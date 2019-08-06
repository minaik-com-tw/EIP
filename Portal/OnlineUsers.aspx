<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Portal.OnlineUsers, App_Web_onlineusers.aspx.cdcab7d2" theme="Default" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Portal.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table width="80%">
		<tr vAlign="top">
			<td width="99%">
			<SmoothEnterpriseWebControlEnterprise:ONLINEUSERS id="OnlineUsers1" runat="server" Width="100%" Font-Names="Arial" Font-Size="12px"
					BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" BackColor="WhiteSmoke" Height="8px" DisplayType="All" Expanded="True"
					ShowOption="False"></SmoothEnterpriseWebControlEnterprise:ONLINEUSERS>
		
			</td>
			<td>
				<table width="200" cellspacing="8" style="BORDER-RIGHT: #d8d8ec 1px solid; BORDER-TOP: #d8d8ec 1px solid; FONT-SIZE: 12px; BORDER-LEFT: #d8d8ec 1px solid; COLOR: slategray; BORDER-BOTTOM: #d8d8ec 1px solid; FONT-FAMILY: Arial, Tahoma; BACKGROUND-COLOR: aliceblue">
					<tr>
						<td>Total Users</td>
					</tr>
					<tr>
						<td height="1" background="/lib/img/bg-mask.gif"></td>
					</tr>
					<tr>
						<td><b><span id="totalusers" runat="server">0</span></b></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</asp:Content>
