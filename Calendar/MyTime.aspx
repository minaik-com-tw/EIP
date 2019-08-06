<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Calendar.MyTime, App_Web_mytime.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

<%@ Register Src="uc/CalendarNavigator.ascx" TagName="CalendarNavigator" TagPrefix="uc1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Calendar, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Calendar.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <uc1:CalendarNavigator ID="CalendarNavigator1" runat="server" />
	<asp:literal id="Literal_language" runat="server" meta:resourcekey="Literal_languageResource1"></asp:literal>
	<table Class="Normal" width="100%" border="0">
		<tr>
			<td vAlign="top" width="500"><span class="PanelBlue1" style="PADDING-RIGHT: 3px; PADDING-LEFT: 3px; PADDING-BOTTOM: 3px; WIDTH: 100%; PADDING-TOP: 3px; HEIGHT: 200px">
					<table Class="Normal" cellSpacing="1" cellPadding="2" width="100%">
						<tr>
							<td Class="NormalBold">
							    <asp:Label ID="LABEL_eventtype" runat="server" Text="事件類別" meta:resourcekey="LABEL_eventtypeResource1"></asp:Label></td>
						</tr>
						<tr>
							<td>
								<table Class="Normal" cellSpacing="0" cellPadding="0">
									<tr>
										<td><input id="event_period" onclick="chg_eventtype('period');" type="radio" CHECKED value="9EFF56E9-90BC-49B5-8F77-DCBC9207ADBB"
												name="input_eventtype"></td>
										<td>
										    <asp:Label ID="LABEL_period" runat="server" Text="時段" meta:resourcekey="LABEL_periodResource1"></asp:Label></td>
										<td>&nbsp;&nbsp;&nbsp;</td>
										<td><input id="event_allday" onclick="chg_eventtype('allday');" type="radio" value="4EB75CAF-0EC4-40D3-8249-B856C4D4AB12"
												name="input_eventtype"></td>
										<td>
										    <asp:Label ID="LABEL_allday" runat="server" Text="整日" meta:resourcekey="LABEL_alldayResource1"></asp:Label></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table id="table_period" cellSpacing="0" cellPadding="0" border="0">
									<tr Class="NormalBold" height="22">
										<td>
										    <asp:Label ID="LABEL_sdate" runat="server" Text="開始日期時間" meta:resourcekey="LABEL_sdateResource1"></asp:Label></td>
										<td></td>
										<td>
										    <asp:Label ID="LABEL_edate" runat="server" Text="結束日期時間" meta:resourcekey="LABEL_edateResource1"></asp:Label></td>
									</tr>
									<tr>
										<td><SmoothEnterpriseWebControl:inputtext id="Input_Sdate" onpropertychange="onDateChange(this);" runat="server" ErrorMessage="請輸入「開始日期時間」!!"
												Required="True"  FormatType="DateTime" CssClass="Normal" BackColor="#F0F0F0" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="Input_SdateResource1" OnClickMore="" Personalize="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:inputtext></td>
										<td Class="NormalBold" noWrap align="center" width="20">
										    <asp:Label ID="LABEL_to" runat="server" Text="至" meta:resourcekey="LABEL_toResource1"></asp:Label></td>
										<td><SmoothEnterpriseWebControl:inputtext id="Input_Edate" onpropertychange="onDateChange(this);" runat="server" 
												FormatType="DateTime" CssClass="Normal" BackColor="#F0F0F0" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="Input_EdateResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:inputtext></td>
									</tr>
								</table>
								<table id="table_allday" style="DISPLAY: none" cellSpacing="0" cellPadding="0" border="0">
									<tr Class="NormalBold" height="22">
										<td>
										    <asp:Label ID="LABEL_eventdate" runat="server" Text="日期" meta:resourcekey="LABEL_eventdateResource1"></asp:Label></td>
									</tr>
									<tr>
										<td Class="NormalBold" noWrap align="center"><SmoothEnterpriseWebControl:inputtext id="Input_eventdate" runat="server" ErrorMessage="請輸入「事件日期」!!" Required="True" 
												FormatType="Date" CssClass="Normal" BackColor="#F0F0F0" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="Input_eventdateResource1" OnClickMore="" Personalize="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:inputtext></td>
									</tr>
								</table>
								<SmoothEnterpriseWebControl:inputtext id="Input_ID" runat="server"  CssClass="Normal" BackColor="#F0F0F0"
									HiddenMode="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="Input_IDResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                </SmoothEnterpriseWebControl:inputtext><SmoothEnterpriseWebControl:inputtext id="Input_eventtype1" runat="server"  CssClass="Normal"
									BackColor="#F0F0F0" HiddenMode="True" Text="9EFF56E9-90BC-49B5-8F77-DCBC9207ADBB" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="Input_eventtype1Resource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    </SmoothEnterpriseWebControl:inputtext><SmoothEnterpriseWebControl:inputtext id="Input_viewcalid" runat="server"  CssClass="Normal"
									BackColor="#F0F0F0" HiddenMode="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="Input_viewcalidResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    </SmoothEnterpriseWebControl:inputtext></td>
						</tr>
						<tr>
							<td Class="NormalBold">
							    <asp:Label ID="LABEL_eventname" runat="server" Text="事件簡述" meta:resourcekey="LABEL_eventnameResource1"></asp:Label></td>
						</tr>
						<tr>
							<td><SmoothEnterpriseWebControl:inputtext id="Input_eventname" runat="server" ErrorMessage="請輸入「事件簡述」!!" Required="True" 
									CssClass="Normal" BackColor="#F0F0F0" MaxLength="50" Width="416px" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="Input_eventnameResource1" OnClickMore="" Personalize="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:inputtext></td>
						</tr>
						<tr>
							<td Class="NormalBold">
								<table cellSpacing="0" cellPadding="0">
									<tr>
										<td Class="NormalBold">
										    <asp:Label ID="LABEL_eventdetails" runat="server" Text="事件詳細內容" meta:resourcekey="LABEL_eventdetailsResource1"></asp:Label></td>
										<td width="5"></td>
										<td Class="Normal" id="TD_useeditor" style="CURSOR: hand; COLOR: #9999ff" onclick="chg_editormode(this);">使用進階編輯器</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<P><SmoothEnterpriseWebControl:inputtext id="Input_eventdetail" runat="server" ErrorMessage="請輸入「事件詳細內容」!!" Required="False"
										 CssClass="Normal" BackColor="#F0F0F0" HiddenMode="True" Width="416px" TextMode="MultiLine"
										Height="48px" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="Input_eventdetailResource1" OnClickMore="" Personalize="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                </SmoothEnterpriseWebControl:inputtext></P>
								<P>
                                    <SmoothEnterpriseWebControl:InputText ID="InputHTML_Details" runat="server" BackColor="#F0F0F0"
                                        CssClass="Normal" FormatType="HTML" Height="130px" Width="420px">
                                        <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    </SmoothEnterpriseWebControl:InputText>&nbsp;</P>
							</td>
						</tr>
						<tr>
							<td Class="NormalBold">
							    <asp:Label ID="LABEL_eventcategory" runat="server" Text="分類" meta:resourcekey="LABEL_eventcategoryResource1"></asp:Label></td>
						</tr>
						<tr>
							<td>
								<!--
								<P><SmoothEnterpriseWebControl:inputselect id="Input_category" runat="server" Width="280px" cssClass="Normal" 
										backcolor="#F0F0F0" Editable="True">
										<Items>
											<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="- 未指定 -" Selected="False" Value="" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
										</Items>
									<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:InputSelect></P>--><SmoothEnterpriseWebControl:inputselect id="InputSelect_Category" runat="server" backcolor="#F0F0F0"  cssClass="Normal"
									ItemNoneDisplayed="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="InputSelect_CategoryResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    </SmoothEnterpriseWebControl:InputSelect></td>
						</tr>
						<!--
						<tr>
							<td Class="NormalBold">相關網頁連結︰</td>
						</tr>
						<tr>
							<td><SmoothEnterpriseWebControl:inputtext id="Input_linkurl" runat="server" Width="416px" BackColor="#F0F0F0" CssClass="Normal"
									><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td>
						</tr>
						-->
						<tr>
							<td><SmoothEnterpriseWebControl:CHECKBOXLIST id="FIELD_private" runat="server" cssClass="Normal" Font-Bold="True" meta:resourcekey="FIELD_privateResource1" Value="" Width="300px">
									<GroupHeaderStyle Font-Bold="True" GradientEnd="192, 192, 0" ForeColor="White" GradientLevel="100"
										Gradient="Right" BorderColor="192, 192, 0" BackColor="Gray" BorderStyle="NotSet" CssClass=""></GroupHeaderStyle>
									<Items>
										<SmoothEnterpriseWebControl:CheckBoxListItem Text="私人事件設定" Selected="False" Value="Y" GroupText="" Description="" meta:resourcekey="CheckBoxListItem_privateResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
									</Items>
                                <DescriptionStyle BorderStyle="NotSet" CssClass="" />
								</SmoothEnterpriseWebControl:CHECKBOXLIST></td>
						</tr>
						<tr>
							<td>
								<table Class="Normal" cellSpacing="0" cellPadding="0">
									<tr>
										<td><SmoothEnterpriseWebControl:checkboxlist id="CheckBox_Remind" runat="server" Width="24px" cssClass="Normal" meta:resourcekey="CheckBox_RemindResource1" Value="">
												<GroupHeaderStyle Font-Bold="True" GradientEnd="192, 192, 0" ForeColor="White" GradientLevel="100"
													Gradient="Right" BorderColor="192, 192, 0" BackColor="Gray" BorderStyle="NotSet" CssClass=""></GroupHeaderStyle>
												<Items>
													<SmoothEnterpriseWebControl:CheckBoxListItem Selected="False" Text="在" Description="" Value="Y" GroupText="" meta:resourcekey="CheckBoxListItem_RemindResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
												</Items>
                                            <DescriptionStyle BorderStyle="NotSet" CssClass="" />
											</SmoothEnterpriseWebControl:checkboxlist></td>
										<td><SmoothEnterpriseWebControl:inputselect id="Input_RemindNumber" runat="server" Width="40px" backcolor="#F0F0F0" 
												cssClass="Normal" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="Input_RemindNumberResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="1">
												<Items>
													<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="1" Selected="False" Value="1" IconUrl="" GroupText="" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
													<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="2" Selected="False" Value="2" IconUrl="" GroupText="" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource2" runat="server"></SmoothEnterpriseWebControl:SelectItem>
													<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="3" Selected="False" Value="3" IconUrl="" GroupText="" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource3" runat="server"></SmoothEnterpriseWebControl:SelectItem>
													<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="4" Selected="False" Value="4" IconUrl="" GroupText="" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource4" runat="server"></SmoothEnterpriseWebControl:SelectItem>
													<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="5" Selected="False" Value="5" IconUrl="" GroupText="" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource5" runat="server"></SmoothEnterpriseWebControl:SelectItem>
													<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="6" Selected="False" Value="6" IconUrl="" GroupText="" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource6" runat="server"></SmoothEnterpriseWebControl:SelectItem>
												</Items>
											<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputSelect></td>
										<td><SmoothEnterpriseWebControl:inputselect id="Input_RemindUnit" runat="server" Width="40px" backcolor="#F0F0F0" 
												cssClass="Normal" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="Input_RemindUnitResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="D">
												<Items>
													<SmoothEnterpriseWebControl:SelectItem Gradient-GradientEnd="" Gradient-GradientBegin="" Selected="False" RowHeight="18"
														Value="D" IconUrl="" Text="日" GroupText="" ID="ItemUnit1" style="FILTER:;" meta:resourcekey="ItemUnit1Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
													<SmoothEnterpriseWebControl:SelectItem Gradient-GradientEnd="" Gradient-GradientBegin="" Selected="False" RowHeight="18"
														Value="W" IconUrl="" Text="週" GroupText="" ID="ItemUnit2" style="FILTER:;" meta:resourcekey="ItemUnit2Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
												</Items>
											<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputSelect></td>
										<td>
										    <asp:Label ID="LABEL_remindme" runat="server" Text="前提醒我" meta:resourcekey="LABEL_remindmeResource1"></asp:Label></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</span>
			</td>
			<td Class="Normal" vAlign="top" width="500" rowSpan="2"><span class="PanelBlue1" style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 5px; WIDTH: 100%; PADDING-TOP: 5px; HEIGHT: 300px">
					<table cellSpacing="0" cellPadding="0">
						<tr>
							<td Class="NormalBold">
							    <asp:Label ID="LABEL_invitelist" runat="server" Text="系統使用者邀請名單" meta:resourcekey="LABEL_invitelistResource1"></asp:Label></td>
						</tr>
					</table>
					<SmoothEnterpriseWebControl:checkboxlist id="CheckBox_Userlist" runat="server" cssClass="Normal" Column="2" meta:resourcekey="CheckBox_UserlistResource1" Value="" Width="300px">
						<GroupHeaderStyle Font-Bold="True" GradientEnd="192, 192, 0" ForeColor="White" GradientLevel="100"
							Gradient="Right" BorderColor="192, 192, 0" BackColor="Gray" BorderStyle="NotSet" CssClass=""></GroupHeaderStyle>
                        <DescriptionStyle BorderStyle="NotSet" CssClass="" />
					</SmoothEnterpriseWebControl:checkboxlist><SmoothEnterpriseWebControl:inputtext id="Input_ouserlist" runat="server"  CssClass="Normal"
						BackColor="#F0F0F0" HiddenMode="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="Input_ouserlistResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                    </SmoothEnterpriseWebControl:inputtext>
					<SmoothEnterpriseWebControl:inputtext id="Input_obookeventids" runat="server" BackColor="#F0F0F0" CssClass="Normal" 
						HiddenMode="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="Input_obookeventidsResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                    </SmoothEnterpriseWebControl:inputtext>
					<!--
					<SmoothEnterpriseWebControl:InputSelect id="InputSelect1" runat="server" cssClass="Normal"  backcolor="#F0F0F0"
						Width="300px" Height="150px" Mode="Multiple"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:InputSelect>-->
					<!--
					<dl style="BEHAVIOR: url(/lib/htc/tabsheet1.htc)" tabclass="TabLightBlue" sheetclass="TabLightBlueBody"
						width="500">
						<dt tabtitle="系統使用者">
							<dt tabtitle="電子郵件">
								<table cellpadding="2" cellspacing="1">
									<tr>
										<td>
											<INPUT type="text" class="inputtext1" size="50" id="input_mail"> <INPUT type="button" value="新增" class="inputbutton" id="addemail" style="WIDTH:70px" onclick="add_mails(AddForm.input_mail.value);">
											<INPUT type="button" value="刪除" class="inputbutton" id="deleteemail" style="WIDTH:70px"
												onclick="delete_mail();">
										</td>
									</tr>
									<tr>
										<td>
											<SELECT style="WIDTH: 400px; HEIGHT: 200px" size="12" id="invitemails" name="invitemails"
												multiple Class="Normal">
											</SELECT>
											<input name="invitemails_value" id="invitemails_value" type="hidden" runat="server">
										</td>
									</tr>
								</table>
							</dt>
					</dl>
					-->
					<table cellSpacing="0" cellPadding="0">
						<tr>
							<td><SmoothEnterpriseWebControl:checkboxlist id="CheckBox_SendMail" runat="server" Width="6px" cssClass="Normal" Font-Bold="True" meta:resourcekey="CheckBox_SendMailResource1" Value="">
									<GroupHeaderStyle Font-Bold="True" GradientEnd="192, 192, 0" ForeColor="White" GradientLevel="100"
										Gradient="Right" BorderColor="192, 192, 0" BackColor="Gray" BorderStyle="NotSet" CssClass=""></GroupHeaderStyle>
									<Items>
										<SmoothEnterpriseWebControl:CheckBoxListItem Selected="False" Text=" " Description="" Value="Y" GroupText=""></SmoothEnterpriseWebControl:CheckBoxListItem>
									</Items>
                                <DescriptionStyle BorderStyle="NotSet" CssClass="" />
								</SmoothEnterpriseWebControl:checkboxlist></td>
							<td Class="NormalBold">
							    <asp:Label ID="LABEL_sendmail" runat="server" Text="發信通知" meta:resourcekey="LABEL_sendmailResource1"></asp:Label></td>
						</tr>
					</table>
				</span>
			</td>
		</tr>
		<tr>
			<td vAlign="top"><span class="PanelBlue1" id="table_repeatevent" style="PADDING-RIGHT: 3px; PADDING-LEFT: 3px; PADDING-BOTTOM: 3px; WIDTH: 100%; PADDING-TOP: 3px; HEIGHT: 200px">
					<!----------------------- Day Event Repeat Setup Begin----------------------------->
					<table Class="Normal" cellPadding="2" width="100%" border="0">
						<tr>
							<td Class="NormalBold">
							    <asp:Label ID="LABEL_eventrepeatoption" runat="server" Text="重複型事件選項定義" meta:resourcekey="LABEL_eventrepeatoptionResource1"></asp:Label></td>
						</tr>
						<tr>
							<td Class="Normal"><asp:radiobutton id="Radio_NoRepeat" runat="server" Text="不重複" GroupName="RepeatType" Checked="True" meta:resourcekey="Radio_NoRepeatResource1"></asp:radiobutton></td>
						</tr>
						<tr>
							<td>
								<table Class="Normal" cellSpacing="0" cellPadding="0" width="450">
									<tr>
										<td><asp:radiobutton id="Radio_ByWeek" runat="server" Text="每" GroupName="RepeatType" meta:resourcekey="Radio_ByWeekResource1"></asp:radiobutton></td>
										<td><SmoothEnterpriseWebControl:inputselect id="InputWeek" runat="server" backcolor="#F0F0F0"  cssClass="Normal" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="InputWeekResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="1">
												<Items>
													<SmoothEnterpriseWebControl:SelectItem Gradient-GradientEnd="" Gradient-GradientBegin="" Selected="False" RowHeight="18"
														Value="1" IconUrl="" Text="1" GroupText="" style="FILTER:;" meta:resourcekey="SelectItemResource7" runat="server"></SmoothEnterpriseWebControl:SelectItem>
													<SmoothEnterpriseWebControl:SelectItem Gradient-GradientEnd="" Gradient-GradientBegin="" Selected="False" RowHeight="18"
														Value="2" IconUrl="" Text="2" GroupText="" style="FILTER:;" meta:resourcekey="SelectItemResource8" runat="server"></SmoothEnterpriseWebControl:SelectItem>
													<SmoothEnterpriseWebControl:SelectItem Gradient-GradientEnd="" Gradient-GradientBegin="" Selected="False" RowHeight="18"
														Value="3" IconUrl="" Text="3" GroupText="" style="FILTER:;" meta:resourcekey="SelectItemResource9" runat="server"></SmoothEnterpriseWebControl:SelectItem>
													<SmoothEnterpriseWebControl:SelectItem Gradient-GradientEnd="" Gradient-GradientBegin="" Selected="False" RowHeight="18"
														Value="4" IconUrl="" Text="4" GroupText="" style="FILTER:;" meta:resourcekey="SelectItemResource10" runat="server"></SmoothEnterpriseWebControl:SelectItem>
												</Items>
											<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputSelect></td>
										<td noWrap>
										    <asp:Label ID="LABEL_weekof" runat="server" Text="個星期的" meta:resourcekey="LABEL_weekofResource1"></asp:Label></td>
										<td><SmoothEnterpriseWebControl:CHECKBOXLIST id="CheckBox_WeekDay" runat="server" cssClass="Normal" Column="7" meta:resourcekey="CheckBox_WeekDayResource1" Value="" Width="300px">
												<GroupHeaderStyle Font-Bold="True" GradientEnd="192, 192, 0" ForeColor="White" GradientLevel="100"
													Gradient="Right" BorderColor="192, 192, 0" BackColor="Gray" BorderStyle="NotSet" CssClass=""></GroupHeaderStyle>
												<Items>
													<SmoothEnterpriseWebControl:CheckBoxListItem Selected="False" Text="日" Description="" Value="1" GroupText="" meta:resourcekey="CheckBoxListItem1_weekofResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
													<SmoothEnterpriseWebControl:CheckBoxListItem Selected="False" Text="一" Description="" Value="2" GroupText="" meta:resourcekey="CheckBoxListItem2_weekofResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
													<SmoothEnterpriseWebControl:CheckBoxListItem Selected="False" Text="二" Description="" Value="3" GroupText="" meta:resourcekey="CheckBoxListItem3_weekofResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
													<SmoothEnterpriseWebControl:CheckBoxListItem Selected="False" Text="三" Description="" Value="4" GroupText="" meta:resourcekey="CheckBoxListItem4_weekofResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
													<SmoothEnterpriseWebControl:CheckBoxListItem Selected="False" Text="四" Description="" Value="5" GroupText="" meta:resourcekey="CheckBoxListItem5_weekofResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
													<SmoothEnterpriseWebControl:CheckBoxListItem Selected="False" Text="五" Description="" Value="6" GroupText="" meta:resourcekey="CheckBoxListItem6_weekofResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
													<SmoothEnterpriseWebControl:CheckBoxListItem Selected="False" Text="六" Description="" Value="7" GroupText="" meta:resourcekey="CheckBoxListItem7_weekofResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
												</Items>
                                            <DescriptionStyle BorderStyle="NotSet" CssClass="" />
											</SmoothEnterpriseWebControl:CHECKBOXLIST></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr Class="Normal">
							<td>
								<table Class="Normal" cellSpacing="0" cellPadding="0">
									<tr>
										<td style="height: 25px"><asp:radiobutton id="Radio_ByMonthWeek" runat="server" Text="每 " GroupName="RepeatType" meta:resourcekey="Radio_ByMonthWeekResource1"></asp:radiobutton></td>
										<td style="height: 25px"><SmoothEnterpriseWebControl:inputselect id="InputMonthWeek" runat="server" backcolor="#F0F0F0"  cssClass="Normal" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="InputMonthWeekResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="1">
												<Items>
													<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="1" Selected="False" Value="1" IconUrl="" GroupText="" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource11" runat="server"></SmoothEnterpriseWebControl:SelectItem>
													<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="2" Selected="False" Value="2" IconUrl="" GroupText="" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource12" runat="server"></SmoothEnterpriseWebControl:SelectItem>
													<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="3" Selected="False" Value="3" IconUrl="" GroupText="" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource13" runat="server"></SmoothEnterpriseWebControl:SelectItem>
													<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="4" Selected="False" Value="4" IconUrl="" GroupText="" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource14" runat="server"></SmoothEnterpriseWebControl:SelectItem>
												</Items>
											<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputSelect></td>
										<td style="height: 25px">
										    <asp:Label ID="LABEL_ofmonth" runat="server" Text="月的" meta:resourcekey="LABEL_ofmonthResource1"></asp:Label></td>
										<td style="height: 25px"><SmoothEnterpriseWebControl:inputselect id="Input_WeekNumber" runat="server" backcolor="#F0F0F0"  cssClass="Normal" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="Input_WeekNumberResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="1">
												<Items>
													<SmoothEnterpriseWebControl:SelectItem Gradient-GradientEnd="" Gradient-GradientBegin="" Selected="False" RowHeight="18"
														Value="1" IconUrl="" Text="第一個" GroupText="" ID="SelectItem1" style="FILTER:;" meta:resourcekey="SelectItem1Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
													<SmoothEnterpriseWebControl:SelectItem Gradient-GradientEnd="" Gradient-GradientBegin="" Selected="False" RowHeight="18"
														Value="2" IconUrl="" Text="第二個" GroupText="" ID="SelectItem2" style="FILTER:;" meta:resourcekey="SelectItem2Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
													<SmoothEnterpriseWebControl:SelectItem Gradient-GradientEnd="" Gradient-GradientBegin="" Selected="False" RowHeight="18"
														Value="3" IconUrl="" Text="第三個" GroupText="" ID="SelectItem3" style="FILTER:;" meta:resourcekey="SelectItem3Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
													<SmoothEnterpriseWebControl:SelectItem Gradient-GradientEnd="" Gradient-GradientBegin="" Selected="False" RowHeight="18"
														Value="4" IconUrl="" Text="第四個" GroupText="" ID="SelectItem4" style="FILTER:;" meta:resourcekey="SelectItem4Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
													<SmoothEnterpriseWebControl:SelectItem Gradient-GradientEnd="" Gradient-GradientBegin="" Selected="False" RowHeight="18"
														Value="-1" IconUrl="" Text="最後一個" GroupText="" ID="SelectItem5" style="FILTER:;" meta:resourcekey="SelectItem5Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
												</Items>
											<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputSelect></td>
										<td style="height: 25px"><SmoothEnterpriseWebControl:inputselect id="Input_WeekDay" runat="server" backcolor="#F0F0F0"  cssClass="Normal" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="Input_WeekDayResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="1">
												<Items>
													<SmoothEnterpriseWebControl:SelectItem Gradient-GradientEnd="" Gradient-GradientBegin="" Selected="False" RowHeight="18"
														Value="1" IconUrl="" Text="星期日" GroupText="" ID="Select_Item0" style="FILTER:;" meta:resourcekey="Select_Item0Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
													<SmoothEnterpriseWebControl:SelectItem Gradient-GradientEnd="" Gradient-GradientBegin="" Selected="False" RowHeight="18"
														Value="2" IconUrl="" Text="星期一" GroupText="" ID="Select_Item1" style="FILTER:;" meta:resourcekey="Select_Item1Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
													<SmoothEnterpriseWebControl:SelectItem Gradient-GradientEnd="" Gradient-GradientBegin="" Selected="False" RowHeight="18"
														Value="3" IconUrl="" Text="星期二" GroupText="" ID="Select_Item2" style="FILTER:;" meta:resourcekey="Select_Item2Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
													<SmoothEnterpriseWebControl:SelectItem Gradient-GradientEnd="" Gradient-GradientBegin="" Selected="False" RowHeight="18"
														Value="4" IconUrl="" Text="星期三" GroupText="" ID="Select_Item3" style="FILTER:;" meta:resourcekey="Select_Item3Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
													<SmoothEnterpriseWebControl:SelectItem Gradient-GradientEnd="" Gradient-GradientBegin="" Selected="False" RowHeight="18"
														Value="5" IconUrl="" Text="星期四" GroupText="" ID="Select_Item4" style="FILTER:;" meta:resourcekey="Select_Item4Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
													<SmoothEnterpriseWebControl:SelectItem Gradient-GradientEnd="" Gradient-GradientBegin="" Selected="False" RowHeight="18"
														Value="6" IconUrl="" Text="星期五" GroupText="" ID="Select_Item5" style="FILTER:;" meta:resourcekey="Select_Item5Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
													<SmoothEnterpriseWebControl:SelectItem Gradient-GradientEnd="" Gradient-GradientBegin="" Selected="False" RowHeight="18"
														Value="7" IconUrl="" Text="星期六" GroupText="" ID="Select_Item6" style="FILTER:;" meta:resourcekey="Select_Item6Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
												</Items>
											<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputSelect></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td Class="Normal"><asp:radiobutton id="Radio_ByMonth" runat="server" Text="每個月重複一次" GroupName="RepeatType" meta:resourcekey="Radio_ByMonthResource1"></asp:radiobutton></td>
						</tr>
						<tr>
							<td Class="Normal"><asp:radiobutton id="Radio_ByYear" runat="server" Text="每年重複一次" GroupName="RepeatType" meta:resourcekey="Radio_ByYearResource1"></asp:radiobutton></td>
						</tr>
						<tr height="1">
							<td background="/lib/img/bg-mask.gif"></td>
						</tr>
						<tr Class="Normal">
							<td class="normalblod">
								<table cellSpacing="0" cellPadding="0">
									<tr>
										<td Class="NormalBold">
										    <asp:Label ID="LABEL_repeatdate" runat="server" Text="重複開始日期" meta:resourcekey="LABEL_repeatdateResource1"></asp:Label></td>
										<td><SmoothEnterpriseWebControl:inputtext id="FIELD_sdate" tabIndex="101" runat="server" ErrorMessage="請輸入「重複開始日期時間」!!" Required="False"
												 FormatType="Date" CssClass="Normal" BackColor="#F0F0F0" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_sdateResource1" OnClickMore="" Personalize="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:inputtext></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td Class="Normal"><asp:radiobutton id="Radio_forever" runat="server" Text="一直排程" GroupName="RepeatEdate" Checked="True" meta:resourcekey="Radio_foreverResource1"></asp:radiobutton></td>
						</tr>
						<tr>
							<td Class="Normal"><asp:radiobutton id="Radio_repeatend" runat="server" Text="到 " GroupName="RepeatEdate" meta:resourcekey="Radio_repeatendResource1"></asp:radiobutton><SmoothEnterpriseWebControl:inputtext id="FIELD_edate" tabIndex="102" runat="server" ErrorMessage="請輸入「重複結束日期時間」!!" 
									FormatType="Date" CssClass="Normal" BackColor="#F0F0F0" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_edateResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:inputtext></td>
						</tr>
						<tr>
							<td></td>
						</tr>
					</table>
				</span>
			</td>
			<!----------------------- Day Event Repeat Setup End-----------------------------></tr>
	</table>
	<!--</TABLE>-->
	<table Class="Normal" border="0">
		<tr>
			<td><SmoothEnterpriseWebControl:inputbutton id="BUTTON_save" runat="server" Gradient-GradientType="Bottom" CssClass="NormalBold"
					BackColor="#C8C8C8" Font-Bold="True" Text="儲存" BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060"
					Font-Size="12px" Font-Names="Arial" width="80px" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_saveResource1" RunAtCient="False">
                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
            </SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BUTTON_savenext" runat="server" Gradient-GradientType="Bottom" CssClass="NormalBold"
					BackColor="#C8C8C8" Font-Bold="True" Text="儲存後繼續操作" BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060"
					Font-Size="12px" Font-Names="Arial" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_savenextResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BUTTON_auth" runat="server" BackColor="#C8C8C8" Height="20px" cssClass="NormalBold"
					Font-Bold="True" Text="授權" BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" Font-Size="12px" Font-Names="Arial"
					Enabled="False" OnClick="BUTTON_auth_Click" meta:resourcekey="BUTTON_authResource1" RunAtCient="False">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControl:inputbutton>&nbsp;<SmoothEnterpriseWebControl:inputbutton id="BUTTON_delete" runat="server" BackColor="#C8C8C8" Width="100px" cssClass="NormalBold"
					Font-Bold="True" Text="刪除" BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" Font-Size="12px" Font-Names="Arial" Visible="False" OnClick="BUTTON_delete_Click" meta:resourcekey="BUTTON_deleteResource1" RunAtCient="False">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControl:inputbutton>&nbsp;&nbsp;<SmoothEnterpriseWebControl:inputbutton id="BUTTON_back" runat="server" Gradient-GradientType="Bottom" CssClass="NormalBold"
					BackColor="#C8C8C8" Font-Bold="True" Text="回上頁" BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" Font-Size="12px" Font-Names="Arial"
					width="80px" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton></td>
		</tr>
	</table>
</asp:Content>
