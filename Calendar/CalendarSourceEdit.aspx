<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Calendar.CalendarSourceEdit, App_Web_calendarsourceedit.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
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
	<table Class="Normal" border="0">
		<tr>
			<td vAlign="top">
				<table> <!--	<tr><td id="LABEL_id" runat="server" class=normalbold >Id</td></tr><tr><td></td></tr>-->
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_sourcename" runat="server" Text="來源名稱" meta:resourcekey="LABEL_sourcenameResource1"></asp:Label><SmoothEnterpriseWebControl:inputtext id="FIELD_id" tabIndex="100" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="請輸入「Id」!!"  HiddenMode="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_idResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_name" tabIndex="101" runat="server" Width="224px" BackColor="#F0F0F0"
								CssClass="Normal" MaxLength="100" ErrorMessage="請輸入「來源名稱」!!"  Required="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nameResource1" OnClickMore="" Personalize="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_tablename" runat="server" Text="來源資料表" meta:resourcekey="LABEL_tablenameResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_tablename" tabIndex="107" runat="server" Width="224px" BackColor="#F0F0F0"
								CssClass="Normal" MaxLength="50" ErrorMessage="請輸入「來源資料表」!!" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_tablenameResource1" OnClickMore="" Personalize="False" Required="False" ><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td>
							<table cellSpacing="0" cellPadding="0">
								<tr height="22">
									<td Class="NormalBold">
									    <asp:Label ID="LABEL_fieldid" runat="server" Text="識別碼欄位名稱" meta:resourcekey="LABEL_fieldidResource1"></asp:Label></td>
									<td Class="NormalBold">
									    <asp:Label ID="LABEL_fieldsdate" runat="server" Text="開始日期欄位名稱" meta:resourcekey="LABEL_fieldsdateResource1"></asp:Label></td>
									<td Class="NormalBold">
									    <asp:Label ID="LABEL_fieldedate" runat="server" Text="結束日期欄位名稱" meta:resourcekey="LABEL_fieldedateResource1"></asp:Label></td>
									<td Class="NormalBold">
									    <asp:Label ID="LABEL_fielddata" runat="server" Text="顯示資料欄位名稱" meta:resourcekey="LABEL_fielddataResource1"></asp:Label></td>
									<td Class="NormalBold">
									    <asp:Label ID="LABEL_fielddetails" runat="server" Text="詳細資料欄位名稱" meta:resourcekey="LABEL_fielddetailsResource1"></asp:Label></td>
								</tr>
								<tr>
									<td><SmoothEnterpriseWebControl:inputtext id="FIELD_fieldid" tabIndex="103" runat="server" Width="125px" BackColor="#F0F0F0"
											CssClass="Normal" MaxLength="50" ErrorMessage="請輸入「識別碼欄位名稱」!!" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_fieldidResource1" OnClickMore="" Personalize="False" Required="False" ><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    </SmoothEnterpriseWebControl:inputtext></td>
									<td><SmoothEnterpriseWebControl:inputtext id="FIELD_fieldsdate" tabIndex="104" runat="server" Width="125px" BackColor="#F0F0F0"
											CssClass="Normal" MaxLength="50" ErrorMessage="請輸入「開始日期欄位名稱」!!" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_fieldsdateResource1" OnClickMore="" Personalize="False" Required="False" ><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    </SmoothEnterpriseWebControl:inputtext></td>
									<td><SmoothEnterpriseWebControl:inputtext id="FIELD_fieldedate" tabIndex="105" runat="server" Width="125px" BackColor="#F0F0F0"
											CssClass="Normal" MaxLength="50" ErrorMessage="請輸入「結束日期欄位名稱」!!" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_fieldedateResource1" OnClickMore="" Personalize="False" Required="False" ><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    </SmoothEnterpriseWebControl:inputtext></td>
									<td><SmoothEnterpriseWebControl:inputtext id="FIELD_fielddata" tabIndex="106" runat="server" Width="125px" BackColor="#F0F0F0"
											CssClass="Normal" MaxLength="500" ErrorMessage="請輸入「顯示資料欄位名稱」!!" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_fielddataResource1" OnClickMore="" Personalize="False" Required="False" ><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    </SmoothEnterpriseWebControl:inputtext></td>
									<td><SmoothEnterpriseWebControl:inputtext id="FIELD_fielddetails" tabIndex="107" runat="server" Width="140px" BackColor="#F0F0F0"
											CssClass="Normal" MaxLength="500" ErrorMessage="請輸入「詳細資料欄位名稱」!!" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_fielddetailsResource1" OnClickMore="" Personalize="False" Required="False" ><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    </SmoothEnterpriseWebControl:inputtext></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_criteria" runat="server" Text='限制條件<FONT Class="Normal"> (:SID is reserved for filtering keyword)</FONT>' meta:resourcekey="LABEL_criteriaResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_criteria" tabIndex="108" runat="server" Width="512px" BackColor="#F0F0F0"
								CssClass="Normal" MaxLength="300" ErrorMessage="請輸入「限制條件」!!" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_criteriaResource1" OnClickMore="" Personalize="False" Required="False" ><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_displaystyle" runat="server" Text="展現樣式" meta:resourcekey="LABEL_displaystyleResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputselect id="FIELD_displaystyle" runat="server"  ItemNoneDisplayed="True" ItemAll-Value="%"
								backcolor="#F0F0F0" cssClass="Normal" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_displaystyleResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:InputSelect></td>
					</tr>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_linkurl" runat="server" Text="連結網址 (:ID is keyword)" meta:resourcekey="LABEL_linkurlResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_linkurl" tabIndex="110" runat="server" Width="392px" BackColor="#F0F0F0"
								CssClass="Normal" MaxLength="200" ErrorMessage="請輸入「連結網址」!!" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_linkurlResource1" OnClickMore="" Personalize="False" Required="False" ><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<!--		<tr>
						<td Class="NormalBold" id="LABEL_iconurl" runat="server">圖示來源網址</td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_iconurl" tabIndex="111" runat="server" Width="296px" BackColor="#F0F0F0"
								CssClass="Normal" MaxLength="200" ErrorMessage="請輸入「圖示來源網址」!!" ><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td>
					</tr>-->
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_cstype" runat="server" Text="事件類型" meta:resourcekey="LABEL_cstypeResource1"></asp:Label></td>
					</tr>
					<tr>
						<td style="HEIGHT: 26px"><SmoothEnterpriseWebControlEnterprise:SelectCode id="FIELD_cstype" runat="server" ItemNoneDisplayed="True" backcolor="White" cssClass="Normal"
								CodeType="cstype" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_cstypeResource1" Mode="Single" TextBoxStyle="ThreeDStyle" TextField="" Value="" ValueField=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControlEnterprise:SelectCode></td>
					</tr>
					<tr>
						<td style="HEIGHT: 17px"><SmoothEnterpriseWebControl:CHECKBOXLIST id="FIELD_isdefault" runat="server" Font-Bold="True" cssClass="Normal" meta:resourcekey="FIELD_isdefaultResource1" Value="Y" Width="300px">
								<GroupHeaderStyle Font-Bold="True" GradientEnd="192, 192, 0" ForeColor="White" GradientLevel="100"
									Gradient="Right" BorderColor="192, 192, 0" BackColor="Gray" BorderStyle="NotSet" CssClass=""></GroupHeaderStyle>
								<Items>
									<SmoothEnterpriseWebControl:CheckBoxListItem Selected="True" Text="預設" Description="" Value="Y" GroupText="" meta:resourcekey="CheckBoxListItem_isdefaultResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
								</Items>
                            <DescriptionStyle BorderStyle="NotSet" CssClass="" />
							</SmoothEnterpriseWebControl:CHECKBOXLIST><GROUPHEADERSTYLE ForeColor="White" BorderColor="192, 192, 0" BackColor="Gray" Gradient="Right" Font-Bold="True"
								GradientLevel="100" GradientEnd="192, 192, 0"></GROUPHEADERSTYLE><ITEMS>
								<SmoothEnterpriseWebControl:CHECKBOXLISTITEM Text="預設" GroupText="" Value="Y" Description="" Selected="True"></SmoothEnterpriseWebControl:CHECKBOXLISTITEM>
							</ITEMS></td>
					</tr>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_remark" runat="server" Text="備註說明" meta:resourcekey="LABEL_remarkResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_remark" tabIndex="102" runat="server" Width="304px" BackColor="#F0F0F0"
								Height="72px" CssClass="Normal" MaxLength="1073741823" ErrorMessage="請輸入「備註說明」!!" 
								TextMode="MultiLine" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_remarkResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<!--			<tr>
						<td id="LABEL_inituid" runat="server" Class="NormalBold">建立人員</td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:InputText id="FIELD_inituid" runat="server"  BackColor="#F0F0F0"
								CssClass="Normal" ErrorMessage="請輸入「建立人員」!!" tabIndex="114" MaxLength="0"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td id="LABEL_initdate" runat="server" Class="NormalBold">建立日期</td>
					</tr>
						<tr>
						<td><SmoothEnterpriseWebControl:InputText id="FIELD_initdate" runat="server"  FormatType="Date"
								BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="請輸入「建立日期」!!" tabIndex="115"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td id="LABEL_modifyuid" runat="server" Class="NormalBold">最近修改人員</td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:InputText id="FIELD_modifyuid" runat="server"  BackColor="#F0F0F0"
								CssClass="Normal" ErrorMessage="請輸入「最近修改人員」!!" tabIndex="116" MaxLength="0"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td id="LABEL_modifydate" runat="server" Class="NormalBold">最近修改日期</td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:InputText id="FIELD_modifydate" runat="server"  FormatType="Date"
								BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="請輸入「最近修改日期」!!" tabIndex="117"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					--></table>
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
				<SmoothEnterpriseWebControl:inputbutton id="BUTTON_back" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom"
					Font-Bold="True" Text="回上頁" width="80px" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BUTTON_delete" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom"
					Font-Bold="True" Text="刪除" width="80px" OnClick="BUTTON_delete_Click" meta:resourcekey="BUTTON_deleteResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton></td>
		</tr>
	</table>
</asp:Content>
