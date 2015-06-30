using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Security;




public partial class yedek : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    SqlCommand cmd2 = new SqlCommand();
    SqlCommand cmd3 = new SqlCommand();


    protected void Page_Load(object sender, EventArgs e)
    {
        String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["LocalConString"].ConnectionString;//localstringi kullanırsa kendi pc OgrConString i kullanırsa uzak pc ye
        con.ConnectionString = strConnString;
        if (!this.IsPostBack)
        {
            formtemizle();
            model_list1_fill();
            birimler();
        }

    }

    protected void gonder_Click1(object sender, EventArgs e)
    {
        try
        {
            ///göndere tıklandığında önce personel varmı diye kontrol et.
            int test = 0;
            con.Open();
            cmd.Connection = con;
            cmd2.Connection = con;
            cmd3.Connection = con;

            cmd.CommandType = System.Data.CommandType.Text;
            cmd2.CommandType = System.Data.CommandType.Text;
            cmd3.CommandType = System.Data.CommandType.Text;

            cmd.CommandText = "SELECT * FROM personel WHERE personel_id=@personel_id";
            cmd.Parameters.AddWithValue("@personel_id", tc_text.Text.ToString());
            SqlDataReader oku = cmd.ExecuteReader();

            if (oku.Read())
            {
                test = 1;
            }
            oku.Close();
            if (test == 1)
            {
                //kullanıcı kayıtlı
                cmd2.CommandText = "DECLARE  @ariza_no int "
                          + "INSERT INTO urunler "
                          + "(personel_id,yapilan_islemler,mevcut_durum,m_id,tarih,teslim_al) "
                          + "VALUES "
                          + "(@personel_id,'Henüz İşleme Alınmadı.','2',@m_id,GETDATE(),0) "
                          + "set @ariza_no=@@IDENTITY "
                          + "INSERT INTO sikayet "
                          + "(sikayet_aciklama,ariza_no) "
                          + "VALUES "
                          + "(@sikayet_aciklama,@ariza_no) ";



                cmd2.Parameters.AddWithValue("@personel_id", tc_text.Text);

                cmd2.Parameters.AddWithValue("@sikayet_aciklama", sikayet_txt.Text);
                cmd2.Parameters.AddWithValue("@m_id", Convert.ToInt32(model_list2.SelectedValue));

                cmd2.ExecuteNonQuery();




            }

            else
            {
                //kullanıcı kayıtlı değil

                cmd2.CommandText = "DECLARE  @ariza_no int "
                          + "INSERT INTO personel "
                          + "(personel_id,personel_adisoyadi,birim_id,personel_tel_no) "
                          + "VALUES "
                          + "(@personel_id,@p_ad,@b_id,@tel_no) "
                          + "INSERT INTO urunler "
                          + "(personel_id,yapilan_islemler,mevcut_durum,m_id,tarih,teslim_al) "
                          + "VALUES "
                          + "(@personel_id,'Henüz İşleme Alınmadı.','2',@m_id,GETDATE(),0) "
                          + "set @ariza_no=@@IDENTITY "

                          + "INSERT INTO sikayet "
                          + "(sikayet_aciklama,ariza_no) "
                          + "VALUES "
                          + "(@sikayet_aciklama, @ariza_no) ";



                cmd2.Parameters.AddWithValue("@personel_id", tc_text.Text);
                cmd2.Parameters.AddWithValue("@p_ad", p_ad_txt.Text);
                cmd2.Parameters.AddWithValue("@b_ad", birimlist.SelectedItem.Value.ToString());
                cmd2.Parameters.AddWithValue("@tel_no", tel_txt.Text);

                cmd2.Parameters.AddWithValue("@sikayet_aciklama", sikayet_txt.Text);
                cmd2.Parameters.AddWithValue("@m_id", Convert.ToInt32(model_list2.SelectedValue));
                cmd2.Parameters.AddWithValue("@b_id", Convert.ToInt32(birimlist.SelectedValue));

                cmd2.ExecuteNonQuery();
            }

            cmd3.CommandText = "SELECT ariza_no FROM urunler WHERE personel_id=@personel_id ORDER BY tarih DESC";
            cmd3.Parameters.AddWithValue("@personel_id", tc_text.Text.ToString());
            SqlDataReader cek = cmd3.ExecuteReader();
            string s = "";
            if (cek.Read())
            {
                s = cek["ariza_no"].ToString();
            }
            id_lbl.Text = "Arıza Takip Numaranız:  " + s;
         
            Panel1_ModalPopupExtender.Show();
        }
        catch (Exception err)
        {
            //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert();", true);
            Response.Write(err.Message.ToString());
        }

        finally
        {
            con.Close();
            cmd.Dispose();
            cmd.Parameters.Clear();
            cmd2.Dispose();
            cmd2.Parameters.Clear();
            formtemizle();

        }




    }

    private void formtemizle()
    {
        p_ad_txt.Text = "";

        sikayet_txt.Text = "";
        tc_text.Text = "";
        tel_txt.Text = "";
        model_list2.Items.Clear();
        model_list2.Visible = false;
       
        birimlist.SelectedValue = "1";
    }

    private void model_list1_fill()
    {
        try
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "SELECT * FROM platform";
            SqlDataReader drx = cmd.ExecuteReader();
            model_list1.Items.Add(new ListItem("Seçiniz..."));
            while (drx.Read())
            {
                model_list1.Items.Add(new ListItem(drx.GetString(1), drx.GetInt32(0).ToString()));

            }
            drx.Close();

        }
        catch (Exception err)
        {

            Response.Write(err.Message.ToString());
        }

        finally
        {
            con.Close();
            cmd.Dispose();
            cmd.Parameters.Clear();
        }


    }
    protected void model_list1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (model_list1.SelectedItem.Text == "Seçiniz...") { model_list2.Visible = false; }
            else
            {
                model_list2.Items.Clear();

                con.Open();
                cmd.Connection = con;
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandText = "SELECT * FROM modeller WHERE p_id=@p_id ";
                cmd.Parameters.AddWithValue("@p_id", Convert.ToInt32(model_list1.SelectedItem.Value));
                SqlDataReader dry = cmd.ExecuteReader();
                while (dry.Read())
                {
                    model_list2.Items.Add(new ListItem(dry.GetString(2), dry.GetInt32(0).ToString()));
                
                }
                dry.Close();

                model_list2.Visible = true;
            }
        }
        catch (Exception err)
        {

            Response.Write(err.Message.ToString());
        }

        finally
        {
            con.Close();
            cmd.Dispose();
            cmd.Parameters.Clear();
        }

    }

    protected void tc_text_TextChanged(object sender, EventArgs e)
    {

        try
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "SELECT * FROM personel WHERE personel_id= @personel_id ";
            cmd.Parameters.AddWithValue("@personel_id", tc_text.Text.ToString());
            SqlDataReader goster = cmd.ExecuteReader();
            if (goster.Read())
            {
                p_ad_txt.Text = goster["personel_adisoyadi"].ToString();
             
                birimlist.SelectedValue = goster["birim_id"].ToString();
                tel_txt.Text = goster["personel_tel_no"].ToString();

            
            }
            goster.Close();


        }
        catch (Exception err)
        {

            Response.Write(err.Message.ToString());
        }

        finally
        {
            con.Close();
            cmd.Dispose();
            cmd.Parameters.Clear();
        }
    }

    public void birimler()
    {

        try
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "SELECT * FROM birimler";
            SqlDataReader drx = cmd.ExecuteReader();
            while (drx.Read())
            {
                birimlist.Items.Add(new ListItem(drx["birim_adi"].ToString(), drx["birim_id"].ToString()));

            }
            drx.Close();

        }
        catch (Exception err)
        {

            Response.Write(err.Message.ToString());
        }

        finally
        {
            con.Close();
            cmd.Dispose();
            cmd.Parameters.Clear();
        }
    }



}

