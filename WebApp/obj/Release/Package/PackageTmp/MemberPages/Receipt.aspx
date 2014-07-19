<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Receipt.aspx.cs" Inherits="WebApp.MemberPages.Receipt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
                    <li><a id="A4" runat="server" href="~/MemberPages/shoppingPage.aspx">ShoppingPage</a></li>
                </ul>
            </nav>
        </div>
</div>
    </header>
    <div id="body">
        <section class="content-wrapper main-content clear-fix">
            <h2 style="text-align:">Receipt Page</h2>
            <br />
            <div style="padding:40px; background:#F8F8F8;">
                <h3>Below is the Receipt for your order:</h3>
                <table>
                    <tr><td><b>Message: </b></td> <td>
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        </td></tr>
                    <tr><td><b>Amount Paid: </b></td><td> $<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                        </td></tr>
                    <tr><td><b>Order ID: </b></td><td>
                        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                        </td></tr>
                    <tr><td><b>Order Status: </b></td><td>
                        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                        </td>
                        </tr>
                </table>
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
