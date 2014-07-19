<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="WebApp.StaffPages.AddProduct" %>
<%@ Register TagPrefix="staff" TagName="header" Src="~/StaffPages/staffPageHeader.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="~/Content/Style.css" />
    <style>
        #CatlogError, #addError, #delError {
            color:red;
        }
        #addProdOutput, #delProductOutput {
            color:green;
        }
        #CatlogOutput {
            width: 800px;
            height: 300px;
        }
        table.table td{ border:2px solid black; padding:5px;}
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
            <div style="text-align:center;">
                <h1>STAFF PAGE</h1>
            </div>
            <br /><br />
            <div style="padding:30px; background:#f8f8f8">
                
                <h3>Add Product to Catalog:</h3>
                <table>
                    <tr>
                    <td><b>Product Name: </b> </td>
                    <td><asp:TextBox ID="addNameBox" runat="server"></asp:TextBox></td>
                        
                    </tr>
                    <tr>
                    <td><b>Price: </b></td>
                    <td><asp:TextBox ID="addPriceBox" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                    <td><b>Quantity: </b></td>
                    <td><asp:TextBox ID="addQuantBox" runat="server"></asp:TextBox></td>
                    </tr>
                </table>
                <p><asp:Button ID="addProductButton" runat="server" Text="Add Product" OnClick="addProductButton_Click" /><asp:Button ID="CatalogButton" runat="server" OnClick="CatalogButton_Click" Text="Display Products" /></p>
                <p><asp:Label ID="addError" runat="server"></asp:Label></p>
                <p><asp:Label ID="addProdOutput" runat="server"></asp:Label></p>

                <p><asp:Label ID="CatlogError" runat="server"></asp:Label></p>

                <asp:Table ID="Table1" runat="server"  CssClass="table" CellPadding="10" CellSpacing="10">
                </asp:Table>
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