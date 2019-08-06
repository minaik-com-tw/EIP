<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Teamwork.TaskStandardDelete, App_Web_taskstandarddelete.aspx.cdcab7d2" theme="Default" %>
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

	<SmoothEnterpriseWebControl:PageJumper id="PageJumper1" runat="server" ShowPageNumber="True">
		<ButtonStyle PaddingSize="2px" Width="20px" GradientEnd="64, 64, 64" BorderWidth="1px" BorderStyle="Solid"
			BorderColor="96, 96, 96" GradientBegin="224, 224, 224" BackColor="200, 200, 200" ></ButtonStyle>
		<PageSelectedStyle BorderWidth="3px" BorderStyle="Solid" BorderColor="Black" BackColor="WhiteSmoke"></PageSelectedStyle>
		<PageNumberStyle Font-Size="10px" Font-Names="Arial" PaddingSize="2px" Width="10px" BorderWidth="1px"
			ForeColor="Black" BorderStyle="Solid" BorderColor="Gray" BackColor="White"></PageNumberStyle>
	</SmoothEnterpriseWebControl:PageJumper>
	<table border="0" Class="Normal">
		<tr><td valign=top><table><tr><td id="LABEL_tasktypeid" runat="server"  class=normalbold>工作類別</td></tr><tr><td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_tasktypeid" runat="server" CssClass="PanelWhite" ReadOnly="True"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td></tr>
		<tr><td id="LABEL_name" runat="server"  class=normalbold>名稱</td></tr><tr><td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_name" runat="server" CssClass="PanelWhite" ReadOnly="True"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td></tr>
		<tr><td id="LABEL_detail" runat="server"  class=normalbold>說明</td></tr><tr><td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_detail" runat="server" CssClass="PanelWhite" ReadOnly="True"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td></tr>
		<tr><td id="LABEL_stdhours" runat="server"  class=normalbold>標準工時</td></tr><tr><td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_stdhours" runat="server" CssClass="PanelWhite" ReadOnly="True"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td></tr>
		<tr><td id="LABEL_inituid" runat="server"  class=normalbold>建立人員</td></tr><tr><td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_inituid" runat="server" CssClass="PanelWhite" ReadOnly="True"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td></tr>
		<tr><td id="LABEL_initdate" runat="server"  class=normalbold>建立時間</td></tr><tr><td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_initdate" runat="server" CssClass="PanelWhite" ReadOnly="True"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td></tr>
		<tr><td id="LABEL_modifyuid" runat="server"  class=normalbold>更新人員</td></tr><tr><td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_modifyuid" runat="server" CssClass="PanelWhite" ReadOnly="True"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td></tr>
		<tr><td id="LABEL_modifydate" runat="server"  class=normalbold>更新時間</td></tr><tr><td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_modifydate" runat="server" CssClass="PanelWhite" ReadOnly="True"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td></tr>
		</table></td></tr>
	</table>
	<TABLE cellSpacing="0" cellPadding="0" border="0">
		<TR>
			<TD><SmoothEnterpriseWebControl:inputbutton id="BUTTON_delete" runat="server" Gradient-GradientType="Bottom" CssClass="NormalBold" BackColor=" #C8C8C8"
					BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial" Font-Size="12px" Font-Bold="True"
					Text="刪除" width="80px" OnClick="BUTTON_delete_Click"></SmoothEnterpriseWebControl:inputbutton>&nbsp;</TD>
			<TD>
				&nbsp;<SmoothEnterpriseWebControl:inputbutton id="BUTTON_cancel" runat="server" BackColor=" #C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" Gradient-GradientType="Bottom" CssClass="NormalBold" width="80px"
					Text="取消" Font-Bold="True" OnClick="BUTTON_cancel_Click"></SmoothEnterpriseWebControl:inputbutton>&nbsp;</TD>
		</TR>
	</TABLE>
</asp:Content>