<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" CodeFile="UserCompanyEdit.aspx.cs" inherits="SPC.UserCompanyEdit"  title="Untitled Page" theme="Default" culture="auto" uiculture="auto"   %>
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
	<table Class="Normal" border="0" width="100%">
		<tr>
			<td>
				<dl class="tabsheet" tabfontcolor="blue" tabcapalign="center" tabwidth="120" width="100%"
					tabalign="left" sheetclass="tabsilverbody" tabclass="TabSilver">
					<dt tabtitle="Account" active="active" id="tabtitle_Account" runat="server">
						<table Class="Normal" border="0">
							<tr>
								<td valign="top">
									<table Class="Normal" border="0" id="TB_detail" runat="server">
										<tr Class="NormalBold">
											<td>
												<asp:Label ID="LABEL_utype" runat="server" Text="使用者類別" meta:resourcekey="LABEL_utypeResource1"></asp:Label></td>
										</tr>
										<tr>
											<td>
												<SmoothEnterpriseWebControlEnterprise:SelectCode id="FIELD_utype" runat="server" Required="True" ValueField="id" TextField="name"
													BackColor="#F0F0F0" CssClass="Normal" CodeType="utype" Value="64CA1E7D-B15F-43CB-A33A-D29DB9020892"
													ErrorMessage="請選擇「使用者類別」!!" ReadOnly="True" OnSelectedIndexChanged="FIELD_utype_SelectedIndexChanged" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_utypeResource1" Mode="Single" TextBoxStyle="ThreeDStyle"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                                </SmoothEnterpriseWebControlEnterprise:SelectCode></td>
										</tr>
										<tr Class="NormalBold">
											<td>
												<asp:Label ID="LABEL_logonid" runat="server" Text="帳號" meta:resourcekey="LABEL_logonidResource1"></asp:Label></td>
										</tr>
										<tr>
											<td><SmoothEnterpriseWebControl:inputtext id="FIELD_logonid" runat="server" ErrorMessage="請輸入「帳號」!!" Required="True"
													CssClass="Normal" BackColor="#F0F0F0" MaxLength="50" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_logonidResource1" OnClickMore="" Personalize="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            </SmoothEnterpriseWebControl:inputtext></td>
										</tr>
										<tr id="TRLABEL_pwd" runat="server" Class="NormalBold">
											<td>
                                                <asp:Label ID="LABEL_pwd" runat="server" Text="密碼" meta:resourcekey="LABEL_pwdResource1"></asp:Label></td>
										</tr>
										<tr id="TRFIELD_pwd" runat="server">
											<td><SmoothEnterpriseWebControl:inputtext id="FIELD_pwd" runat="server" BackColor="#F0F0F0" CssClass="Normal" MaxLength="50"
													Gradient-GradientType="Top" TextMode="Password" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_pwdResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            </SmoothEnterpriseWebControl:inputtext>
												<SmoothEnterpriseWebControl:InputText id="FIELD_opwd" runat="server" HiddenMode="True" backcolor="#F0F0F0"
													cssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_opwdResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                                </SmoothEnterpriseWebControl:inputtext></td>
										</tr>
										<tr id="TRLABEL_pwd_confirm" runat="server" Class="NormalBold">
											<td>
                                                <asp:Label ID="LABEL_pwd_confirm" runat="server" Text="密碼確認" meta:resourcekey="LABEL_pwd_confirmResource1"></asp:Label></td>
										</tr>
										<tr id="TRFIELD_pwd_confirm" runat="server">
											<td><SmoothEnterpriseWebControl:inputtext id="FIELD_pwd_confirm" runat="server" BackColor="#F0F0F0" CssClass="Normal" MaxLength="50"
													Gradient-GradientType="Top" TextMode="Password" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_pwd_confirmResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            </SmoothEnterpriseWebControl:inputtext><asp:comparevalidator id="V_FIELD_pwd" runat="server" ErrorMessage="密碼確認有誤!!" ControlToCompare="FIELD_pwd_confirm"
													EnableClientScript="False" ControlToValidate="FIELD_pwd" Display="None" meta:resourcekey="V_FIELD_pwdResource1"></asp:comparevalidator></td>
										</tr>
										<tr id="TRLABEL_userdomain" runat="server" Class="NormalBold">
											<td>
                                                <asp:Label ID="LABEL_userdomain" runat="server" Text="登入網域" meta:resourcekey="LABEL_userdomainResource1"></asp:Label></td>
										</tr>
										<tr id="TRFIELD_userdomain" runat="server">
											<td><SmoothEnterpriseWebControl:inputtext id="FIELD_userdomain" runat="server" BackColor="#F0F0F0" Width="300px" CssClass="Normal"
													ErrorMessage="請輸入「登入網域」!!" Required="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_userdomainResource1" OnClickMore="" Personalize="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            </SmoothEnterpriseWebControl:inputtext></td>
										</tr>
										<tr Class="NormalBold">
											<td>
												<asp:Label ID="LABEL_effectdate" runat="server" Text="生效日期" meta:resourcekey="LABEL_effectdateResource1"></asp:Label></td>
										</tr>
										<tr>
											<td>
												<SmoothEnterpriseWebControl:InputText id="FIELD_effectdate" runat="server" Width="100px" BackColor="#F0F0F0" CssClass="Normal"
													Gradient-GradientType="Top" FormatType="Date" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_effectdateResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                                </SmoothEnterpriseWebControl:inputtext></td>
										</tr>
										<tr Class="NormalBold">
											<td>
												<asp:Label ID="LABEL_expiredate" runat="server" Text="有效期限" meta:resourcekey="LABEL_expiredateResource1"></asp:Label></td>
										</tr>
										<tr>
											<td>
												<SmoothEnterpriseWebControl:InputText id="FIELD_expiredate" runat="server" Width="100px" BackColor="#F0F0F0" CssClass="Normal"
													Gradient-GradientType="Top" FormatType="Date" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_expiredateResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                                </SmoothEnterpriseWebControl:inputtext></td>
										</tr>
										<tr Class="NormalBold">
											<td>
                                                <asp:Label ID="LABEL_ucategory" runat="server" Text="使用者分類" meta:resourcekey="LABEL_ucategoryResource1"></asp:Label></td>
										</tr>
										<tr>
											<td>
												<SmoothEnterpriseWebControlEnterprise:SelectCode id="FIELD_ucategory" runat="server" ValueField="id" TextField="name" CodeType="ucategory"
													cssClass="Normal" backcolor="#F0F0F0" ItemNoneDisplayed="True" ItemAddDisplayed="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAddUrl="/lib/app/addcode.aspx?ctype=ucategory" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_ucategoryResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                                </SmoothEnterpriseWebControlEnterprise:SelectCode></td>
										</tr>
										<tr Class="NormalBold">
											<td>
												<asp:Label ID="LABEL_ustatus" runat="server" Text="使用帳號狀態" meta:resourcekey="LABEL_ustatusResource1"></asp:Label></td>
										</tr>
										<tr>
											<td>
												<SmoothEnterpriseWebControlEnterprise:SelectCode id="FIELD_ustatus" runat="server" Required="True" ValueField="id" TextField="name"
													BackColor="#F0F0F0" CssClass="Normal" CodeType="ustatus" ErrorMessage="請選擇「使用帳號狀態」!!" ItemNoneDisplayed="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_ustatusResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                                </SmoothEnterpriseWebControlEnterprise:SelectCode></td>
										</tr>
									</table>
								</td>
								<td height="1" width="1"><span style="BORDER-RIGHT: 1px inset; BORDER-TOP: 1px inset; FONT-SIZE: 16px; MARGIN: 0px 3px; BORDER-LEFT: 1px inset; WIDTH: 1px; BORDER-BOTTOM: 1px inset; HEIGHT: 100%"
										clear="all"></span></td>
								<td valign="top">
									<table Class="Normal" border="0">
										<tr Class="NormalBold">
											<td style="width: 263px">
												<asp:Label ID="LABEL_gid" runat="server" Text="群組" meta:resourcekey="LABEL_gidResource1" Width="80px"></asp:Label>
                                                <asp:DropDownList ID="DDgid" runat="server" Width="150px">
                                                </asp:DropDownList>
												<SmoothEnterpriseWebControlEnterprise:SelectGroup id="FIELD_gid" runat="server" CssClass="Normal" BackColor="#F0F0F0" ItemNoneDisplayed="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_gidResource1" Mode="Single" RootId="" TextBoxStyle="ThreeDStyle" Value="" EnabledHTC="False" Visible="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                                </SmoothEnterpriseWebControlEnterprise:SELECTGROUP>
											</td>
                                            <td style="width: 206px">
                                                <asp:Label ID="Label1" runat="server" Font-Bold="True" meta:resourcekey="LABEL_gidResource1"
                                                    Text="廠別"></asp:Label>
                                                <asp:DropDownList ID="DdDept" runat="server" Width="154px">
                                                    <asp:ListItem>MAT</asp:ListItem>
                                                    <asp:ListItem>MAM</asp:ListItem>
                                                    <asp:ListItem>MATC</asp:ListItem>
                                                    <asp:ListItem>MAP</asp:ListItem>
                                                    <asp:ListItem>MAPP</asp:ListItem>
                                                    <asp:ListItem>MAY</asp:ListItem>
                                                    <asp:ListItem>AMO</asp:ListItem>
                                                    <asp:ListItem>NA</asp:ListItem>
                                                </asp:DropDownList></td>
                                            <td>
                                            </td>
										</tr>
										<tr>
											<td style="width: 263px">
                                                <asp:Label ID="Label2" runat="server" Font-Bold="True" meta:resourcekey="LABEL_gidResource1"
                                                    Text="員工編號" Width="80px"></asp:Label>
                                                <asp:TextBox ID="empid" runat="server"></asp:TextBox></td>
                                            <td style="width: 206px">
                                            </td>
										</tr>
                                        <tr>
                                            <td style="width: 263px">
                                                <asp:Label ID="Label3" runat="server" Font-Bold="True" meta:resourcekey="LABEL_gidResource1"
                                                    Text="目標廠區" Width="80px"></asp:Label>
                                                <asp:DropDownList ID="LocComid" runat="server" Width="154px" SkinID="總公司管理者專用,可將指定的使用者,匯入指定廠區,其角色將為一般使用者,群組則為空白,密碼則需要重取">
                                                    <asp:ListItem>NA</asp:ListItem>
                                                    <asp:ListItem>MAT</asp:ListItem>
                                                    <asp:ListItem>MAM</asp:ListItem>
                                                    <asp:ListItem>MATC</asp:ListItem>
                                                    <asp:ListItem>MAP</asp:ListItem>
                                                    <asp:ListItem>MAPP</asp:ListItem>
                                                    <asp:ListItem>MAY</asp:ListItem>
                                                </asp:DropDownList></td>
                                            <td style="width: 206px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 263px">
                                                </td>
                                            <td style="width: 206px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 263px">
                                                </td>
                                            <td style="width: 206px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 263px">
                                                </td>
                                            <td style="width: 206px">
                                            </td>
                                        </tr>
										<tr Class="NormalBold">
											<td style="width: 263px">
												<asp:Label ID="LABEL_role" runat="server" Text="角色" meta:resourcekey="LABEL_roleResource1"></asp:Label></td>
                                            <td style="width: 206px">
                                            </td>
										</tr>
										<tr>
                                            <td colspan="2">
												<SmoothEnterpriseWebControl:multiselect id="FIELD_role" runat="server" Width="400px" SelectBgColor1="204, 204, 204" SelectBgColor2="Silver"
													Font-Names="Arial" Font-Size="12px" CssClass="normalblod" Text1="已選取角色" Text2="未選取角色" Size="10" meta:resourcekey="FIELD_roleResource1" Order="False" SelectedLabel="" SelectionLabel="" Value="">
                                                    <LabelStyle BorderStyle="NotSet" CssClass="" />
                                                </SmoothEnterpriseWebControl:multiselect>
                                            </td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						</dt>
						<dt tabtitle="Information" id="tabtitle_Information" runat="server">
							<table Class="Normal" border="0">
								<tr>
									<td valign="top">
										<table Class="Normal" border="0">
											<tr Class="NormalBold">
												<td>
													<asp:Label ID="LABEL_name" runat="server" Text="名稱" meta:resourcekey="LABEL_nameResource1"></asp:Label></td>
											</tr>
											<tr>
												<td><SmoothEnterpriseWebControl:inputtext id="FIELD_name" runat="server" ErrorMessage="請輸入「名稱」!!" Required="True"
														CssClass="Normal" BackColor="#F0F0F0" MaxLength="50" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nameResource1" OnClickMore="" Personalize="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                                </SmoothEnterpriseWebControl:inputtext></td>
											</tr>
											<tr Class="NormalBold">
												<td>
													<asp:Label ID="LABEL_name1" runat="server" Text="暱稱" meta:resourcekey="LABEL_name1Resource1"></asp:Label></td>
											</tr>
											<tr>
												<td><SmoothEnterpriseWebControl:inputtext id="FIELD_name1" runat="server" CssClass="Normal" BackColor="#F0F0F0"
														MaxLength="50" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_name1Resource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                                </SmoothEnterpriseWebControl:inputtext></td>
											</tr>
											<tr Class="NormalBold">
												<td>
													<asp:Label ID="LABEL_gender" runat="server" Text="性別" meta:resourcekey="LABEL_genderResource1"></asp:Label></td>
											</tr>
											<tr>
												<td><asp:radiobuttonlist id="FIELD_gender" runat="server" CssClass="Normal" RepeatLayout="Flow" RepeatDirection="Horizontal" meta:resourcekey="FIELD_genderResource1">
														<asp:ListItem Value="M" Text="男" meta:resourcekey="ListItemResource1"></asp:ListItem>
														<asp:ListItem Value="F" Text="女" meta:resourcekey="ListItemResource2"></asp:ListItem>
													</asp:radiobuttonlist></td>
											</tr>
											<tr Class="NormalBold">
												<td><asp:Label ID="LABEL_email" runat="server" Text="E-mail :" meta:resourcekey="LABEL_emailResource1"></asp:Label></td>
											</tr>
											<tr>
												<td><SmoothEnterpriseWebControl:inputtext id="FIELD_email" runat="server" CssClass="Normal" BackColor="#F0F0F0"
														Width="300px" MaxLength="100" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_emailResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                                </SmoothEnterpriseWebControl:inputtext></td>
											</tr>
											<tr Class="NormalBold">
												<td>
													<asp:Label ID="LABEL_remark" runat="server" Text="備註" meta:resourcekey="LABEL_remarkResource1"></asp:Label></td>
											</tr>
											<tr>
												<td><SmoothEnterpriseWebControl:inputtext id="FIELD_remark" runat="server" CssClass="Normal" BackColor="#F0F0F0"
														TextMode="MultiLine" Width="300px" Height="100px" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_remarkResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                                </SmoothEnterpriseWebControl:inputtext></td>
											</tr>
											<tr Class="NormalBold">
												<td></td>
											</tr>
											<tr>
												<td></td>
											</tr>
										</table>
									</td>
									<td height="1" width="1"><span style="BORDER-RIGHT: 1px inset; BORDER-TOP: 1px inset; FONT-SIZE: 16px; MARGIN: 0px 3px; BORDER-LEFT: 1px inset; WIDTH: 1px; BORDER-BOTTOM: 1px inset; HEIGHT: 100%"
											clear="all"></span></td>
									<td valign="top">
										<table Class="Normal" border="0">
											<tr Class="NormalBold">
												<td><asp:Label ID="LABEL_photo" runat="server" Text="個人照片" meta:resourcekey="LABEL_photoResource1"></asp:Label></td>
											</tr>
											<tr Class="NormalBold">
												<td>
													<SmoothEnterpriseWebControl:InputFile id="FIELD_photo" runat="server" cssClass="Normal" backcolor="#F0F0F0"
														Width="300px" meta:resourcekey="FIELD_photoResource1"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:InputFile></td>
											</tr>
											<tr>
												<td><IMG id="PREVIEW_photo" alt="" src="/lib/img/img-noimage.gif" runat="server"></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</dt>
				</dl>
			</td>
		</tr>
	</table>
	<table Class="Normal" border="0" id="Table2">
		<tr>
			<td><SmoothEnterpriseWebControl:inputbutton id="BUTTON_save" runat="server" width="80px" Gradient-GradientType="Bottom" CssClass="NormalBold"
					BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial" Font-Size="12px"
					Font-Bold="True" Text="儲存" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_saveResource1" RunAtCient="False">
                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
            </SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BUTTON_back" runat="server" width="80px" Gradient-GradientType="Bottom" CssClass="NormalBold"
					BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial" Font-Size="12px"
					Font-Bold="True" Text="回上頁" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BUTTON_delete" runat="server" width="80px" Gradient-GradientType="Bottom" CssClass="NormalBold"
					BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial" Font-Size="12px"
					Font-Bold="True" Text="刪除" OnClick="BUTTON_delete_Click" meta:resourcekey="BUTTON_deleteResource1" RunAtCient="False" Visible="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton></td>
		</tr>
	</table>
</asp:Content>
