<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Manager.MyQuestionView, App_Web_myquestionview.aspx.cdcab7d2" title="WebForm View Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
				<asp:Label ID="LABEL_fbno" runat="server" Text="問題編號" meta:resourcekey="LABEL_fbnoResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span name="FIELD_fbno" id="FIELD_fbno" runat="server"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_fbtype" runat="server" Text="問題類別" meta:resourcekey="LABEL_fbtypeResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span name="FIELD_fbtype" id="FIELD_fbtype" runat="server"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_fburl" runat="server" Text="問題反應網址" meta:resourcekey="LABEL_fburlResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span name="FIELD_fburl" id="FIELD_fburl" runat="server"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_fbdescription" runat="server" Text="問題描述" meta:resourcekey="LABEL_fbdescriptionResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span name="FIELD_description" id="FIELD_description" runat="server"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_fbresult" runat="server" Text="結果" meta:resourcekey="LABEL_fbresultResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span name="FIELD_result" id="FIELD_result" runat="server"><FONT face="新細明體"></FONT></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_fbstatus" runat="server" Text="處理狀態" meta:resourcekey="LABEL_fbstatusResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span name="FIELD_fbstatus" id="FIELD_fbstatus" runat="server"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_fbemail" runat="server" Text="希望回覆的電子郵件" meta:resourcekey="LABEL_fbemailResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span name="FIELD_fbemail" id="FIELD_fbemail" runat="server"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_fbdate" runat="server" Text="問題反應日期" meta:resourcekey="LABEL_fbdateResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span name="FIELD_fbdate" id="FIELD_fbdate" runat="server"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_remark" runat="server" Text="備註" meta:resourcekey="LABEL_remarkResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span name="FIELD_remark" id="FIELD_remark" runat="server"></span></td>
		</tr>
		<tr>
			<td>
				<SmoothEnterpriseWebControl:InputButton id="BackButton" runat="server" width="80px" Text="Back" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" OnClick="BackButton_Click" meta:resourcekey="BackButtonResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
			</td>
		</tr>
	</table>
</asp:Content>
