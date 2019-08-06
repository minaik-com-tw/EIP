<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Calendar.calendarDelete, App_Web_calendardelete.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
		<CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table border="0" Class="Normal">
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_calendarname" runat="server" Text="��ƾ�W��" meta:resourcekey="LABEL_calendarnameResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span name="FIELD_name" id="FIELD_name" runat="server"><FONT face="�s�ө���"></FONT></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_calendarcategory" runat="server" Text="���O" meta:resourcekey="LABEL_calendarcategoryResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span name="FIELD_category" id="FIELD_category" runat="server"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_remark" runat="server" Text="�Ƶ�" meta:resourcekey="LABEL_remarkResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span name="FIELD_remark" id="FIELD_remark" runat="server"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_privcy" runat="server" Text="�˵����v�覡" meta:resourcekey="LABEL_privcyResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span name="FIELD_privcy" id="FIELD_privcy" runat="server"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_noinvite" runat="server" Text="�����\�Q�ܽ�" meta:resourcekey="LABEL_noinviteResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span name="FIELD_noinvite" id="FIELD_noinvite" runat="server"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_enable" runat="server" Text="�ҥΪ��A" meta:resourcekey="LABEL_enableResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span name="FIELD_enabled" id="FIELD_enabled" runat="server"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_inituid" runat="server" Text="�إߤH��" meta:resourcekey="LABEL_inituidResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span name="FIELD_inituid" id="FIELD_inituid" runat="server"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_initdate" runat="server" Text="�إߤ��" meta:resourcekey="LABEL_initdateResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span name="FIELD_initdate" id="FIELD_initdate" runat="server"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_modifyuid" runat="server" Text="�̪�ק�H��" meta:resourcekey="LABEL_modifyuidResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span name="FIELD_modifyuid" id="FIELD_modifyuid" runat="server"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_modifydate" runat="server" Text="�̪�ק�ɶ�" meta:resourcekey="LABEL_modifydateResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span name="FIELD_modifydate" id="FIELD_modifydate" runat="server"><FONT face="�s�ө���"></FONT></span></td>
		</tr>
		<tr>
			<td>&nbsp;
				<SmoothEnterpriseWebControl:InputButton id="BUTTON_delete" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" Text="�R��" Font-Bold="True" cssClass="NormalBold" OnClick="BUTTON_delete_Click" Width="80px" meta:resourcekey="BUTTON_deleteResource1" RunAtCient="False">
					<Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
				</SmoothEnterpriseWebControl:InputButton>
				<SmoothEnterpriseWebControl:InputButton id="BUTTON_back" runat="server" width="80px" Label="����" CssClass="NormalBold" BackColor="#C8C8C8"
					BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial" Font-Size="12px" Font-Bold="True"
					Text="����" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControl:InputButton>
			</td>
		</tr>
	</table>
</asp:Content>
