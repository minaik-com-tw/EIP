<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="ERPFAdd.aspx.cs" Inherits="ERP_FLOW.ERPFAdd" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>

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
					
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_ERP_NAME" runat="server" CssClass="NormalBold" Text="程式代號"></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText id="FIELD_ERP_NAME" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「程式代號」!!" MaxLength="20"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td></tr>
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_DEP_NAME" runat="server" CssClass="NormalBold" Text="部門代號一"></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText id="FIELD_DEP_NAME" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「部門代號一」!!" MaxLength="20"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td></tr>
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_NO" runat="server" CssClass="NormalBold" Text="部門代號二"></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText id="FIELD_NO" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「部門代號二」!!" MaxLength="10"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td></tr>
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_PNAME" runat="server" CssClass="NormalBold" Text="管理者姓名"></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText id="FIELD_PNAME" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「管理者姓名」!!" MaxLength="20"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td></tr>
 	 	 	 	 	<tr><td><asp:Label ID="LABEL_PID" runat="server" CssClass="NormalBold" Text="管理者ID"></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText id="FIELD_PID" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「管理者ID」!!" MaxLength="0" Visible="False"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                             <ErrorStyle BorderStyle="NotSet" CssClass="" />
                         </SmoothEnterpriseWebControl:InputText><br />
                             <SmoothEnterpriseWebControlEnterprise:PopupUser id="PopupUser1" runat="server" BackColor="#F0F0F0"
                                 CssClass="Normal" DisplayField="name" FormatType="InputCombo" FormatValueField="logonid"
                                 Gradient-GradientType="Top" ValueField="id">
                             </SmoothEnterpriseWebControlEnterprise:PopupUser></td></tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" CssClass="NormalBold" Text="公司別"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="ListComany" runat="server" CssClass="Normal" Width="133px">
                                <asp:ListItem Value="MINAIK">MAT</asp:ListItem>
                                <asp:ListItem>MAP</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
				</table>
			</td>
		</tr>
	</table>
	<table border="0" Class="Normal">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_save" runat="server" Text="儲存" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_save_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>&nbsp;
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_savenext" runat="server" Text="儲存後繼續操作" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_save_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>&nbsp;
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Text="回上頁" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_back_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>
			</td>
		</tr>
	</table>
</asp:Content>