<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApp.Default" %>

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
            <h2>Team 598 - Naruto, welcomes you to &quot;ONLINE SHOPPING&quot; application!</h2>
		<table>
			<tr>
				 <td colspan="6" style="text-align:center;" class="auto-style1">
				 This page is deployed at: <a href="http://webstrar30.fulton.asu.edu/page1/Default.aspx" > http://webstrar30.fulton.asu.edu/page1/Default.aspx </a>
				 </td>
			</tr>
			<tr>
			 <td colspan="6" style="text-align:center;">
			 This project is developed by: MohanRaj Balumuri, Varun Siruvoru, Raghuveer Nanduri
			 </td>
			</tr>
			<tr>
			 <th class="auto-style3">Provider Name</th>
			 <th class="auto-style3">Task</th>
			 <th style="width: 10%;">Try It Link</th>
			 <th style="width: 30%;">Comments</th>
			</tr>
            <tr>
                <td>Raghuveer</td>
                <td>Public page</td>
                <td><a href="http://webstrar30.fulton.asu.edu/page1/Default.aspx">Try It</a></td>
                <td>
                    <ul>
                        <li>This Page is a public page</li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td>Varun</td>
                <td>Login pages</td>
                <td><a href="http://webstrar30.fulton.asu.edu/page1/Account/MemberLogin.aspx">Member Login</a><br /><a href="http://webstrar30.fulton.asu.edu/page1/Account/StaffLogin.aspx">Staff Login</a></td>
                <td>
                    <ul>
                        <li>Member login page and staff login page</li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td>Mohanraj</td>
                <td>Registration page</td>
                <td><a href="http://webstrar30.fulton.asu.edu/page1/Account/Register.aspx">Member registration</a></td>
                <td>
                    <ul>
                        <li>Member registration page</li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td>Varun</td>
                <td>Member page</td>
                <td><a href="http://webstrar30.fulton.asu.edu/page1/MemberPages/userControlDemo.aspx">Try It</a></td>
                <td>
                    <ul>
                        <li>Add item to cart page</li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td>Raghuveer</td>
                <td>Staff page 1</td>
                <td><a href="http://webstrar30.fulton.asu.edu/page1/StaffPages/GetCatalog.aspx">Try It</a></td>
                <td>
                    <ul>
                        <li>Get Catalog page</li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td>Mohanraj</td>
                <td>Staff page 2</td>
                <td><a href="http://webstrar30.fulton.asu.edu/page1/StaffPages/StaffRegistration.aspx">Try It</a></td>
                <td>
                    <ul>
                        <li>Staff Registration Page</li>
                        <li>This can be accessed by only Admin</li>
                        <li>Admin credentials are <b>username</b> - admin, <b>password</b> - 123123</li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td>Varun</td>
                <td>User control with fragment caching</td>
                <td><a href="http://webstrar30.fulton.asu.edu/page1/MemberPages/userControlDemo.aspx">Try It</a></td>
                <td>
                    <ul>
                        <li>Implemented a user control in Add item to cart page</li>
                        <li>If current day is a weekend, displays a 10% off text</li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td>Mohanraj</td>
                <td>DLL implementation</td>
                <td><a href="">Try It</a></td>
                <td>
                    <ul>
                        <li>Implemented a DLL for encrypt and decrypt functionality</li>
                        <li>Used the DLL while saving the password in XML for staff registration and login</li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td>Raghuveer</td>
                <td>Server Controls</td>
                <td>Covered in all pages</td>
                <td>
                    <ul>
                        <li>Implemented server controls in almost all the pages like login, registration, add item to cart etc.</li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td>Varun</td>
                <td>Cart service (Remote Service)</td>
                <td><a href="http://webstrar30.fulton.asu.edu/page7/CartServiceTryIt.aspx">Try It</a></td>
                <td>
                    <ul>
                        <li>Implemented in assignment 3 by Varun</li>
                        <li>Used the service in Add item to cart page</li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td>Varun</td>
                <td>Login service (Remote Service)</td>
                <td><a href="http://webstrar30.fulton.asu.edu/page6/LoginTryIt.aspx">Try It</a></td>
                <td>
                    <ul>
                        <li>Implemented in assignment 3 by MohanRaj</li>
                        <li>Used the service for staff login</li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td>Mohanraj</td>
                <td>Registration Service (Remote Service)</td>
                <td><a href="http://webstrar30.fulton.asu.edu/page5/TryItSignUp.aspx">Try It</a></td>
                <td>
                    <ul>
                        <li>Implemented in assignment 3 by Raghuveer</li>
                        <li>Used the service for staff registration</li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td>Raghuveer</td>
                <td>Catalog Service (Remote Service)</td>
                <td><a href="http://webstrar30.fulton.asu.edu/page6/CatalogTryIt.aspx">Try It</a></td>
                <td>
                    <ul>
                        <li>Implemented in assignment 3 by MohanRaj</li>
                        <li>Used the service for the Get Catalog page, which is a staff page</li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td>Mohanraj</td>
                <td>Permanent state (XML file)</td>
                <td><a href="http://webstrar30.fulton.asu.edu/page1/StaffPages/StaffRegistration.aspx">Try It</a></td>
                <td>
                    <ul>
                        <li>Implemented this for the purpose of registration of staff members</li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td>Raghuveer</td>
                <td>Cookie and Session state</td>
                <td><a href="http://webstrar30.fulton.asu.edu/page1/Account/StaffLogin.aspx">Try It</a></td>
                <td>
                    <ul>
                        <li>Implemented this in the staff login page</li>
                        <li>Used the Cookie to remember the username in staff login page</li>
                        <li>Used the Session to save the username inorder to share among the multiple pages </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td>Varun</td>
                <td>Data caching with Dependency and callback</td>
                <td><a href="http://webstrar30.fulton.asu.edu/page1/MemberPages/userControlDemo.aspx">Try It</a></td>
                <td>
                    <ul>
                        <li>Implemented this in Add item to cart page</li>
                        <li>Cached the list of cart items in cache and used it to display the recent three items added in cart</li>
                        <li>Another cache item for total number of items in the cart which has Dependency on above cache item</li>
                        <li>Upon adding a new item to cart, used a callback to update both the above cache items</li>
                    </ul>
                </td>
            </tr>
		</table>
            </section></div>
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
