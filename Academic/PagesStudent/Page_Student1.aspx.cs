using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Academic
{
    public partial class Page_Student1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DBconnetion db = new DBconnetion();
            DataTable tbl = new DataTable();
            int ID = Convert.ToInt32(Request.Cookies["Login"]["ID"]);
            tbl = db.SqlQuery("select count(stNationalID) from Student_Subject where stNationalID='" + ID + "' and Appreciation ='F';");
            lblfuluer.Text = tbl.Rows[0][0].ToString();
            tbl = db.SqlQuery("select count(stNationalID) from Student_Subject where stNationalID = '"+ID+"' and not Appreciation = 'F'");
            lblSeccess.Text = tbl.Rows[0][0].ToString();
            tbl = db.SqlQuery("select count(stNationalID) from Student_Subject where Appreciation IS Not Null and stNationalID='"+ID+"'");
            lbltotal.Text = tbl.Rows[0][0].ToString();
            tbl = db.SqlQuery("Select* from VeiwSbjectStudent where stNationalID='" + ID + "' and Appreciation IS Not Null");
           
            
            
            tbl.Columns[0].ColumnName = "كود المادة";
            tbl.Columns[1].ColumnName = "اسم المادة";
            tbl.Columns[2].ColumnName = "السنة الدراسية";
            tbl.Columns[3].ColumnName = "الترم";
            tbl.Columns[5].ColumnName = "الفرقة";
            tbl.Columns[6].ColumnName = "الدرجة";
            tbl.Columns.RemoveAt(4);
            tbl.Columns.RemoveAt(7);
            tbl.Columns[6].ColumnName = "التقدير";
            tbl.Columns.RemoveAt(8);
            tbl.Columns.RemoveAt(8);


            DgvStudent.DataSource = tbl;
            DgvStudent.DataBind();
           
           

        }

        

        protected void DgvStudent_DataBinding(object sender, EventArgs e)
        {
           
        }
    }
}