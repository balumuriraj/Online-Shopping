using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Caching;

namespace WebApp.MemberPages
{
    public partial class userControlDemo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loginService.LoginDetails loginobj = (loginService.LoginDetails)Session["loginDetailsObj"];
            if (loginobj != null && !loginobj.Loginrole.Equals("Member"))
            {
                Response.Redirect("~/StaffPages/StaffDefault.aspx");
            }

        }

        protected void loadItemsInCart_Click(object sender, EventArgs e)
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
            Repeater1.DataSource = recentThreeItems;
            Repeater1.DataBind();
            cacheStatusLabel.Text = "";
            if (cartItems.Length > 0)
                cartItemsCountLabel.Text = "";
            else
                cartItemsCountLabel.Text = "Your cart is empty.";
            Cache.Insert("itemsInCart", cartItems);
            string[] cacheKeys = { "itemsInCart" };
            CacheDependency cd = new CacheDependency(null, cacheKeys);
            Cache.Insert("totalItemsInCart", cartItems.Length, cd, DateTime.Now.AddMinutes(30), TimeSpan.Zero, new CacheItemUpdateCallback(cartUpdateCallback));
        }

        private void cartUpdateCallback(String key, CacheItemUpdateReason reason,
                              out Object expensiveObject, out CacheDependency dependencies,
                              out DateTime absoluteExpiration, out TimeSpan slidingExpiration)
        {
            string[] cacheKeys = { "itemsInCart" };
            CacheDependency cd = new CacheDependency(null, cacheKeys);
            shoppingCartService.Product[] cartItems = Cache["itemsInCart"] as shoppingCartService.Product[];
            expensiveObject = cartItems.Length;
            dependencies = cd;
            absoluteExpiration = DateTime.Now.AddMinutes(30);
            slidingExpiration = TimeSpan.Zero;
        }

        protected void showCacheContent_Click(object sender, EventArgs e)
        {
            Repeater1.DataSource = null;
            Repeater1.DataBind();
            if (Cache["itemsInCart"] != null && Cache["totalItemsInCart"] != null)
            {
                cacheStatusLabel.Text = "";
                shoppingCartService.Product[] cartItems = Cache["itemsInCart"] as shoppingCartService.Product[];
                shoppingCartService.Product[] recentThreeItems = new shoppingCartService.Product[3];
                for (int i = 1; i <= 3; i++)
                {
                    if (cartItems.Length - i >= 0)
                        recentThreeItems[i - 1] = cartItems[cartItems.Length - i];
                }
                Repeater1.DataSource = recentThreeItems;
                Repeater1.DataBind();
            }
            else
            {
                cacheStatusLabel.Text = "No items in Cache";
            }
        }

        protected void showCountBtn_Click(object sender, EventArgs e)
        {
            if (Cache["totalItemsInCart"] != null)
            {
                cartItemsCountLabel.Text = "Total number of items in Cart: " + Cache["totalItemsInCart"].ToString();
            }
            else
            {
                cartItemsCountLabel.Text = "No count in cache";
            }
        }

        protected void clearDisplay_Click(object sender, EventArgs e)
        {
            Repeater1.DataSource = null;
            Repeater1.DataBind();
            cartItemsCountLabel.Text = "";
            cacheStatusLabel.Text = "";
        }

        protected void addCartBtn_Click(object sender, EventArgs e)
        {
            string productId = productIdTB.Text;
            int quantity = Convert.ToInt32(quantityTB.Text);
            if (productId.Length > 0 && quantity > 0)
            {
                shoppingCartService.CartServiceClient cartSvcObj = new shoppingCartService.CartServiceClient();
                shoppingCartService.Product[] itemsInCart = cartSvcObj.addToCart(HttpContext.Current.User.Identity.Name, productId, quantity);
                shoppingCartService.Product[] recentThreeItems = new shoppingCartService.Product[3];
                for (int i = 1; i <= 3; i++)
                {
                    if (itemsInCart.Length - i >= 0)
                        recentThreeItems[i - 1] = itemsInCart[itemsInCart.Length - i];
                }
                Repeater1.DataSource = recentThreeItems;
                Repeater1.DataBind();
                Cache.Insert("itemsInCart", itemsInCart);
                cartItemsCountLabel.Text = "";
                cacheStatusLabel.Text = "Cache updated !! Click 'Show Item count' ";
            }
        }

        protected void addCartClearBtn_Click(object sender, EventArgs e)
        {
            productIdTB.Text = "";
            quantityTB.Text = "";
        }
    }
}