<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Manager.FeedbackDelete, App_Web_feedbackdelete.aspx.cdcab7d2" title="WebForm Delete Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
	<SmoothEnterpriseWebControl:PageJumper id="PageJumper1" runat="server" ShowPageNumber="True" ButtonNextLabel="&gt;" ButtonPrevLabel="&lt;" ButtonType="Button" meta:resourcekey="PageJumper1Resource1">
		<ButtonStyle PaddingSize="2px" Width="20px" GradientEnd="64, 64, 64" BorderWidth="1px" BorderStyle="Solid"
			BorderColor="96, 96, 96" GradientBegin="224, 224, 224" BackColor="200, 200, 200" CssClass="" ></ButtonStyle>
		<PageSelectedStyle BorderWidth="3px" BorderStyle="Solid" BorderColor="Black" BackColor="WhiteSmoke" CssClass=""></PageSelectedStyle>
		<PageNumberStyle Font-Size="10px" Font-Names="Arial" PaddingSize="2px" Width="10px" BorderWidth="1px"
			ForeColor="Black" BorderStyle="Solid" BorderColor="Gray" BackColor="White" CssClass=""></PageNumberStyle>
	</SmoothEnterpriseWebControl:PageJumper>
	<table Class="Normal" border="0">
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_fbno" runat="server" Text="問題編號" meta:resourcekey="LABEL_fbnoResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_fbno" runat="server" name="FIELD_fbno"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_fbtype" runat="server" Text="問題類別" meta:resourcekey="LABEL_fbtypeResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_fbtype" runat="server" name="FIELD_fbtype"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_fbdate" runat="server" Text="問題反應日期" meta:resourcekey="LABEL_fbdateResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_fbdate" runat="server" name="FIELD_fbdate"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_fbdescription" runat="server" Text="問題描述" meta:resourcekey="LABEL_fbdescriptionResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_description" runat="server" name="FIELD_description"><FONT face="新細明體"></FONT></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_fbresult" runat="server" Text="處理結果" meta:resourcekey="LABEL_fbresultResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_result" runat="server" name="FIELD_result"><FONT face="新細明體"></FONT></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_fbstatus" runat="server" Text="處理狀態" meta:resourcekey="LABEL_fbstatusResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_fbstatus" runat="server" name="FIELD_fbstatus"><FONT face="新細明體"></FONT></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_fburl" runat="server" Text="問題反應網址" meta:resourcekey="LABEL_fburlResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_fburl" runat="server" name="FIELD_fburl"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_fbemail" runat="server" Text="希望回覆的電子郵件" meta:resourcekey="LABEL_fbemailResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_fbemail" runat="server" name="FIELD_fbemail"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_remark" runat="server" Text="備註" meta:resourcekey="LABEL_remarkResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_remark" runat="server" name="FIELD_remark"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_issuer" runat="server" Text="提出人" meta:resourcekey="LABEL_issuerResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_inituid" runat="server" name="FIELD_inituid"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_issuedate" runat="server" Text="提出日期" meta:resourcekey="LABEL_issuedateResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_initdate" runat="server" name="FIELD_initdate"></span></td>
		</tr>
		<tr>
			<td>
				<TABLE cellSpacing="0" cellPadding="0" border="0">
					<TR>
						<td><SmoothEnterpriseWebControl:inputbutton id="DeleteButton" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
								BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" Gradient-GradientType="Bottom" CssClass="NormalBold"
								Font-Bold="True" Text="刪除" width="80px" OnClick="DeleteButton_Click" meta:resourcekey="DeleteButtonResource1" RunAtCient="False">
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                        </SmoothEnterpriseWebControl:inputbutton>&nbsp;
							<SmoothEnterpriseWebControl:inputbutton id="BackButton" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
								BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" Gradient-GradientType="Bottom" CssClass="NormalBold"
								Font-Bold="True" Text="取消" width="80px" OnClick="BackButton_Click" meta:resourcekey="BackButtonResource1" RunAtCient="False">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                            </SmoothEnterpriseWebControl:inputbutton></td>
					</TR>
				</TABLE>
			</td>
		</tr>
	</table>
</asp:Content>
