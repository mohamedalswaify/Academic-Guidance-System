using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Academic.PagesAdmin
{
    public partial class Page_Admin6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int ID = Convert.ToInt32(Request.Cookies["Login"]["ID"]);
            Session["EmployeeID"] = ID;
        }


    }
}