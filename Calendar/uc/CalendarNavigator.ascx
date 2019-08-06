<%@ control language="C#" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Calendar.uc.CalendarNavigator, App_Web_calendarnavigator.ascx.50d77b3" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>

<SmoothEnterpriseWebControlEnterprise:DESCRIPTOR id="Descriptor1" runat="server" cssClass="Normal" Height="40px" width="100%" Gradient="None"
	PaddingSpace="5px" Caption="My Calendar" Details="Personalized calendar management support">
	<Template>
		<TABLE cellSpacing="5" cellPadding="0" border="0">
			<TR vAlign="middle">
				<TD>
					<SmoothEnterpriseWebControl:InputSelect id="FIELD_calendar" runat="server"  cssClass="Normal" backcolor="#F0F0F0" OnSelectedIndexChanged="FIELD_calendar_SelectedIndexChanged">
						<Items>
							<SmoothEnterpriseWebControl:SelectItem  Selected="False" RowHeight="18"
								IconUrl="" Text="- Select Calendar -" GroupText="" runat="server" Value=""></SmoothEnterpriseWebControl:SelectItem>
						</Items>
                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
					<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:InputSelect></TD>
				<TD>
					<asp:HyperLink id="cal_year" title="Yearly View" runat="server" NavigateUrl="/Calendar/MyYear.aspx"
						ImageUrl="/calendar/img/icon-caly.gif" Visible="False"></asp:HyperLink><!--<a href="MyYear.aspx"><IMG src="img/icon-caly.gif" border="0" align="absmiddle" alt="Yearly View"></a>--></TD>
				<TD>
					<asp:HyperLink id="cal_month" title="Monthly View" runat="server" NavigateUrl="/Calendar/MyMonth.aspx"
						ImageUrl="/calendar/img/icon-calm.gif"></asp:HyperLink></TD>
				<TD>
					<asp:HyperLink id="cal_week" title="Weekly View" runat="server" NavigateUrl="/Calendar/MyWeek.aspx"
						ImageUrl="/calendar/img/icon-calw.gif"></asp:HyperLink></TD>
				<TD>
					<asp:HyperLink id="cal_day" title="Daily View" runat="server" NavigateUrl="/Calendar/MyDay.aspx"
						ImageUrl="/calendar/img/icon-cald.gif"></asp:HyperLink></TD>
				<TD>
					<asp:HyperLink id="cal_time" title="Daily Event" runat="server" NavigateUrl="/Calendar/MyTime.aspx"
						ImageUrl="/calendar/img/icon-calt.gif"></asp:HyperLink></TD>
				<TD>
					<asp:HyperLink id="cal_search" title="My Event Search" runat="server" NavigateUrl="/Calendar/MySearch.aspx"
						ImageUrl="/calendar/img/icon-calsearch.gif"></asp:HyperLink></TD>
				<TD noWrap width="1" background="/lib/img/bg-mask.gif"></TD>
				<TD>
					<SmoothEnterpriseWebControl:InputText id="InputDate" BackColor="#F0F0F0" Width="100px" runat="server" FormatType="Date"
						CssClass="Normal" ><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></TD>
				<TD><INPUT id="inpput_go" type="image" src="/lib/img/icon-go.gif" name="inpput_go" runat="server"></TD>
				<TD noWrap width="1" background="/lib/img/bg-mask.gif"></TD>
				<TD>
					<asp:HyperLink id="cal_customize" title="My Customize" runat="server" NavigateUrl="/Calendar/MyCustomize.aspx"
						ImageUrl="/calendar/img/icon-calconfig.gif"></asp:HyperLink></TD>
				<TD>
					<asp:HyperLink id="cal_defineview" title="Define Calendar View" runat="server" NavigateUrl="/Calendar/MyDefineView.aspx"
						ImageUrl="/calendar/img/icon-calview.gif"></asp:HyperLink></TD>
			</TR>
		</TABLE>
	</Template>
	<CaptionStyle Font-Size="16px" Font-Bold="True" BorderStyle="NotSet"></CaptionStyle>
	<DetailsStyle Font-Size="11px" Font-Names="Arial" BorderStyle="NotSet"></DetailsStyle>
</SmoothEnterpriseWebControlEnterprise:DESCRIPTOR>
<asp:Literal id="Literal1" runat="server"></asp:Literal>
