<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Calendar.CalendarSourceDelete, App_Web_calendarsourcedelete.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
		<CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<SmoothEnterpriseWebControl:PageJumper id="PageJumper1" runat="server" ShowPageNumber="True" ButtonNextLabel="&gt;" ButtonPrevLabel="&lt;" ButtonType="Button" meta:resourcekey="PageJumper1Resource1">
		<ButtonStyle PaddingSize="2px" Width="20px" GradientEnd="64, 64, 64" BorderWidth="1px" BorderStyle="Solid"
			BorderColor="96, 96, 96" GradientBegin="224, 224, 224" BackColor="200, 200, 200" CssClass="" ></ButtonStyle>
		<PageSelectedStyle BorderWidth="3px" BorderStyle="Solid" BorderColor="Black" BackColor="WhiteSmoke" CssClass=""></PageSelectedStyle>
		<PageNumberStyle Font-Size="10px" Font-Names="Arial" PaddingSize="2px" Width="10px" BorderWidth="1px"
			ForeColor="Black" BorderStyle="Solid" BorderColor="Gray" BackColor="White" CssClass=""></PageNumberStyle>
	</SmoothEnterpriseWebControl:PageJumper>
	<table border="0" Class="Normal">
		<tr>
			<td valign="top"><table>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_sourcename" runat="server" Text="來源名稱" meta:resourcekey="LABEL_sourcenameResource1"></asp:Label></td>
					</tr>
					<tr>
						<td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_name" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="192px" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nameResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext><SmoothEnterpriseWebControl:InputText id="FIELD_id" runat="server" CssClass="PanelWhite" ReadOnly="True" HiddenMode="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_idResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_tablename" runat="server" Text="來源資料表" meta:resourcekey="LABEL_tablenameResource1"></asp:Label></td>
					</tr>
					<tr>
						<td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_tablename" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="192px" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_tablenameResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
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
								</tr>
								<tr>
									<td><SmoothEnterpriseWebControl:inputtext id="FIELD_fieldid" tabIndex="103" runat="server" Width="125px" CssClass="Normal"
											MaxLength="50" ErrorMessage="請輸入「識別碼欄位名稱」!!" ReadOnly="True" Gradient-GradientEnd=" " Gradient-GradientBegin=" " ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_fieldidResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    </SmoothEnterpriseWebControl:inputtext></td>
									<td><SmoothEnterpriseWebControl:inputtext id="FIELD_fieldsdate" tabIndex="104" runat="server" Width="125px" CssClass="Normal"
											MaxLength="50" ErrorMessage="請輸入「開始日期欄位名稱」!!" ReadOnly="True" Gradient-GradientEnd=" " Gradient-GradientBegin=" " ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_fieldsdateResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    </SmoothEnterpriseWebControl:inputtext></td>
									<td><SmoothEnterpriseWebControl:inputtext id="FIELD_fieldedate" tabIndex="105" runat="server" Width="125px" CssClass="Normal"
											MaxLength="50" ErrorMessage="請輸入「結束日期欄位名稱」!!" ReadOnly="True" Gradient-GradientEnd=" " Gradient-GradientBegin=" " ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_fieldedateResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    </SmoothEnterpriseWebControl:inputtext></td>
									<td><SmoothEnterpriseWebControl:inputtext id="FIELD_fielddata" tabIndex="106" runat="server" Width="125px" CssClass="Normal"
											MaxLength="500" ErrorMessage="請輸入「顯示資料欄位名稱」!!" ReadOnly="True" Gradient-GradientEnd=" " Gradient-GradientBegin=" " ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_fielddataResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    </SmoothEnterpriseWebControl:inputtext></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_criteria" runat="server" Text="限制條件" meta:resourcekey="LABEL_criteriaResource1"></asp:Label></td>
					</tr>
					<tr>
						<td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_criteria" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="376px" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_criteriaResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_displaystyle" runat="server" Text="展式樣式" meta:resourcekey="LABEL_displaystyleResource1"></asp:Label></td>
					</tr>
					<tr>
						<td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_displaystyle" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="376px" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_displaystyleResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_linkurl" runat="server" Text="連結網址" meta:resourcekey="LABEL_linkurlResource1"></asp:Label></td>
					</tr>
					<tr>
						<td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_linkurl" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="376px" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_linkurlResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_iconurl" runat="server" Text="圖示來源網址" meta:resourcekey="LABEL_iconurlResource1"></asp:Label></td>
					</tr>
					<tr>
						<td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_iconurl" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="376px" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_iconurlResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_cstype" runat="server" Text="事件類型" meta:resourcekey="LABEL_cstypeResource1"></asp:Label></td>
					</tr>
					<tr>
						<td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_cstype" runat="server" CssClass="PanelWhite" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_cstypeResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_isdefault" runat="server" Text="預設" meta:resourcekey="LABEL_isdefaultResource1"></asp:Label></td>
					</tr>
					<tr>
						<td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_isdefault" runat="server" CssClass="PanelWhite" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_isdefaultResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_remark" runat="server" Text="備註說明" meta:resourcekey="LABEL_remarkResource1"></asp:Label></td>
					</tr>
					<tr>
						<td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_remark" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="376px" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_remarkResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_inituid" runat="server" Text="建立人員" meta:resourcekey="LABEL_inituidResource1"></asp:Label></td>
					</tr>
					<tr>
						<td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_inituid" runat="server" CssClass="PanelWhite" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_inituidResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_initdate" runat="server" Text="建立日期" meta:resourcekey="LABEL_initdateResource1"></asp:Label></td>
					</tr>
					<tr>
						<td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_initdate" runat="server" CssClass="PanelWhite" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_initdateResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_modifyuid" runat="server" Text="最近修改人員" meta:resourcekey="LABEL_modifyuidResource1"></asp:Label></td>
					</tr>
					<tr>
						<td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_modifyuid" runat="server" CssClass="PanelWhite" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_modifyuidResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_modifydate" runat="server" Text="最近修改日期" meta:resourcekey="LABEL_modifydateResource1"></asp:Label></td>
					</tr>
					<tr>
						<td Class="Normal"><SmoothEnterpriseWebControl:InputText id="FIELD_modifydate" runat="server" CssClass="PanelWhite" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_modifydateResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<TABLE cellSpacing="0" cellPadding="0" border="0">
		<TR>
			<TD><SmoothEnterpriseWebControl:inputbutton id="BUTTON_delete" runat="server" Gradient-GradientType="Bottom" CssClass="NormalBold"
					BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial" Font-Size="12px"
					Font-Bold="True" Text="刪除" width="80px" OnClick="BUTTON_delete_Click" meta:resourcekey="BUTTON_deleteResource1" RunAtCient="False">
                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
            </SmoothEnterpriseWebControl:inputbutton>&nbsp;</TD>
			<TD>
				&nbsp;<SmoothEnterpriseWebControl:inputbutton id="BUTTON_cancel" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" Gradient-GradientType="Bottom" CssClass="NormalBold" width="80px"
					Text="取消" Font-Bold="True" OnClick="BUTTON_cancel_Click" meta:resourcekey="BUTTON_cancelResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton>&nbsp;</TD>
		</TR>
	</TABLE>
</asp:Content>
