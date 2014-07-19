<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberLogin.aspx.cs" Inherits="WebApp.Account.MemberLogin" %>

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
                    <li><a id="A3" runat="server" href="~/">Home</a></li>
                    <li><a id="A4" runat="server" href="~/MemberPages/shoppingPage.aspx">ShoppingPage</a></li>
                </ul>
            </nav>
        </div>
</div>
    </header>
    <div id="body">
        <section class="content-wrapper main-content clear-fix">
        <h1>Member Login</h1>
            <br />
        <div class="stafflogin">
            Username: <asp:TextBox ID="userNameTB" runat="server"></asp:TextBox><br />
            Password: <asp:TextBox ID="passwordTB" runat="server" TextMode="Password"></asp:TextBox><br />
            <asp:Label ID="loginStatusLbl" runat="server" ForeColor="Red"></asp:Label><br />
            <asp:CheckBox ID="rememberUserId" runat="server" Text="Remember UserName" /><br />
            <asp:Button ID="loginBtn" runat="server" Text="Login" OnClick="loginBtn_Click" />
            <asp:Button ID="clearBtn" runat="server" Text="Clear" OnClick="clearBtn_Click" ToolTip="clears fields and cookies"/><br />
            <asp:Label ID="userStatusLabel" runat="server"></asp:Label>
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
