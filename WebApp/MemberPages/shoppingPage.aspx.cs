using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Xml;
using System.IO;
using System.Web.Caching;

namespace WebApp.MemberPages
{
    public partial class shoppingPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loginService.LoginDetails loginobj = (loginService.LoginDetails)Session["loginDetailsObj"];
            if (loginobj != null && !loginobj.Loginrole.Equals("Member"))
            {
                Response.Redirect("~/StaffPages/StaffDefault.aspx");
            }

            if (!IsPostBack)
            {
                String url = "http://webstrar30.fulton.asu.edu/page0/page01/Service1.svc/GetCatalog";
                WebRequest req = WebRequest.Create(@url);
                req.Method = "GET";
                try
                {
                    HttpWebResponse resp = req.GetResponse() as HttpWebResponse;
                    if (resp.StatusCode == HttpStatusCode.OK)
                    {
                        noCatalogItemsLabel.Visible = false;
                        using (Stream respStream = resp.GetResponseStream())
                        {
                            XmlDocument doc = new XmlDocument();
                            doc.Load(respStream);

                            XmlNodeList nameList = doc.GetElementsByTagName("Name");
                            XmlNodeList priceList = doc.GetElementsByTagName("Price");
                            XmlNodeList quantityList = doc.GetElementsByTagName("Quantity");

                            List<shoppingCartService.Product> allCatalogItems = new List<shoppingCartService.Product>();

                            if (nameList.Count > 0)
                            {
                                for (int i = 0; i < nameList.Count; i++)
                                {
                                    shoppingCartService.Product prodObj = new shoppingCartService.Product();
                                    prodObj.ProductName = nameList[i].InnerText.ToString();
                                    prodObj.Quantity = Convert.ToInt32(quantityList[i].InnerText);
                                    prodObj.Price = Convert.ToDouble(priceList[i].InnerText);
                                    allCatalogItems.Add(prodObj);
                                }
                                Repeater1.DataSource = allCatalogItems;
                                Repeater1.DataBind();
                            }
                            else
                            {
                                noCatalogItemsLabel.Visible = true;
                                noCatalogItemsLabel.Text = "There are no products in catalog";
                            }
                        }
                    }
                    else
                    {
                        noCatalogItemsLabel.Visible = true;
                        noCatalogItemsLabel.Text = "The site is not responding";
                    }
                }
                catch (Exception)
                {
                    noCatalogItemsLabel.Visible = true;
                    noCatalogItemsLabel.Text = "An Exception has occured. Please try again!";
                }
                loadItemsInCart();
            }
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            try
            {
                string[] argParts = e.CommandArgument.ToString().Split(';');
                shoppingCartService.Product selectedItem = new shoppingCartService.Product();
                selectedItem.ProductName = argParts[0];
                selectedItem.Price = Convert.ToDouble(argParts[1]);
                selectedItem.Quantity = Convert.ToInt32(argParts[2]);
                int quantityOrdered = Convert.ToInt32(argParts[3]);
                shoppingCartService.CartServiceClient cartSvcObj = new shoppingCartService.CartServiceClient();
                shoppingCartService.Product[] allCartItems = cartSvcObj.addToCart(HttpContext.Current.User.Identity.Name, selectedItem.ProductName, quantityOrdered);
                shoppingCartService.Product[] recentThreeItems = new shoppingCartService.Product[3];
                for (int i = 1; i <= 3; i++)
                {
                    if (allCartItems.Length - i >= 0)
                        recentThreeItems[i - 1] = allCartItems[allCartItems.Length - i];
                }
                Repeater2.DataSource = recentThreeItems;
                Repeater2.DataBind();
                cartItemsCountLabel.Visible = false;
                cartItemsCountLabel.Text = "";
                Session["itemsInCart"] = allCartItems;
                noCatalogItemsLabel.Visible = true;
                noCatalogItemsLabel.Text = "Added to the cart !!";
            }
            catch (Exception)
            {
                noCatalogItemsLabel.Visible = true;
                noCatalogItemsLabel.Text = "Unable to add the product to cart !!";
            }
        }

        private void loadItemsInCart()
        {
            try
            {
                shoppingCartService.CartServiceClient cartSvcObj = new shoppingCartService.CartServiceClient();
                //get username from session after login
                shoppingCartService.Product[] cartItems = cartSvcObj.getProductsInCart(HttpContext.Current.User.Identity.Name);
                shoppingCartService.Product[] recentThreeItems = new shoppingCartService.Product[3];
                for (int i = 1; i <= 3; i++)
                {
                    if (cartItems.Length - i >= 0)
                        recentThreeItems[i - 1] = cartItems[cartItems.Length - i];
                }
                Repeater2.DataSource = recentThreeItems;
                Repeater2.DataBind();
                if (cartItems.Length - 3 > 0)
                {
                    remainingCartItemsLbl.Visible = true;
                    remainingCartItemsLbl.Text = "and " + (cartItems.Length - 3) + " more items";
                }
                if (cartItems.Length > 0)
                    cartItemsCountLabel.Text = "";
                else
                {
                    cartItemsCountLabel.Visible = true;
                    cartItemsCountLabel.Text = "Your cart is empty.";
                }
                Session["itemsInCart"] = cartItems;
            }
            catch (Exception)
            {
                cartItemsCountLabel.Visible = true;
                cartItemsCountLabel.Text = "Your cart is empty.";
            }
        }

        protected void checkOutBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MemberPages/Checkout.aspx");
        }
    }
}