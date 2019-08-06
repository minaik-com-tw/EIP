<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="ForwarderiniAdd.aspx.cs" Inherits="ForwarderData.ForwarderDataAdd" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="ForwarderData Add Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table border="0" Class="Normal">
		<tr>
			<td valign="top">
				<table>
					
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_ta_oga20" runat="server" CssClass="NormalBold" Text="�����ӥN��"></asp:Label></td><td><SmoothEnterpriseWebControl:InputText id="FIELD_ta_oga20" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uTa_oga20�v!!" MaxLength="20"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td></tr>
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_pmc30" runat="server" CssClass="NormalBold" Text="�����ӦW��"></asp:Label></td><td><SmoothEnterpriseWebControl:InputText id="FIELD_pmc30" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uPmc30�v!!" MaxLength="20"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td></tr>
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_account" runat="server" CssClass="NormalBold" Text="�����ӱb��"></asp:Label></td><td><SmoothEnterpriseWebControl:InputText id="FIELD_account" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uAccount�v!!" MaxLength="50"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td></tr>
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_password" runat="server" CssClass="NormalBold" Text="�����ӱK�X"></asp:Label></td><td><SmoothEnterpriseWebControl:InputText id="FIELD_password" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uPassword�v!!" MaxLength="50"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td></tr>
				</table>
			</td>
		</tr>
	</table>
	<table border="0" Class="Normal">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_save" runat="server" Text="�x�s" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_save_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>&nbsp;
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_savenext" runat="server" Text="�x�s���~��ާ@" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_save_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>&nbsp;
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Text="�^�W��" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_back_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>
			</td>
		</tr>
	</table>
</asp:Content>