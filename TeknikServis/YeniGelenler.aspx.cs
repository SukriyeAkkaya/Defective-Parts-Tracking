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
    SqlCommand cmd1 = new SqlCommand();

    protected void Page_Load(object sender, EventArgs e)
    {
        String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["LocalConString"].ConnectionString;//localstringi kullanırsa kendi pc OgrConString i kullanırsa uzak pc ye
        con.ConnectionString = strConnString;

        grid_bind();


    }




    /* protected void tablo_grid_RowCommand(object sender, GridViewCommandEventArgs e)
       {
        

       }*/
    protected void tablo_grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {


        try
        {
            int val = (int)(this.tablo_grid.DataKeys[e.RowIndex]["Arıza No"]);


            con.Open();
            cmd.Connection = con;
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = " SELECT sikayet_aciklama FROM sikayet WHERE ariza_no=@val ";
            cmd.Parameters.AddWithValue("@val", val);

            SqlDataReader cek = cmd.ExecuteReader();
            string sikayet = "";
            if (cek.Read())
            {
                sikayet = cek["sikayet_aciklama"].ToString();
            }
            id_lbl.Text = sikayet;
            
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

    protected void tablo_grid_RowEditing(object sender, GridViewEditEventArgs e)
    {

        try
        {
            con.Open();
            int rowIndex = (e.NewEditIndex);
            int val = (int)this.tablo_grid.DataKeys[rowIndex]["Arıza No"];


           
            cmd1.Connection = con;
            cmd1.CommandType = System.Data.CommandType.Text;
          

            cmd1.CommandText = "SELECT urun_id FROM urunler WHERE ariza_no=@ariza_no";
            cmd1.Parameters.AddWithValue("@ariza_no", val);

            SqlDataReader cek = cmd1.ExecuteReader();
            int urun_id = 0;
            if (cek.Read())
            {
                urun_id = cek.GetInt32(0);
            }
            cek.Close();

            Response.Redirect("YapılanIslemler.aspx?id=2&urun_id=" + urun_id + "");//işlem yapma sayfasına yönleniyor


        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        finally
        {
            con.Close();
           
            cmd1.Dispose();
            cmd1.Parameters.Clear();
        }

    }

    protected void tablo_grid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
       // e.Row.Cells[3].HorizontalAlign = HorizontalAlign.Center;
       // e.Row.Cells[6].HorizontalAlign = HorizontalAlign.Center;

        //tablo_grid.Columns[0].ItemStyle.Width = Unit.Pixel(50);


    }
    public void grid_bind()
    {
        try
        {
            string selectSQL = " SELECT personel.personel_adisoyadi AS 'Ürün Sahibi',  urunler.urun_id AS 'Ürün No',     modeller.model + ' ' + platform.platform AS 'Ürün Modeli',  urunler.tarih  AS 'Kayıt Tarihi' , urunler.ariza_no AS 'Arıza No' FROM  personel INNER JOIN urunler ON personel.personel_id = urunler.personel_id INNER JOIN modeller ON urunler.m_id = modeller.m_id INNER JOIN platform ON modeller.p_id = platform.p_id  AND urunler.yapilan_islemler='Yeni Geldi' AND urunler.teslim_al=1   ";

            SqlCommand cmd = new SqlCommand(selectSQL, con);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();

            adapter.Fill(ds);

            tablo_grid.DataSource = ds;
            tablo_grid.DataBind();



        }
        catch (Exception ex){
            Response.Write(ex.Message);
        }
        finally
        {
            con.Close();
            cmd.Dispose();
        }

    }
}