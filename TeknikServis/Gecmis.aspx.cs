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
  
    protected void Page_Load(object sender, EventArgs e)
    {
        String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["EvString"].ConnectionString;//localstringi kullanırsa kendi pc OgrConString i kullanırsa uzak pc ye
        con.ConnectionString = strConnString;

    }
    protected void ara_btn_Click(object sender, EventArgs e)
    {
        try
        {
            string selectSQL = " SELECT    urunler.ariza_no AS 'Arıza No',  urunler.tarih  AS 'Geliş Tarihi', urunler.yapilan_islemler AS 'Yapılan İşlemler' , urunler.mevcut_durum AS Durum FROM  urunler WHERE urunler.urun_id=@urun_id ORDER BY tarih desc";
            SqlCommand cmd = new SqlCommand(selectSQL, con);
            cmd.Parameters.AddWithValue("@urun_id",u_notxt.Text);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();


            adapter.Fill(ds);

            tablo_grid1.DataSource = ds;
            tablo_grid1.DataBind();

            cmd.Dispose();

        }
        catch { }
        finally
        {
            con.Close();

        }
    }

    protected void tablo_grid1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.Cells[3].Text == "0") { e.Row.Cells[3].Text = "İşlemde"; }
        if (e.Row.Cells[3].Text == "1") { e.Row.Cells[3].Text = "Hazır"; }
        if (e.Row.Cells[3].Text == "2") { e.Row.Cells[3].Text = "Teslim Edildi"; }
    }
}