<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Calendar.MyCalendarAuth, App_Web_mycalendarauth.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
<asp:label id="Label_Event" runat="server" meta:resourcekey="Label_EventResource1"></asp:label><br/>
	<SmoothEnterpriseWebControlEnterprise:ProgAuth id="ProgAuth1" runat="server" Width="600px" Font-Names="Tahoma" Font-Size="12px"
		Font-Bold="True" meta:resourcekey="ProgAuth1Resource1" SID="00000000-0000-0000-0000-000000000000">
		<AuthTypes>
			<SmoothEnterpriseWebControlEnterprise:AuthItem AuthType="V" AuthName="檢視" meta:resourcekey="AuthItem1_ProgAuthResource1"></SmoothEnterpriseWebControlEnterprise:AuthItem>
			<SmoothEnterpriseWebControlEnterprise:AuthItem AuthType="M" AuthName="增修&lt;br&gt;紀錄" meta:resourcekey="AuthItem2_ProgAuthResource1"></SmoothEnterpriseWebControlEnterprise:AuthItem>
			<SmoothEnterpriseWebControlEnterprise:AuthItem AuthType="B" AuthName="事件&lt;br&gt;預約" meta:resourcekey="AuthItem3_ProgAuthResource1"></SmoothEnterpriseWebControlEnterprise:AuthItem>
			<SmoothEnterpriseWebControlEnterprise:AuthItem AuthType="A" AuthName="授權&lt;br&gt;指定" meta:resourcekey="AuthItem4_ProgAuthResource1"></SmoothEnterpriseWebControlEnterprise:AuthItem>
		</AuthTypes>
	</SmoothEnterpriseWebControlEnterprise:ProgAuth><br>
	<SmoothEnterpriseWebControl:INPUTBUTTON id="BUTTON_save" runat="server" Width="80px" Font-Names="Arial" Font-Size="12px"
		BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" Font-Bold="True" Text="儲存"
		cssClass="NormalBold" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_saveResource1" RunAtCient="False">
		<Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
	</SmoothEnterpriseWebControl:INPUTBUTTON>&nbsp;
    <SmoothEnterpriseWebControl:inputbutton id="BUTTON_cancel" runat="server" Width="80px" Font-Names="Arial" Font-Size="12px"
		BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" Font-Bold="True" Text="回上頁" cssClass="NormalBold" OnClick="BUTTON_cancel_Click" meta:resourcekey="BUTTON_cancelResource1" RunAtCient="False">
		<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
	</SmoothEnterpriseWebControl:inputbutton></asp:Content>
