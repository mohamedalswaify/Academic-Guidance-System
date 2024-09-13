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
    public partial class Page_Admin5 : System.Web.UI.Page
    {
        DBconnetion db = new DBconnetion();
        DataTable tb = new DataTable();


        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            DataTable tbl = new DataTable();
            tbl = db.SqlQuery("select term from terms ");
            lblterm.Text = tbl.Rows[0][0].ToString();
            string n = autosID.Text;
            n= n.Remove(n.Length - 2, 1);
            tbl = db.SqlQuery("select NationalID from Student where Name= N'"+n.ToString().TrimEnd()+"' ");
            string StudentID = tbl.Rows[0][0].ToString();
            if (tbl.Rows.Count > 0)
            {
                Session["x"] = tbl.Rows[0][0].ToString();
                 

            }
            tbl = db.SqlQuery("select LevelID from Student where NationalID= '" +StudentID+ "' ");
            Session["LevelID"] = tbl.Rows[0][0].ToString();
            try
            {
                DataSbjcrt_student.Insert();
                dgv.DataBind();
                lblbAdded.Visible = true;
                lblbAdded.Text = "تمت الاضافة بنجاح";
                lblbAdded.ForeColor = Color.Green;
            }
            catch (Exception)
            {
                lblbAdded.Text = "الطالب سجل من قبل";
                lblbAdded.ForeColor = Color.Red;
                lblbAdded.Visible = true;
            }

        }

        protected void ddlsbject_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}