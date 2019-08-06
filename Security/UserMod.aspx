<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="UserMod.aspx.cs" Inherits="Security.UserModEdit" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="UserMod Edit Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <asp:ScriptManager id="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel id="UpdatePanel1" runat="server">
        <contenttemplate>
<TABLE style="WIDTH: 339px"><TR><TD style="WIDTH: 52px; HEIGHT: 25px"><asp:Label id="Label2" runat="server" CssClass="NormalBold" Text="姓名"></asp:Label></TD><TD style="WIDTH: 113px; HEIGHT: 25px"><SmoothEnterpriseWebControl:InputText id="FIELD_name" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Name」!!" MaxLength="50" Required="True" ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></TD><TD style="WIDTH: 45px; HEIGHT: 25px"></TD><TD style="HEIGHT: 25px"></TD></TR><TR><TD style="WIDTH: 52px"><asp:Label id="Label1" runat="server" Width="37px" CssClass="NormalBold" Text="廠別"></asp:Label></TD><TD style="WIDTH: 113px"><asp:DropDownList id="Liscompany" runat="server" Width="156px" OnSelectedIndexChanged="Button1_Click"><asp:ListItem>NA</asp:ListItem>
<asp:ListItem>MAT</asp:ListItem>
<asp:ListItem>MAM</asp:ListItem>
<asp:ListItem>MAY</asp:ListItem>
<asp:ListItem>MAP</asp:ListItem>
</asp:DropDownList></TD><TD style="WIDTH: 45px"><asp:Button id="Button1" runat="server" Text="GET" OnClick="Button1_Click"></asp:Button></TD><TD></TD></TR><TR><TD style="WIDTH: 52px"><asp:Label id="LABEL_name" runat="server" CssClass="NormalBold" Text="部門"></asp:Label></TD><TD colSpan=3><asp:DropDownList id="LisDepart" runat="server" Width="251px"></asp:DropDownList></TD></TR></TABLE>
</contenttemplate>
    </asp:UpdatePanel>
    <br />
	<table border="0" Class="Normal">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_save" runat="server" Text="儲存" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_save_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>&nbsp;
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Text="回上頁" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_back_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>&nbsp;
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_delete" runat="server" Text="刪除" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_delete_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>
			</td>
		</tr>
	</table>
</asp:Content>