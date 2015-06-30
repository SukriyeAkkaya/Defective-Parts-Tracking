using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection();
    SqlCommand cmd = new SqlCommand();

    SqlCommand cmd5 = new SqlCommand();

    CheckBox[] cbl = new CheckBox[30];


    protected void Page_Load(object sender, EventArgs e)
    {
       

            //  this.Button1.Click += new EventHandler(Button1_Click);

        String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["LocalConString"].ConnectionString;//localstringi kullanırsa kendi pc OgrConString i kullanırsa uzak pc ye
            con.ConnectionString = strConnString;

            try
            {
                for (int i = 0; i < cbl.Length; i++) { cbl[i] = new CheckBox(); }

                con.Open();
                cmd.Connection = con;
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandText = "SELECT * FROM yapilanislemler";

                SqlDataReader rd = cmd.ExecuteReader();


                int r = 0;

                while (rd.Read())
                {
                    cbl[r].Text = "" + rd["islemler"];
                    r++;
                }
                rd.Close();


                int j = 0;
                for (int i = 0; i < Math.Ceiling((double)r / 3); i++)
                {
                    TableRow satir = new TableRow();

                    int t = 1;


                    while ((t % 4 != 0))
                    {
                        TableCell sutun = new TableCell();
                        if (j < cbl.Length)
                        {
                            if (cbl[j].Text != "")
                                sutun.Controls.Add(cbl[j]);
                        }
                        //   sutun.BorderStyle = BorderStyle.Outset;
                        j++;
                        t++;
                        satir.Cells.Add(sutun);
                    }
                    Table1.Rows.Add(satir);

                }


            }
            catch (Exception ex) { }
            finally
            {
                con.Close();
                cmd.Dispose(); ;
                cmd.Parameters.Clear();
            }
            if (!Page.IsPostBack)
            {
            int acan_sayfa = Convert.ToInt32(Request.QueryString["id"]);
            if (acan_sayfa == 2)
            {

                urunid_txt.Text = Request.QueryString["urun_id"];
                urunid_txt_TextChanged(Page, e);
            }
            
        }
    }
    protected void urunid_txt_TextChanged(object sender, EventArgs e)
    {
      //  form_temizle();

        try
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandType = System.Data.CommandType.Text;

            cmd.CommandText = "SELECT urunler.kullanici_adi, personel.personel_adisoyadi, birimler.birim_adi, personel.personel_tel_no, yapilan_islemler,   modeller.model + ' ' + platform.platform AS 'Ürün Modeli' , sikayet.sikayet_aciklama , urunler.mevcut_durum from personel JOIN urunler ON urunler.personel_id=personel.personel_id JOIN modeller ON urunler.m_id=modeller.m_id JOIN platform ON modeller.p_id=platform.p_id JOIN sikayet ON urunler.ariza_no=sikayet.ariza_no JOIN birimler ON birimler.birim_id=personel.birim_id AND urunler.urun_id=@urun_id AND urunler.teslim_al=1";
            cmd.Parameters.AddWithValue("@urun_id", urunid_txt.Text);
            SqlDataReader oku = cmd.ExecuteReader();
            string model_platform = "";
            string personel = "";
            string birim = "";
            string per_tel = "";
            string bidb_per = "";
            string yapilan_islem = "";
            string sikayet = "";
            if (oku.Read())
            {
                bidb_per = oku.GetString(0);
                personel = oku.GetString(1);
                birim = oku.GetString(2);
                per_tel = oku.GetString(3);
                yapilan_islem = oku.GetString(4);
                model_platform = oku.GetString(5);
                sikayet = oku.GetString(6);


                model_lbl.Text = ":" + "  " + model_platform;
                sahip_lbl.Text = ":" + "  " + personel;
                birim_lbl.Text = ":" + "  " + birim;
                tel_no_lbl.Text = ":" + "  " + per_tel;
                islem_yapan_lbl.Text = ":" + "  " + bidb_per;
                sikayet_lbl.Text = ":" + "  " + sikayet;
                durum_Drop.SelectedValue=oku["mevcut_durum"].ToString();

                string[] yapilanlar = yapilan_islem.Split('*');

                for (int k = 0; k < yapilanlar.Length; k++)
                {
                    for (int i = 0; i < cbl.Length; i++)
                    {
                        if (yapilanlar[k] == cbl[i].Text)
                        {
                            cbl[i].Checked = true;
                        }
                    }
                }
            }
            else
            {

                Panel1_ModalPopupExtender.Show();
            }
            oku.Close();

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        finally
        {
            con.Close();
            cmd.Dispose();
            cmd.Parameters.Clear();
        }

    }

    public void form_temizle()
    {

        model_lbl.Text = ":";
        sahip_lbl.Text = ":";
        birim_lbl.Text = ":";
        tel_no_lbl.Text = ":";
        islem_yapan_lbl.Text = ":";
        sikayet_lbl.Text = ":";

        for (int i = 0; i < cbl.Length; i++) { cbl[i].Checked = false; }
      //  durum_Drop.SelectedIndex = 0;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        try
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "update urunler set  yapilan_islemler=@yapilan_islemler, mevcut_durum=@mevcut_durum , kullanici_adi=@kullanici_adi where urun_id=@urun_id and teslim_al=1";
            string islemler = "";
           string durum = durum_Drop.SelectedIndex.ToString();
          // string durumtx = durum_Drop.Selected;

       
       
            for (int i = 0; i < cbl.Length; i++)
            {
                if (cbl[i].Checked == true)
                {
                    islemler = islemler + "*" + cbl[i].Text;
                }
            }
            
            cmd.Parameters.AddWithValue("@urun_id", urunid_txt.Text);
            cmd.Parameters.AddWithValue("@yapilan_islemler", islemler);
            cmd.Parameters.AddWithValue("@mevcut_durum",   durum);
            cmd.Parameters.AddWithValue("@kullanici_adi", Session["kullanici"].ToString());
            cmd.ExecuteNonQuery();

            Image1.ImageUrl = "~/Styles/tick-icon.jpg";
            id_lbl.Text = "İşlemler Kaydedilmiştir.";
            string x = id_lbl.Text;
            //Panel1_ModalPopupExtender.
           Panel1_ModalPopupExtender.Show();


        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        finally
        {
            con.Close();
            cmd.Dispose();
            cmd.Parameters.Clear();
        }
    }


  
}
