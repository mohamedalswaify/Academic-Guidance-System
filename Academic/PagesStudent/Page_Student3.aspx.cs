using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Academic.PagesStudent
{
    public partial class Page_Student3 : System.Web.UI.Page
    {
        DBconnetion db = new DBconnetion();
        DataTable tbl = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {

            
            if (IsPostBack == false ) {
                DBconnetion db = new DBconnetion();
                DataTable tbl = new DataTable();

                int ID = Convert.ToInt32(Request.Cookies["Login"]["ID"]);
                Session["StudID"] = ID;



                tbl = db.SqlQuery("Select levelID from Student where NationalID='" + ID + "' ");
                int level = Convert.ToInt32(tbl.Rows[0][0]);
                Session["LevelID"] = level;

                tbl = db.SqlQuery("Select DepID from Student where NationalID='" + ID + "' ");
                int DepartmentID = Convert.ToInt32(tbl.Rows[0][0]);

                tbl = db.SqlQuery("select term from Terms");
                int Re = Convert.ToInt32(tbl.Rows[0][0]);
                Session["TermID"] = Re;

                tbl = db.SqlQuery("select SubjectID,SubjectName from Subjects where  LevelID<="+level+" and DepID="+ DepartmentID + " and SubjectType=N'اجباري' and SubjectID not in (select SubjectID from Student_Subject where stNationalID='"+ID+"') and Statu=1 ");
                DDlMandatory.DataSource = tbl;
                DDlMandatory.DataTextField = "SubjectName";
                DDlMandatory.DataValueField = "SubjectID";
                DDlMandatory.DataBind();
                ListItem Mandatory = new ListItem("(من فضلك اختر مادة اجباري)", string.Empty);
                DDlMandatory.Items.Insert(0, Mandatory);

                tbl = db.SqlQuery("select SubjectID,SubjectName from Subjects where  LevelID<="+level+" and SubjectType=N'اختياري' and SubjectID not in (select SubjectID from Student_Subject where stNationalID='"+ID+"') and Statu=1 ");
                DDlChose.DataSource = tbl;
                DDlChose.DataTextField = "SubjectName";
                DDlChose.DataValueField = "SubjectID";
                DDlChose.DataBind();
                ListItem Chose = new ListItem("(من فضلك اختر مادة ااختياري)", string.Empty);
                DDlChose.Items.Insert(0, Chose);


                tbl = db.SqlQuery("select SubjectID,SubjectName from ViewSubjectB where stNationalID='" + ID + "' and Appreciation=N'F'");
                if (tbl.Rows.Count == 0) {
                    Pfull.Visible = false;
                }
                else
                {
                    Pfull.Visible = true;
                    DDlFul.DataSource = tbl;
                    DDlFul.DataTextField = "SubjectName";
                    DDlFul.DataValueField = "SubjectID";
                    DDlFul.DataBind();
                    ListItem full = new ListItem("(من فضلك اختر مادة الرسوب)", string.Empty);
                    DDlFul.Items.Insert(0, full);
                }
            }


        }

        protected void DDlMandatory_TextChanged(object sender, EventArgs e)
        {

            Session["SubjectID"] = DDlMandatory.SelectedValue;
            int ID = Convert.ToInt32(Request.Cookies["Login"]["ID"]);
            Session["StudentID"] = ID;
            DataStudent.Insert();
        }

        protected void DDlMandatory_DataBound1(object sender, EventArgs e)
        {
            //Session["SubjectID"] = DDlMandatory.SelectedValue;
            //int ID = Convert.ToInt32(Request.Cookies["Login"]["ID"]);
            //Session["StudentID"] = ID;
            //DataStudent.Insert();
        }

        protected void DDlMandatory_SelectedIndexChanged(object sender, EventArgs e)
        {
            DateTime da = DateTime.Now;
            int ID = Convert.ToInt32(Request.Cookies["Login"]["ID"]);
            tbl = db.SqlQuery("select term from Terms");
            int Re = Convert.ToInt32(tbl.Rows[0][0]);
            tbl = db.SqlQuery("Select Count(stNationalID) from Student_Subject where Term="+Re+ " and stNationalID='"+ID+"' and AcademicYear='"+da.Year.ToString()+"' ");
            int count = Convert.ToInt32(tbl.Rows[0][0]);

            if(DgvStudent.Items.Count == 5 || count==5)
            {
                pEmpty1.Visible = true;
                return;
            }
            if (DDlMandatory.SelectedIndex == 0)
            {
                return;
            }

            try
            {
                pEmpty1.Visible = false;
                pEmpty.Visible = false;
                Session["SubjectID"] = DDlMandatory.SelectedValue;
                Session["StudentID"] = ID;
                DataStudent.Insert();
            }
            catch (Exception)
            {
                pEmpty.Visible = true;
            }
        
        }

        protected void DDlChose_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (DgvStudent.Items.Count == 5)
            {
                pEmpty1.Visible = true;
                return;
            }
            if (DDlChose.SelectedIndex == 0)
            {
                return;
            }

            try
            {
                pEmpty1.Visible = false;
                pEmpty.Visible = false;
                Session["SubjectID"] = DDlChose.SelectedValue;
                int ID = Convert.ToInt32(Request.Cookies["Login"]["ID"]);
                Session["StudentID"] = ID;
                DataStudent.Insert();
            }
            catch (Exception)
            {
                pEmpty.Visible = true;
            }
        }

        protected void DDlFul_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DgvStudent.Items.Count == 5)
            {
                pEmpty1.Visible = true;
                return;
            }
            if (DDlFul.SelectedIndex == 0)
            {
                return;
            }

            try
            {
                pEmpty1.Visible = false;
                pEmpty.Visible = false;
                Session["SubjectID"] = DDlFul.SelectedValue;
                int ID = Convert.ToInt32(Request.Cookies["Login"]["ID"]);
                Session["StudentID"] = ID;
                DataStudent.Insert();
            }
            catch (Exception)
            {
                pEmpty.Visible = true;
            }
        }
    }
}