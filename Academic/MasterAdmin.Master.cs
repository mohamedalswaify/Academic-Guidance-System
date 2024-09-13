using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Academic
{
    public partial class MasterAdmin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                DataTable tbl = new DataTable();
                int ID = Convert.ToInt32(Request.Cookies["Login"]["ID"]);
                DBconnetion con = new DBconnetion();
                tbl = con.SqlQuery("select NumberInsurance,Job,Name from Employee where NationalID='" + ID + "' ");
                lblID.Text = tbl.Rows[0][2].ToString();
                lbljob.Text = tbl.Rows[0][1].ToString();
                lblNameEmployee.Text = tbl.Rows[0][2].ToString();

            }
            catch (Exception)
            {
                Response.Redirect("../LoginAdmin.aspx");
               
            }
           
        }
    }
}