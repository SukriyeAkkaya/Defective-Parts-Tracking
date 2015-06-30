
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Data;


public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection();
    SqlCommand cmd = new SqlCommand();

    protected void Page_Load(object sender, EventArgs e)
    {
        String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["LocalConString"].ConnectionString;//localstringi kullanırsa kendi pc OgrConString i kullanırsa uzak pc ye
        con.ConnectionString = strConnString;

        grid_bind();
    }


    protected void tablo_grid_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        // e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Right;
      //e.Row.Cells[5].HorizontalAlign = HorizontalAlign.Center;
       // e.Row.Cells[5].Width = Unit.Pixel(70);

        //tablo_grid.Columns[0].ItemStyle.Width = Unit.Pixel(50);
        // tablo_grid.Columns[0].ItemStyle.HorizontalAlign = HorizontalAlign.Center;


    }

    protected void tablo_grid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            int rowIndex = int.Parse(e.CommandArgument.ToString());
            int val = (int)this.tablo_grid.DataKeys[rowIndex]["Arz. No"];
            con.Open();
            cmd.Connection = con;
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "UPDATE urunler "
              + "SET "
              + "teslim_al=0, mevcut_durum='2' WHERE ariza_no= @ariza_no";
            cmd.Parameters.AddWithValue("@ariza_no", val);
            cmd.ExecuteNonQuery();
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


        grid_bind();
        Panel1_ModalPopupExtender.Show();

    }
    public void grid_bind()
    {


        try
        {
            string selectSQL = " SELECT    personel.personel_adisoyadi AS 'Ürün Sahibi',  urunler.urun_id AS 'Ürün No', modeller.model + ' ' + platform.platform AS 'Ürün Modeli',  urunler.tarih  AS 'Kayıt Tarihi' ,  urunler.ariza_no AS 'Arz. No'   FROM         personel INNER JOIN urunler ON personel.personel_id = urunler.personel_id INNER JOIN modeller ON urunler.m_id = modeller.m_id INNER JOIN platform ON modeller.p_id = platform.p_id  AND urunler.mevcut_durum='1' AND urunler.teslim_al=1 ";
            SqlCommand cmd1 = new SqlCommand(selectSQL, con);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd1);
            DataSet ds = new DataSet();


            adapter.Fill(ds);

            tablo_grid.DataSource = ds;
            tablo_grid.DataBind();

            cmd1.Dispose();

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