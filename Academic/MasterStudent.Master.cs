using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Academic
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                DataTable tbl = new DataTable();
                int ID = Convert.ToInt32(Request.Cookies["Login"]["ID"]);
                DBconnetion con = new DBconnetion();
                tbl = con.SqlQuery("select StudentID,Name,LevelName,DepName from VStudent where NationalID='" + ID + "' ");
                lblID.Text = tbl.Rows[0][0].ToString();
                lblName.Text = tbl.Rows[0][1].ToString();
                lbllevel.Text = tbl.Rows[0][2].ToString();
                lblspliz.Text = tbl.Rows[0][3].ToString();
                lblNameStudent.Text= tbl.Rows[0][1].ToString();

                tbl = con.SqlQuery("Select count(GPA) from Student_Subject where stNationalID='"+ID+"' ");
                int G =Convert.ToInt32( tbl.Rows[0][0]);
                if (G == 0)
                {
                    lblGPA.Text = "00.00";
                    lblgrade.Text = "NN";
                }
                else {
                    tbl = con.SqlQuery("select sum(GPA)/count(GPA) from ViewStatStudent where stNationalID='" + ID + "' ");
                    string Gpa = tbl.Rows[0][0].ToString();
                    double Gpe = Convert.ToDouble(tbl.Rows[0][0]);
                    lblGPA.Text = Gpa.Substring(0, 4);
                    Gpe = Math.Round(Gpe, 2);

                        if (Gpe < 1.00)
                            lblgrade.Text = "F";
                        else if (Gpe > 1.00 && Gpe < 1.50)
                            lblgrade.Text = "D";
                        else if (Gpe >= 1.50 && Gpe < 2.00)
                            lblgrade.Text = "D+";
                        else if (Gpe >= 2.00 && Gpe < 2.50)
                            lblgrade.Text = "C";
                        else if (Gpe >= 2.50 && Gpe < 3.00)
                            lblgrade.Text = "+C";
                        else if (Gpe >= 3.00 && Gpe < 3.50)
                            lblgrade.Text = "B";
                        else if (Gpe >= 3.00 && Gpe < 3.50)
                            lblgrade.Text = "B+";
                        else if (Gpe >= 3.00 && Gpe < 3.50)
                            lblgrade.Text = "A";
                        else
                            lblgrade.Text = "+A";
                }
            }
            catch (Exception)
            {
                Response.Redirect("../Default.aspx");
            }
        }
    }
}