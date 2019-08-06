<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="ForwarderDelete.aspx.cs" Inherits="Shipping.ForwarderDelete" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Forwarder Delete Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<SmoothEnterpriseWebControl:PageJumper id="PageJumper1" runat="server" ShowPageNumber="True">
		<ButtonStyle PaddingSize="2px" Width="20px" GradientEnd="64, 64, 64" BorderWidth="1px" BorderStyle="Solid"
			BorderColor="96, 96, 96" GradientBegin="224, 224, 224" BackColor="200, 200, 200" Gradient="Top"></ButtonStyle>
		<PageSelectedStyle BorderWidth="3px" BorderStyle="Solid" BorderColor="Black" BackColor="WhiteSmoke"></PageSelectedStyle>
		<PageNumberStyle Font-Size="10px" Font-Names="Arial" PaddingSize="2px" Width="10px" BorderWidth="1px"
			ForeColor="Black" BorderStyle="Solid" BorderColor="Gray" BackColor="White"></PageNumberStyle>
	</SmoothEnterpriseWebControl:PageJumper>
	<table border="0" Class="Normal">
		<tr>
			<td valign="top">
				<table>
					
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_INV_Num" runat="server" CssClass="NormalBold" Text="INV_Num"></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText id="FIELD_INV_Num" runat="server" CssClass="PanelWhite" ReadOnly="True" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td></tr>
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_SHIP_To" runat="server" CssClass="NormalBold" Text="SHIP_To"></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText id="FIELD_SHIP_To" runat="server" CssClass="PanelWhite" ReadOnly="True" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td></tr>
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_SHIPPING_No" runat="server" CssClass="NormalBold" Text="SHIPPING_No"></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText id="FIELD_SHIPPING_No" runat="server" CssClass="PanelWhite" ReadOnly="True" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td></tr>
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_SHIPPING_Dec" runat="server" CssClass="NormalBold" Text="SHIPPING_Dec"></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText id="FIELD_SHIPPING_Dec" runat="server" CssClass="PanelWhite" ReadOnly="True" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td></tr>
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_SHIPPING_Mode" runat="server" CssClass="NormalBold" Text="SHIPPING_Mode"></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText id="FIELD_SHIPPING_Mode" runat="server" CssClass="PanelWhite" ReadOnly="True" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td></tr>
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_SHIPPING_ModeDec" runat="server" CssClass="NormalBold" Text="SHIPPING_ModeDec"></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText id="FIELD_SHIPPING_ModeDec" runat="server" CssClass="PanelWhite" ReadOnly="True" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td></tr>
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_FORWARDER_Num" runat="server" CssClass="NormalBold" Text="FORWARDER_Num"></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText id="FIELD_FORWARDER_Num" runat="server" CssClass="PanelWhite" ReadOnly="True" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td></tr>
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_FORWARDER_Dec" runat="server" CssClass="NormalBold" Text="FORWARDER_Dec"></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText id="FIELD_FORWARDER_Dec" runat="server" CssClass="PanelWhite" ReadOnly="True" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td></tr>
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_HawbNo" runat="server" CssClass="NormalBold" Text="HawbNo"></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText id="FIELD_HawbNo" runat="server" CssClass="PanelWhite" ReadOnly="True" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td></tr>
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_FitNo" runat="server" CssClass="NormalBold" Text="FitNo"></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText id="FIELD_FitNo" runat="server" CssClass="PanelWhite" ReadOnly="True" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td></tr>
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_ETD" runat="server" CssClass="NormalBold" Text="ETD"></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText id="FIELD_ETD" runat="server" CssClass="PanelWhite" ReadOnly="True" FormatType="DateTime"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td></tr>
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_ATD" runat="server" CssClass="NormalBold" Text="ATD"></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText id="FIELD_ATD" runat="server" CssClass="PanelWhite" ReadOnly="True" FormatType="DateTime"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td></tr>
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_ETA" runat="server" CssClass="NormalBold" Text="ETA"></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText id="FIELD_ETA" runat="server" CssClass="PanelWhite" ReadOnly="True" FormatType="DateTime"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td></tr>
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_ATAAS" runat="server" CssClass="NormalBold" Text="ATAAS"></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText id="FIELD_ATAAS" runat="server" CssClass="PanelWhite" ReadOnly="True" FormatType="DateTime"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td></tr>
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_ATAC" runat="server" CssClass="NormalBold" Text="ATAC"></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText id="FIELD_ATAC" runat="server" CssClass="PanelWhite" ReadOnly="True" FormatType="DateTime"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td></tr>
				</table>
			</td>
		</tr>
	</table>
	<TABLE cellSpacing="0" cellPadding="0" border="0">
		<TR>
			<TD>
				<SmoothEnterpriseWebControl:inputbutton ID="BUTTON_delete" runat="server" Text="刪除" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_delete_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton ID="BUTTON_cancel" runat="server" Text="取消" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_cancel_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:inputbutton>
			</TD>
		</TR>
	</TABLE>
</asp:Content>