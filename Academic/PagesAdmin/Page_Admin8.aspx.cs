using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Academic.PagesAdmin
{
    public partial class Page_Admin8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                DataAddvisor.Insert();
                dgv.DataBind();
                lblbAdded.Visible = true;
                lblbAdded.Text = "تمت الاضافة بنجاح";
                lblbAdded.ForeColor = Color.Green;


            }
            catch (Exception)
            {

                lblbAdded.Text = "المرشد متواجدة من قبل في نفس اليوم";
                lblbAdded.ForeColor = Color.Red;
                lblbAdded.Visible = true;
            }
        }
    }
}