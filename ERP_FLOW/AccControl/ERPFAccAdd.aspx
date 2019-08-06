<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="ERPFAccAdd.aspx.cs" Inherits="ERP_FLOW.ERPFAdd" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>

<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="ERPF Add Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table border="0" Class="Normal">
		<tr>
			<td valign="top">
				<table>
					
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_ERP_NAME" runat="server" CssClass="NormalBold" Text="�{���N��"></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText id="FIELD_ERP_NAME" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�u�{���N���v!!" MaxLength="20" Enabled="False" Text="apmt420"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                             <ErrorStyle BorderStyle="NotSet" CssClass="" />
                         </SmoothEnterpriseWebControl:InputText></td></tr>
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_DEP_NAME" runat="server" CssClass="NormalBold" Text="�����N���@"></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText id="FIELD_DEP_NAME" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�u�����N���@�v!!" MaxLength="20" Enabled="False" Text="ACC"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                             <ErrorStyle BorderStyle="NotSet" CssClass="" />
                         </SmoothEnterpriseWebControl:InputText></td></tr>
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_NO" runat="server" CssClass="NormalBold" Text="���O"></asp:Label></td></tr><tr><td>
                             <asp:DropDownList ID="LisType" runat="server" Width="239px">
                                 <asp:ListItem Value="2">CAP:�겣���� �Ĥ@��</asp:ListItem>
                                 <asp:ListItem Value="2_2">CAP:�겣���� �ĤG��</asp:ListItem>
                                 <asp:ListItem Value="2_3">CAP:�겣���� �ĤT��</asp:ListItem>
                                 <asp:ListItem Value="1">EXP:�O�ν��� �Ĥ@��</asp:ListItem>
                                 <asp:ListItem Value="1_2">EXP:�O�ν��� �ĤG��</asp:ListItem>
                                 <asp:ListItem Value="1_3">EXP:�O�ν��� �ĤT��</asp:ListItem>
                             </asp:DropDownList></td></tr>
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_PNAME" runat="server" CssClass="NormalBold" Text="�޲z��"></asp:Label></td></tr><tr><td>
                             <SmoothEnterpriseWebControlEnterprise:PopupUser id="PopupUser1" runat="server" BackColor="#F0F0F0"
                                 CssClass="Normal" DisplayField="name" FormatType="InputCombo" FormatValueField="logonid"
                                 Gradient-GradientType="Top" ValueField="id">
                             </SmoothEnterpriseWebControlEnterprise:PopupUser></td></tr>
 	 	 	 	 	<tr><td>
                             <asp:Label ID="Label1" runat="server" CssClass="NormalBold" Text="���q�O"></asp:Label></td></tr><tr><td>
                             <asp:DropDownList ID="ListComany" runat="server" CssClass="Normal" Width="133px">
                                 <asp:ListItem Value="MINAIK">MAT</asp:ListItem>
                                 <asp:ListItem>MAP</asp:ListItem>
                             </asp:DropDownList></td></tr>
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