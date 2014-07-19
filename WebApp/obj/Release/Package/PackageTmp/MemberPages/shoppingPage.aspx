<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="shoppingPage.aspx.cs" Inherits="WebApp.MemberPages.shoppingPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Online Shopping</title>
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
                        <li><asp:Button ID="checkOutBtn" Text="Check out >" runat="server" OnClick="checkOutBtn_Click"/></li>
                        <!--<li><a id="A4" runat="server" href="~/MemberPages/shoppingPage.aspx">Shopping Page</a></li>-->
                    </ul>
                </nav>
            </div>
        </div>
    </header>
    <div id="body">
        <section class="content-wrapper main-content clear-fix">
        <div>
            <table>
                <thead>
                    <tr>
                        <td><b>Product Name</b></td>
                        <td><b>Price</b></td>
                        <td><b>Available</b></td>
                        <td><b>Quantity</b></td>
                    </tr>
                </thead>
                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                    <ItemTemplate>
                        <tr>
                           <td><%# DataBinder.Eval((Container.DataItem as WebApp.shoppingCartService.Product),"ProductName") %></td>
                           <td><%# DataBinder.Eval((Container.DataItem as WebApp.shoppingCartService.Product),"Price") %></td>
                           <td><%# DataBinder.Eval((Container.DataItem as WebApp.shoppingCartService.Product),"Quantity") %></td>
                           <td><asp:TextBox ID="quantityTB" runat="server" Text="1" Width="50px"></asp:TextBox></td>
                           <td><asp:Button ID="Button1" Text="Add to Cart" runat="server" CommandArgument='<%# DataBinder.Eval((Container.DataItem as WebApp.shoppingCartService.Product),"ProductName").ToString() + ";" + DataBinder.Eval((Container.DataItem as WebApp.shoppingCartService.Product),"Price") + ";" + DataBinder.Eval((Container.DataItem as WebApp.shoppingCartService.Product),"Quantity") + ";" + (((Container.FindControl("quantityTB") as TextBox).Text == "") ? Convert.ToString(1) : ((Container.FindControl("quantityTB") as TextBox).Text))%>'/></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater> 
            </table>
            <asp:Label ID="noCatalogItemsLabel" runat="server" Visible="false"></asp:Label>
        </div>
        <h4>Your recently added items</h4>
        <div>
            <table>
                <tr>
                    <asp:Repeater ID="Repeater2" runat="server"> 
                        <ItemTemplate>
                           <td><%# DataBinder.Eval((Container.DataItem as WebApp.shoppingCartService.Product),"ProductName") %></td>
                        </ItemTemplate>  
                    </asp:Repeater>
                    <td><asp:Label ID="remainingCartItemsLbl" runat="server" Visible="false"></asp:Label></td>
                </tr>
            </table>
            <asp:Label ID="cartItemsCountLabel" runat="server" Visible="false"></asp:Label>
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
