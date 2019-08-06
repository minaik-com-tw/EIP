<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Calendar.MyEventGrant, App_Web_myeventgrant.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
		<CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table>
		<tr>
			<td><asp:label id="Label_Event" runat="server" meta:resourcekey="Label_EventResource1"></asp:label></td>
		</tr>
	</table>
	<SmoothEnterpriseWebControlEnterprise:ProgAuth id="ProgAuth1" runat="server" Font-Size="12px" Font-Names="Tahoma" Font-Bold="True" meta:resourcekey="ProgAuth1Resource1" SID="00000000-0000-0000-0000-000000000000">
		<AuthTypes>
			<SmoothEnterpriseWebControlEnterprise:AuthItem AuthType="V" AuthName="View" meta:resourcekey="AuthItem_ProgAuthResource1"></SmoothEnterpriseWebControlEnterprise:AuthItem>
		</AuthTypes>
	</SmoothEnterpriseWebControlEnterprise:ProgAuth>
	<P></P>
	<SmoothEnterpriseWebControl:INPUTBUTTON id="BUTTON_save" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
		BorderColor="#606060" Font-Size="12px" Font-Names="Arial" Width="80px" Font-Bold="True" Text="Save" cssClass="NormalBold" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_saveResource1" RunAtCient="False">
		<Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
	</SmoothEnterpriseWebControl:INPUTBUTTON>&nbsp;
	<SmoothEnterpriseWebControl:InputButton id="BUTTON_back" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
		BorderColor="#606060" Font-Size="12px" Font-Names="Arial" Width="80px" Font-Bold="True" Text="Back" cssClass="NormalBold" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
		<Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
	</SmoothEnterpriseWebControl:InputButton>
	<P></P>
</asp:Content>
