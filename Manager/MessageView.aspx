<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Manager.MessageView, App_Web_messageview.aspx.cdcab7d2" title="WebForm View Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Application.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
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
				<asp:Label ID="LABEL_messagename" runat="server" Text="�T���W��" meta:resourcekey="LABEL_messagenameResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span name="FIELD_name" id="FIELD_name" runat="server"><FONT face="�s�ө���"></FONT></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_defaultsubject" runat="server" Text="�w�]�D�D" meta:resourcekey="LABEL_defaultsubjectResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span name="FIELD_subject" id="FIELD_subject" runat="server"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_defaultsender" runat="server" Text="�w�]�H���" meta:resourcekey="LABEL_defaultsenderResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span name="FIELD_sender" id="FIELD_sender" runat="server"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_defaultcopyto" runat="server" Text="�w�]�ƥ������" meta:resourcekey="LABEL_defaultcopytoResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span name="FIELD_copyto" id="FIELD_copyto" runat="server"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_messagebody" runat="server" Text="�w�]�T�����e�榡" meta:resourcekey="LABEL_messagebodyResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span name="FIELD_body" id="FIELD_body" runat="server"></span></td>
		</tr>
		<tr>
			<td>
				<SmoothEnterpriseWebControl:InputButton id="BackButton" runat="server" width="80px" Text="�^�W��" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" OnClick="BackButton_Click" meta:resourcekey="BackButtonResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
			</td>
		</tr>
	</table>
</asp:Content>
