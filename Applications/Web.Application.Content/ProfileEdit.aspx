<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Content.ProfileEdit, App_Web_profileedit.aspx.cdcab7d2" title="�s���ɮפ��e" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
			<td vAlign="top" width="400">
				<table>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_pathname" runat="server" Text="���e���|�W��" meta:resourcekey="LABEL_pathnameResource1"></asp:Label></td>
					</tr>
					<tr>
						<td Class="Normal">
							<SmoothEnterpriseWebControl:inputtext id="FIELD_pathname" runat="server" Width="420px" CssClass="PanelWhite" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_pathnameResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_contentdescription" runat="server" Text="���e��ܦW��" meta:resourcekey="LABEL_contentdescriptionResource1"></asp:Label></td>
					</tr>
					<tr>
						<td style="HEIGHT: 25px"><SmoothEnterpriseWebControl:inputtext id="FIELD_description" tabIndex="104" runat="server" BackColor="#F0F0F0" Width="420px"
								CssClass="Normal" Required="True"  ErrorMessage="�п�J�u���e��ܦW�١v!!" MaxLength="200" Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_descriptionResource1" OnClickMore=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_remark" runat="server" Text="�Ƶ�����" meta:resourcekey="LABEL_remarkResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_remark" tabIndex="117" runat="server" BackColor="#F0F0F0" Width="420px"
								CssClass="Normal"  ErrorMessage="�п�J�u�Ƶ������v!!" MaxLength="1073741823" TextMode="MultiLine"
								Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_remarkResource1" OnClickMore="" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_contenttypename" runat="server" Text="���e����" meta:resourcekey="LABEL_contenttypenameResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputselect id="FIELD_ctypeid" runat="server" Width="402px"  onChange="seticonurl(this);"
								cssClass="Normal" backcolor="#F0F0F0" ItemNoneDisplayed="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_ctypeidResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" />
                        </SmoothEnterpriseWebControl:InputSelect></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_categoryname" runat="server" Text="���e����" meta:resourcekey="LABEL_categorynameResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControlEnterprise:selectcategory id="FIELD_catid" runat="server" Width="402px" cssClass="Normal" backcolor="#F0F0F0"
								ValueField="id" TextField="pids" ItemNoneDisplayed="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_catidResource1" Mode="Single" PareantId="00000000-0000-0000-0000-000000000000" TextBoxStyle="ThreeDStyle" Value="">
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControlEnterprise:selectcategory></td>
					</tr>
					<tr>
						<td Class="NormalBold" style="height: 23px"><asp:Label ID="LABEL_iconurl" runat="server" Text="���e�ϥܦ�}" meta:resourcekey="LABEL_iconurlResource1"></asp:Label></td>
					</tr>
					<tr>
						<td>
							<SmoothEnterpriseWebControlEnterprise:SelectIconURL id="FIELD_iconurl" runat="server" Width="402px" backcolor="#F0F0F0" cssClass="Normal"
								Editable="True" EditIconDisplayed="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_iconurlResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="" ItemNoneDisplayed="True">
                                <ErrorStyle BorderStyle="NotSet" />
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControlEnterprise:SelectIconURL></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_imgurl" runat="server" Text="�ϥܦ�}" meta:resourcekey="LABEL_imgurlResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_imgurl" tabIndex="110" runat="server" BackColor="#F0F0F0" Width="420px"
								CssClass="Normal"  ErrorMessage="�п�J�u�ϥܦ�}�v!!" MaxLength="255" Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_imgurlResource1" OnClickMore="" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" />
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
							<td><SmoothEnterpriseWebControl:inputtext id="FIELD_keywords" runat="server" BackColor="#F0F0F0" CssClass="Normal" 
									MaxLength="100" essage="�п�J�u�j�M����ȡv!!" ErrorM Personalize="False" Width="420px" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_keywordsResource1" OnClickMore="" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" />
                            </SmoothEnterpriseWebControl:inputtext></td>
						</tr>
					</span>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_cstatus" runat="server" Text="���e���A" meta:resourcekey="LABEL_cstatusResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControlEnterprise:selectcode id="FIELD_cstatus" runat="server" Width="116px" cssClass="Normal" backcolor="White"
								ValueField="id" TextField="name" CodeType="cstatus" ItemNoneDisplayed="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_cstatusResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" />
                        </SmoothEnterpriseWebControlEnterprise:SelectCode></td>
					</tr>
					<span id="SPAN_fileauth" runat="server">
						<tr>
							<td>
								<table Class="Normal" cellSpacing="0" cellPadding="0" border="0">
									<tr>
										<td Class="NormalBold" style="HEIGHT: 21px" runat="server"><asp:Label ID="LABEL_viewmode" runat="server" Text="��ܰ���覡" meta:resourcekey="LABEL_viewmodeResource1"></asp:Label></td>
										<td Class="NormalBold"><asp:Label ID="LABEL_viewtarget" runat="server" Text="��ܰ����m" meta:resourcekey="LABEL_viewtargetResource1"></asp:Label></td>
									</tr>
									<tr>
										<td><SmoothEnterpriseWebControlEnterprise:selectcode id="FIELD_viewmode" runat="server" Width="116px" cssClass="Normal" backcolor="White"
												ValueField="id" TextField="name" CodeType="viewmode" ErrorMessage="�Ы��w�u��ܰ���覡�v!!" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_viewmodeResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" />
                                        </SmoothEnterpriseWebControlEnterprise:SelectCode></td>
										<td><SmoothEnterpriseWebControl:inputtext id="FIELD_viewtarget" tabIndex="112" runat="server" BackColor="#F0F0F0" CssClass="Normal"
												 ErrorMessage="�п�J�u��ܰ����m�v!!" MaxLength="20" Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_viewtargetResource1" OnClickMore="" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" />
                                        </SmoothEnterpriseWebControl:inputtext></td>
									</tr>
									<tr>
										<td Class="NormalBold"><asp:Label ID="LABEL_effectdate" runat="server" Text="���e�ͮĤ��" meta:resourcekey="LABEL_effectdateResource1"></asp:Label></td>
										<td Class="NormalBold"><asp:Label ID="LABEL_expiredate" runat="server" Text="���e���Ĵ���" meta:resourcekey="LABEL_expiredateResource1"></asp:Label></td>
									</tr>
									<tr>
										<td><SmoothEnterpriseWebControl:inputtext id="FIELD_effectdate" tabIndex="115" runat="server" BackColor="#F0F0F0" CssClass="Normal"
												 ErrorMessage="�п�J�u���e�ͮĤ���v!!" FormatType="Date" Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_effectdateResource1" OnClickMore="" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" />
                                        </SmoothEnterpriseWebControl:inputtext></td>
										<td><SmoothEnterpriseWebControl:inputtext id="FIELD_expiredate" tabIndex="116" runat="server" BackColor="#F0F0F0" CssClass="Normal"
												 ErrorMessage="�п�J�u���e���Ĵ����v!!" FormatType="Date" Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_expiredateResource1" OnClickMore="" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" />
                                        </SmoothEnterpriseWebControl:inputtext></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td Class="NormalBold"><asp:Label ID="LABEL_nocode" runat="server" Text="���e�s��" meta:resourcekey="LABEL_nocodeResource1"></asp:Label></td>
						</tr>
						<tr>
							<td><SmoothEnterpriseWebControl:inputtext id="FIELD_nocode" runat="server" BackColor="#F0F0F0" CssClass="Normal" 
									MaxLength="100" essage="�п�J�u���e�s���v!!" ErrorM Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nocodeResource1" OnClickMore="" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" />
                            </SmoothEnterpriseWebControl:inputtext></td>
						</tr>
						<tr>
							<td Class="NormalBold"><asp:Label ID="LABEL_browsable" runat="server" Text="�i�s��" meta:resourcekey="LABEL_browsableResource1"></asp:Label></td>
						</tr>
						<tr>
							<td style="HEIGHT: 21px"><input id="FIELD_browsable" runat="server" type="checkbox">
								<asp:Label id="CHECK_browsable" runat="server" CssClass="Normal" Text="��ܩ�D�\���" meta:resourcekey="CHECK_browsableResource1"></asp:Label></td>
						</tr>
						<tr>
							<td Class="NormalBold" style="HEIGHT: 22px"><asp:Label ID="LABEL_viewprofile" runat="server" Text="�O�_��ܤ��e�ݩ�" meta:resourcekey="LABEL_viewprofileResource1"></asp:Label></td>
						</tr>
						<tr>
							<td><input id="FIELD_viewprofile" runat="server" type="checkbox">
								<asp:Label id="CHECK_viewprofile" runat="server" CssClass="Normal" Text="��ܤ��e�ݩ�" meta:resourcekey="CHECK_viewprofileResource1"></asp:Label></td>
						</tr>
					</span><span id="SPAN_directoryauth" runat="server">
						<tr>
							<td Class="NormalBold"><asp:Label ID="LABEL_foldertype" runat="server" Text="��Ƨ����O" meta:resourcekey="LABEL_foldertypeResource1"></asp:Label></td>
						</tr>
						<tr>
							<td><SmoothEnterpriseWebControlEnterprise:selectcode id="FIELD_foldertype" runat="server" Width="116px" cssClass="Normal" backcolor="#F0F0F0"
									ValueField="id" TextField="name" CodeType="foldertype" ErrorMessage="�Ы��w�u��Ƨ����O�v!!" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_foldertypeResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControlEnterprise:SelectCode></td>
						</tr>
						<tr>
							<td Class="NormalBold"><asp:Label ID="LABEL_uploadlimit" runat="server" Text="���e�W�Ǥj�p����" meta:resourcekey="LABEL_uploadlimitResource1"></asp:Label></td>
						</tr>
						<tr>
							<td><SmoothEnterpriseWebControl:inputtext id="FIELD_uploadlimit" runat="server" BackColor="#F0F0F0" CssClass="Normal" 
									Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_uploadlimitResource1" OnClickMore="" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" />
                            </SmoothEnterpriseWebControl:inputtext></td>
						</tr>
					</span>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_modifydate" runat="server" Text="��ƭק�ɶ�" meta:resourcekey="LABEL_modifydateResource1"></asp:Label></td>
					</tr>
					<tr>
						<td Class="Normal"><asp:label id="FIELD_modifydate" runat="server" meta:resourcekey="FIELD_modifydateResource1"></asp:label></td>
					</tr>
				</table>
			</td>
			<td vAlign="top" width="10" background="/lib/img/vline.gif">&nbsp;</td>
			<td vAlign="top">
				<table>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_cattribute" runat="server" Text="���e�ݩʦW��" meta:resourcekey="LABEL_cattributeResource1"></asp:Label></td>
					</tr>
					<tr>
						<td>
							<SmoothEnterpriseWebControl:MultiSelect id="FIELD_cattribute" runat="server" Font-Names="Arial" Font-Size="12px" CssClass="normalblod"
								SelectBgColor2="Silver" SelectBgColor1="204, 204, 204" Size="5" Width="402px" SelectedLabel="�w������e�ݩ����" SelectionLabel="�Ҧ����e�ݩ����" meta:resourcekey="FIELD_cattributeResource1" Order="False" Value="">
								<LabelStyle Font-Size="12px" Font-Names="Arial" Font-Bold="True" BorderStyle="NotSet" CssClass=""></LabelStyle>
							</SmoothEnterpriseWebControl:MultiSelect></td>
					</tr>
					<span id="SPAN_functionset" runat="server">
						<tr>
							<td Class="NormalBold"><asp:Label ID="LABEL_functionset" runat="server" Text="�\�ධ�X" meta:resourcekey="LABEL_functionsetResource1"></asp:Label></td>
						</tr>
						<tr>
							<td><SmoothEnterpriseWebControl:DATALIST id="DataList1" runat="server" BorderColor="Gray" Font-Size="12px" Font-Names="Arial"
									gridlines="both" borderwidth="1px" borderstyle="Solid" Connected="False" HeaderHeight="30px" EnableCustom="False"
									EnableExport="False" EnablePrint="False" NavigatorPos="None" RowNumber="False" Width="402px" BackImageURL="" CellPadding="3px" ConnectionString="" CurrentColumn="" CurrentRow="0" IconCustom="" IconExport="" IconGoFirstPage="" IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage="" IconPages="" IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc="" meta:resourcekey="DataList1Resource1" SortColumn="" SortType="" OnOnRenderCell="DataList1_OnRenderCell">
									<Columns>
										<SmoothEnterpriseWebControl:DataColumn DataType="CheckBox" DataAlign="Center" Width="1%" Required="True" ID="DataList1_chk" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_chkResource1"></SmoothEnterpriseWebControl:DataColumn>
										<SmoothEnterpriseWebControl:DataColumn DataType="IconEdit" DataAlign="Center" Width="1%" Required="True" ID="DataList1_edit" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_editResource1"></SmoothEnterpriseWebControl:DataColumn>
										<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="���e�ɮצW��" Required="True" DataName="filename" Sortable="True"
											ID="DataList1_filename" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_filenameResource1"></SmoothEnterpriseWebControl:DataColumn>
										<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="���e��ܦW��" Required="True" DataName="description" Sortable="True"
											ID="DataList1_contentdescription" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_contentdescriptionResource1"></SmoothEnterpriseWebControl:DataColumn>
										<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Required="True" DataName="authtypename" ID="DataList1_authtypename" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_authtypenameResource1"></SmoothEnterpriseWebControl:DataColumn>
									</Columns>
									<NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px" ForeColor="64, 64, 64"
										BorderColor="Silver" BackColor="224, 224, 224"></NavigatorStyle>
									<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="Black" BorderStyle="NotSet"></HeaderStyle>
									<SelectStyle BackColor="LightSteelBlue" BorderStyle="NotSet"></SelectStyle>
									<GridLine LineColor="224, 224, 224" LineStyle="Solid" LineMode="Vertical" LineWidth="1px"></GridLine>
									<HoverStyle BackColor="230, 237, 255" BorderStyle="NotSet"></HoverStyle>
                                <SelectColumnStyle BorderStyle="NotSet" />
                                <RowStyle BorderStyle="NotSet" />
								</SmoothEnterpriseWebControl:DATALIST></td>
						</tr>
						<tr>
							<td><SmoothEnterpriseWebControl:inputbutton id="BUTTON_new" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
									Gradient-GradientType="Bottom" BorderColor="#606060" Font-Size="12px" Font-Names="Arial" Width="80px" cssClass="NormalBold"
									Text="�s�W���X" Font-Bold="True" RunAtCient="True" meta:resourcekey="BUTTON_newResource1">
									<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
								</SmoothEnterpriseWebControl:inputbutton>&nbsp;
								<SmoothEnterpriseWebControl:inputbutton id="BUTTON_remove" runat="server" OnClick="BUTTON_remove_Click" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
									Gradient-GradientType="Bottom" BorderColor="#606060" Font-Size="12px" Font-Names="Arial" Width="80px" cssClass="NormalBold"
									Text="�������p" Font-Bold="True" meta:resourcekey="BUTTON_removeResource1" RunAtCient="False">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                                </SmoothEnterpriseWebControl:inputbutton></td>
						</tr>
					</span>
				</table>
			</td>
		</tr>
	</table>
	<table Class="Normal" border="0">
		<tr>
			<td><SmoothEnterpriseWebControl:inputbutton id="BUTTON_save" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" Text="�x�s" Font-Bold="True"
					width="80px" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_saveResource1" RunAtCient="False">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BUTTON_back" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" Text="�^�W��" Font-Bold="True"
					width="80px" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BUTTON_delete" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" Text="�R��" Font-Bold="True"
					width="80px" OnClick="BUTTON_delete_Click" meta:resourcekey="BUTTON_deleteResource1" RunAtCient="False">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BUTTON_authority" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" Text="�v��" Font-Bold="True"
					Width="80px" OnClick="BUTTON_authority_Click" meta:resourcekey="BUTTON_authorityResource1" RunAtCient="False">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BUTTON_viewlog" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" Text="�O��" Font-Bold="True"
					width="80px" OnClick="BUTTON_viewlog_Click" meta:resourcekey="BUTTON_viewlogResource1" RunAtCient="False">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControl:inputbutton></td>
			&nbsp;
		</tr>
	</table>
</asp:Content>
