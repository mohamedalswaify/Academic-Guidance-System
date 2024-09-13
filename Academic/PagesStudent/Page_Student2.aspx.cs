using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Academic.PagesStudent
{
    public partial class Page_Student2 : System.Web.UI.Page
    {
        DBconnetion db = new DBconnetion();
        DataTable tbl = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            tbl = db.SqlQuery("select term from Terms");
            int Re = Convert.ToInt32(tbl.Rows[0][0]);
            if (IsPostBack == false)
            {
                if (Re == 1)
                {
                    ddlTerm.Items[0].Selected = true;
                }
                else if (Re == 2)
                {
                    ddlTerm.Items[1].Selected = true;
                }
                else if (Re == 3)
                {
                    ddlTerm.Items[2].Selected = true;
                }
            }


            DateTime da = DateTime.Now;
            int ID = Convert.ToInt32(Request.Cookies["Login"]["ID"]);
            ddlTerm.SelectedIndex = ddlTerm.Items.IndexOf(ddlTerm.Items.FindByValue(ddlTerm.SelectedValue));
            tbl = db.SqlQuery("Select Count(SubjectID) from VeiwSbjectStudent where stNationalID='" + ID + "' and AcademicYear='" + da.Year.ToString() + "' and Term=" + ddlTerm.SelectedValue + " and TypeOkayID=" + 2 + " ");
            lblTotal.Text = tbl.Rows[0][0].ToString();
            tbl = db.SqlQuery("Select levelID from Student where NationalID='"+ID+"' ");
            int level = Convert.ToInt32(tbl.Rows[0][0]);
            tbl = db.SqlQuery("select *from VeiwSbjectStudent where stNationalID='" + ID + "' and LevelID="+level+" and term="+ddlTerm.SelectedValue+ " and TypeOkayID="+2+" "); ;
            tbl.Columns[0].ColumnName = "كود المادة";
            tbl.Columns[1].ColumnName = "اسم المادة";
            tbl.Columns[6].ColumnName = "الدرجة";
            tbl.Columns[7].ColumnName = "التقدير";
            tbl.Columns.RemoveAt(2);
            tbl.Columns.RemoveAt(2);
            tbl.Columns.RemoveAt(2);
            tbl.Columns.RemoveAt(2);
            tbl.Columns.RemoveAt(4);
            tbl.Columns.RemoveAt(5);
            tbl.Columns.RemoveAt(5);



            DgvStudent.DataSource = tbl;


            if (tbl.Rows.Count == 0)
                pEmpty.Visible = true;
            else
                pEmpty.Visible = false;

            DgvStudent.DataBind();



        }
    }
}