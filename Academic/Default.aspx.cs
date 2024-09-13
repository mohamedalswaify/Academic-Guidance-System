using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;

public partial class Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    DataTable tb = new DataTable();
    Academic.DBconnetion con = new Academic.DBconnetion();
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        
        tb = con.SqlQuery("select * from Student where NationalID='"+ txtuser.Text+ "' and Password="+txtpassword.Text+" ");
        if (tb.Rows.Count > 0)
        {
            HttpCookie co = new HttpCookie("Login");
            co.Values.Add("ID", txtuser.Text);
            Response.Cookies.Add(co);
            Response.Redirect("PagesStudent/Dashboard_Student.aspx");
        }
    }
}
