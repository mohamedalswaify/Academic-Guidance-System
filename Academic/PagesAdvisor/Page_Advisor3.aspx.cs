using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Academic.PagesAdvisor
{
    public partial class Page_Advisor3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false || ddlLevel.SelectedIndex==0) { 
            ddlLevel.DataBind();
            ListItem full = new ListItem("(من فضلك اختر مادة )", string.Empty);
                ddlLevel.Items.Insert(0, full);
                Pval.Visible = false;
            }
            else
            {
                Pval.Visible = true;
                lblTitle.Text = ddlLevel.SelectedValue;
            }


        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            DBconnetion db = new DBconnetion();
            DataTable tbl = new DataTable();
            int ID = Convert.ToInt32(Request.Cookies["Login"]["ID"]);
            db.SqlDml("update Student set ChatDitels=N'" + txthoer.Text + "' where LevelID=" + ddlLevel.SelectedValue + " and adNationalID='" + ID + "' ");
            txthoer.Text = "";
        }
    }
}