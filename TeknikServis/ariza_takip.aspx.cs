using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class ariza_takip : System.Web.UI.Page
{
  
    SqlConnection con = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
  
    protected void Page_Load(object sender, EventArgs e)
    {
        String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["EvString"].ConnectionString;
        con.ConnectionString = strConnString;

       
    }

    protected void gonder_Click(object sender, EventArgs e)
    {
        try
        {
            int test = 0;

            con.Open();
            cmd.Connection = con;
            cmd.CommandType = System.Data.CommandType.Text;

            cmd.CommandText = " SELECT mevcut_durum FROM urunler WHERE personel_id=@personel_id AND urun_id=@urun_id  AND teslim_al=1";
            cmd.Parameters.AddWithValue("@personel_id", tc_text.Text.ToString());
            cmd.Parameters.AddWithValue("@urun_id", p_ad_txt.Text.ToString());
            SqlDataReader oku = cmd.ExecuteReader();
            string durum = "";
            if (oku.Read())
            {

                durum = oku["mevcut_durum"].ToString();
                if (durum.Equals("0")) {
                    id_lbl.Text = "Ürününüz İşlemde...";
                
                }
                else 
                {
                    id_lbl.Text = "Ürününüz Hazır, Teslim Alabilirsiniz.";
                }
               
            }
            else {
                id_lbl.Text = "Teknik Serviste Böyle Bir Ürün Bulunmamaktadır.";
               
            
            }
            oku.Close();

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


        }

    }
}