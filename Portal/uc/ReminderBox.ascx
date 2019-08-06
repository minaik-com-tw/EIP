<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Portal.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ control language="c#" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Portal.uc.ReminderBox, App_Web_reminderbox.ascx.50d77b3" targetschema="http://schemas.microsoft.com/intellisense/ie5" enableviewstate="False" %>
<table style="BORDER-RIGHT: #a2b6d0 1px solid; BORDER-TOP: #a2b6d0 1px solid; FONT-SIZE: 12px; BACKGROUND-IMAGE: url(img/bg1.jpg); BORDER-LEFT: #a2b6d0 1px solid; BORDER-BOTTOM: #a2b6d0 1px solid"
	cellSpacing="0" cellPadding="0" border="0">
	<tr>
		<td>
			<table style="FONT-SIZE: 11px; FONT-FAMILY: Tahoma, Arial" cellSpacing="2" width="180"
				border="0">
				<tr>
					<td width="1%"><img src="/lib/img/icon-reminder.gif" border="0" vspace="3" hspace="3"></td>
					<td ><asp:Label style="PADDING-RIGHT: 5px; FONT-WEIGHT: bold; COLOR: #417492" id="remindertitle"
						runat="server" Text="我個人的提醒事項：" meta:resourcekey="remindertitleResource1"></asp:Label></td>
				</tr>
				<tr>
					<td bgColor="lightsteelblue" height="1" colspan="2"></td>
				</tr>
				<tr>
					<td valign="top" height="40" colspan="2" style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 5px">
						<SmoothEnterpriseWebControlEnterprise:Reminder id="Reminder1" runat="server" Width="100%" Font-Size="11px" Font-Names="Tahoma"
							ForeColor="Black" PaddingSize="0px" meta:resourcekey="Reminder1Resource1">
							<NumberStyle ForeColor="White" GradientLevel="150" PaddingSize="2px" BackColor="DarkRed" BorderStyle="NotSet"></NumberStyle>
                            <TitleStyle BorderStyle="NotSet" />
						</SmoothEnterpriseWebControlEnterprise:Reminder>
					</td>
				</tr>
<!--				<tr>
					<td height="1" colspan=2 background="/lib/img/bg-mask.gif"></td>
				</tr>
				<tr>
				<td colspan=2 align=right style="PADDING-right: 10px; FONT-SIZE: 9px; COLOR: #417492; FONT-FAMILY: Arial">0 item(s).</td>
				</tr> -->
			</table>
		</td>
	</tr>
</table>
<table cellpadding="0" cellspacing="0">
	<tr>
		<td height="2"></td>
	</tr>
</table>
