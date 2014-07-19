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

namespace WebApp.StaffPages
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loginService.LoginDetails loginobj = (loginService.LoginDetails)Session["loginDetailsObj"];
            if (loginobj != null && loginobj.Loginrole.Equals("Member"))
            {
                Response.Redirect("~/MemberPages/shoppingPage.aspx");
            }

        }



        protected void addProductButton_Click(object sender, EventArgs e)
        {

            addProdOutput.Text = "";

            CatlogError.Text = "";
            addError.Text = "";

            if (addNameBox.Text == "" || addPriceBox.Text == "" || addQuantBox.Text == "")
            {
                addError.Text = "Please enter all the fields!";
                return;
            }

            String url = "http://webstrar30.fulton.asu.edu/page0/page01/Service1.svc/addProduct?name=" + addNameBox.Text + "&price=" + addPriceBox.Text + "&quantity=" + addQuantBox.Text;
            WebRequest req = WebRequest.Create(@url);
            req.Method = "GET";
            try
            {
                HttpWebResponse resp = req.GetResponse() as HttpWebResponse;
                if (resp.StatusCode == HttpStatusCode.OK)
                {
                    using (Stream respStream = resp.GetResponseStream())
                    {
                        XmlDocument doc = new XmlDocument();
                        doc.Load(respStream);

                        XmlNodeList nameList = doc.GetElementsByTagName("boolean");
                        if (nameList[0].InnerText.ToString() == "true")
                        {
                            addProdOutput.Text = "Product added Successfully!";
                        }
                        else
                        {
                            addError.Text = "Add product failed!";
                        }
                    }
                }
                else
                {
                    addError.Text = "The site is not responding";
                }
            }
            catch (Exception ex)
            {
                addError.Text = "An Exception has occured. Please try again!";
            }
        }

        protected void CatalogButton_Click(object sender, EventArgs e)
        {
            addProdOutput.Text = "";

            addNameBox.Text = "";
            addPriceBox.Text = "";
            addQuantBox.Text = "";

            CatlogError.Text = "";
            addError.Text = "";

            TableHeaderRow htr = new TableHeaderRow();
            TableHeaderCell htc1 = new TableHeaderCell();
            TableHeaderCell htc2 = new TableHeaderCell();
            TableHeaderCell htc3 = new TableHeaderCell();
            htc1.Text = "Name";
            htc2.Text = "Price";
            htc3.Text = "Quantity";
            htr.Cells.Add(htc1);
            htr.Cells.Add(htc2);
            htr.Cells.Add(htc3);
            Table1.Rows.Add(htr);

            String url = "http://webstrar30.fulton.asu.edu/page0/page01/Service1.svc/GetCatalog";
            WebRequest req = WebRequest.Create(@url);
            req.Method = "GET";
            try
            {
                HttpWebResponse resp = req.GetResponse() as HttpWebResponse;
                if (resp.StatusCode == HttpStatusCode.OK)
                {
                    using (Stream respStream = resp.GetResponseStream())
                    {
                        XmlDocument doc = new XmlDocument();
                        doc.Load(respStream);

                        XmlNodeList nameList = doc.GetElementsByTagName("Name");
                        XmlNodeList priceList = doc.GetElementsByTagName("Price");
                        XmlNodeList quantityList = doc.GetElementsByTagName("Quantity");

                        if (nameList.Count > 1)
                        {
                            for (int i = 0; i < nameList.Count; i++)
                            {
                                TableRow tr = new TableRow();
                                TableCell tc1 = new TableCell();
                                TableCell tc2 = new TableCell();
                                TableCell tc3 = new TableCell();
                                tc1.Text = nameList[i].InnerText.ToString();
                                tc2.Text = priceList[i].InnerText.ToString();
                                tc3.Text = quantityList[i].InnerText.ToString();
                                tr.Cells.Add(tc1);
                                tr.Cells.Add(tc2);
                                tr.Cells.Add(tc3);
                                Table1.Rows.Add(tr);
                            }
                        }
                        else
                        {
                            CatlogError.Text = "There are no products in catalog";
                        }
                    }
                }
                else
                {
                    CatlogError.Text = "The site is not responding";
                }
            }
            catch (Exception ex)
            {
                CatlogError.Text = "An Exception has occured. Please try again!";
            }
        }
    }
}