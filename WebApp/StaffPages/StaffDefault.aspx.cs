using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.StaffPages
{
    public partial class StaffDefault : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loginService.LoginDetails loginobj = (loginService.LoginDetails)Session["loginDetailsObj"];
            if (loginobj != null && loginobj.Loginrole.Equals("Member"))
            {
                Response.Redirect("~/MemberPages/shoppingPage.aspx");
            }
        }
    }
}