using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection();
    SqlCommand cmd = new SqlCommand();

    protected void Page_Load(object sender, EventArgs e)
    {
        String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["LocalConString"].ConnectionString;//localstringi kullanırsa kendi pc OgrConString i kullanırsa uzak pc ye
        con.ConnectionString = strConnString;


        if (!Page.IsPostBack)
        {
            grid_bind();
        }

    }

    protected void ekle_btn_Click(object sender, EventArgs e)
    {
        try
        {
            ///göndere tıklandığında önce personel varmı diye kontrol et.

            con.Open();
            cmd.Connection = con;



            cmd.CommandType = System.Data.CommandType.Text;


            //kullanıcı kayıtlı
            cmd.CommandText = "INSERT INTO yapilanislemler "
                      + "(islemler) "
                      + "VALUES "
                      + "(@islem) ";



            cmd.Parameters.AddWithValue("@islem", islem_txt.Text);



            cmd.ExecuteNonQuery();
            grid_bind();

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

    public void grid_bind()
    {



        try
        {
            string selectSQL = " SELECT islemler As 'Kayıtlı İşlemler'  from  yapilanislemler ";

            SqlCommand cmd = new SqlCommand(selectSQL, con);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();


            adapter.Fill(ds);

            tablo_grid.DataSource = ds;
            tablo_grid.DataBind();

            cmd.Dispose();


            tablo_grid.RowStyle.Height = Unit.Pixel(10);



        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        finally
        {
            con.Close();

        }



    }

  
}
