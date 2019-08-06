<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Teamwork.ProjectTeamView, App_Web_projectteamview.aspx.cdcab7d2" theme="Default" %>
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

	<table border="0" Class="Normal">
		<tr><td valign=top><table><tr><td id="LABEL_projid" runat="server" class=normalbold>專案</td></tr><tr><td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_projid" runat="server" CssClass="PanelWhite" ReadOnly="True"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td></tr>
		<tr><td id="LABEL_projphaseid" runat="server" class=normalbold>專案階段</td></tr><tr><td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_projphaseid" runat="server" CssClass="PanelWhite" ReadOnly="True"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td></tr>
		<tr><td id="LABEL_roleid" runat="server" class=normalbold>專案角色</td></tr><tr><td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_roleid" runat="server" CssClass="PanelWhite" ReadOnly="True"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td></tr>
		<tr><td id="LABEL_uid" runat="server" class=normalbold>成員</td></tr><tr><td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_uid" runat="server" CssClass="PanelWhite" ReadOnly="True"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td></tr>
		<tr><td id="LABEL_description" runat="server" class=normalbold>描述</td></tr><tr><td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_description" runat="server" CssClass="PanelWhite" ReadOnly="True"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td></tr>
		<tr><td id="LABEL_inituid" runat="server" class=normalbold>建立人員</td></tr><tr><td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_inituid" runat="server" CssClass="PanelWhite" ReadOnly="True"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td></tr>
		<tr><td id="LABEL_initdate" runat="server" class=normalbold>建立時間</td></tr><tr><td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_initdate" runat="server" CssClass="PanelWhite" ReadOnly="True"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td></tr>
		<tr><td id="LABEL_modifyuid" runat="server" class=normalbold>更新人員</td></tr><tr><td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_modifyuid" runat="server" CssClass="PanelWhite" ReadOnly="True"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td></tr>
		<tr><td id="LABEL_modifydate" runat="server" class=normalbold>更新時間</td></tr><tr><td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_modifydate" runat="server" CssClass="PanelWhite" ReadOnly="True"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td></tr>
		</table></td></tr>
	</table>
	<table border="0" Class="Normal">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:InputButton id="BUTTON_back" runat="server" width="80px" Text="回上頁" Gradient-GradientType="Bottom" CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial" Font-Size="12px" Font-Bold="True" OnClick="BUTTON_back_Click"></SmoothEnterpriseWebControl:InputButton>
			</td>
		</tr>
	</table>
</asp:Content>