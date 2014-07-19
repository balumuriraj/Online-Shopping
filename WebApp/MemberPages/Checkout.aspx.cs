using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.XPath;
using System.Net;
using System.IO;

namespace WebApp.MemberPages
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loginService.LoginDetails loginobj = (loginService.LoginDetails)Session["loginDetailsObj"];
            if (loginobj != null && !loginobj.Loginrole.Equals("Member"))
            {
                Response.Redirect("~/StaffPages/StaffDefault.aspx");
            }

            double amount;
            String url = "http://webstrar30.fulton.asu.edu/page0/page02/CheckOutSVC.svc/checkOut?userId=" + loginobj.Loginusername;
            WebRequest req = WebRequest.Create(@url);
            req.Method = "GET";

            HttpWebResponse resp = req.GetResponse() as HttpWebResponse;
            if (resp.StatusCode == HttpStatusCode.OK)
            {
                using (Stream respStream = resp.GetResponseStream())
                {
                    XmlDocument doc = new XmlDocument();
                    doc.Load(respStream);

                    XmlNodeList nameList = doc.GetElementsByTagName("double");
                    amount = Convert.ToDouble(nameList[0].InnerXml);

                    if (Convert.ToInt32(amount) > 0)
                    {
                        
                        TableHeaderRow htr = new TableHeaderRow();
                        TableHeaderCell htc1 = new TableHeaderCell();
                        TableHeaderCell htc2 = new TableHeaderCell();
                        TableHeaderCell htc3 = new TableHeaderCell();
                        htc1.Text = "Name";
                        htc2.Text = "Quantity";
                        htr.Cells.Add(htc1);
                        htr.Cells.Add(htc2);
                        Table1.Rows.Add(htr);

                        shoppingCartService.CartServiceClient cartSvcObj = new shoppingCartService.CartServiceClient();
                        shoppingCartService.Product[] allCartItems = Session["itemsInCart"] as shoppingCartService.Product[];

                        for (int i = 0; i < allCartItems.Length; i++)
                        {
                            TableRow tr = new TableRow();
                            TableCell tc1 = new TableCell();
                            TableCell tc2 = new TableCell();
                            TableCell tc3 = new TableCell();
                            tc1.Text = allCartItems[i].ProductName;
                            tc2.Text = allCartItems[i].Quantity.ToString();
                            tr.Cells.Add(tc1);
                            tr.Cells.Add(tc2);
                            Table1.Rows.Add(tr);
                        }

                        Session["totalamount"] = amount;
                    }
                    else
                    {
                        error.Text = "The products in your cart are not in Stock!";
                        double amt = 0;
                        Session["totalamount"] = amt;
                    }
                }
            }
            else
            {
                error.Text = "Something went wrong. Try again!";
            }

            
        }

        protected void PaymentButton_Click(object sender, EventArgs e)
        {
            if ((Double)Session["totalamount"] > 0)
            {
                Response.Redirect("~/MemberPages/Payment.aspx");
            }
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Session["totalamount"] = "0";
            Response.Redirect("~/MemberPages/shoppingPage.aspx");
        }
    }
}