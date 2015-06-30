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
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.IO;

public partial class _Default : System.Web.UI.Page
{

    String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["LocalConString"].ConnectionString;
    SqlConnection con = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    /* TextBox isim = new TextBox();
     TextBox sifre = new TextBox();
     Button ekle = new Button();*/

    protected void Page_Load(object sender, EventArgs e)
    {
        con.ConnectionString = strConnString;

        if (!Page.IsPostBack)
        {
            grid_bind();
        }









    }

    protected void tablo_grid_RowEditing(object sender, GridViewEditEventArgs e)
    {
        if (tablo_grid.Rows[e.NewEditIndex].Cells[3].Text.Equals("admin"))
        {

            tablo_grid.EditIndex = -1;
            grid_bind();
            id_lbl.Text = "'admin' Kullanıcısı Değiştirilemez.";
            Panel1_ModalPopupExtender.Show();
            e.Cancel = true;

        }
        else
        {
            tablo_grid.EditIndex = e.NewEditIndex;
            grid_bind();
        }







    }

    public void grid_bind()
    {



        try
        {
            string selectSQL = " SELECT  kullanici_id As No, kullanici_adi As 'Personel Adı', kullanici_sifre As 'Şifre' from bidb_personel";

            SqlCommand cmd1 = new SqlCommand(selectSQL, con);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd1);
            DataSet ds = new DataSet();


            adapter.Fill(ds);

            tablo_grid.DataSource = ds;
            tablo_grid.DataBind();

            cmd1.Dispose();


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


    protected void tablo_grid_RowUpdating1(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = (GridViewRow)tablo_grid.Rows[e.RowIndex];
        int val = (int)(this.tablo_grid.DataKeys[e.RowIndex]["No"]);
        TextBox textName = ((TextBox)row.Cells[3].Controls[0]);
        TextBox textPass = ((TextBox)row.Cells[4].Controls[0]);
        string name = textName.Text;


        con.Open();
        cmd.Connection = con;
        cmd.CommandType = System.Data.CommandType.Text;
        cmd.CommandText = "update bidb_personel set kullanici_adi=@kullanici_adi, kullanici_sifre=@kullanici_sifre Where kullanici_id=@val ";
        cmd.Parameters.AddWithValue("@kullanici_adi", name);
        cmd.Parameters.AddWithValue("@kullanici_sifre", textPass.Text);
        cmd.Parameters.AddWithValue("@val", val);

        cmd.ExecuteNonQuery();

        tablo_grid.EditIndex = -1;
        con.Close();
        cmd.Dispose();
        cmd.Parameters.Clear();

        grid_bind();




    }



    protected void tablo_grid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        tablo_grid.EditIndex = -1;
        grid_bind();
    }
    protected void ekle_Click(object sender, EventArgs e)
    {
        string _isim = isim.Text;
        string _sifre = sifre.Text;

        con.Open();
        cmd.Connection = con;
        cmd.CommandType = System.Data.CommandType.Text;
        cmd.CommandText = "INSERT INTO bidb_personel (kullanici_adi , kullanici_sifre)"
        + "VALUES (@kullanici_adi , @kullanici_sifre)";
        cmd.Parameters.AddWithValue("@kullanici_adi", _isim);
        cmd.Parameters.AddWithValue("@kullanici_sifre", _sifre);


        cmd.ExecuteNonQuery();


        con.Close();
        cmd.Dispose();
        cmd.Parameters.Clear();

        grid_bind();

        isim.Text = "";
        sifre.Text = "";

    }
    protected void tablo_grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        TableCell cell = tablo_grid.Rows[e.RowIndex].Cells[3];
        if (cell.Text == "admin")
        {


            Panel1_ModalPopupExtender.Show();
        }
        else
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandType = System.Data.CommandType.Text;
            int val = (int)(this.tablo_grid.DataKeys[e.RowIndex]["No"]);
            cmd.CommandText = "DELETE bidb_personel WHERE kullanici_id=@val";
            cmd.Parameters.AddWithValue("@val", val);

            cmd.ExecuteNonQuery();


            con.Close();
            cmd.Dispose();
            cmd.Parameters.Clear();

            grid_bind();
        }
    }
    protected void tablo_grid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[0].HorizontalAlign = HorizontalAlign.Center;
        e.Row.Cells[1].HorizontalAlign = HorizontalAlign.Center;
        e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Left;


        e.Row.Cells[2].Width = Unit.Pixel(30);//sonradan bağlananlar
        e.Row.Cells[3].Width = Unit.Pixel(200);
        e.Row.Cells[4].Width = Unit.Pixel(200);


        tablo_grid.Columns[0].ItemStyle.Width = Unit.Pixel(100);//html de var olanlar
        tablo_grid.Columns[1].ItemStyle.Width = Unit.Pixel(60);




    }
}
