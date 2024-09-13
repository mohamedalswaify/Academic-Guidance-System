using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Academic.PagesAdmin
{
    public partial class Page_Admin2 : System.Web.UI.Page
    {
        void ClaerText()
        {
            txtName.Text = "";
            txtPhone.Text = "";

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack==true)
            {
              
            }
        }

        protected void btnAddDep_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataAdded.Insert();
                Dgv.DataBind();
                lblbAdded.Visible = true;
                lblbAdded.Text = "تمت الاضافة بنجاح";
                lblbAdded.ForeColor = Color.Green;
                ClaerText();
            }
            catch (Exception )
            {

                lblbAdded.Text = "خطـــــأ في ادخال البيانات";
                lblbAdded.ForeColor = Color.Red;
                lblbAdded.Visible = true;
            }
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            
            DataTable tb = new DataTable();
            DBconnetion db = new DBconnetion();
            tb=db.SqlQuery("select * form Department where DepID=" + txtSearch.Text + " ");
            Dgv.DataSource = tb;
            Dgv.DataBind();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataTable tb = new DataTable();
            DBconnetion db = new DBconnetion();
            tb = db.SqlQuery("select * form Department where DepID=" + txtSearch.Text + " ");
            Dgv.DataSource = tb;
            Dgv.DataBind();
        }
    }
}