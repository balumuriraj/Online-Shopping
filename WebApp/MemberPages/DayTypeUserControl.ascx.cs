using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.MemberPages
{
    public partial class DayTypeUserControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DayOfWeek today = DateTime.Now.DayOfWeek;
            if (today.ToString().Equals("Saturday") || today.ToString().Equals("Sunday"))
                dayTypeLabel.Text = "Today is a Weekend day !! You will have 10% off on each purchase.";
            else
                dayTypeLabel.Text = "Today is a Week day !! You will have 10% off on purchases above $50.";
        }
    }
}