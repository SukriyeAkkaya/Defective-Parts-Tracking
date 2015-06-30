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
    SqlCommand cmd2 = new SqlCommand();
    SqlCommand cmd3 = new SqlCommand();

    protected void Page_Load(object sender, EventArgs e)
    {
        String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["LocalConString"].ConnectionString;//localstringi kullanırsa kendi pc OgrConString i kullanırsa uzak pc ye
        con.ConnectionString = strConnString;
     

    }
    protected void Button1_Click(object sender, EventArgs e)
    {


        bool chek = CheckBox1.Checked;


        try
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandType = System.Data.CommandType.Text;
            cmd2.Connection = con;
            cmd2.CommandType = System.Data.CommandType.Text;
            cmd3.Connection = con;
            cmd3.CommandType = System.Data.CommandType.Text;

            cmd3.CommandText = "Select  teslim_al FROM urunler WHERE ariza_no=@ariza_no";
            cmd3.Parameters.AddWithValue("@ariza_no", Convert.ToInt32(a_notxt.Text));
            SqlDataReader test = cmd3.ExecuteReader();
            int teslim = -1;
            if (test.Read())
            {
                teslim = Convert.ToInt32(test["teslim_al"].ToString());
            }
            test.Close();

            if (teslim == 0)
            {
                if (chek == true)
                {//ilk kez
                    cmd2.CommandText = "SELECT  MAX(urun_id) As id FROM urunler";
                    SqlDataReader oku = cmd2.ExecuteReader();
                    int son = 0;
                    if (oku.Read())
                    {
                        son = (int)oku["id"];
                    }
                    oku.Close();

                    cmd.CommandText = "UPDATE urunler "
                    + "SET "
                    + "urun_id= @urun_id, teslim_al= @teslim_al ,  mevcut_durum='0' , yapilan_islemler='Yeni Geldi' , tarih=GETDATE(), kullanici_adi='Yok' WHERE ariza_no= @ariza_no AND teslim_al=0";//ARIZA NUMARASI x olan satırın ürün id sini ekle
                    cmd.Parameters.AddWithValue("@urun_id", son + 1);
                    cmd.Parameters.AddWithValue("@teslim_al", 1);

                    cmd.Parameters.AddWithValue("@ariza_no", a_notxt.Text);

                    cmd.ExecuteNonQuery();

                    id_lbl.Text = "Ürün Numarası:" + (son + 1);

                    Panel1_ModalPopupExtender.Show();

                   
                }
                else
                {//mevcut_durum 0-işlemde,1-hazır,2-işleme alınmadı 
                    cmd.CommandText = "UPDATE urunler "
                    + "SET "
                    + "urun_id= @urun_id, teslim_al= @teslim_al, mevcut_durum='0' , tarih=GETDATE(), kullanici_adi='Yok',  yapilan_islemler='Yeni Geldi'  WHERE ariza_no= @ariza_no";//ARIZA NUMARASI x olan satırın ürün id sini ekle
                    cmd.Parameters.AddWithValue("@urun_id", u_notxt.Text);
                    cmd.Parameters.AddWithValue("@teslim_al", 1);

                    cmd.Parameters.AddWithValue("@ariza_no", a_notxt.Text);

                    cmd.ExecuteNonQuery();

                    id_lbl.Text = "Ürün Teknik Servis Tarafından Teslim Alındı.";

                    Panel1_ModalPopupExtender.Show();
                }
            }//if
            else
            {

                id_lbl.Text = "Bu Arıza Zaten Teknik Serviste İşlemdedir.";
                logo_img.ImageUrl = "~/Styles/indir(1).jpg";
                Panel1_ModalPopupExtender.Show();

            }
        }
        catch (Exception ex)
        {
            id_lbl.Text = "Veri Tabanı Hatası:   " + ex.Message;
            logo_img.ImageUrl = "~/Styles/sqlerror.jpg";
            Panel1_ModalPopupExtender.Show();

        }
        finally
        {
            con.Close();
            cmd.Dispose();
            cmd.Parameters.Clear();
            cmd2.Dispose();
            cmd2.Parameters.Clear();
            cmd3.Dispose();
            cmd3.Parameters.Clear();
        }



    }

    

    public void form_temizle()
    {
        u_notxt.Text = "";


        CheckBox1.Checked = false;

        u_notxt.Enabled = true;

    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked == true) { u_notxt.Enabled = false; }
        else { u_notxt.Enabled = true; }
    }
}