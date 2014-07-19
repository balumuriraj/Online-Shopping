<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="WebApp.MemberPages.Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="~/Content/Style.css" />
    <style>
        #PayError {
            color:red;
        }
    </style>
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
            <h2 style="text-align:">Payment Page</h2>
            <br />
            <div style="padding:40px; background:#F8F8F8;">
                <h3>Please enter your card details for payment:</h3>
                <table>
                    <tr><td><b>Card No: </b></td><td> <asp:TextBox ID="CardBox" runat="server"></asp:TextBox></td></tr>
                    <tr><td><b>CVV: </b></td><td><asp:TextBox ID="CvvBox" runat="server"></asp:TextBox>
                        </td></tr>
                    <tr><td><b>Exp Month: </b></td><td>
                        <asp:TextBox ID="MonthBox" runat="server"></asp:TextBox></td>
                        </tr>
                    <tr><td><b>Exp Year: </b></td><td>
                        <asp:TextBox ID="YearBox" runat="server"></asp:TextBox>
                        </td></tr>
                    
                </table>
                <p>
                    <asp:Label ID="PayError" runat="server"></asp:Label>
                </p>
                <p>
                    <asp:Button ID="PayButton" runat="server" Text="Submit Payment" OnClick="PayButton_Click" />
                </p>

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
