<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Content.ProfileAdd, App_Web_profileadd.aspx.cdcab7d2" title="�s�W�ɮפ��e" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
						<td Class="NormalBold"><asp:Label ID="LABEL_pathname" runat="server" Text="���e���|�W��" meta:resourcekey="LABEL_pathnameResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_pathname" tabIndex="100" runat="server" Width="420px" BackColor="#F0F0F0"
								CssClass="Normal" Required="True" MaxLength="255" ErrorMessage="�п�J�u���e���|�W�١v!!" 
								Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_pathnameResource1" OnClickMore=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_filename" runat="server" Text="���e�ɮצW��" meta:resourcekey="LABEL_filenameResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_filename" tabIndex="101" runat="server" Width="420px" BackColor="#F0F0F0"
								CssClass="Normal" Required="True" MaxLength="100" ErrorMessage="�п�J�u���e�ɮצW�١v!!" 
								Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_filenameResource1" OnClickMore=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_linkurl" runat="server" Text="�s����}" meta:resourcekey="LABEL_linkurlResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_linkurl" tabIndex="108" runat="server" Width="420px" BackColor="#F0F0F0"
								CssClass="Normal" Required="True" MaxLength="255" ErrorMessage="�п�J�u�s����}�v!!" 
								Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_linkurlResource1" OnClickMore=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_contentdescription" runat="server" Text="���e��ܦW��" meta:resourcekey="LABEL_contentdescriptionResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_description" tabIndex="104" runat="server" Width="420px" BackColor="#F0F0F0"
								CssClass="Normal" Required="True" MaxLength="200" ErrorMessage="�п�J�u���e��ܦW�١v!!" 
								Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_descriptionResource1" OnClickMore=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_remark" runat="server" Text="�Ƶ�����" meta:resourcekey="LABEL_remarkResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_remark" tabIndex="117" runat="server" Width="420px" BackColor="#F0F0F0"
								CssClass="Normal" MaxLength="1073741823" ErrorMessage="�п�J�u�Ƶ������v!!"  TextMode="MultiLine"
								Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_remarkResource1" OnClickMore="" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_contenttypename" runat="server" Text="���e����" meta:resourcekey="LABEL_contenttypenameResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputselect id="FIELD_ctypeid" runat="server" Width="402px"  ItemNoneDisplayed="True"
								onChange="seticonurl(this);" cssClass="Normal" backcolor="#F0F0F0" Personalize="False" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_ctypeidResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:InputSelect></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_categoryname" runat="server" Text="���e����" meta:resourcekey="LABEL_categorynameResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControlEnterprise:selectcategory id="FIELD_catid" runat="server" Width="402px" ItemNoneDisplayed="True" cssClass="Normal"
								backcolor="#F0F0F0" TextField="pids" ValueField="id" Personalize="False" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_catidResource1" Mode="Single" PareantId="00000000-0000-0000-0000-000000000000" TextBoxStyle="ThreeDStyle" Value="">
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            <ErrorStyle BorderStyle="NotSet" />
                        </SmoothEnterpriseWebControlEnterprise:selectcategory></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_iconurl" runat="server" Text="���e�ϥܦ�}" meta:resourcekey="LABEL_iconurlResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControlEnterprise:selecticonurl id="FIELD_iconurl" runat="server" Width="402px" cssClass="Normal" backcolor="#F0F0F0"
								EditIconDisplayed="True" Editable="True" Personalize="False" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_iconurlResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="" ItemNoneDisplayed="True">
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControlEnterprise:selecticonurl></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_imgurl" runat="server" Text="�ϥܦ�}" meta:resourcekey="LABEL_imgurlResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_imgurl" tabIndex="110" runat="server" Width="420px" BackColor="#F0F0F0"
								CssClass="Normal" MaxLength="255" ErrorMessage="�п�J�u�ϥܦ�}�v!!"  Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_imgurlResource1" OnClickMore="" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<span id="SPAN_fileoption" runat="server">
						<tr>
							<td Class="NormalBold"><asp:Label ID="LABEL_deniedurl" runat="server" Text="�ڵ��s���ɤJ�s��" meta:resourcekey="LABEL_deniedurlResource1"></asp:Label></td>
						</tr>
						<tr>
							<td>
								<SmoothEnterpriseWebControl:inputtext id="FIELD_deniedurl" runat="server" BackColor="#F0F0F0" Width="420px" CssClass="Normal"
									 ErrorMessage="�п�J�u�ڵ��s���ɤJ�s���v!!" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_deniedurlResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                </SmoothEnterpriseWebControl:inputtext></td>
						</tr>
						<tr>
							<td Class="NormalBold"><asp:Label ID="LABEL_keywords" runat="server" Text="�j�M�����" meta:resourcekey="LABEL_keywordsResource1"></asp:Label></td>
						</tr>
						<tr>
							<td><SmoothEnterpriseWebControl:inputtext id="FIELD_keywords" tabIndex="114" runat="server" BackColor="#F0F0F0" CssClass="Normal"
									MaxLength="100" ErrorMessage="�п�J�u�j�M����ȡv!!"  Personalize="False" Width="420px" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_keywordsResource1" OnClickMore="" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:inputtext></td>
						</tr>
					</span>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_filetype" runat="server" Text="���e���O(�ɮ�/��Ƨ�)" meta:resourcekey="LABEL_filetypeResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControlEnterprise:selectcode id="FIELD_filetype" runat="server" Width="116px" Required="True" ErrorMessage="�п�J�u���e���O�v!!"
								ItemNoneDisplayed="True" cssClass="Normal" backcolor="White" TextField="name" ValueField="id" CodeType="filetype"
								Personalize="False" OnSelectedIndexChanged="FIELD_filetype_SelectedIndexChanged" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_filetypeResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControlEnterprise:SelectCode></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_cstatus" runat="server" Text="���e���A" meta:resourcekey="LABEL_cstatusResource1"></asp:Label></td>
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
										<td Class="NormalBold"><asp:Label ID="LABEL_viewmode" runat="server" Text="��ܰ���覡" meta:resourcekey="LABEL_viewmodeResource1"></asp:Label></td>
										<td>&nbsp;</td>
										<td Class="NormalBold"><asp:Label ID="LABEL_viewtarget" runat="server" Text="��ܰ����m" meta:resourcekey="LABEL_viewtargetResource1"></asp:Label></td>
									</tr>
									<tr>
										<td><SmoothEnterpriseWebControlEnterprise:selectcode id="FIELD_viewmode" runat="server" Width="116px" cssClass="Normal" backcolor="White"
												TextField="name" ValueField="id" CodeType="viewmode" ErrorMessage="�Ы��w�u��ܰ���覡�v!!" Personalize="False" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_viewmodeResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControlEnterprise:SelectCode></td>
										<td>&nbsp;</td>
										<td><SmoothEnterpriseWebControl:inputtext id="FIELD_viewtarget" tabIndex="112" runat="server" BackColor="#F0F0F0" CssClass="Normal"
												MaxLength="20" ErrorMessage="�п�J�u��ܰ����m�v!!"  Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_viewtargetResource1" OnClickMore="" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:inputtext></td>
									</tr>
									<tr>
										<td Class="NormalBold"><asp:Label ID="LABEL_effectdate" runat="server" Text="���e�ͮĤ��" meta:resourcekey="LABEL_effectdateResource1"></asp:Label></td>
										<td>&nbsp;</td>
										<td Class="NormalBold"><asp:Label ID="LABEL_expiredate" runat="server" Text="���e���Ĵ���" meta:resourcekey="LABEL_expiredateResource1"></asp:Label></td>
									</tr>
									<tr>
										<td><SmoothEnterpriseWebControl:inputtext id="FIELD_effectdate" tabIndex="115" runat="server" BackColor="#F0F0F0" CssClass="Normal"
												ErrorMessage="�п�J�u���e�ͮĤ���v!!"  FormatType="Date" Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_effectdateResource1" OnClickMore="" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:inputtext></td>
										<td>&nbsp;</td>
										<td><SmoothEnterpriseWebControl:inputtext id="FIELD_expiredate" tabIndex="116" runat="server" BackColor="#F0F0F0" CssClass="Normal"
												ErrorMessage="�п�J�u���e���Ĵ����v!!"  FormatType="Date" Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_expiredateResource1" OnClickMore="" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:inputtext></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td Class="NormalBold" style="HEIGHT: 23px"><asp:Label ID="LABEL_nocode" runat="server" Text="���e�s��" meta:resourcekey="LABEL_nocodeResource1"></asp:Label></td>
						</tr>
						<tr>
							<td><SmoothEnterpriseWebControl:inputtext id="FIELD_nocode" runat="server" BackColor="#F0F0F0" CssClass="Normal" 
									Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nocodeResource1" OnClickMore="" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:inputtext></td>
						</tr>
						<tr>
							<td Class="NormalBold"><asp:Label ID="LABEL_browsable" runat="server" Text="�i�s��" meta:resourcekey="LABEL_browsableResource1"></asp:Label></td>
						</tr>
						<tr>
							<td style="HEIGHT: 21px"><input id="FIELD_browsable" type="checkbox" name="FIELD_browsable" runat="server">
								<asp:label id="CHECK_browsable" runat="server" CssClass="Normal" Text="��ܩ�D�\���" meta:resourcekey="CHECK_browsableResource1"></asp:label></td>
						</tr>
						<tr>
							<td Class="NormalBold"><asp:Label ID="LABEL_viewprofile" runat="server" Text="�O�_��ܤ��e�ݩ�" meta:resourcekey="LABEL_viewprofileResource1"></asp:Label></td>
						</tr>
						<tr>
							<td><input id="FIELD_viewprofile" type="checkbox" name="FIELD_viewprofile" runat="server">
								<asp:label id="CHECK_viewprofile" runat="server" CssClass="Normal" Text="��ܤ��e�ݩ�" meta:resourcekey="CHECK_viewprofileResource1"></asp:label></td>
						</tr>
					</span>
					<span id="SPAN_directoryauth" runat="server">
						<tr>
							<td Class="NormalBold"><asp:Label ID="LABEL_foldertype" runat="server" Text="��Ƨ����O" meta:resourcekey="LABEL_foldertypeResource1"></asp:Label></td>
						</tr>
						<tr>
							<td><SmoothEnterpriseWebControlEnterprise:selectcode id="FIELD_foldertype" runat="server" Width="116px" cssClass="Normal" backcolor="#F0F0F0"
									TextField="name" ValueField="id" CodeType="foldertype" ErrorMessage="�Ы��w�u��Ƨ����O�v!!" Personalize="False" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_foldertypeResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" />
                            </SmoothEnterpriseWebControlEnterprise:SelectCode></td>
						</tr>
						<tr>
							<td Class="NormalBold"><asp:Label ID="LABEL_uploadlimit" runat="server" Text="���e�W�Ǥj�p����" meta:resourcekey="LABEL_uploadlimitResource1"></asp:Label></td>
						</tr>
						<tr>
							<td><SmoothEnterpriseWebControl:inputtext id="FIELD_uploadlimit" tabIndex="128" runat="server" BackColor="#F0F0F0" CssClass="Normal"
									MaxLength="19" ErrorMessage="�п�J�u�ɮפj�p�v!!"  Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_uploadlimitResource1" OnClickMore="" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
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
					Font-Bold="True" Text="�x�s" width="80px" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_saveResource1" RunAtCient="False">
                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
            </SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BUTTON_savenext" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom"
					Font-Bold="True" Text="�x�s���~��ާ@" meta:resourcekey="BUTTON_savenextResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:InputButton id="BUTTON_back" runat="server" width="80px" Text="�^�W��" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
		</tr>
	</table>
</asp:Content>
