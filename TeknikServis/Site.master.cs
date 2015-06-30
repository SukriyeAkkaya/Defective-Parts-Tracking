using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["kullanici"] != null)
        {
            kull_lbl.Text = "" + Session["kullanici"];

            if (!Session["kullanici"].ToString().Equals("admin"))
            {
                kullanici.Visible = false;

            }

        }
        else {

            Response.Redirect("LogIn.aspx");
        
        }

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        
        Session["kullanici"] = null;
        Response.Redirect("LogIn.aspx");

    }
}
