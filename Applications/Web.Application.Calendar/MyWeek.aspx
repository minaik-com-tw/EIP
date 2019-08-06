<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Calendar.MyWeek, App_Web_myweek.aspx.cdcab7d2" theme="Default" %>

<%@ Register Src="uc/CalendarNavigator.ascx" TagName="CalendarNavigator" TagPrefix="uc1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Calendar, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Calendar.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<uc1:CalendarNavigator ID="CalendarNavigator1" runat="server" />
	<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="100%" border="0">
		<TR>
			<TD vAlign="top" noWrap width="1%">
			<SmoothEnterpriseWebControlEnterprise:month id="Month1" runat="server" Font-Names="Tahoma" BorderWidth="1px" BorderStyle="Solid"
					BorderColor="Gray" DayAlign="Right" MonthFormat="Long" DayHeaderHeight="20px" TitleHeight="22px" DayHeight="20px" DayWidth="24px"
					backcolor="#eeeeee" Width="190px" CellSpacing="0" OnOnDayEventAdd="Month1_OnDayEventAdd" OnOnDayEventEdit="Month1_OnDayEventEdit">
					<SunDayStyle ForeColor="Maroon" BackColor="255, 192, 192"></SunDayStyle>
					<SatHeaderStyle GradientEnd="SeaGreen"  GradientBegin="192, 255, 192"></SatHeaderStyle>
					<SelectedDayStyle Font-Bold="True" BorderStyle="Solid" GradientEnd="0, 0, 192" BorderWidth="1px" ForeColor="White"
						GradientLevel="100" Gradient="Left" BorderColor="Navy" GradientBegin="192, 192, 255"></SelectedDayStyle>
					<EventStyle BorderStyle="Solid" BorderWidth="1px" ForeColor="White" BorderColor="DarkBlue"></EventStyle>
					<TodayStyle Font-Size="12px" Font-Bold="True" BorderStyle="Solid" GradientEnd="DarkBlue" BorderWidth="1px"
						ForeColor="White" Gradient="Left" BorderColor="Black" GradientBegin="192, 192, 255" BackColor="SlateBlue"></TodayStyle>
					<TitleStyle Font-Size="11px" Font-Names="Tahoma" Font-Bold="True" GradientEnd="Gainsboro" BorderWidth="1px"
						ForeColor="White" GradientLevel="150"  BorderColor="Black" GradientBegin="DarkSlateBlue"
						BackColor="LightSteelBlue"></TitleStyle>
					<DayHeaderStyle ForeColor="Navy" GradientLevel="150" Gradient="Bottom" GradientBegin="192, 192, 255"
						BackColor="192, 192, 255"></DayHeaderStyle>
					<DayStyle GradientLevel="150" Gradient="Right" GradientBegin="224, 224, 224" BackColor="White"></DayStyle>
					<SunHeaderStyle GradientEnd="192, 0, 0"  GradientBegin="255, 192, 192"></SunHeaderStyle>
					<SatDayStyle ForeColor="Green" BackColor="PaleGreen"></SatDayStyle>
				</SmoothEnterpriseWebControlEnterprise:month>
                
            </TD>
			<TD vAlign="top" width="99%">
			<span id="span1" runat="server" name="span1">
			
			<SmoothEnterpriseWebControlEnterprise:week id="Week1" runat="server" backcolor="#eeeeee" Width="100%" CellSpacing="1" CellPadding="1"
						Height="400px" SaturDayHeight="70px" SunDayHeight="70px" WeekDayHeight="55px" WeekDayWidth="140px" BackGroundImage="/lib/img/bg-linelightgray.gif" ShowCaption="False"
						ForeColor="Black" OnOnDailyView="Week1_OnDailyView" OnOnDayEventAdd="Week1_OnDayEventAdd" OnOnDayEventEdit="Week1_OnDayEventEdit">
						<WeekSunDayStyle Font-Size="14px" Font-Names="Tahoma" Font-Bold="True" BorderStyle="Solid" GradientEnd="MistyRose"
							BorderWidth="1px" ForeColor="OrangeRed" GradientLevel="155"  BorderColor="255, 128, 128"
							GradientBegin="255, 160, 160" BackColor="MistyRose"></WeekSunDayStyle>
						<WeekDayStyle Font-Size="14px" Font-Names="Tahoma" Font-Bold="True" BorderStyle="Solid" GradientEnd="Lavender"
							BorderWidth="1px" ForeColor="MidnightBlue" GradientLevel="150"  BorderColor="128, 128, 255"
							GradientBegin="RoyalBlue" BackColor="WhiteSmoke"></WeekDayStyle>
						<DayStyle GradientLevel="120"  PaddingSize="1px" GradientBegin="192, 192, 255"></DayStyle>
						<EventStyle BorderStyle="Solid" BorderWidth="1px" GradientLevel="100" BorderColor="LightSteelBlue"
							GradientBegin="Gold" BackColor="White"></EventStyle>
						<TimeStyle Font-Size="9px" Font-Names="Arial" Font-Bold="True" BorderStyle="Solid" BorderWidth="1px"
							ForeColor="WhiteSmoke" BorderColor="ControlText" BackColor="ControlDarkDark"></TimeStyle>
						<WeekSaturDayStyle Font-Size="14px" Font-Names="Tahoma" Font-Bold="True" BorderStyle="Solid" GradientEnd="Honeydew"
							BorderWidth="1px" ForeColor="Green" GradientLevel="200"  BorderColor="Green" GradientBegin="LightGreen"
							BackColor="PaleGreen"></WeekSaturDayStyle>
					</SmoothEnterpriseWebControlEnterprise:week>
					
					</span></TD>
		</TR>
	</TABLE>
</asp:Content>
