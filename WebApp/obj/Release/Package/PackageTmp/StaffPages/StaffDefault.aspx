<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffDefault.aspx.cs" Inherits="WebApp.StaffPages.StaffDefault" %>
<%@ Register TagPrefix="staff" TagName="header" Src="~/StaffPages/StaffPageHeader.ascx" %>

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
                    <li><a id="A3" runat="server" href="~/StaffPages/StaffDefault.aspx">Home</a></li>
                    <li><a id="A4" runat="server" href="~/StaffPages/AddProduct.aspx">AddProduct</a></li>
                    <li><a id="A6" runat="server" href="~/StaffPages/DeleteProduct.aspx">DeleteProduct</a></li>
                    <li><a id="A5" runat="server" href="~/StaffPages/StaffRegistration.aspx">StaffRegistration</a></li>
                </ul>
            </nav>
        </div>
</div>
    </header>
    <div id="body">
        <section class="content-wrapper main-content clear-fix">
            You are logged in as : <%= (string)Session["userName"] %><br />
            <h1>Welcome to Staff HomePage</h1>
            <br />
            Staff member can add a product or delete a product. But only the staff member with admin previliges can register another staff member. Below are the links for these pages: <br /><br />
            <a id="A7" runat="server" href="~/StaffPages/AddProduct.aspx">AddProduct</a><br />
            <a id="A8" runat="server" href="~/StaffPages/DeleteProduct.aspx">DeleteProduct</a><br />
            <a href="StaffRegistration.aspx">Staff Registration</a> (Only Admin is allowed!)<br />
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
