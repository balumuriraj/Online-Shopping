<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApp.Account.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="~/Content/Style.css" />
    <style>
        .hide {
            display:none;
        }

        .successmsg {
            color: green;
            font-weight: bold;
        }
        .dropd {
            border: 1px solid #e2e2e2;
            background: #fff;
            color: #333;
            font-size: 1.2em;
            margin: 5px 0 6px 0;
            padding: 5px;
            width: 310px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Scripts>
            <%--Framework Scripts--%>
            <asp:ScriptReference Name="jquery" />
            <%--Site Scripts--%>

        </Scripts>
    </asp:ScriptManager>
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
        <hgroup class="title">
            <h1>Member Registration: </h1>
            <h2>Use the form below to create a new account.</h2>
        </hgroup>

        <asp:Label ID="ErrResult" runat="server" CssClass="field-validation-error"></asp:Label>
        <asp:Label ID="Result" runat="server" CssClass="successmsg"></asp:Label>

        <fieldset>
            <legend>Member Registration Form</legend>
            <ol>
            <li>
                <asp:Label ID="LabelName" runat="server" AssociatedControlID="Name">Name</asp:Label>
                <asp:TextBox runat="server" ID="Name" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Name"
                    CssClass="field-validation-error" ErrorMessage="The Name field is required." />
            </li>
            <li>
                <asp:Label ID="LabelUserName" runat="server" AssociatedControlID="UserName">Username</asp:Label>
                <asp:TextBox runat="server" ID="UserName" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="UserName"
                    CssClass="field-validation-error" ErrorMessage="The user name field is required." />
            </li>
            <li>
                <asp:Label ID="Label1" runat="server" AssociatedControlID="Password">Password</asp:Label>
                <asp:TextBox runat="server" ID="Password" TextMode="Password" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Password"
                    CssClass="field-validation-error" ErrorMessage="The password field is required." />
            </li>
            <li>
                <asp:Label ID="Label2" runat="server" AssociatedControlID="ConfirmPassword">Confirm password</asp:Label>
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ConfirmPassword"
                        CssClass="field-validation-error" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                        CssClass="field-validation-error" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </li>
            <li>
                <asp:Label ID="Img" runat="server" AssociatedControlID="Image1" Text="String Image"></asp:Label>
                <asp:Image ID="Image1" runat="server" />
                <asp:Label ID="Label3" runat="server" AssociatedControlID="fake"></asp:Label>
                <asp:TextBox ID="fake" runat="server" CssClass="hide"></asp:TextBox>
            </li>
            <li>
                <asp:Label ID="Label4" runat="server" AssociatedControlID="ImgStrBox" Text="Enter the Image String"></asp:Label>
                <asp:TextBox ID="ImgStrBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ImgStrBox" CssClass="field-validation-error" Display="Dynamic" ErrorMessage="The Image String field is required."></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="fake" ControlToValidate="ImgStrBox" CssClass="field-validation-error" Display="Dynamic" ErrorMessage="The String do not match with the image!"></asp:CompareValidator>
            </li>
        </ol>
            <p><asp:Button ID="RegisterButton" runat="server" Text="Register" OnClick="RegisterButton_Click" /></p>
        </fieldset>
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
