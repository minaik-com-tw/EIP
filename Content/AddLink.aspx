<%@ page language="C#" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Content.AddLink, App_Web_addlink.aspx.cdcab7d2" title="功能集合設定" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
				<SmoothEnterpriseWebControlEnterprise:descriptor id="Descriptor1" runat="server" Gradient="None" PaddingSpace="5px" Details="依內容目錄及授權類型設定功能集合"
					IconURL="img/img-files.jpg" Caption="設定功能集合" Width="100%" Height="40%" cssClass="Normal" IconHeight="" IconWidth="" meta:resourcekey="Descriptor1Resource1">
					<CaptionStyle Font-Size="16px" Font-Names="Arial" Font-Bold="True" BorderStyle="NotSet" CssClass=""></CaptionStyle>
					<DetailsStyle Font-Size="11px" Font-Names="Arial" BorderStyle="NotSet" CssClass=""></DetailsStyle>
				</SmoothEnterpriseWebControlEnterprise:descriptor>		
				<table border="0">
					<tr Class="NormalBold">
						<td><asp:Label ID="LABEL_filepath" runat="server" Text="內容目錄" meta:resourcekey="LABEL_filepathResource1"></asp:Label></td>
						<td width="100%"><asp:Label ID="LABEL_authtypename" runat="server" Text="內容類別" meta:resourcekey="LABEL_authtypenameResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:INPUTSELECT id="FIELD_filepath" runat="server"  cssClass="Normal" backcolor="#F0F0F0"
								Personalize="True" OnSelectedIndexChanged="FIELD_filepath_SelectedIndexChanged" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_filepathResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:InputSelect></td>
						<td><SmoothEnterpriseWebControl:inputselect id="FIELD_authtypename" runat="server"  cssClass="Normal" backcolor="#F0F0F0"
								Personalize="True" ItemNoneDisplayed="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_authtypenameResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:InputSelect></td>
					</tr>
					<tr Class="NormalBold">
						<td colSpan="2"><asp:Label ID="LABEL_functionset" runat="server" Text="欲加入功能集合之檔案" meta:resourcekey="LABEL_functionsetResource1"></asp:Label></td>
					</tr>
					<tr>
						<td colSpan="2"><SmoothEnterpriseWebControl:MULTISELECT id="FIELD_functionset" runat="server" SelectBgColor1="204, 204, 204" SelectBgColor2="Silver"
								CssClass="normalblod" Font-Names="Arial" Font-Size="12px" SelectedLabel="已選功能集合之檔案" SelectionLabel="所有功能集合之檔案" Width="402px" meta:resourcekey="FIELD_functionsetResource1" Order="False" Size="10" Value="">
								<LabelStyle Font-Size="12px" Font-Names="Arial" Font-Bold="True" ForeColor="Black" BorderStyle="NotSet" CssClass=""></LabelStyle>
							</SmoothEnterpriseWebControl:MULTISELECT></td>
					</tr>
					<tr>
						<td colSpan="2"><SmoothEnterpriseWebControl:inputbutton id="BUTTON_insert" runat="server" Width="80px" cssClass="NormalBold" Font-Names="Arial"
								Gradient-GradientType="Bottom" Font-Size="12px" Text="加入" BackColor="#C8C8C8" Font-Bold="True" BorderColor="#606060" BorderStyle="Solid"
								BorderWidth="1px" OnClick="BUTTON_insert_Click" meta:resourcekey="BUTTON_insertResource1" RunAtCient="False">
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                        </SmoothEnterpriseWebControl:inputbutton>&nbsp;
							<SmoothEnterpriseWebControl:inputbutton id="BUTTON_close" runat="server" Width="80px" cssClass="NormalBold" Font-Names="Arial"
								Gradient-GradientType="Bottom" Font-Size="12px" Text="關閉" BackColor="#C8C8C8" Font-Bold="True" BorderColor="#606060"
								BorderStyle="Solid" BorderWidth="1px" RunAtCient="True" meta:resourcekey="BUTTON_closeResource1">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                            </SmoothEnterpriseWebControl:inputbutton></td>
					</tr>
				</table>
		</td>
	</tr>
</table>
</form>
