using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Academic
{
    public partial class LoginAdmin : System.Web.UI.Page
    {
        DBconnetion con= new DBconnetion();
        DataTable tb = new DataTable();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnLoginAdmin_Click(object sender, EventArgs e)
        {
            HttpCookie co = new HttpCookie("Login");
            tb = con.SqlQuery("select * from Employee where NationalID='" + txtuser.Text + "' and Password=" + txtpassword.Text + " ");
            if (tb.Rows.Count > 0)
            {
                co.Values.Add("ID", txtuser.Text);
                Response.Cookies.Add(co);
                Response.Redirect("PagesAdmin/Dashboard_Admin.aspx");
            }
            tb = con.SqlQuery("select * from Advisor where NationalID='" + txtuser.Text + "' and Password=" + txtpassword.Text + " ");
            if (tb.Rows.Count > 0)
            {
                co.Values.Add("ID", txtuser.Text);
                Response.Cookies.Add(co);
                Response.Redirect("PagesAdvisor/Dashboard_Advisor.aspx");
            }
        }
    }
}