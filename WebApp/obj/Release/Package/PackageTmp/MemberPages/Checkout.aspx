<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="WebApp.MemberPages.Checkout" %>
<%@ Register TagPrefix="myControl" TagName="dayType" Src="~/MemberPages/DayTypeUserControl.ascx"%>

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
            <h2 style="text-align:">Checkout Page</h2>
            <br />
            <div style="padding:40px; background:#F8F8F8;">
            <h3>List of products: </h3>

            <asp:Table ID="Table1" runat="server"  CssClass="table" CellPadding="10" CellSpacing="10">
                </asp:Table>
            <table style="text-align:right;">
                <tr><td><hr /></td><td><hr /></td></tr>
            <tr><td><b>Total Amount: </b></td> <td>$<%= (Double)Session["totalamount"] %></td></tr>
            </table>

                <br />
                <asp:Label ID="error" runat="server"></asp:Label>

            <br />
            <asp:Button ID="PaymentButton" runat="server" Text="Proceed to Payment" OnClick="PaymentButton_Click" />

            <asp:Button ID="CancelButton" runat="server" Text="Cancel" OnClick="CancelButton_Click" />
            </div>
        </section>
    </div>
    </form>
    <footer>
        <div class="content-wrapper">
            <div class="float-left">
                <p>&copy; <%: DateTime.Now.Year %>- My ASP.NET Application</p>
            </div>
        </div>
    </footer>
</body>
</html>
