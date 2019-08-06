<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WebUserControl.ascx.cs" Inherits="Comm_WebUserControl" %>
<asp:Button ID="goBack_btn" runat="server" Text="返回" OnClick="goBack_btn_OnClick"   />
<asp:TextBox ID="txt_user" runat="server" Text="" OnLoad="ma_user_Load" ></asp:TextBox>