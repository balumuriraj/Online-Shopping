<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EncryptDecryptTryIt.aspx.cs" Inherits="WebApp.EncryptDecryptTryIt" %>

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
                            <li><a id="loginLink" runat="server" href="~/Account/MemberLogin.aspx">Member Log in</a></li>
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

        </div>
</div>
    </header>
    <div id="body">
        <section class="content-wrapper main-content clear-fix">
            <header>
            <h3>Encrypt:</h3>
        </header>
         <p>
            <span class="label">Plain Text:</span> 
            <asp:TextBox ID="EncTextBox" runat="server"></asp:TextBox>
        </p>
        <p>
            <span class="label">Result:</span>
            <asp:Label ID="EncResult" runat="server"></asp:Label>
        </p>
        <p>
            <asp:Button ID="EncButton" runat="server" Text="Encrypt" OnClick="EncButton_Click" />
        </p>

        <header>
            <h3>Decrypt:</h3>
        </header>
        <p>
            <span class="label">Cipher Text:</span> 
            <asp:TextBox ID="DecTextBox" runat="server"></asp:TextBox>
        </p>
        <p>
            <span class="label">Result:</span>
            <asp:Label ID="DecResult" runat="server"></asp:Label>
        </p>
        <p>
            <asp:Button ID="DecButton" runat="server" Text="Decrypt" OnClick="DecButton_Click" />
        </p>
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