<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Content.Upload, App_Web_upload.aspx.cdcab7d2" title="內容更新通知" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
	<table cellSpacing="0" cellPadding="0" width="70%">
		<tr>
			<td bgColor="lavender">
				<table style="BORDER-RIGHT: #d3d9f0 1px solid; BORDER-TOP: #d3d9f0 1px solid; FILTER: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#00DBE2FF, endcolorstr=#ddffffff); BORDER-LEFT: #d3d9f0 1px solid; COLOR: #2d387b; BORDER-BOTTOM: #d3d9f0 1px solid"
					cellSpacing="5" width="100%">
					<tr Class="NormalBold">
						<td width="1%"><IMG src="img/bullet-circle1.gif" border="0"></td>
						<td colSpan="2" style="HEIGHT: 22px">
                            <asp:Label ID="LABEL_selectcategory" runat="server" Text="請選擇上傳文件(檔案)所要歸屬的分類" meta:resourcekey="LABEL_selectcategoryResource1"></asp:Label></td>
					</tr>
					<tr Class="Normal">
						<td></td>
						<td>
							<SmoothEnterpriseWebControl:InputSelect id="FIELD_category" runat="server" Width="384px" cssClass="Normal" 
								backcolor="Lavender" Required="True" ErrorMessage="請輸入「上傳文件分類」!!" ItemNoneDisplayed="True" Personalize="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_categoryResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputSelect>
						</td>
					</tr>
					<tr Class="NormalBold">
						<td width="1%"><img src="img/bullet-circle2.gif" border="0"></td>
						<td id="LABEL_browsefilepath" runat="server"><asp:Label ID="LABEL_font"
                            runat="server" Text="請按<b>瀏覽鍵</b>選擇要上傳之文件(檔案)" meta:resourcekey="LABEL_fontResource1"></asp:Label><font color="blue"><asp:Label ID="LABEL_font1"
                                runat="server" Text="(請勿含有" meta:resourcekey="LABEL_font1Resource1"></asp:Label><font color="red">\ 
									/ : * ? '' &lt; &gt; | &amp; # +</font><asp:Label ID="LABEL_font2" runat="server"
                                        Text="等字元)" meta:resourcekey="LABEL_font2Resource1"></asp:Label></font></td>
					</tr>
					<tr>
						<td></td>
						<td>
							<SmoothEnterpriseWebControl:InputFile id="FIELD_filepath" runat="server" Width="470px" cssClass="Normal" 
								backcolor="Lavender" meta:resourcekey="FIELD_filepathResource1"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:InputFile>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<SmoothEnterpriseWebControl:InputButton id="BUTTON_fake" runat="server" Width="80px" Font-Names="Arial" Font-Size="12px"
								BorderColor="#BDBDDD" BorderWidth="1px" BorderStyle="Solid" BackColor="Lavender" cssClass="NormalBold" Text="上傳檔案"
								Font-Bold="True" Enabled="False" ForeColor="#2D387B" meta:resourcekey="BUTTON_fakeResource1" RunAtCient="False">
								<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
							</SmoothEnterpriseWebControl:InputButton>
							<SmoothEnterpriseWebControl:InputButton id="BUTTON_upload" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#BDBDDD"
								BorderWidth="1px" BorderStyle="Solid" BackColor="Lavender" cssClass="NormalBold" Font-Bold="True" Text="上傳檔案"
								Width="80px" ForeColor="#2D387B" OnClick="BUTTON_upload_Click" meta:resourcekey="BUTTON_uploadResource1" RunAtCient="False">
								<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
							</SmoothEnterpriseWebControl:InputButton>
							<asp:Label id="LABEL_message" runat="server" meta:resourcekey="LABEL_messageResource1"></asp:Label>
						</td>
					</tr>
					<tr Class="NormalBold">
						<td></td>
						<td><img hspace="10" src="img/img-uparrow.gif" border="0"><br>
							<table style="FILTER:progid:DXImageTransform.Microsoft.gradient(gradienttype=1,startcolorstr=#00666666, endcolorstr=#ffF5F5FC);COLOR:#464688;BACKGROUND-COLOR:#dbe2ff"
								cellSpacing="2">
								<tr>
									<td>
										<input id="FIELD_overwrite" runat="server" type="checkbox"></td>
									<td style="FONT-SIZE: 11px; FONT-FAMILY: Tahoma"><asp:Label ID="LABEL_overwrite" runat="server" Text="允許取代原有文件(檔案)" meta:resourcekey="LABEL_overwriteResource1"></asp:Label></td>
									<td width="30"></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</asp:Content>
