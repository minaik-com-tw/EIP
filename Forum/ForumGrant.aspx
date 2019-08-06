<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Forum.ForumGrant, App_Web_forumgrant.aspx.cdcab7d2" title="討論區授權管理" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Application.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
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
	<table border="0" width="100%">
		<tr>
			<td>
				<SmoothEnterpriseWebControlEnterprise:ProgAuth id="ForumProgAuth" runat="server" Font-Names="Arial" Font-Size="12px" Font-Bold="True" meta:resourcekey="ForumProgAuthResource1" SID="00000000-0000-0000-0000-000000000000">
					<AuthTypes>
                        <SmoothEnterpriseWebControlEnterprise:AuthItem AuthName="加入討論" AuthType="A" meta:resourcekey="ForumProgAuthItem1Resource1" />
						<SmoothEnterpriseWebControlEnterprise:AuthItem AuthType="M" AuthName="管理維護" meta:resourcekey="ForumProgAuthItem2Resource1"></SmoothEnterpriseWebControlEnterprise:AuthItem>
					</AuthTypes>
				</SmoothEnterpriseWebControlEnterprise:ProgAuth>
			</td>
		</tr>
	</table>
	<table border="0">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:InputButton id="BUTTON_save" runat="server" Width="80px" Font-Names="Arial" Font-Size="12px"
					BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" Font-Bold="True" cssClass="NormalBold"
					Text="儲存" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_saveResource1" RunAtCient="False">
					<Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
				</SmoothEnterpriseWebControl:InputButton>&nbsp;
				<SmoothEnterpriseWebControl:InputButton id="BUTTON_back" runat="server" Width="80px" Font-Names="Arial" Font-Size="12px"
					BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" Font-Bold="True" cssClass="NormalBold"
					Text="回上頁" OnClick="Page_Load" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
					<Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
				</SmoothEnterpriseWebControl:InputButton></td>
		</tr>
	</table>
</asp:Content>
