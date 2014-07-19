using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.MemberPages
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loginService.LoginDetails loginobj = (loginService.LoginDetails)Session["loginDetailsObj"];
            if (loginobj != null && !loginobj.Loginrole.Equals("Member"))
            {
                Response.Redirect("~/StaffPages/StaffDefault.aspx");
            }
        }

        protected void PayButton_Click(object sender, EventArgs e)
        {
            loginService.LoginDetails loginobj = (loginService.LoginDetails)Session["loginDetailsObj"];

            PayError.Text = "";

            if (CardBox.Text == "" || CvvBox.Text == "" || MonthBox.Text == "" || YearBox.Text == "")
            {
                PayError.Text = "Please enter all the fields!";
                return;
            }

            try
            {
                PaymentService.PaymentServiceClient proxy = new PaymentService.PaymentServiceClient();
                string status = proxy.MakePayment(loginobj.Loginusername, Convert.ToInt32(CardBox.Text), Convert.ToInt32(CvvBox.Text), Convert.ToInt32(MonthBox.Text), Convert.ToInt32(YearBox.Text));

                if (status.IndexOf("Successful") != -1)
                {
                    Session["Receipt"] = status;
                    Response.Redirect("~/MemberPages/Receipt.aspx");
                }
                else
                {
                    PayError.Text = status;
                }
            }
            catch (Exception ex)
            {
                PayError.Text = "An Exception has occured. Please try again!";
            }
        }
    }
}