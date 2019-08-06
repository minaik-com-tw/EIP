<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Security.Denied, App_Web_denied.aspx.cdcab7d2" title="Untitled Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table border="0" cellspacing="3" cellpadding="0" width="80%">
		<tr valign="top">
			<td width="1%"><IMG src="img/img-oops.jpg" border="1"></td>
			<td Class="NormalBold" style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 5px; PADDING-TOP: 5px">
			<span style="FONT-WEIGHT: bold; FONT-SIZE: 14px; COLOR: #660000; FONT-FAMILY: Tahoma"><asp:Label ID="L_errmsg1" runat="server"
                    Text="Sorry! You do not have the permission to access" meta:resourcekey="L_errmsg1Resource1"></asp:Label><br>
				<br>
				<span id="linkurl" runat="server" Class="PanelWhite" style="PADDING-RIGHT: 3px; PADDING-LEFT: 3px; PADDING-BOTTOM: 3px; PADDING-TOP: 3px">
						<asp:Label ID="L_errmsg2" runat="server" Text="url" meta:resourcekey="L_errmsg2Resource1"></asp:Label></span></span><br><br>
				<hr>
				<asp:Label ID="L_errmsg3" runat="server"
                    Text="Please take the following action to continue :" meta:resourcekey="L_errmsg3Resource1"></asp:Label><br>
				<br>
				<a href="javascript:history.back();"><asp:Label ID="L_errmsg4" runat="server" Text="Go back" meta:resourcekey="L_errmsg4Resource1"></asp:Label></a>
				<br>				
				<br>
				<asp:Label ID="L_errmsg5" runat="server" Text="or" meta:resourcekey="L_errmsg5Resource1"></asp:Label>
				<br>
				<br>
				<br>
				<a href="~/security/logout.aspx" id="relogin" runat="server"><asp:Label ID="L_errmsg6" runat="server" Text="Relogin with another user account" meta:resourcekey="L_errmsg6Resource1"></asp:Label></a>
			</td>
		</tr>
	</table>
</asp:Content>
