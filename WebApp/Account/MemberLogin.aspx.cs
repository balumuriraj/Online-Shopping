using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassLibrary;

namespace WebApp.Account
{
    public partial class MemberLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie storedCookie = Request.Cookies["memberLogin"];
            if (storedCookie == null || storedCookie["userName"] == null || storedCookie["userName"] == "")
                userStatusLabel.Text = "Welcome new user !!";
            else
            {
                userStatusLabel.Text = "Welcome " + storedCookie["userName"] + " !!";
                userNameTB.Text = storedCookie["userName"];
            }
        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            string uName = userNameTB.Text;
            string pwd = EncryptionDecryption.Encrypt(passwordTB.Text);

            loginService.LoginServiceClient loginSvcObj = new loginService.LoginServiceClient();
            if (uName.Length > 0 && pwd.Length > 0)
            {
                loginService.LoginDetails loginResult = loginSvcObj.Login(uName, pwd);
                if (loginResult == null || loginResult.Loginrole != "Member")
                {
                    loginStatusLbl.Text = "Invalid credentials.";
                    Session["userName"] = null;
                    Session["loginDetailsObj"] = null;
                }
                else
                {
                    Session["userName"] = loginResult.Loginusername;
                    Session["loginDetailsObj"] = loginResult;

                    FormsAuthentication.SetAuthCookie(uName, false);

                    if (rememberUserId.Checked)
                    {
                        HttpCookie myCookies = new HttpCookie("memberLogin");
                        myCookies["userName"] = uName;
                        myCookies.Expires = DateTime.Now.AddDays(2);
                        Response.Cookies.Add(myCookies);
                    }
                    Response.Redirect("~/MemberPages/shoppingPage.aspx");
                }
            }
            else
                loginStatusLbl.Text = "Please enter username and password.";
        }

        protected void clearBtn_Click(object sender, EventArgs e)
        {
            userNameTB.Text = "";
            passwordTB.Text = "";
            if (Request.Cookies["memberLogin"] != null)
            {
                HttpCookie storedCookie = Request.Cookies["memberLogin"];
                storedCookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(storedCookie);
                userStatusLabel.Text = "Welcome new user !!";
                userStatusLabel.DataBind();
            }
        }
    }
}