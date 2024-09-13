using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace Academic.PagesAdmin
{
    public partial class Page_Admin1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                DataSubject.Insert();
                dgv.DataBind();
                lblbAdded.Visible = true;
                lblbAdded.Text = "تمت الاضافة بنجاح";
                lblbAdded.ForeColor = Color.Green;


            }
            catch (Exception ex)
            {

                lblbAdded.Text = "المادة متواجدة من قبل في القسم";
                lblbAdded.ForeColor = Color.Red;
                lblbAdded.Visible = true;
            }
           

          
        }

        protected void dgv_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void RadGrid1_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {

        }

        protected void dgv_NeedDataSource1(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {

        }
    }
}