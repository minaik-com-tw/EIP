<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Content.ProfileAdd, App_Web_profileadd.aspx.cdcab7d2" title="新增檔案內容" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
	<table Class="Normal" border="0">
		<tr>
			<td vAlign="top">
				<table>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_pathname" runat="server" Text="內容路徑名稱" meta:resourcekey="LABEL_pathnameResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_pathname" tabIndex="100" runat="server" Width="420px" BackColor="#F0F0F0"
								CssClass="Normal" Required="True" MaxLength="255" ErrorMessage="請輸入「內容路徑名稱」!!" 
								Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_pathnameResource1" OnClickMore=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_filename" runat="server" Text="內容檔案名稱" meta:resourcekey="LABEL_filenameResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_filename" tabIndex="101" runat="server" Width="420px" BackColor="#F0F0F0"
								CssClass="Normal" Required="True" MaxLength="100" ErrorMessage="請輸入「內容檔案名稱」!!" 
								Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_filenameResource1" OnClickMore=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_linkurl" runat="server" Text="連結位址" meta:resourcekey="LABEL_linkurlResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_linkurl" tabIndex="108" runat="server" Width="420px" BackColor="#F0F0F0"
								CssClass="Normal" Required="True" MaxLength="255" ErrorMessage="請輸入「連結位址」!!" 
								Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_linkurlResource1" OnClickMore=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_contentdescription" runat="server" Text="內容顯示名稱" meta:resourcekey="LABEL_contentdescriptionResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_description" tabIndex="104" runat="server" Width="420px" BackColor="#F0F0F0"
								CssClass="Normal" Required="True" MaxLength="200" ErrorMessage="請輸入「內容顯示名稱」!!" 
								Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_descriptionResource1" OnClickMore=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_remark" runat="server" Text="備註說明" meta:resourcekey="LABEL_remarkResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_remark" tabIndex="117" runat="server" Width="420px" BackColor="#F0F0F0"
								CssClass="Normal" MaxLength="1073741823" ErrorMessage="請輸入「備註說明」!!"  TextMode="MultiLine"
								Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_remarkResource1" OnClickMore="" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_contenttypename" runat="server" Text="內容類型" meta:resourcekey="LABEL_contenttypenameResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputselect id="FIELD_ctypeid" runat="server" Width="402px"  ItemNoneDisplayed="True"
								onChange="seticonurl(this);" cssClass="Normal" backcolor="#F0F0F0" Personalize="False" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_ctypeidResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:InputSelect></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_categoryname" runat="server" Text="內容分類" meta:resourcekey="LABEL_categorynameResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControlEnterprise:selectcategory id="FIELD_catid" runat="server" Width="402px" ItemNoneDisplayed="True" cssClass="Normal"
								backcolor="#F0F0F0" TextField="pids" ValueField="id" Personalize="False" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_catidResource1" Mode="Single" PareantId="00000000-0000-0000-0000-000000000000" TextBoxStyle="ThreeDStyle" Value="">
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            <ErrorStyle BorderStyle="NotSet" />
                        </SmoothEnterpriseWebControlEnterprise:selectcategory></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_iconurl" runat="server" Text="內容圖示位址" meta:resourcekey="LABEL_iconurlResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControlEnterprise:selecticonurl id="FIELD_iconurl" runat="server" Width="402px" cssClass="Normal" backcolor="#F0F0F0"
								EditIconDisplayed="True" Editable="True" Personalize="False" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_iconurlResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="" ItemNoneDisplayed="True">
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControlEnterprise:selecticonurl></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_imgurl" runat="server" Text="圖示位址" meta:resourcekey="LABEL_imgurlResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_imgurl" tabIndex="110" runat="server" Width="420px" BackColor="#F0F0F0"
								CssClass="Normal" MaxLength="255" ErrorMessage="請輸入「圖示位址」!!"  Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_imgurlResource1" OnClickMore="" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<span id="SPAN_fileoption" runat="server">
						<tr>
							<td Class="NormalBold"><asp:Label ID="LABEL_deniedurl" runat="server" Text="拒絕存取導入連結" meta:resourcekey="LABEL_deniedurlResource1"></asp:Label></td>
						</tr>
						<tr>
							<td>
								<SmoothEnterpriseWebControl:inputtext id="FIELD_deniedurl" runat="server" BackColor="#F0F0F0" Width="420px" CssClass="Normal"
									 ErrorMessage="請輸入「拒絕存取導入連結」!!" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_deniedurlResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                </SmoothEnterpriseWebControl:inputtext></td>
						</tr>
						<tr>
							<td Class="NormalBold"><asp:Label ID="LABEL_keywords" runat="server" Text="搜尋關鍵值" meta:resourcekey="LABEL_keywordsResource1"></asp:Label></td>
						</tr>
						<tr>
							<td><SmoothEnterpriseWebControl:inputtext id="FIELD_keywords" tabIndex="114" runat="server" BackColor="#F0F0F0" CssClass="Normal"
									MaxLength="100" ErrorMessage="請輸入「搜尋關鍵值」!!"  Personalize="False" Width="420px" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_keywordsResource1" OnClickMore="" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:inputtext></td>
						</tr>
					</span>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_filetype" runat="server" Text="內容類別(檔案/資料夾)" meta:resourcekey="LABEL_filetypeResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControlEnterprise:selectcode id="FIELD_filetype" runat="server" Width="116px" Required="True" ErrorMessage="請輸入「內容類別」!!"
								ItemNoneDisplayed="True" cssClass="Normal" backcolor="White" TextField="name" ValueField="id" CodeType="filetype"
								Personalize="False" OnSelectedIndexChanged="FIELD_filetype_SelectedIndexChanged" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_filetypeResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControlEnterprise:SelectCode></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_cstatus" runat="server" Text="內容狀態" meta:resourcekey="LABEL_cstatusResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControlEnterprise:selectcode id="FIELD_cstatus" runat="server" Width="116px" ItemNoneDisplayed="True" cssClass="Normal"
								backcolor="White" TextField="name" ValueField="id" CodeType="cstatus" Personalize="False" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_cstatusResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControlEnterprise:SelectCode></td>
					</tr>
					<span id="SPAN_fileauth" runat="server">
						<tr>
							<td>
								<table Class="Normal" cellSpacing="0" cellPadding="0" border="0">
									<tr>
										<td Class="NormalBold"><asp:Label ID="LABEL_viewmode" runat="server" Text="顯示執行方式" meta:resourcekey="LABEL_viewmodeResource1"></asp:Label></td>
										<td>&nbsp;</td>
										<td Class="NormalBold"><asp:Label ID="LABEL_viewtarget" runat="server" Text="顯示執行位置" meta:resourcekey="LABEL_viewtargetResource1"></asp:Label></td>
									</tr>
									<tr>
										<td><SmoothEnterpriseWebControlEnterprise:selectcode id="FIELD_viewmode" runat="server" Width="116px" cssClass="Normal" backcolor="White"
												TextField="name" ValueField="id" CodeType="viewmode" ErrorMessage="請指定「顯示執行方式」!!" Personalize="False" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_viewmodeResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControlEnterprise:SelectCode></td>
										<td>&nbsp;</td>
										<td><SmoothEnterpriseWebControl:inputtext id="FIELD_viewtarget" tabIndex="112" runat="server" BackColor="#F0F0F0" CssClass="Normal"
												MaxLength="20" ErrorMessage="請輸入「顯示執行位置」!!"  Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_viewtargetResource1" OnClickMore="" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:inputtext></td>
									</tr>
									<tr>
										<td Class="NormalBold"><asp:Label ID="LABEL_effectdate" runat="server" Text="內容生效日期" meta:resourcekey="LABEL_effectdateResource1"></asp:Label></td>
										<td>&nbsp;</td>
										<td Class="NormalBold"><asp:Label ID="LABEL_expiredate" runat="server" Text="內容有效期限" meta:resourcekey="LABEL_expiredateResource1"></asp:Label></td>
									</tr>
									<tr>
										<td><SmoothEnterpriseWebControl:inputtext id="FIELD_effectdate" tabIndex="115" runat="server" BackColor="#F0F0F0" CssClass="Normal"
												ErrorMessage="請輸入「內容生效日期」!!"  FormatType="Date" Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_effectdateResource1" OnClickMore="" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:inputtext></td>
										<td>&nbsp;</td>
										<td><SmoothEnterpriseWebControl:inputtext id="FIELD_expiredate" tabIndex="116" runat="server" BackColor="#F0F0F0" CssClass="Normal"
												ErrorMessage="請輸入「內容有效期限」!!"  FormatType="Date" Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_expiredateResource1" OnClickMore="" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:inputtext></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td Class="NormalBold" style="HEIGHT: 23px"><asp:Label ID="LABEL_nocode" runat="server" Text="內容編號" meta:resourcekey="LABEL_nocodeResource1"></asp:Label></td>
						</tr>
						<tr>
							<td><SmoothEnterpriseWebControl:inputtext id="FIELD_nocode" runat="server" BackColor="#F0F0F0" CssClass="Normal" 
									Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nocodeResource1" OnClickMore="" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:inputtext></td>
						</tr>
						<tr>
							<td Class="NormalBold"><asp:Label ID="LABEL_browsable" runat="server" Text="可瀏覽" meta:resourcekey="LABEL_browsableResource1"></asp:Label></td>
						</tr>
						<tr>
							<td style="HEIGHT: 21px"><input id="FIELD_browsable" type="checkbox" name="FIELD_browsable" runat="server">
								<asp:label id="CHECK_browsable" runat="server" CssClass="Normal" Text="顯示於主功能表" meta:resourcekey="CHECK_browsableResource1"></asp:label></td>
						</tr>
						<tr>
							<td Class="NormalBold"><asp:Label ID="LABEL_viewprofile" runat="server" Text="是否顯示內容屬性" meta:resourcekey="LABEL_viewprofileResource1"></asp:Label></td>
						</tr>
						<tr>
							<td><input id="FIELD_viewprofile" type="checkbox" name="FIELD_viewprofile" runat="server">
								<asp:label id="CHECK_viewprofile" runat="server" CssClass="Normal" Text="顯示內容屬性" meta:resourcekey="CHECK_viewprofileResource1"></asp:label></td>
						</tr>
					</span>
					<span id="SPAN_directoryauth" runat="server">
						<tr>
							<td Class="NormalBold"><asp:Label ID="LABEL_foldertype" runat="server" Text="資料夾類別" meta:resourcekey="LABEL_foldertypeResource1"></asp:Label></td>
						</tr>
						<tr>
							<td><SmoothEnterpriseWebControlEnterprise:selectcode id="FIELD_foldertype" runat="server" Width="116px" cssClass="Normal" backcolor="#F0F0F0"
									TextField="name" ValueField="id" CodeType="foldertype" ErrorMessage="請指定「資料夾類別」!!" Personalize="False" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_foldertypeResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" />
                            </SmoothEnterpriseWebControlEnterprise:SelectCode></td>
						</tr>
						<tr>
							<td Class="NormalBold"><asp:Label ID="LABEL_uploadlimit" runat="server" Text="內容上傳大小限制" meta:resourcekey="LABEL_uploadlimitResource1"></asp:Label></td>
						</tr>
						<tr>
							<td><SmoothEnterpriseWebControl:inputtext id="FIELD_uploadlimit" tabIndex="128" runat="server" BackColor="#F0F0F0" CssClass="Normal"
									MaxLength="19" ErrorMessage="請輸入「檔案大小」!!"  Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_uploadlimitResource1" OnClickMore="" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:inputtext></td>
						</tr>
					</span>
				</table>
			</td>
		</tr>
	</table>
	<table Class="Normal" border="0">
		<tr>
			<td><SmoothEnterpriseWebControl:inputbutton id="BUTTON_save" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom"
					Font-Bold="True" Text="儲存" width="80px" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_saveResource1" RunAtCient="False">
                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
            </SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BUTTON_savenext" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom"
					Font-Bold="True" Text="儲存後繼續操作" meta:resourcekey="BUTTON_savenextResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:InputButton id="BUTTON_back" runat="server" width="80px" Text="回上頁" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
		</tr>
	</table>
</asp:Content>
