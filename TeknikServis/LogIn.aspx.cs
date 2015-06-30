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

public partial class deneme : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection();
    SqlCommand cmd = new SqlCommand();

       protected void Page_Load(object sender, EventArgs e)
       {
           String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["LocalConString"].ConnectionString;//localstringi kullanırsa kendi pc OgrConString i kullanırsa uzak pc ye
        con.ConnectionString = strConnString;

    
        if (Request.Cookies["kullanıcı"] != null) {
            Response.Redirect("Teslim Alma.aspx");
         }

    
       }
     
     
       protected void Button1_Click(object sender, EventArgs e)
       {
           try
           {
               con.Open();
               cmd.Connection = con;
               cmd.CommandType = System.Data.CommandType.Text;
               string k_ad = kullanıcı_txt.Text.ToString();
               cmd.CommandText = "SELECT * FROM bidb_personel  WHERE kullanici_adi=@kullanici_adi AND kullanici_sifre=@kullanici_sifre";
               cmd.Parameters.AddWithValue("@kullanici_adi", k_ad);
               cmd.Parameters.AddWithValue("@kullanici_sifre", psw_txt.Text.ToString());
               SqlDataReader oku = cmd.ExecuteReader();
               if (oku.Read())
               {
                   Session.Add("kullanici", k_ad);
                   Response.Redirect("Teslim Alma.aspx");
                   if (remember_check.Checked == true)
                   {
                       Response.Cookies["kullanıcı"].Value = kullanıcı_txt.Text;
                       Response.Cookies["kullanıcı"].Expires = DateTime.Now.AddDays(1);
                   }
               }
               else
               {
                   Response.Write("Kullanıcı Adı veya Şifre yanlış, Lütfen tekrar deneyin.");
               }
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
