using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Academic.PagesAdvisor
{
    public partial class Page_Advisor2 : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            int ID = Convert.ToInt32(Request.Cookies["Login"]["ID"]);
            Session["AdvisorID"] = ID;
           
            

        }
         protected void Button2_Click(object sender, EventArgs e)
        {
            
            int ID = Convert.ToInt32(Request.Cookies["Login"]["ID"]);
            DBconnetion db = new DBconnetion();
            try
            {
                string ok = db.SqlDml("Update Student_Subject set TypeOkayID=3 where  stNationalID IN (select NationalID from Student where adNationalID='" + ID + "' and LevelID=" + ddlLevel.SelectedValue + ")");
            }
            catch
            {

            }
            if (DgvStudent.Items.Count == 0)
            {
                DgvStudent.Visible = false;
                pEmpty.Visible = true;
            }
            else
            {
                DgvStudent.Visible = true;
                pEmpty.Visible = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
                
        }
    }
}