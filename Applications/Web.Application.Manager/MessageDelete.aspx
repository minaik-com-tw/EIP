<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Manager.MessageDelete, App_Web_messagedelete.aspx.cdcab7d2" title="WebForm Delete Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Application.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
		<CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor> 
	<table border="0" Class="Normal">
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_messagename" runat="server" Text="訊息名稱" meta:resourcekey="LABEL_messagenameResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span name="FIELD_name" id="FIELD_name" runat="server"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_defaultsubject" runat="server" Text="預設主題" meta:resourcekey="LABEL_defaultsubjectResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span name="FIELD_subject" id="FIELD_subject" runat="server"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_defaultsender" runat="server" Text="預設寄件者" meta:resourcekey="LABEL_defaultsenderResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span name="FIELD_sender" id="FIELD_sender" runat="server"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_defaultcopyto" runat="server" Text="預設副本收件者" meta:resourcekey="LABEL_defaultcopytoResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span name="FIELD_copyto" id="FIELD_copyto" runat="server"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_messagebody" runat="server" Text="預設訊息內容格式" meta:resourcekey="LABEL_messagebodyResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span name="FIELD_body" id="FIELD_body" runat="server"></span></td>
		</tr>
		<tr>
			<td>
				<TABLE cellSpacing="0" cellPadding="0" border="0">
					<TR>
						<TD>
							<SmoothEnterpriseWebControl:PageJumper id="PageJumper1" runat="server" ShowPageNumber="False" ButtonNextLabel="&gt;" ButtonPrevLabel="&lt;" ButtonType="Button" meta:resourcekey="PageJumper1Resource1">
								<PageSelectedStyle BorderWidth="3px" BorderStyle="Solid" BorderColor="Black" BackColor="Silver" CssClass=""></PageSelectedStyle>
								<PageNumberStyle Font-Size="10px" Font-Names="Arial" PaddingSize="4px" Width="18px" BorderWidth="1px"
									ForeColor="Black" BorderStyle="Solid" BorderColor="Black" CssClass=""></PageNumberStyle>
                                <ButtonStyle BorderStyle="NotSet" CssClass="" />
							</SmoothEnterpriseWebControl:PageJumper></TD>
						<TD><SmoothEnterpriseWebControl:inputbutton id="DeleteButton" runat="server" Gradient-GradientType="Bottom" CssClass="NormalBold"
								BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial" Font-Size="12px"
								Font-Bold="True" Text="刪除" width="80px" OnClick="DeleteButton_Click" meta:resourcekey="DeleteButtonResource1" RunAtCient="False">
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                        </SmoothEnterpriseWebControl:inputbutton>&nbsp;</TD>
						<TD>
							&nbsp;<SmoothEnterpriseWebControl:inputbutton id="BackButton" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
								BorderColor="#606060" Font-Size="12px" Font-Names="Arial" Gradient-GradientType="Bottom" CssClass="NormalBold" width="80px"
								Text="取消" Font-Bold="True" OnClick="BackButton_Click" meta:resourcekey="BackButtonResource1" RunAtCient="False">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                            </SmoothEnterpriseWebControl:inputbutton>&nbsp;</TD>
					</TR>
				</TABLE>
			</td>
		</tr>
	</table>
</asp:Content>
