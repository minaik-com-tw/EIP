<%@ page language="C#" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Content.AddFile, App_Web_addfile.aspx.cdcab7d2" title="檔案程式分類設定" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Application.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>      
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<html>
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <base target="_self"/>
</head>
<body style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0">
    <form id="form1" runat="server">
<table cellSpacing="0" cellPadding="6" border="0">
	<tr>
		<td>
				<SmoothEnterpriseWebControlEnterprise:Descriptor id="Descriptor1" runat="server" Gradient="None" cssClass="Normal" BorderWidth="1px"
					Height="40px" IconURL="img/img-files.jpg" PaddingSpace="5px" Caption="" Details="" IconHeight="" IconWidth="" meta:resourcekey="Descriptor1Resource1">
					<CaptionStyle Font-Size="16px" Font-Names="Arial" Font-Bold="True" BorderStyle="NotSet" CssClass=""></CaptionStyle>
					<DetailsStyle Font-Size="11px" Font-Names="Arial" BorderStyle="NotSet" CssClass=""></DetailsStyle>
				</SmoothEnterpriseWebControlEnterprise:Descriptor>		
				<table border="0">
					<tr Class="NormalBold">
						<td><asp:Label ID="LABEL_filepath" runat="server" Text="內容目錄" meta:resourcekey="LABEL_filepathResource1"></asp:Label></td>
					</tr>
					<tr Class="NormalBold">
						<td>
							<SmoothEnterpriseWebControl:InputSelect id="FIELD_filepath" runat="server" ItemAll-Value="%"  backcolor="#F0F0F0"
								cssClass="Normal" Width="360px" Personalize="True" OnSelectedIndexChanged="FIELD_filepath_SelectedIndexChanged" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_filepathResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputSelect></td>
					</tr>
					<tr Class="NormalBold">
						<td><asp:Label ID="LABEL_filename" runat="server" Text="選擇文件及內容加入此分類中" meta:resourcekey="LABEL_filenameResource1"></asp:Label></td>
					</tr>
					<tr Class="NormalBold">
						<td>
							<SmoothEnterpriseWebControl:MultiSelect id="FIELD_filename" runat="server" CssClass="normalblod" Font-Size="12px" Font-Names="Arial"
								SelectBgColor2="Silver" SelectBgColor1="204, 204, 204" SelectedLabel="Selected" SelectionLabel="Selection" meta:resourcekey="FIELD_filenameResource1" Order="False" Size="10" Value="">
								<LabelStyle Font-Size="12px" Font-Names="Arial" Font-Bold="True" BorderStyle="NotSet" CssClass=""></LabelStyle>
							</SmoothEnterpriseWebControl:MultiSelect></td>
					</tr>
					<tr Class="NormalBold">
						<td>
							<SmoothEnterpriseWebControl:InputButton id="BUTTON_insert" runat="server" OnClick="BUTTON_insert_Click" cssClass="NormalBold" Font-Size="12px" Font-Names="Arial"
								Font-Bold="True" BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" BackColor="#C8C8C8" Width="80px"
								Text="加入" meta:resourcekey="BUTTON_insertResource1" RunAtCient="False">
								<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
							</SmoothEnterpriseWebControl:InputButton>&nbsp;
							<SmoothEnterpriseWebControl:InputButton id="BUTTON_close" runat="server" cssClass="NormalBold" Font-Size="12px" Font-Names="Arial"
								Font-Bold="True" BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" BackColor="#C8C8C8" Width="80px"
								Text="關閉" RunAtCient="True" meta:resourcekey="BUTTON_closeResource1">
								<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
							</SmoothEnterpriseWebControl:InputButton></td>
					</tr>
				</table>
		</td>
	</tr>
</table>
</form>
