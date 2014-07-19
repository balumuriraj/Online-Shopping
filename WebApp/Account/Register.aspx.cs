using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using System.Runtime.Serialization;
using System.Xml;
using System.Xml.XPath;
using ClassLibrary;

namespace WebApp.Account
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                String randstr = "";
                String url = "http://venus.eas.asu.edu/WSRepository/Services/ImageVerifier/Service.svc/GetVerifierString/5";
                WebRequest req = WebRequest.Create(@url);
                req.Method = "GET";
                HttpWebResponse resp = req.GetResponse() as HttpWebResponse;
                if (resp.StatusCode == HttpStatusCode.OK)
                {
                    using (Stream respStream = resp.GetResponseStream())
                    {
                        XmlDocument doc = new XmlDocument();
                        doc.Load(respStream);

                        XmlNodeList nameList = doc.GetElementsByTagName("string");
                        randstr = nameList[0].InnerText.ToString();
                    }
                }

                Image1.ImageUrl = "http://venus.eas.asu.edu/WSRepository/Services/ImageVerifier/Service.svc//GetImage/" + randstr;
                fake.Text = randstr;
            }
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            String name = Name.Text;
            String username = UserName.Text;
            String password = EncryptionDecryption.Encrypt(Password.Text);

            Name.Text = "";
            UserName.Text = "";
            ImgStrBox.Text = "";
            Result.Text = "";
            ErrResult.Text = "";

            StaffRegisterService.SignUpServiceClient proxy = new StaffRegisterService.SignUpServiceClient();
            String output = proxy.signUp(name, username, password, "Member");

            if (output.Equals("Registration Successful!!"))
            {
                Result.Text = "Registration Successful!! " + "<a href='MemberLogin.aspx'>Click Here</a> to Login.";
            }
            else
            {
                ErrResult.Text = output;
            }
        }
    }
}