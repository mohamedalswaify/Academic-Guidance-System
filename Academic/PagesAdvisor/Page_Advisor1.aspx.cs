using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Academic.PagesAdvisor
{
    public partial class Page_Advisor1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            DBconnetion db = new DBconnetion();
            DataTable tbl = new DataTable();
            int ID = Convert.ToInt32(Request.Cookies["Login"]["ID"]);
            Session["AdvisorID"] = ID;
            tbl = db.SqlQuery("select count(adNationalID) from ViewAdvisorStudent where adNationalID='"+ID+"'");
            lbltotal.Text = tbl.Rows[0][0].ToString();
            tbl = db.SqlQuery("select count(adNationalID) from ViewAdvisorStudent where adNationalID='" + ID + "'");
            lbltotal.Text = tbl.Rows[0][0].ToString();
            if (IsPostBack == false)
            {
                tbl = db.SqlQuery("select count(adNationalID) from ViewAdvisorStudent where adNationalID='" + ID + "' and LevelID=" +1+ " ");
                if (tbl.Rows.Count == 0)
                    return;
                lbltotalLevel.Text = tbl.Rows[0][0].ToString();
                lblTitle.Text = "1";

            }
            else
            {
                tbl = db.SqlQuery("select count(adNationalID) from ViewAdvisorStudent where adNationalID='" + ID + "' and LevelID=" + ddlLevel.SelectedValue + " ");
                if (tbl.Rows.Count == 0)
                    return;
                lbltotalLevel.Text = tbl.Rows[0][0].ToString();
                lblTitle.Text = ddlLevel.Text;
            }
            tbl = db.SqlQuery("select count(adNationalID) from ViewAdvisorStudent where adNationalID='" + ID + "' and LevelID="+ddlLevel.SelectedValue+" ");
          


        }
    }
}