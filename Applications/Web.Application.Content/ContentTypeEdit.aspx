<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Content.ContentTypeEdit, App_Web_contenttypeedit.aspx.cdcab7d2" title="編輯檔案內容類型" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
	<table border="0" Class="Normal">
		<tr>
			<td valign="top"><table>
					<tr>
						<td Class="NormalBold">
							<asp:Label ID="LABEL_contenttypename" runat="server" Text="內容類型" meta:resourcekey="LABEL_contenttypenameResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:InputText id="FIELD_name" runat="server"  BackColor="#F0F0F0" CssClass="Normal"
								ErrorMessage="請輸入「內容類型」!!" tabIndex="100" MaxLength="50" Required="True" Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nameResource1" OnClickMore="">
<ErrorStyle BorderStyle="NotSet"></ErrorStyle>
<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold">
							<asp:Label ID="LABEL_fileext" runat="server" Text="預設檔案附屬類型" meta:resourcekey="LABEL_fileextResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:InputText id="FIELD_fileext" runat="server"  BackColor="#F0F0F0"
								CssClass="Normal" ErrorMessage="請輸入「預設檔案附屬類型」!!" tabIndex="101" MaxLength="200" Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_fileextResource1" OnClickMore="" Required="False">
<ErrorStyle BorderStyle="NotSet"></ErrorStyle>
<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold">
							<asp:Label ID="LABEL_iconurl" runat="server" Text="內容圖示位址" meta:resourcekey="LABEL_iconurlResource1"></asp:Label></td>
					</tr>
					<tr>
						<td>
							<SmoothEnterpriseWebControlEnterprise:SelectIconURL id="FIELD_iconurl" runat="server" Width="116px" backcolor="White" cssClass="Normal"
								Editable="True" EditIconDisplayed="True" ItemNoneDisplayed="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_iconurlResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="">
                                <ErrorStyle BorderStyle="NotSet" />
                                <Gradient GradientBegin="" GradientEnd="" />
                            </SmoothEnterpriseWebControlEnterprise:SelectIconURL></td>
					</tr>
					<tr>
						<td Class="NormalBold">
							<asp:Label ID="LABEL_seq" runat="server" Text="顯示順序" meta:resourcekey="LABEL_seqResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:InputText id="FIELD_seq" runat="server"  BackColor="#F0F0F0" CssClass="Normal"
								ErrorMessage="請輸入「顯示順序」!!" tabIndex="103" MaxLength="2" Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_seqResource1" OnClickMore="" Required="False">
<ErrorStyle BorderStyle="NotSet"></ErrorStyle>
<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<table border="0" Class="Normal">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:InputButton id="BUTTON_save" runat="server" width="80px" Text="儲存" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_saveResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
				<SmoothEnterpriseWebControl:InputButton id="BUTTON_back" runat="server" width="80px" Text="回上頁" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
				<SmoothEnterpriseWebControl:InputButton id="BUTTON_delete" runat="server" Text="刪除" width="80px" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" OnClick="BUTTON_delete_Click" meta:resourcekey="BUTTON_deleteResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
			</td>
		</tr>
	</table>
</asp:Content>
