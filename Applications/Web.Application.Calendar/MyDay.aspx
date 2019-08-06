<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Calendar.MyDay, App_Web_myday.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" %>

<%@ Register Src="uc/CalendarNavigator.ascx" TagName="CalendarNavigator" TagPrefix="uc1" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Calendar, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Calendar.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<!--style>.DayTable { BORDER-RIGHT: lightsteelblue 1px solid; BORDER-TOP: lightsteelblue 1px solid; FONT-WEIGHT: normal; FONT-SIZE: 12px; BORDER-LEFT: lightsteelblue 1px solid; BORDER-BOTTOM: lightsteelblue 1px solid; FONT-FAMILY: Sans-Serif, Verdana, Arial, Tahoma; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #fafafa }
	.content { BORDER-RIGHT: lightsteelblue 1px solid; BORDER-TOP: lightsteelblue 1px solid; BORDER-LEFT: lightsteelblue 1px solid; BORDER-BOTTOM: lightsteelblue 1px solid; BORDER-COLLAPSE: collapse }
	</style-->
	<uc1:CalendarNavigator ID="CalendarNavigator1" runat="server" />
	<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="100%" border="0">
		<TR>
			<TD noWrap width="1%" valign="top">
                
				<SmoothEnterpriseWebControlEnterprise:Month id="Month1" runat="server" backcolor="#eeeeee" Width="190px" Font-Names="Tahoma"
					BorderWidth="1px" BorderStyle="Solid" BorderColor="Gray" DayAlign="Right" MonthFormat="Long"
					DayHeaderHeight="20px" TitleHeight="22px" DayHeight="20px" DayWidth="24px" CellSpacing="0" OnOnDayEventAdd="Month1_OnDayEventAdd" OnOnDayEventEdit="Month1_OnDayEventEdit">
					<SunDayStyle ForeColor="Maroon" BackColor="255, 192, 192"></SunDayStyle>
					<SunHeaderStyle GradientEnd="192, 0, 0"  GradientBegin="255, 192, 192"></SunHeaderStyle>
					<DayStyle GradientLevel="150" Gradient="Right" GradientBegin="224, 224, 224" BackColor="White"></DayStyle>
					<SatDayStyle ForeColor="Green" BackColor="PaleGreen"></SatDayStyle>
					<SelectedDayStyle BorderStyle="Solid" GradientEnd="0, 0, 192" BorderWidth="1px" GradientLevel="100"
						Gradient="Left" BorderColor="Navy" GradientBegin="192, 192, 255"></SelectedDayStyle>
					<TodayStyle Font-Size="12px" Font-Bold="True" BorderStyle="Solid" GradientEnd="DarkBlue" BorderWidth="1px"
						ForeColor="White" Gradient="Left" BorderColor="Black" GradientBegin="192, 192, 255" BackColor="SlateBlue"></TodayStyle>
					<EventStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="DarkBlue"></EventStyle>
					<SatHeaderStyle GradientEnd="SeaGreen"  GradientBegin="192, 255, 192"></SatHeaderStyle>
					<DayHeaderStyle ForeColor="Navy" GradientLevel="150" Gradient="Bottom" GradientBegin="192, 192, 255"
						BackColor="192, 192, 255"></DayHeaderStyle>
					<TitleStyle Font-Size="11px" Font-Names="Tahoma" Font-Bold="True" GradientEnd="Gainsboro" BorderWidth="1px"
						ForeColor="White" GradientLevel="150"  BorderColor="Black" GradientBegin="DarkSlateBlue"
						BackColor="LightSteelBlue"></TitleStyle>
				</SmoothEnterpriseWebControlEnterprise:Month>
			</TD>
			<TD width="99%"><SmoothEnterpriseWebControlEnterprise:Day id="Day1" runat="server" backcolor="DimGray" Width="100%" CellSpacing="1" CaptionHeight="30px"
					HourWidth="120px" HourHeight="35px" BackGroundImage="/lib/img/bg-linelightgray.gif" Caption="本 日 記 事"
					ShowCaption="False" OnOnDayEventAdd="Day1_OnDayEventAdd" OnOnDayEventEdit="Day1_OnDayEventEdit">
					<TimeStyle Font-Size="9px" Font-Names="Arial" Font-Bold="True" BorderStyle="Solid" BorderWidth="1px"
						ForeColor="WhiteSmoke" BorderColor="ControlText" BackColor="ControlDarkDark"></TimeStyle>
					<DayStyle GradientLevel="120"  PaddingSize="0px" GradientBegin="192, 192, 255"
						BackColor="Transparent"></DayStyle>
					<CaptionStyle Font-Size="14pt" Font-Names="Tahoma" Font-Bold="True" BorderStyle="Solid" BorderWidth="1px"
						GradientLevel="80"  BorderColor="ForestGreen" GradientBegin="ForestGreen" BackColor="GreenYellow"></CaptionStyle>
					<HourStyle Font-Size="12px" Font-Names="Tahoma" Font-Bold="True" BorderStyle="Solid" GradientEnd="Lavender"
						BorderWidth="1px" ForeColor="MidnightBlue" GradientLevel="150"  BorderColor="128, 128, 255"
						GradientBegin="RoyalBlue" BackColor="WhiteSmoke"></HourStyle>
					<EventStyle BorderStyle="Solid" BorderWidth="1px" GradientLevel="100" BorderColor="LightSteelBlue"
						PaddingSize="1px" GradientBegin="Gold" BackColor="White"></EventStyle>
				</SmoothEnterpriseWebControlEnterprise:Day></TD>
		</TR>
	</TABLE>
</asp:Content>
