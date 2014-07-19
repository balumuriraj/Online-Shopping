<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userControlDemo.aspx.cs" Inherits="WebApp.MemberPages.userControlDemo" %>
<%@ Register TagPrefix="myControl" TagName="dayType" Src="~/MemberPages/DayTypeUserControl.ascx"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="~/Content/Style.css" />
</head>
<body>
    <form id="form1" runat="server">
    <header>
        <div class="content-wrapper">
            <div class="float-left">
                <p class="site-title">
                    <a id="A2" runat="server" href="~/">Online Shopping</a>
                </p>
            </div>
        <div class="float-right">
            <section id="login">
                <asp:LoginView ID="LoginView1" runat="server" ViewStateMode="Disabled">
                    <AnonymousTemplate>
                        <ul>
                            <li><a id="registerLink" runat="server" href="~/Account/Register.aspx">Register</a></li>
                            <li><a id="loginLink" runat="server" href="~/Account/Login.aspx">Member Log in</a></li>
                            <li><a id="A1" runat="server" href="~/Account/StaffLogin.aspx">Staff Log in</a></li>
                        </ul>
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                        <p>
                            Hello, <asp:LoginName ID="LoginName1" runat="server" CssClass="username" />!
                            <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" LogoutText="Log off" LogoutPageUrl="~/" />
                        </p>
                    </LoggedInTemplate>
                </asp:LoginView>
            </section>
            <nav>
                <ul id="menu">
                    <li><a id="A4" runat="server" href="~/MemberPages/userControlDemo.aspx">UserControlDemo</a></li>
                </ul>
            </nav>
        </div>
</div>
    </header>
    <div id="body">
        <section class="content-wrapper main-content clear-fix">
        <h2 style="text-align:">User Control and Data Caching Demo Page</h2>
        <br />
        <myControl:dayType runat="server" />

        <div>
            <asp:Button ID="loadItemsInCart" Text="Load Items from Cart DB" runat="server" OnClick="loadItemsInCart_Click" />
            <asp:Button ID="showCacheContent" Text="Show cart Items in cache" runat="server" OnClick="showCacheContent_Click" /><br />
            <h4>Recently added items to Cart</h4>
            <table>
                <tr>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <td><%# DataBinder.Eval((Container.DataItem as WebApp.shoppingCartService.Product),"ProductName") %></td>
                        </ItemTemplate>
                    </asp:Repeater>
                </tr>
            </table>
            <asp:Label ID="cacheStatusLabel" runat="server"></asp:Label><br />
            <asp:Button ID="showCountBtn" Text="Show Item count" runat="server" OnClick="showCountBtn_Click" />
            <asp:Label ID="cartItemsCountLabel" runat="server"></asp:Label><br />
            <asp:Button ID="clearDisplay" Text="Clear" runat="server" OnClick="clearDisplay_Click" />
        </div>
        <div>
            <h3>addToCart</h3>
            Product Id<asp:TextBox ID="productIdTB" runat="server"></asp:TextBox><br />
            Quantity <asp:TextBox ID="quantityTB" runat="server"></asp:TextBox><br />
            <asp:Button ID="addCartBtn" runat="server" Text="Submit" OnClick="addCartBtn_Click" />
            <asp:Button ID="addCartClearBtn" runat="server" Text="Clear" OnClick="addCartClearBtn_Click" /><br />
        </div>
            </section>
    </div>
    </form>
    <footer>
        <div class="content-wrapper">
            <div class="float-left">
                <p>&copy; <%: DateTime.Now.Year %> - My ASP.NET Application</p>
            </div>
        </div>
    </footer>
</body>
</html>
