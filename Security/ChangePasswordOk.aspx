﻿<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Security.ChangePasswordOk, App_Web_changepasswordok.aspx.cdcab7d2" title="Untitled Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table Class="Normal" border="0">
		<tr Class="NormalBold">
			<td>
                <asp:Label ID="L_errmsg" runat="server" meta:resourcekey="L_errmsgResource1" Text='Change Password Finished !<br><br><a href="logout.aspx?target=/">Relogin with new password</a>'></asp:Label>
			</td>
		</tr>
	</table>
</asp:Content>
