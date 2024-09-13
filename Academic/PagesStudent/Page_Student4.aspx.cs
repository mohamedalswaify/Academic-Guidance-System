using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Academic.PagesStudent
{
    public partial class Page_Student4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable tbl = new DataTable();
            DBconnetion db = new DBconnetion();
            int ID = Convert.ToInt32(Request.Cookies["Login"]["ID"]);
            tbl = db.SqlQuery("Select AdvName from Student_Advisor where NationalID='" + ID+"' ");
            lblAdd.Text = tbl.Rows[0][0].ToString();
            lblADID.Text = tbl.Rows[0][0].ToString();
            tbl = db.SqlQuery("Select adNationalID from Student where NationalID='" + ID + "' ");
            string addID = tbl.Rows[0][0].ToString();
            tbl = db.SqlQuery("Select AdDay,fromHour,toHour from Advisor_Hours where advNationalID='"+addID+"' ");
            DgvStudent.DataSource = tbl;
            tbl.Columns[0].ColumnName = "اليوم";
            tbl.Columns[1].ColumnName = "ساعة التواجد من";
            tbl.Columns[2].ColumnName = "ساعة التواجد الى";
            DgvStudent.DataBind();

            tbl = db.SqlQuery("Select ChatDitels from Student where NationalID='" + ID + "' ");
            txtMessageBody.Text = tbl.Rows[0][0].ToString();




        }
    }
}