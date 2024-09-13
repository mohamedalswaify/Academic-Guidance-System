using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Academic.PagesAdmin
{
    public partial class Page_Admin3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnAddDep_Click(object sender, EventArgs e)
        {
            if (radStudent.Checked) {
            try
            {
                DataAddStudent.Insert();
                DgvStudent.DataBind();
                lblbAdded.Visible = true;
                lblbAdded.Text = "تمت الاضافة بنجاح";
                lblbAdded.ForeColor = Color.Green;
            }
            catch (Exception )
            {
                lblbAdded.Text = "الطالب موجود من قبل";
                lblbAdded.ForeColor = Color.Red;
                lblbAdded.Visible = true;
            }
            }
            else if (radAdvisor.Checked)
            {
                try
                {
                    DataAddDoctor.Insert();
                    DgvStudent.DataBind();
                    lblbAdded.Visible = true;
                    lblbAdded.Text = "تمت الاضافة بنجاح";
                    lblbAdded.ForeColor = Color.Green;
                }
                catch (Exception)
                {
                    lblbAdded.Text = "المرشد موجود من قبل";
                    lblbAdded.ForeColor = Color.Red;
                    lblbAdded.Visible = true;
                }
            }
            else if (rademployee.Checked)
            {
                try
                {
                    DataAddEmployee.Insert();
                    DgvStudent.DataBind();
                    lblbAdded.Visible = true;
                    lblbAdded.Text = "تمت الاضافة بنجاح";
                    lblbAdded.ForeColor = Color.Green;
                }
                catch (Exception )
                {
                    lblbAdded.Text ="الموظف موجود من قبل";
                    lblbAdded.ForeColor = Color.Red;
                    lblbAdded.Visible = true;
                }
              
            }
        }

        protected void radStudent_CheckedChanged(object sender, EventArgs e)
        {
            radAdvisor.Checked = false;
            rademployee.Checked = false;
            radStudent.Checked = true;
            
            pStudent.Visible = true;
            pEmployee.Visible = false;
            PDoctor.Visible = false;

            DgvDoctor.Visible = false;
            DgvStudent.Visible = true;
            DgvEmployee.Visible = false;


        }

        protected void radAdvisor_CheckedChanged(object sender, EventArgs e)
        {
            radAdvisor.Checked = true;
            rademployee.Checked = false;
            radStudent.Checked = false;

            pStudent.Visible = false;
            pEmployee.Visible = false;
            PDoctor.Visible = true;

            DgvDoctor.Visible = true;
            DgvStudent.Visible = false;
            DgvEmployee.Visible = false;

        }

        protected void rademployee_CheckedChanged(object sender, EventArgs e)
        {
            radAdvisor.Checked = false;
            rademployee.Checked = true;
            radStudent.Checked = false;

            pStudent.Visible = false;
            pEmployee.Visible = true;
            PDoctor.Visible = false;

            DgvDoctor.Visible = false;
            DgvStudent.Visible = false;
            DgvEmployee.Visible = true;
        }

        protected void RadGrid1_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {

        }

        protected void DgvEmployee_DeleteCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
         
        }

        protected void DgvDoctor_DeleteCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
          
        }
    }
}