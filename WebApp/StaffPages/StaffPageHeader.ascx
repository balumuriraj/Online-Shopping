<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StaffPageHeader.ascx.cs" Inherits="WebApp.StaffPages.StaffPageHeader" %>
<p style="text-align:right">
    <%= (string)Session["userName"] %>
    <asp:Button ID="logoutBtn" Text="Signout" runat="server" OnClick="logoutBtn_Click" />
</p>