using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Academic.PagesStudent
{
    public partial class Page_Student5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable tbl = new DataTable();
            DBconnetion db = new DBconnetion();
            int ID = Convert.ToInt32(Request.Cookies["Login"]["ID"]);
            tbl = db.SqlQuery("Select Name from Student where NationalID='" + ID + "' ");
            lblName.Text = tbl.Rows[0][0].ToString();
            tbl = db.SqlQuery("Select Name from Student where NationalID='" + ID + "' ");
            lblName.Text = tbl.Rows[0][0].ToString();
            tbl = db.SqlQuery("Select StudentID from Student where NationalID='" + ID + "' ");
            lblStudentCode.Text = tbl.Rows[0][0].ToString();
            tbl = db.SqlQuery("Select DepName from ViewStudent where NationalID='" + ID + "' ");
            lblDepartment.Text = tbl.Rows[0][0].ToString();
            tbl = db.SqlQuery("Select Email from ViewStudent where NationalID='" + ID + "' ");
            lblEmail.Text = tbl.Rows[0][0].ToString();
            tbl = db.SqlQuery("Select Phone from ViewStudent where NationalID='" + ID + "' ");
            lblPhone.Text = tbl.Rows[0][0].ToString();
            lblNational.Text = ID.ToString();
            tbl = db.SqlQuery("Select count(GPA) from Student_Subject where stNationalID='" + ID + "' ");
            int G = Convert.ToInt32(tbl.Rows[0][0]);
            if (G == 0)
            {
                lblGPA.Text = "0.00";
            }
            else
            {
                tbl = db.SqlQuery("select sum(GPA)/count(GPA) from ViewStatStudent where stNationalID='" + ID + "' ");
                string Gpa = tbl.Rows[0][0].ToString();
                lblGPA.Text = Gpa.Substring(0, 4);
            }
            tbl = db.SqlQuery("select count(stNationalID) from Student_Subject where stNationalID = '" + ID + "' and not Appreciation = 'F' ");
            lblSeccess.Text = tbl.Rows[0][0].ToString();
            tbl = db.SqlQuery("select count(stNationalID) from Student_Subject where stNationalID='" + ID + "' and Appreciation ='F';");
            lblFull.Text = tbl.Rows[0][0].ToString();
            tbl = db.SqlQuery("select count(stNationalID) from Student_Subject where Appreciation IS Not Null and stNationalID='" + ID + "'");
            lbltotal.Text = tbl.Rows[0][0].ToString();
            int total=Convert.ToInt16( tbl.Rows[0][0]);
            tbl = db.SqlQuery("select TotalSubject from Slate");
            int toTotalSubjecttal =Convert.ToInt16(tbl.Rows[0][0]);
            int his = toTotalSubjecttal- total;
            lblfill.Text = his.ToString();
            tbl = db.SqlQuery("select SubjectMantory from Slate");
            lblMandtory.Text = tbl.Rows[0][0].ToString();
            tbl = db.SqlQuery("select SubjectChooes from Slate");
            lblchoess.Text = tbl.Rows[0][0].ToString();
            tbl = db.SqlQuery("Select count(stNationalID) from ViewStatStudent where SubjectType=N'اجباري' and stNationalID='"+ID+ "' and Appreciation IS Not Null ");
            lbltotalmandtory.Text = tbl.Rows[0][0].ToString();
            tbl = db.SqlQuery("Select count(stNationalID) from ViewStatStudent where SubjectType=N'اختياري' and stNationalID='" + ID + "' and Appreciation IS Not Null ");
            lbltotalChoess.Text = tbl.Rows[0][0].ToString();
            tbl = db.SqlQuery("select SubjectHour from Slate");
            his = Convert.ToInt16(tbl.Rows[0][0]);
            lblHour.Text = (toTotalSubjecttal * his).ToString();
            lblHourT.Text = (total * his).ToString();
            lblHourB.Text = (Convert.ToInt32(lblHour.Text)-Convert.ToInt32(lblHourT.Text)).ToString();


        }
    }
}