<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Manager.Config, App_Web_config.aspx.cdcab7d2" title="WebForm Edit Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
		<CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor> 
		<TABLE id="Table1" cellSpacing="1" cellPadding="1" border="0" runat="server">
			<TR>
				<TD></TD>
			</TR>
		</TABLE>
		<TABLE id="Table2" cellSpacing="1" cellPadding="1" border="0">
			<TR>
				<TD>
					<SmoothEnterpriseWebControl:InputButton id="SaveButton" runat="server" cssClass="NormalBold" BorderWidth="1px" BorderStyle="Solid"
						BorderColor="#606060" Font-Names="Arial" Font-Size="12px" BackColor="#C8C8C8" Gradient-GradientType="Bottom"
						Font-Bold="True" Width="80px" Text="Àx¦s" OnClick="SaveButton_Click" meta:resourcekey="SaveButtonResource1" RunAtCient="False">
						<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
					</SmoothEnterpriseWebControl:InputButton></TD>
			</TR>
		</TABLE>
</asp:Content>
