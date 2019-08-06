<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Portal.MyReminderDelete, App_Web_myreminderdelete.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
	<SmoothEnterpriseWebControl:PAGEJUMPER id="PageJumper1" runat="server" ShowPageNumber="True" ButtonNextLabel="&gt;" ButtonPrevLabel="&lt;" ButtonType="Button" meta:resourcekey="PageJumper1Resource1">
		<BUTTONSTYLE BackColor="200, 200, 200" BorderColor="96, 96, 96" BorderWidth="1px" BorderStyle="Solid"
			Width="20px"  PaddingSize="2px" GradientEnd="64, 64, 64" GradientBegin="224, 224, 224" CssClass=""></BUTTONSTYLE>
		<PAGESELECTEDSTYLE BackColor="WhiteSmoke" BorderColor="Black" BorderWidth="3px" BorderStyle="Solid" CssClass=""></PAGESELECTEDSTYLE>
		<PAGENUMBERSTYLE ForeColor="Black" BackColor="White" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid"
			Font-Names="Arial" Font-Size="10px" Width="10px" PaddingSize="2px" CssClass=""></PAGENUMBERSTYLE>
	</SmoothEnterpriseWebControl:PAGEJUMPER>
	<table border="0" Class="Normal">
		<tr>
			<td valign="top">
				<table border="0" Class="Normal">
					<tr Class="NormalBold">
						<td>
						    <asp:Label ID="LABEL_reminddate" runat="server" Text="開始日期" meta:resourcekey="LABEL_reminddateResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext name="FIELD_reminddate" id="FIELD_reminddate" runat="server" CssClass="PanelWhite"
								readonly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_reminddateResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr Class="NormalBold">
						<td>
						    <asp:Label ID="LABEL_reminderto" runat="server" Text="收件人" meta:resourcekey="LABEL_remindertoResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext name="FIELD_reminderto" id="FIELD_reminderto" runat="server" CssClass="PanelWhite"
								readonly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_remindertoResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr Class="NormalBold">
						<td>
						    <asp:Label ID="LABEL_subject" runat="server" Text="郵件主旨" meta:resourcekey="LABEL_subjectResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext name="FIELD_subject" id="FIELD_subject" runat="server" CssClass="PanelWhite" readonly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_subjectResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr Class="NormalBold">
						<td>
						    <asp:Label ID="LABEL_details" runat="server" Text="郵件內容" meta:resourcekey="LABEL_detailsResource1"></asp:Label></td>
					</tr>
					<tr>
						<td>
							<SmoothEnterpriseWebControl:InputHTML id="FIELD_details" runat="server" Width="300px" Height="150px"  cssClass="Normal"
								backcolor="#F0F0F0" ReadOnly="True" ErrorMessage="" Gradient="Left" imgSrc="" IsValid="True" meta:resourcekey="FIELD_detailsResource1" Mode="Advance" Value="">
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputHTML></td>
					</tr>
					<tr Class="NormalBold">
						<td>
						    <asp:Label ID="LABEL_closedate" runat="server" Text="停止日期" meta:resourcekey="LABEL_closedateResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext name="FIELD_closedate" id="FIELD_closedate" runat="server" CssClass="PanelWhite"
								readonly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_closedateResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
				</table>
			</td>
			<td style="BORDER-RIGHT: #c0c0c0 1px inset"><table>
					<tr>
						<td></td>
					</tr>
				</table>
			</td>
			<td valign="top">
				<table border="0" Class="Normal">
					<tr Class="NormalBold">
						<td>
						    <asp:Label ID="LABEL_jobtype" runat="server" Text="週期" meta:resourcekey="LABEL_jobtypeResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext name="FIELD_jobtype" id="FIELD_jobtype" runat="server" CssClass="PanelWhite" readonly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_jobtypeResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr Class="NormalBold">
						<td>
						    <asp:Label ID="LABEL_jobinterval" runat="server" Text="循環間隔" meta:resourcekey="LABEL_jobintervalResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext name="FIELD_jobinterval" id="FIELD_jobinterval" runat="server" CssClass="PanelWhite"
								readonly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_jobintervalResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr Class="NormalBold">
						<td>
						    <asp:Label ID="LABEL_jobstatus" runat="server" Text="程序狀態" meta:resourcekey="LABEL_jobstatusResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext name="FIELD_jobstatus" id="FIELD_jobstatus" runat="server" CssClass="PanelWhite"
								readonly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_jobstatusResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr Class="NormalBold">
						<td>
						    <asp:Label ID="LABEL_remark" runat="server" Text="描述" meta:resourcekey="LABEL_remarkResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext name="FIELD_remark" id="FIELD_remark" runat="server" CssClass="PanelWhite" readonly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_remarkResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<TABLE id="Table1" cellSpacing="0" cellPadding="0" border="0">
		<TR>
			<TD colSpan="1"></TD>
			<TD><SmoothEnterpriseWebControl:inputbutton id="BUTTON_delete" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom"
					width="80px" Text="刪除" Font-Bold="True" OnClick="BUTTON_delete_Click" meta:resourcekey="BUTTON_deleteResource1" RunAtCient="False">
                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
            </SmoothEnterpriseWebControl:inputbutton>&nbsp;</TD>
			<TD>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BUTTON_back" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom"
					width="80px" Text="取消" Font-Bold="True" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton>&nbsp;</TD>
		</TR>
	</TABLE>
</asp:Content>
