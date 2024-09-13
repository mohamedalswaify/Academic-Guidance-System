using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Academic.PagesAdmin
{
    public partial class Page_Admin11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DBconnetion db = new DBconnetion();
            DataTable tbl = new DataTable();
            int ID = Convert.ToInt32(Request.Cookies["Login"]["ID"]);
            tbl = db.SqlQuery("select Password from Employee where NationalID='" + ID + "' ");
            string Password = tbl.Rows[0][0].ToString();
            if (txtNewPassword.Text != txtConfirmPassword.Text)
            {
                Panel1.Visible = false;
                pEmpty.Visible = true;
                lblerror.Text = "كلمة المرور غير متطابقة";
                return;
            }
            if (txtOldPassword.Text == Password)
            {
                db.SqlDml("update Employee set Password='" + txtNewPassword.Text + "' where NationalID='" + ID + "' ");
                pEmpty.Visible = false;
                Panel1.Visible = true;

            }
            else
            {
                pEmpty.Visible = true;
                Panel1.Visible = false;
                lblerror.Text = "كلمة المرور غير القديمة غير صحيحة";

            }
        }
    }
}