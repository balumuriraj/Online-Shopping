using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.MemberPages
{
    public partial class Receipt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loginService.LoginDetails loginobj = (loginService.LoginDetails)Session["loginDetailsObj"];
            if (loginobj != null && !loginobj.Loginrole.Equals("Member"))
            {
                Response.Redirect("~/StaffPages/StaffDefault.aspx");
            }

            String status = Session["Receipt"].ToString();
            string[] parts = status.Split('#');

            Label1.Text = parts[0];
            Label2.Text = parts[1];
            Label3.Text = parts[2];
            Label4.Text = parts[3];
        }
    }
}