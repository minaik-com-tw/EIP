<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Calendar.MyYear, App_Web_myyear.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Calendar, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Calendar.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Src="uc/CalendarNavigator.ascx" TagName="CalendarNavigator" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<uc1:CalendarNavigator ID="CalendarNavigator1" runat="server" />
	<table Class="Normal" cellSpacing="1" cellPadding="1" width="100%" border="0">
		<tr height="25">
			<td valign="middle" width="60" Class="NormalBold">
			    <asp:Label ID="LABEL_viewtype" runat="server" Text="檢視方式" meta:resourcekey="LABEL_viewtypeResource1"></asp:Label></td>
			<td>
				<SmoothEnterpriseWebControl:CheckBoxList id="CheckBoxList1" runat="server" cssClass="Normal" Width="128px" Column="2" CheckMode="SingleRadio" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged" meta:resourcekey="CheckBoxList1Resource1" Value="halfyear">
					<GroupHeaderStyle Font-Bold="True" GradientEnd="192, 192, 0" ForeColor="White" GradientLevel="100"
						Gradient="Right" BorderColor="192, 192, 0" BackColor="Gray" BorderStyle="NotSet" CssClass=""></GroupHeaderStyle>
					<Items>
						<SmoothEnterpriseWebControl:CheckBoxListItem Selected="True" Text="半年" Description="" Value="halfyear" GroupText="" meta:resourcekey="CheckBoxListItem1_viewtypeResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
						<SmoothEnterpriseWebControl:CheckBoxListItem Selected="False" Text="季" Description="" Value="season" GroupText="" meta:resourcekey="CheckBoxListItem2_viewtypeResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
					</Items>
                    <DescriptionStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControl:CheckBoxList>
			</td>
		</tr>
	</table>

	<table Class="Normal" cellSpacing="1" cellPadding="1" width="100%" border="0" id="month_table"
		runat="server">
		<tr vAlign="top">
			<td><SmoothEnterpriseWebControlEnterprise:Month id="Month1" runat="server" Font-Names="Tahoma" DayAlign="Right" Width="100%" Height="145px"
					CellSpacing="0" backcolor="#EEEEEE" MonthFormat="Long" TitleFormat="Month" YearMonth="1"
					BorderStyle="Solid" BorderWidth="1px" BorderColor="Gray" DayWidth="16%" DayHeight="18px"
					TitleHeight="22px" DayHeaderHeight="20px" SatDayWidth="10%" SunDayWidth="10%" OnOnDayClick="Month1_OnTitleClick" OnOnDayEventAdd="Month1_OnDayEventAdd" OnOnDayEventEdit="Month1_OnDayEventEdit" Align="Left" CalendarID="00000000-0000-0000-0000-000000000000" CellPadding="2" DayFormat="Day" DayHeaderAlign="Center" DayHeaderFormat="Short" DisplayType="DateOnly" EventAddable="True" EventEditable="True" EventHeight="100px" meta:resourcekey="Month1Resource1" SelectedDate="" ShowDayHeader="True" ViewCalendarID="00000000-0000-0000-0000-000000000000" ViewEventDetail="False" Year="2006">
					<SunDayStyle ForeColor="Maroon" BackColor="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunDayStyle>
					<SunHeaderStyle GradientEnd="192, 0, 0"  GradientBegin="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunHeaderStyle>
					<DayStyle ForeColor="Black" GradientLevel="150" Gradient="Right" GradientBegin="224, 224, 224"
						BackColor="White" BorderStyle="NotSet" CssClass=""></DayStyle>
					<SatDayStyle ForeColor="Green" BackColor="PaleGreen" BorderStyle="NotSet" CssClass=""></SatDayStyle>
					<SelectedDayStyle BorderStyle="Solid" GradientEnd="0, 0, 192" BorderWidth="1px" GradientLevel="100"
						Gradient="Left" BorderColor="Navy" GradientBegin="192, 192, 255" CssClass=""></SelectedDayStyle>
					<TodayStyle Font-Size="12px" Font-Bold="True" BorderStyle="Solid" GradientEnd="DarkBlue" BorderWidth="1px"
						ForeColor="White" Gradient="Left" BorderColor="Black" GradientBegin="192, 192, 255" BackColor="SlateBlue" CssClass=""></TodayStyle>
					<EventStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="DarkBlue" CssClass=""></EventStyle>
					<SatHeaderStyle GradientEnd="SeaGreen"  GradientBegin="192, 255, 192" BorderStyle="NotSet" CssClass=""></SatHeaderStyle>
					<DayHeaderStyle ForeColor="Navy" GradientLevel="150" Gradient="Bottom" GradientBegin="192, 192, 255"
						BackColor="192, 192, 255" BorderStyle="NotSet" CssClass=""></DayHeaderStyle>
					<TitleStyle Font-Size="11px" Font-Names="Tahoma" Font-Bold="True" GradientEnd="Gainsboro" BorderWidth="1px"
						ForeColor="White" GradientLevel="150"  BorderColor="Black" GradientBegin="DarkSlateBlue"
						BackColor="LightSteelBlue" BorderStyle="NotSet" CssClass=""></TitleStyle>
                <EventTextStyle BorderStyle="NotSet" CssClass="" />
                <TimeStyle BorderStyle="NotSet" CssClass="" />
                <DayEventStyle BorderStyle="NotSet" CssClass="" />
                <SatEventStyle BorderStyle="NotSet" CssClass="" />
                <SunEventStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControlEnterprise:Month></td>
			<td><SmoothEnterpriseWebControlEnterprise:Month id="Month2" runat="server" Font-Names="Tahoma" DayAlign="Right" Width="100%" Height="145px"
					CellSpacing="0" backcolor="#EEEEEE" MonthFormat="Long" TitleFormat="Month" YearMonth="2"
					BorderStyle="Solid" BorderWidth="1px" BorderColor="Gray" DayWidth="16%" DayHeight="18px"
					TitleHeight="22px" DayHeaderHeight="20px" SatDayWidth="10%" SunDayWidth="10%" OnOnDayClick="Month1_OnTitleClick" OnOnDayEventAdd="Month1_OnDayEventAdd" OnOnDayEventEdit="Month1_OnDayEventEdit" Align="Left" CalendarID="00000000-0000-0000-0000-000000000000" CellPadding="2" DayFormat="Day" DayHeaderAlign="Center" DayHeaderFormat="Short" DisplayType="DateOnly" EventAddable="True" EventEditable="True" EventHeight="100px" meta:resourcekey="Month2Resource1" SelectedDate="" ShowDayHeader="True" ViewCalendarID="00000000-0000-0000-0000-000000000000" ViewEventDetail="False" Year="2006">
					<SunDayStyle ForeColor="Maroon" BackColor="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunDayStyle>
					<SunHeaderStyle GradientEnd="192, 0, 0"  GradientBegin="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunHeaderStyle>
					<DayStyle ForeColor="Black" GradientLevel="150" Gradient="Right" GradientBegin="224, 224, 224"
						BackColor="White" BorderStyle="NotSet" CssClass=""></DayStyle>
					<SatDayStyle ForeColor="Green" BackColor="PaleGreen" BorderStyle="NotSet" CssClass=""></SatDayStyle>
					<SelectedDayStyle BorderStyle="Solid" GradientEnd="0, 0, 192" BorderWidth="1px" GradientLevel="100"
						Gradient="Left" BorderColor="Navy" GradientBegin="192, 192, 255" CssClass=""></SelectedDayStyle>
					<TodayStyle Font-Size="12px" Font-Bold="True" BorderStyle="Solid" GradientEnd="DarkBlue" BorderWidth="1px"
						ForeColor="White" Gradient="Left" BorderColor="Black" GradientBegin="192, 192, 255" BackColor="SlateBlue" CssClass=""></TodayStyle>
					<EventStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="DarkBlue" CssClass=""></EventStyle>
					<SatHeaderStyle GradientEnd="SeaGreen"  GradientBegin="192, 255, 192" BorderStyle="NotSet" CssClass=""></SatHeaderStyle>
					<DayHeaderStyle ForeColor="Navy" GradientLevel="150" Gradient="Bottom" GradientBegin="192, 192, 255"
						BackColor="192, 192, 255" BorderStyle="NotSet" CssClass=""></DayHeaderStyle>
					<TitleStyle Font-Size="11px" Font-Names="Tahoma" Font-Bold="True" GradientEnd="Gainsboro" BorderWidth="1px"
						ForeColor="White" GradientLevel="150"  BorderColor="Black" GradientBegin="DarkSlateBlue"
						BackColor="LightSteelBlue" BorderStyle="NotSet" CssClass=""></TitleStyle>
                <EventTextStyle BorderStyle="NotSet" CssClass="" />
                <TimeStyle BorderStyle="NotSet" CssClass="" />
                <DayEventStyle BorderStyle="NotSet" CssClass="" />
                <SatEventStyle BorderStyle="NotSet" CssClass="" />
                <SunEventStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControlEnterprise:Month></td>
			<td><SmoothEnterpriseWebControlEnterprise:Month id="Month3" runat="server" Font-Names="Tahoma" DayAlign="Right" Width="100%" Height="145px"
					CellSpacing="0" backcolor="#EEEEEE" MonthFormat="Long" TitleFormat="Month" YearMonth="3"
					BorderStyle="Solid" BorderWidth="1px" BorderColor="Gray" DayWidth="16%" DayHeight="18px"
					TitleHeight="22px" DayHeaderHeight="20px" SatDayWidth="10%" SunDayWidth="10%" OnOnDayClick="Month1_OnTitleClick" OnOnDayEventAdd="Month1_OnDayEventAdd" OnOnDayEventEdit="Month1_OnDayEventEdit" Align="Left" CalendarID="00000000-0000-0000-0000-000000000000" CellPadding="2" DayFormat="Day" DayHeaderAlign="Center" DayHeaderFormat="Short" DisplayType="DateOnly" EventAddable="True" EventEditable="True" EventHeight="100px" meta:resourcekey="Month3Resource1" SelectedDate="" ShowDayHeader="True" ViewCalendarID="00000000-0000-0000-0000-000000000000" ViewEventDetail="False" Year="2006">
					<SunDayStyle ForeColor="Maroon" BackColor="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunDayStyle>
					<SunHeaderStyle GradientEnd="192, 0, 0"  GradientBegin="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunHeaderStyle>
					<DayStyle ForeColor="Black" GradientLevel="150" Gradient="Right" GradientBegin="224, 224, 224"
						BackColor="White" BorderStyle="NotSet" CssClass=""></DayStyle>
					<SatDayStyle ForeColor="Green" BackColor="PaleGreen" BorderStyle="NotSet" CssClass=""></SatDayStyle>
					<SelectedDayStyle BorderStyle="Solid" GradientEnd="0, 0, 192" BorderWidth="1px" GradientLevel="100"
						Gradient="Left" BorderColor="Navy" GradientBegin="192, 192, 255" CssClass=""></SelectedDayStyle>
					<TodayStyle Font-Size="12px" Font-Bold="True" BorderStyle="Solid" GradientEnd="DarkBlue" BorderWidth="1px"
						ForeColor="White" Gradient="Left" BorderColor="Black" GradientBegin="192, 192, 255" BackColor="SlateBlue" CssClass=""></TodayStyle>
					<EventStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="DarkBlue" CssClass=""></EventStyle>
					<SatHeaderStyle GradientEnd="SeaGreen"  GradientBegin="192, 255, 192" BorderStyle="NotSet" CssClass=""></SatHeaderStyle>
					<DayHeaderStyle ForeColor="Navy" GradientLevel="150" Gradient="Bottom" GradientBegin="192, 192, 255"
						BackColor="192, 192, 255" BorderStyle="NotSet" CssClass=""></DayHeaderStyle>
					<TitleStyle Font-Size="11px" Font-Names="Tahoma" Font-Bold="True" GradientEnd="Gainsboro" BorderWidth="1px"
						ForeColor="White" GradientLevel="150"  BorderColor="Black" GradientBegin="DarkSlateBlue"
						BackColor="LightSteelBlue" BorderStyle="NotSet" CssClass=""></TitleStyle>
                <EventTextStyle BorderStyle="NotSet" CssClass="" />
                <TimeStyle BorderStyle="NotSet" CssClass="" />
                <DayEventStyle BorderStyle="NotSet" CssClass="" />
                <SatEventStyle BorderStyle="NotSet" CssClass="" />
                <SunEventStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControlEnterprise:Month></td>
			<td><SmoothEnterpriseWebControlEnterprise:Month id="Month4" runat="server" Font-Names="Tahoma" DayAlign="Right" Width="100%" Height="145px"
					CellSpacing="0" backcolor="#EEEEEE" MonthFormat="Long" TitleFormat="Month" YearMonth="4"
					BorderStyle="Solid" BorderWidth="1px" BorderColor="Gray" DayWidth="16%" DayHeight="18px"
					TitleHeight="22px" DayHeaderHeight="20px" SatDayWidth="10%" SunDayWidth="10%" OnOnDayClick="Month1_OnTitleClick" OnOnDayEventAdd="Month1_OnDayEventAdd" OnOnDayEventEdit="Month1_OnDayEventEdit" Align="Left" CalendarID="00000000-0000-0000-0000-000000000000" CellPadding="2" DayFormat="Day" DayHeaderAlign="Center" DayHeaderFormat="Short" DisplayType="DateOnly" EventAddable="True" EventEditable="True" EventHeight="100px" meta:resourcekey="Month4Resource1" SelectedDate="" ShowDayHeader="True" ViewCalendarID="00000000-0000-0000-0000-000000000000" ViewEventDetail="False" Year="2006">
					<SunDayStyle ForeColor="Maroon" BackColor="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunDayStyle>
					<SunHeaderStyle GradientEnd="192, 0, 0"  GradientBegin="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunHeaderStyle>
					<DayStyle ForeColor="Black" GradientLevel="150" Gradient="Right" GradientBegin="224, 224, 224"
						BackColor="White" BorderStyle="NotSet" CssClass=""></DayStyle>
					<SatDayStyle ForeColor="Green" BackColor="PaleGreen" BorderStyle="NotSet" CssClass=""></SatDayStyle>
					<SelectedDayStyle BorderStyle="Solid" GradientEnd="0, 0, 192" BorderWidth="1px" GradientLevel="100"
						Gradient="Left" BorderColor="Navy" GradientBegin="192, 192, 255" CssClass=""></SelectedDayStyle>
					<TodayStyle Font-Size="12px" Font-Bold="True" BorderStyle="Solid" GradientEnd="DarkBlue" BorderWidth="1px"
						ForeColor="White" Gradient="Left" BorderColor="Black" GradientBegin="192, 192, 255" BackColor="SlateBlue" CssClass=""></TodayStyle>
					<EventStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="DarkBlue" CssClass=""></EventStyle>
					<SatHeaderStyle GradientEnd="SeaGreen"  GradientBegin="192, 255, 192" BorderStyle="NotSet" CssClass=""></SatHeaderStyle>
					<DayHeaderStyle ForeColor="Navy" GradientLevel="150" Gradient="Bottom" GradientBegin="192, 192, 255"
						BackColor="192, 192, 255" BorderStyle="NotSet" CssClass=""></DayHeaderStyle>
					<TitleStyle Font-Size="11px" Font-Names="Tahoma" Font-Bold="True" GradientEnd="Gainsboro" BorderWidth="1px"
						ForeColor="White" GradientLevel="150"  BorderColor="Black" GradientBegin="DarkSlateBlue"
						BackColor="LightSteelBlue" BorderStyle="NotSet" CssClass=""></TitleStyle>
                <EventTextStyle BorderStyle="NotSet" CssClass="" />
                <TimeStyle BorderStyle="NotSet" CssClass="" />
                <DayEventStyle BorderStyle="NotSet" CssClass="" />
                <SatEventStyle BorderStyle="NotSet" CssClass="" />
                <SunEventStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControlEnterprise:Month></td>
			<td><SmoothEnterpriseWebControlEnterprise:Month id="Month5" runat="server" Font-Names="Tahoma" DayAlign="Right" Width="100%" Height="145px"
					CellSpacing="0" backcolor="#EEEEEE" MonthFormat="Long" TitleFormat="Month" YearMonth="5"
					BorderStyle="Solid" BorderWidth="1px" BorderColor="Gray" DayWidth="16%" DayHeight="18px"
					TitleHeight="22px" DayHeaderHeight="20px" SatDayWidth="10%" SunDayWidth="10%" OnOnDayClick="Month1_OnTitleClick" OnOnDayEventAdd="Month1_OnDayEventAdd" OnOnDayEventEdit="Month1_OnDayEventEdit" Align="Left" CalendarID="00000000-0000-0000-0000-000000000000" CellPadding="2" DayFormat="Day" DayHeaderAlign="Center" DayHeaderFormat="Short" DisplayType="DateOnly" EventAddable="True" EventEditable="True" EventHeight="100px" meta:resourcekey="Month5Resource1" SelectedDate="" ShowDayHeader="True" ViewCalendarID="00000000-0000-0000-0000-000000000000" ViewEventDetail="False" Year="2006">
					<SunDayStyle ForeColor="Maroon" BackColor="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunDayStyle>
					<SunHeaderStyle GradientEnd="192, 0, 0"  GradientBegin="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunHeaderStyle>
					<DayStyle ForeColor="Black" GradientLevel="150" Gradient="Right" GradientBegin="224, 224, 224"
						BackColor="White" BorderStyle="NotSet" CssClass=""></DayStyle>
					<SatDayStyle ForeColor="Green" BackColor="PaleGreen" BorderStyle="NotSet" CssClass=""></SatDayStyle>
					<SelectedDayStyle BorderStyle="Solid" GradientEnd="0, 0, 192" BorderWidth="1px" GradientLevel="100"
						Gradient="Left" BorderColor="Navy" GradientBegin="192, 192, 255" CssClass=""></SelectedDayStyle>
					<TodayStyle Font-Size="12px" Font-Bold="True" BorderStyle="Solid" GradientEnd="DarkBlue" BorderWidth="1px"
						ForeColor="White" Gradient="Left" BorderColor="Black" GradientBegin="192, 192, 255" BackColor="SlateBlue" CssClass=""></TodayStyle>
					<EventStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="DarkBlue" CssClass=""></EventStyle>
					<SatHeaderStyle GradientEnd="SeaGreen"  GradientBegin="192, 255, 192" BorderStyle="NotSet" CssClass=""></SatHeaderStyle>
					<DayHeaderStyle ForeColor="Navy" GradientLevel="150" Gradient="Bottom" GradientBegin="192, 192, 255"
						BackColor="192, 192, 255" BorderStyle="NotSet" CssClass=""></DayHeaderStyle>
					<TitleStyle Font-Size="11px" Font-Names="Tahoma" Font-Bold="True" GradientEnd="Gainsboro" BorderWidth="1px"
						ForeColor="White" GradientLevel="150"  BorderColor="Black" GradientBegin="DarkSlateBlue"
						BackColor="LightSteelBlue" BorderStyle="NotSet" CssClass=""></TitleStyle>
                <EventTextStyle BorderStyle="NotSet" CssClass="" />
                <TimeStyle BorderStyle="NotSet" CssClass="" />
                <DayEventStyle BorderStyle="NotSet" CssClass="" />
                <SatEventStyle BorderStyle="NotSet" CssClass="" />
                <SunEventStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControlEnterprise:Month></td>
			<td><SmoothEnterpriseWebControlEnterprise:Month id="Month6" runat="server" Font-Names="Tahoma" DayAlign="Right" Width="100%" Height="145px"
					CellSpacing="0" backcolor="#EEEEEE" MonthFormat="Long" TitleFormat="Month" YearMonth="6"
					BorderStyle="Solid" BorderWidth="1px" BorderColor="Gray" DayWidth="16%" DayHeight="18px"
					TitleHeight="22px" DayHeaderHeight="20px" SatDayWidth="10%" SunDayWidth="10%" OnOnDayClick="Month1_OnTitleClick" OnOnDayEventAdd="Month1_OnDayEventAdd" OnOnDayEventEdit="Month1_OnDayEventEdit" Align="Left" CalendarID="00000000-0000-0000-0000-000000000000" CellPadding="2" DayFormat="Day" DayHeaderAlign="Center" DayHeaderFormat="Short" DisplayType="DateOnly" EventAddable="True" EventEditable="True" EventHeight="100px" meta:resourcekey="Month6Resource1" SelectedDate="" ShowDayHeader="True" ViewCalendarID="00000000-0000-0000-0000-000000000000" ViewEventDetail="False" Year="2006">
					<SunDayStyle ForeColor="Maroon" BackColor="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunDayStyle>
					<SunHeaderStyle GradientEnd="192, 0, 0"  GradientBegin="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunHeaderStyle>
					<DayStyle ForeColor="Black" GradientLevel="150" Gradient="Right" GradientBegin="224, 224, 224"
						BackColor="White" BorderStyle="NotSet" CssClass=""></DayStyle>
					<SatDayStyle ForeColor="Green" BackColor="PaleGreen" BorderStyle="NotSet" CssClass=""></SatDayStyle>
					<SelectedDayStyle BorderStyle="Solid" GradientEnd="0, 0, 192" BorderWidth="1px" GradientLevel="100"
						Gradient="Left" BorderColor="Navy" GradientBegin="192, 192, 255" CssClass=""></SelectedDayStyle>
					<TodayStyle Font-Size="12px" Font-Bold="True" BorderStyle="Solid" GradientEnd="DarkBlue" BorderWidth="1px"
						ForeColor="White" Gradient="Left" BorderColor="Black" GradientBegin="192, 192, 255" BackColor="SlateBlue" CssClass=""></TodayStyle>
					<EventStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="DarkBlue" CssClass=""></EventStyle>
					<SatHeaderStyle GradientEnd="SeaGreen"  GradientBegin="192, 255, 192" BorderStyle="NotSet" CssClass=""></SatHeaderStyle>
					<DayHeaderStyle ForeColor="Navy" GradientLevel="150" Gradient="Bottom" GradientBegin="192, 192, 255"
						BackColor="192, 192, 255" BorderStyle="NotSet" CssClass=""></DayHeaderStyle>
					<TitleStyle Font-Size="11px" Font-Names="Tahoma" Font-Bold="True" GradientEnd="Gainsboro" BorderWidth="1px"
						ForeColor="White" GradientLevel="150"  BorderColor="Black" GradientBegin="DarkSlateBlue"
						BackColor="LightSteelBlue" BorderStyle="NotSet" CssClass=""></TitleStyle>
                <EventTextStyle BorderStyle="NotSet" CssClass="" />
                <TimeStyle BorderStyle="NotSet" CssClass="" />
                <DayEventStyle BorderStyle="NotSet" CssClass="" />
                <SatEventStyle BorderStyle="NotSet" CssClass="" />
                <SunEventStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControlEnterprise:Month></td>
		</tr>
		<tr vAlign="top">
			<td><SmoothEnterpriseWebControlEnterprise:Month id="Month7" runat="server" Font-Names="Tahoma" DayAlign="Right" Width="100%" Height="145px"
					CellSpacing="0" backcolor="#EEEEEE" MonthFormat="Long" TitleFormat="Month" YearMonth="7"
					BorderStyle="Solid" BorderWidth="1px" BorderColor="Gray" DayWidth="16%" DayHeight="18px"
					TitleHeight="22px" DayHeaderHeight="20px" SatDayWidth="10%" SunDayWidth="10%" OnOnDayClick="Month1_OnTitleClick" OnOnDayEventAdd="Month1_OnDayEventAdd" OnOnDayEventEdit="Month1_OnDayEventEdit" Align="Left" CalendarID="00000000-0000-0000-0000-000000000000" CellPadding="2" DayFormat="Day" DayHeaderAlign="Center" DayHeaderFormat="Short" DisplayType="DateOnly" EventAddable="True" EventEditable="True" EventHeight="100px" meta:resourcekey="Month7Resource1" SelectedDate="" ShowDayHeader="True" ViewCalendarID="00000000-0000-0000-0000-000000000000" ViewEventDetail="False" Year="2006">
					<SunDayStyle ForeColor="Maroon" BackColor="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunDayStyle>
					<SunHeaderStyle GradientEnd="192, 0, 0"  GradientBegin="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunHeaderStyle>
					<DayStyle ForeColor="Black" GradientLevel="150" Gradient="Right" GradientBegin="224, 224, 224"
						BackColor="White" BorderStyle="NotSet" CssClass=""></DayStyle>
					<SatDayStyle ForeColor="Green" BackColor="PaleGreen" BorderStyle="NotSet" CssClass=""></SatDayStyle>
					<SelectedDayStyle BorderStyle="Solid" GradientEnd="0, 0, 192" BorderWidth="1px" GradientLevel="100"
						Gradient="Left" BorderColor="Navy" GradientBegin="192, 192, 255" CssClass=""></SelectedDayStyle>
					<TodayStyle Font-Size="12px" Font-Bold="True" BorderStyle="Solid" GradientEnd="DarkBlue" BorderWidth="1px"
						ForeColor="White" Gradient="Left" BorderColor="Black" GradientBegin="192, 192, 255" BackColor="SlateBlue" CssClass=""></TodayStyle>
					<EventStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="DarkBlue" CssClass=""></EventStyle>
					<SatHeaderStyle GradientEnd="SeaGreen"  GradientBegin="192, 255, 192" BorderStyle="NotSet" CssClass=""></SatHeaderStyle>
					<DayHeaderStyle ForeColor="Navy" GradientLevel="150" Gradient="Bottom" GradientBegin="192, 192, 255"
						BackColor="192, 192, 255" BorderStyle="NotSet" CssClass=""></DayHeaderStyle>
					<TitleStyle Font-Size="11px" Font-Names="Tahoma" Font-Bold="True" GradientEnd="Gainsboro" BorderWidth="1px"
						ForeColor="White" GradientLevel="150"  BorderColor="Black" GradientBegin="DarkSlateBlue"
						BackColor="LightSteelBlue" BorderStyle="NotSet" CssClass=""></TitleStyle>
                <EventTextStyle BorderStyle="NotSet" CssClass="" />
                <TimeStyle BorderStyle="NotSet" CssClass="" />
                <DayEventStyle BorderStyle="NotSet" CssClass="" />
                <SatEventStyle BorderStyle="NotSet" CssClass="" />
                <SunEventStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControlEnterprise:Month></td>
			<td><SmoothEnterpriseWebControlEnterprise:Month id="Month8" runat="server" Font-Names="Tahoma" DayAlign="Right" Width="100%" Height="145px"
					CellSpacing="0" backcolor="#EEEEEE" MonthFormat="Long" TitleFormat="Month" YearMonth="8"
					BorderStyle="Solid" BorderWidth="1px" BorderColor="Gray" DayWidth="16%" DayHeight="18px"
					TitleHeight="22px" DayHeaderHeight="20px" SatDayWidth="10%" SunDayWidth="10%" OnOnDayClick="Month1_OnTitleClick" OnOnDayEventAdd="Month1_OnDayEventAdd" OnOnDayEventEdit="Month1_OnDayEventEdit" Align="Left" CalendarID="00000000-0000-0000-0000-000000000000" CellPadding="2" DayFormat="Day" DayHeaderAlign="Center" DayHeaderFormat="Short" DisplayType="DateOnly" EventAddable="True" EventEditable="True" EventHeight="100px" meta:resourcekey="Month8Resource1" SelectedDate="" ShowDayHeader="True" ViewCalendarID="00000000-0000-0000-0000-000000000000" ViewEventDetail="False" Year="2006">
					<SunDayStyle ForeColor="Maroon" BackColor="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunDayStyle>
					<SunHeaderStyle GradientEnd="192, 0, 0"  GradientBegin="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunHeaderStyle>
					<DayStyle ForeColor="Black" GradientLevel="150" Gradient="Right" GradientBegin="224, 224, 224"
						BackColor="White" BorderStyle="NotSet" CssClass=""></DayStyle>
					<SatDayStyle ForeColor="Green" BackColor="PaleGreen" BorderStyle="NotSet" CssClass=""></SatDayStyle>
					<SelectedDayStyle BorderStyle="Solid" GradientEnd="0, 0, 192" BorderWidth="1px" GradientLevel="100"
						Gradient="Left" BorderColor="Navy" GradientBegin="192, 192, 255" CssClass=""></SelectedDayStyle>
					<TodayStyle Font-Size="12px" Font-Bold="True" BorderStyle="Solid" GradientEnd="DarkBlue" BorderWidth="1px"
						ForeColor="White" Gradient="Left" BorderColor="Black" GradientBegin="192, 192, 255" BackColor="SlateBlue" CssClass=""></TodayStyle>
					<EventStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="DarkBlue" CssClass=""></EventStyle>
					<SatHeaderStyle GradientEnd="SeaGreen"  GradientBegin="192, 255, 192" BorderStyle="NotSet" CssClass=""></SatHeaderStyle>
					<DayHeaderStyle ForeColor="Navy" GradientLevel="150" Gradient="Bottom" GradientBegin="192, 192, 255"
						BackColor="192, 192, 255" BorderStyle="NotSet" CssClass=""></DayHeaderStyle>
					<TitleStyle Font-Size="11px" Font-Names="Tahoma" Font-Bold="True" GradientEnd="Gainsboro" BorderWidth="1px"
						ForeColor="White" GradientLevel="150"  BorderColor="Black" GradientBegin="DarkSlateBlue"
						BackColor="LightSteelBlue" BorderStyle="NotSet" CssClass=""></TitleStyle>
                <EventTextStyle BorderStyle="NotSet" CssClass="" />
                <TimeStyle BorderStyle="NotSet" CssClass="" />
                <DayEventStyle BorderStyle="NotSet" CssClass="" />
                <SatEventStyle BorderStyle="NotSet" CssClass="" />
                <SunEventStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControlEnterprise:Month></td>
			<td>
				<SmoothEnterpriseWebControlEnterprise:Month id="Month9" runat="server" SunDayWidth="10%" SatDayWidth="10%" DayHeaderHeight="20px"
					TitleHeight="22px" DayHeight="18px" DayWidth="16%" BorderColor="Gray" BorderWidth="1px"
					BorderStyle="Solid" YearMonth="9" TitleFormat="Month" MonthFormat="Long" backcolor="#EEEEEE"
					CellSpacing="0" Height="145px" Width="100%" DayAlign="Right" Font-Names="Tahoma" OnOnDayClick="Month1_OnTitleClick" OnOnDayEventAdd="Month1_OnDayEventAdd" OnOnDayEventEdit="Month1_OnDayEventEdit" Align="Left" CalendarID="00000000-0000-0000-0000-000000000000" CellPadding="2" DayFormat="Day" DayHeaderAlign="Center" DayHeaderFormat="Short" DisplayType="DateOnly" EventAddable="True" EventEditable="True" EventHeight="100px" meta:resourcekey="Month9Resource1" SelectedDate="" ShowDayHeader="True" ViewCalendarID="00000000-0000-0000-0000-000000000000" ViewEventDetail="False" Year="2006">
					<SunDayStyle ForeColor="Maroon" BackColor="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunDayStyle>
					<SunHeaderStyle GradientEnd="192, 0, 0"  GradientBegin="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunHeaderStyle>
					<DayStyle ForeColor="Black" GradientLevel="150" Gradient="Right" GradientBegin="224, 224, 224"
						BackColor="White" BorderStyle="NotSet" CssClass=""></DayStyle>
					<SatDayStyle ForeColor="Green" BackColor="PaleGreen" BorderStyle="NotSet" CssClass=""></SatDayStyle>
					<SelectedDayStyle BorderStyle="Solid" GradientEnd="0, 0, 192" BorderWidth="1px" GradientLevel="100"
						Gradient="Left" BorderColor="Navy" GradientBegin="192, 192, 255" CssClass=""></SelectedDayStyle>
					<TodayStyle Font-Size="12px" Font-Bold="True" BorderStyle="Solid" GradientEnd="DarkBlue" BorderWidth="1px"
						ForeColor="White" Gradient="Left" BorderColor="Black" GradientBegin="192, 192, 255" BackColor="SlateBlue" CssClass=""></TodayStyle>
					<EventStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="DarkBlue" CssClass=""></EventStyle>
					<SatHeaderStyle GradientEnd="SeaGreen"  GradientBegin="192, 255, 192" BorderStyle="NotSet" CssClass=""></SatHeaderStyle>
					<DayHeaderStyle ForeColor="Navy" GradientLevel="150" Gradient="Bottom" GradientBegin="192, 192, 255"
						BackColor="192, 192, 255" BorderStyle="NotSet" CssClass=""></DayHeaderStyle>
					<TitleStyle Font-Size="11px" Font-Names="Tahoma" Font-Bold="True" GradientEnd="Gainsboro" BorderWidth="1px"
						ForeColor="White" GradientLevel="150"  BorderColor="Black" GradientBegin="DarkSlateBlue"
						BackColor="LightSteelBlue" BorderStyle="NotSet" CssClass=""></TitleStyle>
                    <EventTextStyle BorderStyle="NotSet" CssClass="" />
                    <TimeStyle BorderStyle="NotSet" CssClass="" />
                    <DayEventStyle BorderStyle="NotSet" CssClass="" />
                    <SatEventStyle BorderStyle="NotSet" CssClass="" />
                    <SunEventStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControlEnterprise:Month></td>
			<td><SmoothEnterpriseWebControlEnterprise:Month id="Month10" runat="server" Font-Names="Tahoma" DayAlign="Right" Width="100%" Height="145px"
					CellSpacing="0" backcolor="#EEEEEE" MonthFormat="Long" TitleFormat="Month" YearMonth="10"
					BorderStyle="Solid" BorderWidth="1px" BorderColor="Gray" DayWidth="16%" DayHeight="18px"
					TitleHeight="22px" DayHeaderHeight="20px" SatDayWidth="10%" SunDayWidth="10%" OnOnDayClick="Month1_OnTitleClick" OnOnDayEventAdd="Month1_OnDayEventAdd" OnOnDayEventEdit="Month1_OnDayEventEdit" Align="Left" CalendarID="00000000-0000-0000-0000-000000000000" CellPadding="2" DayFormat="Day" DayHeaderAlign="Center" DayHeaderFormat="Short" DisplayType="DateOnly" EventAddable="True" EventEditable="True" EventHeight="100px" meta:resourcekey="Month10Resource1" SelectedDate="" ShowDayHeader="True" ViewCalendarID="00000000-0000-0000-0000-000000000000" ViewEventDetail="False" Year="2006">
					<SunDayStyle ForeColor="Maroon" BackColor="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunDayStyle>
					<SunHeaderStyle GradientEnd="192, 0, 0"  GradientBegin="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunHeaderStyle>
					<DayStyle ForeColor="Black" GradientLevel="150" Gradient="Right" GradientBegin="224, 224, 224"
						BackColor="White" BorderStyle="NotSet" CssClass=""></DayStyle>
					<SatDayStyle ForeColor="Green" BackColor="PaleGreen" BorderStyle="NotSet" CssClass=""></SatDayStyle>
					<SelectedDayStyle BorderStyle="Solid" GradientEnd="0, 0, 192" BorderWidth="1px" GradientLevel="100"
						Gradient="Left" BorderColor="Navy" GradientBegin="192, 192, 255" CssClass=""></SelectedDayStyle>
					<TodayStyle Font-Size="12px" Font-Bold="True" BorderStyle="Solid" GradientEnd="DarkBlue" BorderWidth="1px"
						ForeColor="White" Gradient="Left" BorderColor="Black" GradientBegin="192, 192, 255" BackColor="SlateBlue" CssClass=""></TodayStyle>
					<EventStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="DarkBlue" CssClass=""></EventStyle>
					<SatHeaderStyle GradientEnd="SeaGreen"  GradientBegin="192, 255, 192" BorderStyle="NotSet" CssClass=""></SatHeaderStyle>
					<DayHeaderStyle ForeColor="Navy" GradientLevel="150" Gradient="Bottom" GradientBegin="192, 192, 255"
						BackColor="192, 192, 255" BorderStyle="NotSet" CssClass=""></DayHeaderStyle>
					<TitleStyle Font-Size="11px" Font-Names="Tahoma" Font-Bold="True" GradientEnd="Gainsboro" BorderWidth="1px"
						ForeColor="White" GradientLevel="150"  BorderColor="Black" GradientBegin="DarkSlateBlue"
						BackColor="LightSteelBlue" BorderStyle="NotSet" CssClass=""></TitleStyle>
                <EventTextStyle BorderStyle="NotSet" CssClass="" />
                <TimeStyle BorderStyle="NotSet" CssClass="" />
                <DayEventStyle BorderStyle="NotSet" CssClass="" />
                <SatEventStyle BorderStyle="NotSet" CssClass="" />
                <SunEventStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControlEnterprise:Month></td>
			<td>
				<SmoothEnterpriseWebControlEnterprise:Month id="Month11" runat="server" Font-Names="Tahoma" DayAlign="Right" Width="100%" Height="145px"
					CellSpacing="0" backcolor="#EEEEEE" MonthFormat="Long" TitleFormat="Month" YearMonth="11"
					BorderStyle="Solid" BorderWidth="1px" BorderColor="Gray" DayWidth="16%" DayHeight="18px"
					TitleHeight="22px" DayHeaderHeight="20px" SatDayWidth="10%" SunDayWidth="10%" OnOnDayClick="Month1_OnTitleClick" OnOnDayEventAdd="Month1_OnDayEventAdd" OnOnDayEventEdit="Month1_OnDayEventEdit" Align="Left" CalendarID="00000000-0000-0000-0000-000000000000" CellPadding="2" DayFormat="Day" DayHeaderAlign="Center" DayHeaderFormat="Short" DisplayType="DateOnly" EventAddable="True" EventEditable="True" EventHeight="100px" meta:resourcekey="Month11Resource1" SelectedDate="" ShowDayHeader="True" ViewCalendarID="00000000-0000-0000-0000-000000000000" ViewEventDetail="False" Year="2006">
					<SunDayStyle ForeColor="Maroon" BackColor="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunDayStyle>
					<SunHeaderStyle GradientEnd="192, 0, 0"  GradientBegin="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunHeaderStyle>
					<DayStyle ForeColor="Black" GradientLevel="150" Gradient="Right" GradientBegin="224, 224, 224"
						BackColor="White" BorderStyle="NotSet" CssClass=""></DayStyle>
					<SatDayStyle ForeColor="Green" BackColor="PaleGreen" BorderStyle="NotSet" CssClass=""></SatDayStyle>
					<SelectedDayStyle BorderStyle="Solid" GradientEnd="0, 0, 192" BorderWidth="1px" GradientLevel="100"
						Gradient="Left" BorderColor="Navy" GradientBegin="192, 192, 255" CssClass=""></SelectedDayStyle>
					<TodayStyle Font-Size="12px" Font-Bold="True" BorderStyle="Solid" GradientEnd="DarkBlue" BorderWidth="1px"
						ForeColor="White" Gradient="Left" BorderColor="Black" GradientBegin="192, 192, 255" BackColor="SlateBlue" CssClass=""></TodayStyle>
					<EventStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="DarkBlue" CssClass=""></EventStyle>
					<SatHeaderStyle GradientEnd="SeaGreen"  GradientBegin="192, 255, 192" BorderStyle="NotSet" CssClass=""></SatHeaderStyle>
					<DayHeaderStyle ForeColor="Navy" GradientLevel="150" Gradient="Bottom" GradientBegin="192, 192, 255"
						BackColor="192, 192, 255" BorderStyle="NotSet" CssClass=""></DayHeaderStyle>
					<TitleStyle Font-Size="11px" Font-Names="Tahoma" Font-Bold="True" GradientEnd="Gainsboro" BorderWidth="1px"
						ForeColor="White" GradientLevel="150"  BorderColor="Black" GradientBegin="DarkSlateBlue"
						BackColor="LightSteelBlue" BorderStyle="NotSet" CssClass=""></TitleStyle>
                    <EventTextStyle BorderStyle="NotSet" CssClass="" />
                    <TimeStyle BorderStyle="NotSet" CssClass="" />
                    <DayEventStyle BorderStyle="NotSet" CssClass="" />
                    <SatEventStyle BorderStyle="NotSet" CssClass="" />
                    <SunEventStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControlEnterprise:Month></td>
			<td>
				<SmoothEnterpriseWebControlEnterprise:Month id="Month12" runat="server" Font-Names="Tahoma" DayAlign="Right" Width="100%" Height="145px"
					CellSpacing="0" backcolor="#EEEEEE" MonthFormat="Long" TitleFormat="Month" YearMonth="12"
					BorderStyle="Solid" BorderWidth="1px" BorderColor="Gray" DayWidth="16%" DayHeight="18px"
					TitleHeight="22px" DayHeaderHeight="20px" SatDayWidth="10%" SunDayWidth="10%" OnOnDayClick="Month1_OnTitleClick" OnOnDayEventAdd="Month1_OnDayEventAdd" OnOnDayEventEdit="Month1_OnDayEventEdit" Align="Left" CalendarID="00000000-0000-0000-0000-000000000000" CellPadding="2" DayFormat="Day" DayHeaderAlign="Center" DayHeaderFormat="Short" DisplayType="DateOnly" EventAddable="True" EventEditable="True" EventHeight="100px" meta:resourcekey="Month12Resource1" SelectedDate="" ShowDayHeader="True" ViewCalendarID="00000000-0000-0000-0000-000000000000" ViewEventDetail="False" Year="2006">
					<SunDayStyle ForeColor="Maroon" BackColor="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunDayStyle>
					<SunHeaderStyle GradientEnd="192, 0, 0"  GradientBegin="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunHeaderStyle>
					<DayStyle ForeColor="Black" GradientLevel="150" Gradient="Right" GradientBegin="224, 224, 224"
						BackColor="White" BorderStyle="NotSet" CssClass=""></DayStyle>
					<SatDayStyle ForeColor="Green" BackColor="PaleGreen" BorderStyle="NotSet" CssClass=""></SatDayStyle>
					<SelectedDayStyle BorderStyle="Solid" GradientEnd="0, 0, 192" BorderWidth="1px" GradientLevel="100"
						Gradient="Left" BorderColor="Navy" GradientBegin="192, 192, 255" CssClass=""></SelectedDayStyle>
					<TodayStyle Font-Size="12px" Font-Bold="True" BorderStyle="Solid" GradientEnd="DarkBlue" BorderWidth="1px"
						ForeColor="White" Gradient="Left" BorderColor="Black" GradientBegin="192, 192, 255" BackColor="SlateBlue" CssClass=""></TodayStyle>
					<EventStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="DarkBlue" CssClass=""></EventStyle>
					<SatHeaderStyle GradientEnd="SeaGreen"  GradientBegin="192, 255, 192" BorderStyle="NotSet" CssClass=""></SatHeaderStyle>
					<DayHeaderStyle ForeColor="Navy" GradientLevel="150" Gradient="Bottom" GradientBegin="192, 192, 255"
						BackColor="192, 192, 255" BorderStyle="NotSet" CssClass=""></DayHeaderStyle>
					<TitleStyle Font-Size="11px" Font-Names="Tahoma" Font-Bold="True" GradientEnd="Gainsboro" BorderWidth="1px"
						ForeColor="White" GradientLevel="150"  BorderColor="Black" GradientBegin="DarkSlateBlue"
						BackColor="LightSteelBlue" BorderStyle="NotSet" CssClass=""></TitleStyle>
                    <EventTextStyle BorderStyle="NotSet" CssClass="" />
                    <TimeStyle BorderStyle="NotSet" CssClass="" />
                    <DayEventStyle BorderStyle="NotSet" CssClass="" />
                    <SatEventStyle BorderStyle="NotSet" CssClass="" />
                    <SunEventStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControlEnterprise:Month></td>
		</tr>
	</table>
	<table border="0" width="80%" align="center" cellpadding="10" id="Table_Season" runat="server">
		<tr>
			<td width="33%">
				<SmoothEnterpriseWebControlEnterprise:Month id="Month13" runat="server" SunDayWidth="10%" SatDayWidth="10%" DayHeaderHeight="20px"
					TitleHeight="22px" DayHeight="18px" DayWidth="16%" BorderColor="Gray" BorderWidth="1px"
					BorderStyle="Solid" YearMonth="1" TitleFormat="Month" MonthFormat="Long" backcolor="#EEEEEE"
					CellSpacing="0" Height="145px" Width="100%" DayAlign="Right" Font-Names="Tahoma" OnOnDayClick="Month1_OnTitleClick" OnOnDayEventAdd="Month1_OnDayEventAdd" OnOnDayEventEdit="Month1_OnDayEventEdit" Align="Left" CalendarID="00000000-0000-0000-0000-000000000000" CellPadding="2" DayFormat="Day" DayHeaderAlign="Center" DayHeaderFormat="Short" DisplayType="DateOnly" EventAddable="True" EventEditable="True" EventHeight="100px" meta:resourcekey="Month13Resource1" SelectedDate="" ShowDayHeader="True" ViewCalendarID="00000000-0000-0000-0000-000000000000" ViewEventDetail="False" Year="2006">
					<SunDayStyle ForeColor="Maroon" BackColor="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunDayStyle>
					<SunHeaderStyle GradientEnd="192, 0, 0"  GradientBegin="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunHeaderStyle>
					<DayStyle ForeColor="Black" GradientLevel="150" Gradient="Right" GradientBegin="224, 224, 224"
						BackColor="White" BorderStyle="NotSet" CssClass=""></DayStyle>
					<SatDayStyle ForeColor="Green" BackColor="PaleGreen" BorderStyle="NotSet" CssClass=""></SatDayStyle>
					<SelectedDayStyle BorderStyle="Solid" GradientEnd="0, 0, 192" BorderWidth="1px" GradientLevel="100"
						Gradient="Left" BorderColor="Navy" GradientBegin="192, 192, 255" CssClass=""></SelectedDayStyle>
					<TodayStyle Font-Size="12px" Font-Bold="True" BorderStyle="Solid" GradientEnd="DarkBlue" BorderWidth="1px"
						ForeColor="White" Gradient="Left" BorderColor="Black" GradientBegin="192, 192, 255" BackColor="SlateBlue" CssClass=""></TodayStyle>
					<EventStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="DarkBlue" CssClass=""></EventStyle>
					<SatHeaderStyle GradientEnd="SeaGreen"  GradientBegin="192, 255, 192" BorderStyle="NotSet" CssClass=""></SatHeaderStyle>
					<DayHeaderStyle ForeColor="Navy" GradientLevel="150" Gradient="Bottom" GradientBegin="192, 192, 255"
						BackColor="192, 192, 255" BorderStyle="NotSet" CssClass=""></DayHeaderStyle>
					<TitleStyle Font-Size="11px" Font-Names="Tahoma" Font-Bold="True" GradientEnd="Gainsboro" BorderWidth="1px"
						ForeColor="White" GradientLevel="150"  BorderColor="Black" GradientBegin="DarkSlateBlue"
						BackColor="LightSteelBlue" BorderStyle="NotSet" CssClass=""></TitleStyle>
                    <EventTextStyle BorderStyle="NotSet" CssClass="" />
                    <TimeStyle BorderStyle="NotSet" CssClass="" />
                    <DayEventStyle BorderStyle="NotSet" CssClass="" />
                    <SatEventStyle BorderStyle="NotSet" CssClass="" />
                    <SunEventStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControlEnterprise:Month></td>
			<td width="33%">
				<SmoothEnterpriseWebControlEnterprise:Month id="Month14" runat="server" SunDayWidth="10%" SatDayWidth="10%" DayHeaderHeight="20px"
					TitleHeight="22px" DayHeight="18px" DayWidth="16%" BorderColor="Gray" BorderWidth="1px"
					BorderStyle="Solid" YearMonth="2" TitleFormat="Month" MonthFormat="Long" backcolor="#EEEEEE"
					CellSpacing="0" Height="145px" Width="100%" DayAlign="Right" Font-Names="Tahoma" OnOnDayClick="Month1_OnTitleClick" OnOnDayEventAdd="Month1_OnDayEventAdd" OnOnDayEventEdit="Month1_OnDayEventEdit" Align="Left" CalendarID="00000000-0000-0000-0000-000000000000" CellPadding="2" DayFormat="Day" DayHeaderAlign="Center" DayHeaderFormat="Short" DisplayType="DateOnly" EventAddable="True" EventEditable="True" EventHeight="100px" meta:resourcekey="Month14Resource1" SelectedDate="" ShowDayHeader="True" ViewCalendarID="00000000-0000-0000-0000-000000000000" ViewEventDetail="False" Year="2006">
					<SunDayStyle ForeColor="Maroon" BackColor="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunDayStyle>
					<SunHeaderStyle GradientEnd="192, 0, 0"  GradientBegin="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunHeaderStyle>
					<DayStyle ForeColor="Black" GradientLevel="150" Gradient="Right" GradientBegin="224, 224, 224"
						BackColor="White" BorderStyle="NotSet" CssClass=""></DayStyle>
					<SatDayStyle ForeColor="Green" BackColor="PaleGreen" BorderStyle="NotSet" CssClass=""></SatDayStyle>
					<SelectedDayStyle BorderStyle="Solid" GradientEnd="0, 0, 192" BorderWidth="1px" GradientLevel="100"
						Gradient="Left" BorderColor="Navy" GradientBegin="192, 192, 255" CssClass=""></SelectedDayStyle>
					<TodayStyle Font-Size="12px" Font-Bold="True" BorderStyle="Solid" GradientEnd="DarkBlue" BorderWidth="1px"
						ForeColor="White" Gradient="Left" BorderColor="Black" GradientBegin="192, 192, 255" BackColor="SlateBlue" CssClass=""></TodayStyle>
					<EventStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="DarkBlue" CssClass=""></EventStyle>
					<SatHeaderStyle GradientEnd="SeaGreen"  GradientBegin="192, 255, 192" BorderStyle="NotSet" CssClass=""></SatHeaderStyle>
					<DayHeaderStyle ForeColor="Navy" GradientLevel="150" Gradient="Bottom" GradientBegin="192, 192, 255"
						BackColor="192, 192, 255" BorderStyle="NotSet" CssClass=""></DayHeaderStyle>
					<TitleStyle Font-Size="11px" Font-Names="Tahoma" Font-Bold="True" GradientEnd="Gainsboro" BorderWidth="1px"
						ForeColor="White" GradientLevel="150"  BorderColor="Black" GradientBegin="DarkSlateBlue"
						BackColor="LightSteelBlue" BorderStyle="NotSet" CssClass=""></TitleStyle>
                    <EventTextStyle BorderStyle="NotSet" CssClass="" />
                    <TimeStyle BorderStyle="NotSet" CssClass="" />
                    <DayEventStyle BorderStyle="NotSet" CssClass="" />
                    <SatEventStyle BorderStyle="NotSet" CssClass="" />
                    <SunEventStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControlEnterprise:Month></td>
			<td width="33%">
				<SmoothEnterpriseWebControlEnterprise:Month id="Month15" runat="server" SunDayWidth="10%" SatDayWidth="10%" DayHeaderHeight="20px"
					TitleHeight="22px" DayHeight="18px" DayWidth="16%" BorderColor="Gray" BorderWidth="1px"
					BorderStyle="Solid" YearMonth="3" TitleFormat="Month" MonthFormat="Long" backcolor="#EEEEEE"
					CellSpacing="0" Height="145px" Width="100%" DayAlign="Right" Font-Names="Tahoma" OnOnDayClick="Month1_OnTitleClick" OnOnDayEventAdd="Month1_OnDayEventAdd" OnOnDayEventEdit="Month1_OnDayEventEdit" Align="Left" CalendarID="00000000-0000-0000-0000-000000000000" CellPadding="2" DayFormat="Day" DayHeaderAlign="Center" DayHeaderFormat="Short" DisplayType="DateOnly" EventAddable="True" EventEditable="True" EventHeight="100px" meta:resourcekey="Month15Resource1" SelectedDate="" ShowDayHeader="True" ViewCalendarID="00000000-0000-0000-0000-000000000000" ViewEventDetail="False" Year="2006">
					<SunDayStyle ForeColor="Maroon" BackColor="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunDayStyle>
					<SunHeaderStyle GradientEnd="192, 0, 0"  GradientBegin="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunHeaderStyle>
					<DayStyle ForeColor="Black" GradientLevel="150" Gradient="Right" GradientBegin="224, 224, 224"
						BackColor="White" BorderStyle="NotSet" CssClass=""></DayStyle>
					<SatDayStyle ForeColor="Green" BackColor="PaleGreen" BorderStyle="NotSet" CssClass=""></SatDayStyle>
					<SelectedDayStyle BorderStyle="Solid" GradientEnd="0, 0, 192" BorderWidth="1px" GradientLevel="100"
						Gradient="Left" BorderColor="Navy" GradientBegin="192, 192, 255" CssClass=""></SelectedDayStyle>
					<TodayStyle Font-Size="12px" Font-Bold="True" BorderStyle="Solid" GradientEnd="DarkBlue" BorderWidth="1px"
						ForeColor="White" Gradient="Left" BorderColor="Black" GradientBegin="192, 192, 255" BackColor="SlateBlue" CssClass=""></TodayStyle>
					<EventStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="DarkBlue" CssClass=""></EventStyle>
					<SatHeaderStyle GradientEnd="SeaGreen"  GradientBegin="192, 255, 192" BorderStyle="NotSet" CssClass=""></SatHeaderStyle>
					<DayHeaderStyle ForeColor="Navy" GradientLevel="150" Gradient="Bottom" GradientBegin="192, 192, 255"
						BackColor="192, 192, 255" BorderStyle="NotSet" CssClass=""></DayHeaderStyle>
					<TitleStyle Font-Size="11px" Font-Names="Tahoma" Font-Bold="True" GradientEnd="Gainsboro" BorderWidth="1px"
						ForeColor="White" GradientLevel="150"  BorderColor="Black" GradientBegin="DarkSlateBlue"
						BackColor="LightSteelBlue" BorderStyle="NotSet" CssClass=""></TitleStyle>
                    <EventTextStyle BorderStyle="NotSet" CssClass="" />
                    <TimeStyle BorderStyle="NotSet" CssClass="" />
                    <DayEventStyle BorderStyle="NotSet" CssClass="" />
                    <SatEventStyle BorderStyle="NotSet" CssClass="" />
                    <SunEventStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControlEnterprise:Month></td>
		</tr>
		<tr>
			<td>
				<SmoothEnterpriseWebControlEnterprise:Month id="Month16" runat="server" SunDayWidth="10%" SatDayWidth="10%" DayHeaderHeight="20px"
					TitleHeight="22px" DayHeight="18px" DayWidth="16%" BorderColor="Gray" BorderWidth="1px"
					BorderStyle="Solid" YearMonth="4" TitleFormat="Month" MonthFormat="Long" backcolor="#EEEEEE"
					CellSpacing="0" Height="145px" Width="100%" DayAlign="Right" Font-Names="Tahoma" OnOnDayClick="Month1_OnTitleClick" OnOnDayEventAdd="Month1_OnDayEventAdd" OnOnDayEventEdit="Month1_OnDayEventEdit" Align="Left" CalendarID="00000000-0000-0000-0000-000000000000" CellPadding="2" DayFormat="Day" DayHeaderAlign="Center" DayHeaderFormat="Short" DisplayType="DateOnly" EventAddable="True" EventEditable="True" EventHeight="100px" meta:resourcekey="Month16Resource1" SelectedDate="" ShowDayHeader="True" ViewCalendarID="00000000-0000-0000-0000-000000000000" ViewEventDetail="False" Year="2006">
					<SunDayStyle ForeColor="Maroon" BackColor="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunDayStyle>
					<SunHeaderStyle GradientEnd="192, 0, 0"  GradientBegin="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunHeaderStyle>
					<DayStyle ForeColor="Black" GradientLevel="150" Gradient="Right" GradientBegin="224, 224, 224"
						BackColor="White" BorderStyle="NotSet" CssClass=""></DayStyle>
					<SatDayStyle ForeColor="Green" BackColor="PaleGreen" BorderStyle="NotSet" CssClass=""></SatDayStyle>
					<SelectedDayStyle BorderStyle="Solid" GradientEnd="0, 0, 192" BorderWidth="1px" GradientLevel="100"
						Gradient="Left" BorderColor="Navy" GradientBegin="192, 192, 255" CssClass=""></SelectedDayStyle>
					<TodayStyle Font-Size="12px" Font-Bold="True" BorderStyle="Solid" GradientEnd="DarkBlue" BorderWidth="1px"
						ForeColor="White" Gradient="Left" BorderColor="Black" GradientBegin="192, 192, 255" BackColor="SlateBlue" CssClass=""></TodayStyle>
					<EventStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="DarkBlue" CssClass=""></EventStyle>
					<SatHeaderStyle GradientEnd="SeaGreen"  GradientBegin="192, 255, 192" BorderStyle="NotSet" CssClass=""></SatHeaderStyle>
					<DayHeaderStyle ForeColor="Navy" GradientLevel="150" Gradient="Bottom" GradientBegin="192, 192, 255"
						BackColor="192, 192, 255" BorderStyle="NotSet" CssClass=""></DayHeaderStyle>
					<TitleStyle Font-Size="11px" Font-Names="Tahoma" Font-Bold="True" GradientEnd="Gainsboro" BorderWidth="1px"
						ForeColor="White" GradientLevel="150"  BorderColor="Black" GradientBegin="DarkSlateBlue"
						BackColor="LightSteelBlue" BorderStyle="NotSet" CssClass=""></TitleStyle>
                    <EventTextStyle BorderStyle="NotSet" CssClass="" />
                    <TimeStyle BorderStyle="NotSet" CssClass="" />
                    <DayEventStyle BorderStyle="NotSet" CssClass="" />
                    <SatEventStyle BorderStyle="NotSet" CssClass="" />
                    <SunEventStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControlEnterprise:Month></td>
			<td>
				<SmoothEnterpriseWebControlEnterprise:Month id="Month17" runat="server" SunDayWidth="10%" SatDayWidth="10%" DayHeaderHeight="20px"
					TitleHeight="22px" DayHeight="18px" DayWidth="16%" BorderColor="Gray" BorderWidth="1px"
					BorderStyle="Solid" YearMonth="5" TitleFormat="Month" MonthFormat="Long" backcolor="#EEEEEE"
					CellSpacing="0" Height="145px" Width="100%" DayAlign="Right" Font-Names="Tahoma" OnOnDayClick="Month1_OnTitleClick" OnOnDayEventAdd="Month1_OnDayEventAdd" OnOnDayEventEdit="Month1_OnDayEventEdit" Align="Left" CalendarID="00000000-0000-0000-0000-000000000000" CellPadding="2" DayFormat="Day" DayHeaderAlign="Center" DayHeaderFormat="Short" DisplayType="DateOnly" EventAddable="True" EventEditable="True" EventHeight="100px" meta:resourcekey="Month17Resource1" SelectedDate="" ShowDayHeader="True" ViewCalendarID="00000000-0000-0000-0000-000000000000" ViewEventDetail="False" Year="2006">
					<SunDayStyle ForeColor="Maroon" BackColor="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunDayStyle>
					<SunHeaderStyle GradientEnd="192, 0, 0"  GradientBegin="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunHeaderStyle>
					<DayStyle ForeColor="Black" GradientLevel="150" Gradient="Right" GradientBegin="224, 224, 224"
						BackColor="White" BorderStyle="NotSet" CssClass=""></DayStyle>
					<SatDayStyle ForeColor="Green" BackColor="PaleGreen" BorderStyle="NotSet" CssClass=""></SatDayStyle>
					<SelectedDayStyle BorderStyle="Solid" GradientEnd="0, 0, 192" BorderWidth="1px" GradientLevel="100"
						Gradient="Left" BorderColor="Navy" GradientBegin="192, 192, 255" CssClass=""></SelectedDayStyle>
					<TodayStyle Font-Size="12px" Font-Bold="True" BorderStyle="Solid" GradientEnd="DarkBlue" BorderWidth="1px"
						ForeColor="White" Gradient="Left" BorderColor="Black" GradientBegin="192, 192, 255" BackColor="SlateBlue" CssClass=""></TodayStyle>
					<EventStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="DarkBlue" CssClass=""></EventStyle>
					<SatHeaderStyle GradientEnd="SeaGreen"  GradientBegin="192, 255, 192" BorderStyle="NotSet" CssClass=""></SatHeaderStyle>
					<DayHeaderStyle ForeColor="Navy" GradientLevel="150" Gradient="Bottom" GradientBegin="192, 192, 255"
						BackColor="192, 192, 255" BorderStyle="NotSet" CssClass=""></DayHeaderStyle>
					<TitleStyle Font-Size="11px" Font-Names="Tahoma" Font-Bold="True" GradientEnd="Gainsboro" BorderWidth="1px"
						ForeColor="White" GradientLevel="150"  BorderColor="Black" GradientBegin="DarkSlateBlue"
						BackColor="LightSteelBlue" BorderStyle="NotSet" CssClass=""></TitleStyle>
                    <EventTextStyle BorderStyle="NotSet" CssClass="" />
                    <TimeStyle BorderStyle="NotSet" CssClass="" />
                    <DayEventStyle BorderStyle="NotSet" CssClass="" />
                    <SatEventStyle BorderStyle="NotSet" CssClass="" />
                    <SunEventStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControlEnterprise:Month></td>
			<td>
				<SmoothEnterpriseWebControlEnterprise:Month id="Month18" runat="server" SunDayWidth="10%" SatDayWidth="10%" DayHeaderHeight="20px"
					TitleHeight="22px" DayHeight="18px" DayWidth="16%" BorderColor="Gray" BorderWidth="1px"
					BorderStyle="Solid" YearMonth="6" TitleFormat="Month" MonthFormat="Long" backcolor="#EEEEEE"
					CellSpacing="0" Height="145px" Width="100%" DayAlign="Right" Font-Names="Tahoma" OnOnDayClick="Month1_OnTitleClick" OnOnDayEventAdd="Month1_OnDayEventAdd" OnOnDayEventEdit="Month1_OnDayEventEdit" Align="Left" CalendarID="00000000-0000-0000-0000-000000000000" CellPadding="2" DayFormat="Day" DayHeaderAlign="Center" DayHeaderFormat="Short" DisplayType="DateOnly" EventAddable="True" EventEditable="True" EventHeight="100px" meta:resourcekey="Month18Resource1" SelectedDate="" ShowDayHeader="True" ViewCalendarID="00000000-0000-0000-0000-000000000000" ViewEventDetail="False" Year="2006">
					<SunDayStyle ForeColor="Maroon" BackColor="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunDayStyle>
					<SunHeaderStyle GradientEnd="192, 0, 0"  GradientBegin="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunHeaderStyle>
					<DayStyle ForeColor="Black" GradientLevel="150" Gradient="Right" GradientBegin="224, 224, 224"
						BackColor="White" BorderStyle="NotSet" CssClass=""></DayStyle>
					<SatDayStyle ForeColor="Green" BackColor="PaleGreen" BorderStyle="NotSet" CssClass=""></SatDayStyle>
					<SelectedDayStyle BorderStyle="Solid" GradientEnd="0, 0, 192" BorderWidth="1px" GradientLevel="100"
						Gradient="Left" BorderColor="Navy" GradientBegin="192, 192, 255" CssClass=""></SelectedDayStyle>
					<TodayStyle Font-Size="12px" Font-Bold="True" BorderStyle="Solid" GradientEnd="DarkBlue" BorderWidth="1px"
						ForeColor="White" Gradient="Left" BorderColor="Black" GradientBegin="192, 192, 255" BackColor="SlateBlue" CssClass=""></TodayStyle>
					<EventStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="DarkBlue" CssClass=""></EventStyle>
					<SatHeaderStyle GradientEnd="SeaGreen"  GradientBegin="192, 255, 192" BorderStyle="NotSet" CssClass=""></SatHeaderStyle>
					<DayHeaderStyle ForeColor="Navy" GradientLevel="150" Gradient="Bottom" GradientBegin="192, 192, 255"
						BackColor="192, 192, 255" BorderStyle="NotSet" CssClass=""></DayHeaderStyle>
					<TitleStyle Font-Size="11px" Font-Names="Tahoma" Font-Bold="True" GradientEnd="Gainsboro" BorderWidth="1px"
						ForeColor="White" GradientLevel="150"  BorderColor="Black" GradientBegin="DarkSlateBlue"
						BackColor="LightSteelBlue" BorderStyle="NotSet" CssClass=""></TitleStyle>
                    <EventTextStyle BorderStyle="NotSet" CssClass="" />
                    <TimeStyle BorderStyle="NotSet" CssClass="" />
                    <DayEventStyle BorderStyle="NotSet" CssClass="" />
                    <SatEventStyle BorderStyle="NotSet" CssClass="" />
                    <SunEventStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControlEnterprise:Month></td>
		</tr>
		<tr>
			<td>
				<SmoothEnterpriseWebControlEnterprise:Month id="Month19" runat="server" SunDayWidth="10%" SatDayWidth="10%" DayHeaderHeight="20px"
					TitleHeight="22px" DayHeight="18px" DayWidth="16%" BorderColor="Gray" BorderWidth="1px"
					BorderStyle="Solid" YearMonth="7" TitleFormat="Month" MonthFormat="Long" backcolor="#EEEEEE"
					CellSpacing="0" Height="145px" Width="100%" DayAlign="Right" Font-Names="Tahoma" OnOnDayClick="Month1_OnTitleClick" OnOnDayEventAdd="Month1_OnDayEventAdd" OnOnDayEventEdit="Month1_OnDayEventEdit" Align="Left" CalendarID="00000000-0000-0000-0000-000000000000" CellPadding="2" DayFormat="Day" DayHeaderAlign="Center" DayHeaderFormat="Short" DisplayType="DateOnly" EventAddable="True" EventEditable="True" EventHeight="100px" meta:resourcekey="Month19Resource1" SelectedDate="" ShowDayHeader="True" ViewCalendarID="00000000-0000-0000-0000-000000000000" ViewEventDetail="False" Year="2006">
					<SunDayStyle ForeColor="Maroon" BackColor="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunDayStyle>
					<SunHeaderStyle GradientEnd="192, 0, 0"  GradientBegin="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunHeaderStyle>
					<DayStyle ForeColor="Black" GradientLevel="150" Gradient="Right" GradientBegin="224, 224, 224"
						BackColor="White" BorderStyle="NotSet" CssClass=""></DayStyle>
					<SatDayStyle ForeColor="Green" BackColor="PaleGreen" BorderStyle="NotSet" CssClass=""></SatDayStyle>
					<SelectedDayStyle BorderStyle="Solid" GradientEnd="0, 0, 192" BorderWidth="1px" GradientLevel="100"
						Gradient="Left" BorderColor="Navy" GradientBegin="192, 192, 255" CssClass=""></SelectedDayStyle>
					<TodayStyle Font-Size="12px" Font-Bold="True" BorderStyle="Solid" GradientEnd="DarkBlue" BorderWidth="1px"
						ForeColor="White" Gradient="Left" BorderColor="Black" GradientBegin="192, 192, 255" BackColor="SlateBlue" CssClass=""></TodayStyle>
					<EventStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="DarkBlue" CssClass=""></EventStyle>
					<SatHeaderStyle GradientEnd="SeaGreen"  GradientBegin="192, 255, 192" BorderStyle="NotSet" CssClass=""></SatHeaderStyle>
					<DayHeaderStyle ForeColor="Navy" GradientLevel="150" Gradient="Bottom" GradientBegin="192, 192, 255"
						BackColor="192, 192, 255" BorderStyle="NotSet" CssClass=""></DayHeaderStyle>
					<TitleStyle Font-Size="11px" Font-Names="Tahoma" Font-Bold="True" GradientEnd="Gainsboro" BorderWidth="1px"
						ForeColor="White" GradientLevel="150"  BorderColor="Black" GradientBegin="DarkSlateBlue"
						BackColor="LightSteelBlue" BorderStyle="NotSet" CssClass=""></TitleStyle>
                    <EventTextStyle BorderStyle="NotSet" CssClass="" />
                    <TimeStyle BorderStyle="NotSet" CssClass="" />
                    <DayEventStyle BorderStyle="NotSet" CssClass="" />
                    <SatEventStyle BorderStyle="NotSet" CssClass="" />
                    <SunEventStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControlEnterprise:Month></td>
			<td>
				<SmoothEnterpriseWebControlEnterprise:Month id="Month20" runat="server" SunDayWidth="10%" SatDayWidth="10%" DayHeaderHeight="20px"
					TitleHeight="22px" DayHeight="18px" DayWidth="16%" BorderColor="Gray" BorderWidth="1px"
					BorderStyle="Solid" YearMonth="8" TitleFormat="Month" MonthFormat="Long" backcolor="#EEEEEE"
					CellSpacing="0" Height="145px" Width="100%" DayAlign="Right" Font-Names="Tahoma" OnOnDayClick="Month1_OnTitleClick" OnOnDayEventAdd="Month1_OnDayEventAdd" OnOnDayEventEdit="Month1_OnDayEventEdit" Align="Left" CalendarID="00000000-0000-0000-0000-000000000000" CellPadding="2" DayFormat="Day" DayHeaderAlign="Center" DayHeaderFormat="Short" DisplayType="DateOnly" EventAddable="True" EventEditable="True" EventHeight="100px" meta:resourcekey="Month20Resource1" SelectedDate="" ShowDayHeader="True" ViewCalendarID="00000000-0000-0000-0000-000000000000" ViewEventDetail="False" Year="2006">
					<SunDayStyle ForeColor="Maroon" BackColor="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunDayStyle>
					<SunHeaderStyle GradientEnd="192, 0, 0"  GradientBegin="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunHeaderStyle>
					<DayStyle ForeColor="Black" GradientLevel="150" Gradient="Right" GradientBegin="224, 224, 224"
						BackColor="White" BorderStyle="NotSet" CssClass=""></DayStyle>
					<SatDayStyle ForeColor="Green" BackColor="PaleGreen" BorderStyle="NotSet" CssClass=""></SatDayStyle>
					<SelectedDayStyle BorderStyle="Solid" GradientEnd="0, 0, 192" BorderWidth="1px" GradientLevel="100"
						Gradient="Left" BorderColor="Navy" GradientBegin="192, 192, 255" CssClass=""></SelectedDayStyle>
					<TodayStyle Font-Size="12px" Font-Bold="True" BorderStyle="Solid" GradientEnd="DarkBlue" BorderWidth="1px"
						ForeColor="White" Gradient="Left" BorderColor="Black" GradientBegin="192, 192, 255" BackColor="SlateBlue" CssClass=""></TodayStyle>
					<EventStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="DarkBlue" CssClass=""></EventStyle>
					<SatHeaderStyle GradientEnd="SeaGreen"  GradientBegin="192, 255, 192" BorderStyle="NotSet" CssClass=""></SatHeaderStyle>
					<DayHeaderStyle ForeColor="Navy" GradientLevel="150" Gradient="Bottom" GradientBegin="192, 192, 255"
						BackColor="192, 192, 255" BorderStyle="NotSet" CssClass=""></DayHeaderStyle>
					<TitleStyle Font-Size="11px" Font-Names="Tahoma" Font-Bold="True" GradientEnd="Gainsboro" BorderWidth="1px"
						ForeColor="White" GradientLevel="150"  BorderColor="Black" GradientBegin="DarkSlateBlue"
						BackColor="LightSteelBlue" BorderStyle="NotSet" CssClass=""></TitleStyle>
                    <EventTextStyle BorderStyle="NotSet" CssClass="" />
                    <TimeStyle BorderStyle="NotSet" CssClass="" />
                    <DayEventStyle BorderStyle="NotSet" CssClass="" />
                    <SatEventStyle BorderStyle="NotSet" CssClass="" />
                    <SunEventStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControlEnterprise:Month></td>
			<td>
				<SmoothEnterpriseWebControlEnterprise:Month id="Month21" runat="server" SunDayWidth="10%" SatDayWidth="10%" DayHeaderHeight="20px"
					TitleHeight="22px" DayHeight="18px" DayWidth="16%" BorderColor="Gray" BorderWidth="1px"
					BorderStyle="Solid" YearMonth="9" TitleFormat="Month" MonthFormat="Long" backcolor="#EEEEEE"
					CellSpacing="0" Height="145px" Width="100%" DayAlign="Right" Font-Names="Tahoma" OnOnDayClick="Month1_OnTitleClick" OnOnDayEventAdd="Month1_OnDayEventAdd" OnOnDayEventEdit="Month1_OnDayEventEdit" Align="Left" CalendarID="00000000-0000-0000-0000-000000000000" CellPadding="2" DayFormat="Day" DayHeaderAlign="Center" DayHeaderFormat="Short" DisplayType="DateOnly" EventAddable="True" EventEditable="True" EventHeight="100px" meta:resourcekey="Month21Resource1" SelectedDate="" ShowDayHeader="True" ViewCalendarID="00000000-0000-0000-0000-000000000000" ViewEventDetail="False" Year="2006">
					<SunDayStyle ForeColor="Maroon" BackColor="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunDayStyle>
					<SunHeaderStyle GradientEnd="192, 0, 0"  GradientBegin="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunHeaderStyle>
					<DayStyle ForeColor="Black" GradientLevel="150" Gradient="Right" GradientBegin="224, 224, 224"
						BackColor="White" BorderStyle="NotSet" CssClass=""></DayStyle>
					<SatDayStyle ForeColor="Green" BackColor="PaleGreen" BorderStyle="NotSet" CssClass=""></SatDayStyle>
					<SelectedDayStyle BorderStyle="Solid" GradientEnd="0, 0, 192" BorderWidth="1px" GradientLevel="100"
						Gradient="Left" BorderColor="Navy" GradientBegin="192, 192, 255" CssClass=""></SelectedDayStyle>
					<TodayStyle Font-Size="12px" Font-Bold="True" BorderStyle="Solid" GradientEnd="DarkBlue" BorderWidth="1px"
						ForeColor="White" Gradient="Left" BorderColor="Black" GradientBegin="192, 192, 255" BackColor="SlateBlue" CssClass=""></TodayStyle>
					<EventStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="DarkBlue" CssClass=""></EventStyle>
					<SatHeaderStyle GradientEnd="SeaGreen"  GradientBegin="192, 255, 192" BorderStyle="NotSet" CssClass=""></SatHeaderStyle>
					<DayHeaderStyle ForeColor="Navy" GradientLevel="150" Gradient="Bottom" GradientBegin="192, 192, 255"
						BackColor="192, 192, 255" BorderStyle="NotSet" CssClass=""></DayHeaderStyle>
					<TitleStyle Font-Size="11px" Font-Names="Tahoma" Font-Bold="True" GradientEnd="Gainsboro" BorderWidth="1px"
						ForeColor="White" GradientLevel="150"  BorderColor="Black" GradientBegin="DarkSlateBlue"
						BackColor="LightSteelBlue" BorderStyle="NotSet" CssClass=""></TitleStyle>
                    <EventTextStyle BorderStyle="NotSet" CssClass="" />
                    <TimeStyle BorderStyle="NotSet" CssClass="" />
                    <DayEventStyle BorderStyle="NotSet" CssClass="" />
                    <SatEventStyle BorderStyle="NotSet" CssClass="" />
                    <SunEventStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControlEnterprise:Month></td>
		</tr>
		<tr>
			<td>
				<SmoothEnterpriseWebControlEnterprise:Month id="Month22" runat="server" SunDayWidth="10%" SatDayWidth="10%" DayHeaderHeight="20px"
					TitleHeight="22px" DayHeight="18px" DayWidth="16%" BorderColor="Gray" BorderWidth="1px"
					BorderStyle="Solid" YearMonth="10" TitleFormat="Month" MonthFormat="Long" backcolor="#EEEEEE"
					CellSpacing="0" Height="145px" Width="100%" DayAlign="Right" Font-Names="Tahoma" OnOnDayClick="Month1_OnTitleClick" OnOnDayEventAdd="Month1_OnDayEventAdd" OnOnDayEventEdit="Month1_OnDayEventEdit" Align="Left" CalendarID="00000000-0000-0000-0000-000000000000" CellPadding="2" DayFormat="Day" DayHeaderAlign="Center" DayHeaderFormat="Short" DisplayType="DateOnly" EventAddable="True" EventEditable="True" EventHeight="100px" meta:resourcekey="Month22Resource1" SelectedDate="" ShowDayHeader="True" ViewCalendarID="00000000-0000-0000-0000-000000000000" ViewEventDetail="False" Year="2006">
					<SunDayStyle ForeColor="Maroon" BackColor="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunDayStyle>
					<SunHeaderStyle GradientEnd="192, 0, 0"  GradientBegin="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunHeaderStyle>
					<DayStyle ForeColor="Black" GradientLevel="150" Gradient="Right" GradientBegin="224, 224, 224"
						BackColor="White" BorderStyle="NotSet" CssClass=""></DayStyle>
					<SatDayStyle ForeColor="Green" BackColor="PaleGreen" BorderStyle="NotSet" CssClass=""></SatDayStyle>
					<SelectedDayStyle BorderStyle="Solid" GradientEnd="0, 0, 192" BorderWidth="1px" GradientLevel="100"
						Gradient="Left" BorderColor="Navy" GradientBegin="192, 192, 255" CssClass=""></SelectedDayStyle>
					<TodayStyle Font-Size="12px" Font-Bold="True" BorderStyle="Solid" GradientEnd="DarkBlue" BorderWidth="1px"
						ForeColor="White" Gradient="Left" BorderColor="Black" GradientBegin="192, 192, 255" BackColor="SlateBlue" CssClass=""></TodayStyle>
					<EventStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="DarkBlue" CssClass=""></EventStyle>
					<SatHeaderStyle GradientEnd="SeaGreen"  GradientBegin="192, 255, 192" BorderStyle="NotSet" CssClass=""></SatHeaderStyle>
					<DayHeaderStyle ForeColor="Navy" GradientLevel="150" Gradient="Bottom" GradientBegin="192, 192, 255"
						BackColor="192, 192, 255" BorderStyle="NotSet" CssClass=""></DayHeaderStyle>
					<TitleStyle Font-Size="11px" Font-Names="Tahoma" Font-Bold="True" GradientEnd="Gainsboro" BorderWidth="1px"
						ForeColor="White" GradientLevel="150"  BorderColor="Black" GradientBegin="DarkSlateBlue"
						BackColor="LightSteelBlue" BorderStyle="NotSet" CssClass=""></TitleStyle>
                    <EventTextStyle BorderStyle="NotSet" CssClass="" />
                    <TimeStyle BorderStyle="NotSet" CssClass="" />
                    <DayEventStyle BorderStyle="NotSet" CssClass="" />
                    <SatEventStyle BorderStyle="NotSet" CssClass="" />
                    <SunEventStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControlEnterprise:Month></td>
			<td>
				<SmoothEnterpriseWebControlEnterprise:Month id="Month23" runat="server" SunDayWidth="10%" SatDayWidth="10%" DayHeaderHeight="20px"
					TitleHeight="22px" DayHeight="18px" DayWidth="16%" BorderColor="Gray" BorderWidth="1px"
					BorderStyle="Solid" YearMonth="11" TitleFormat="Month" MonthFormat="Long" backcolor="#EEEEEE"
					CellSpacing="0" Height="145px" Width="100%" DayAlign="Right" Font-Names="Tahoma" OnOnDayClick="Month1_OnTitleClick" OnOnDayEventAdd="Month1_OnDayEventAdd" OnOnDayEventEdit="Month1_OnDayEventEdit" Align="Left" CalendarID="00000000-0000-0000-0000-000000000000" CellPadding="2" DayFormat="Day" DayHeaderAlign="Center" DayHeaderFormat="Short" DisplayType="DateOnly" EventAddable="True" EventEditable="True" EventHeight="100px" meta:resourcekey="Month23Resource1" SelectedDate="" ShowDayHeader="True" ViewCalendarID="00000000-0000-0000-0000-000000000000" ViewEventDetail="False" Year="2006">
					<SunDayStyle ForeColor="Maroon" BackColor="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunDayStyle>
					<SunHeaderStyle GradientEnd="192, 0, 0"  GradientBegin="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunHeaderStyle>
					<DayStyle ForeColor="Black" GradientLevel="150" Gradient="Right" GradientBegin="224, 224, 224"
						BackColor="White" BorderStyle="NotSet" CssClass=""></DayStyle>
					<SatDayStyle ForeColor="Green" BackColor="PaleGreen" BorderStyle="NotSet" CssClass=""></SatDayStyle>
					<SelectedDayStyle BorderStyle="Solid" GradientEnd="0, 0, 192" BorderWidth="1px" GradientLevel="100"
						Gradient="Left" BorderColor="Navy" GradientBegin="192, 192, 255" CssClass=""></SelectedDayStyle>
					<TodayStyle Font-Size="12px" Font-Bold="True" BorderStyle="Solid" GradientEnd="DarkBlue" BorderWidth="1px"
						ForeColor="White" Gradient="Left" BorderColor="Black" GradientBegin="192, 192, 255" BackColor="SlateBlue" CssClass=""></TodayStyle>
					<EventStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="DarkBlue" CssClass=""></EventStyle>
					<SatHeaderStyle GradientEnd="SeaGreen"  GradientBegin="192, 255, 192" BorderStyle="NotSet" CssClass=""></SatHeaderStyle>
					<DayHeaderStyle ForeColor="Navy" GradientLevel="150" Gradient="Bottom" GradientBegin="192, 192, 255"
						BackColor="192, 192, 255" BorderStyle="NotSet" CssClass=""></DayHeaderStyle>
					<TitleStyle Font-Size="11px" Font-Names="Tahoma" Font-Bold="True" GradientEnd="Gainsboro" BorderWidth="1px"
						ForeColor="White" GradientLevel="150"  BorderColor="Black" GradientBegin="DarkSlateBlue"
						BackColor="LightSteelBlue" BorderStyle="NotSet" CssClass=""></TitleStyle>
                    <EventTextStyle BorderStyle="NotSet" CssClass="" />
                    <TimeStyle BorderStyle="NotSet" CssClass="" />
                    <DayEventStyle BorderStyle="NotSet" CssClass="" />
                    <SatEventStyle BorderStyle="NotSet" CssClass="" />
                    <SunEventStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControlEnterprise:Month></td>
			<td>
				<SmoothEnterpriseWebControlEnterprise:Month id="Month24" runat="server" SunDayWidth="10%" SatDayWidth="10%" DayHeaderHeight="20px"
					TitleHeight="22px" DayHeight="18px" DayWidth="16%" BorderColor="Gray" BorderWidth="1px"
					BorderStyle="Solid" YearMonth="12" TitleFormat="Month" MonthFormat="Long" backcolor="#EEEEEE"
					CellSpacing="0" Height="145px" Width="100%" DayAlign="Right" Font-Names="Tahoma" OnOnDayClick="Month1_OnTitleClick" OnOnDayEventAdd="Month1_OnDayEventAdd" OnOnDayEventEdit="Month1_OnDayEventEdit" Align="Left" CalendarID="00000000-0000-0000-0000-000000000000" CellPadding="2" DayFormat="Day" DayHeaderAlign="Center" DayHeaderFormat="Short" DisplayType="DateOnly" EventAddable="True" EventEditable="True" EventHeight="100px" meta:resourcekey="Month24Resource1" SelectedDate="" ShowDayHeader="True" ViewCalendarID="00000000-0000-0000-0000-000000000000" ViewEventDetail="False" Year="2006">
					<SunDayStyle ForeColor="Maroon" BackColor="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunDayStyle>
					<SunHeaderStyle GradientEnd="192, 0, 0"  GradientBegin="255, 192, 192" BorderStyle="NotSet" CssClass=""></SunHeaderStyle>
					<DayStyle ForeColor="Black" GradientLevel="150" Gradient="Right" GradientBegin="224, 224, 224"
						BackColor="White" BorderStyle="NotSet" CssClass=""></DayStyle>
					<SatDayStyle ForeColor="Green" BackColor="PaleGreen" BorderStyle="NotSet" CssClass=""></SatDayStyle>
					<SelectedDayStyle BorderStyle="Solid" GradientEnd="0, 0, 192" BorderWidth="1px" GradientLevel="100"
						Gradient="Left" BorderColor="Navy" GradientBegin="192, 192, 255" CssClass=""></SelectedDayStyle>
					<TodayStyle Font-Size="12px" Font-Bold="True" BorderStyle="Solid" GradientEnd="DarkBlue" BorderWidth="1px"
						ForeColor="White" Gradient="Left" BorderColor="Black" GradientBegin="192, 192, 255" BackColor="SlateBlue" CssClass=""></TodayStyle>
					<EventStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="DarkBlue" CssClass=""></EventStyle>
					<SatHeaderStyle GradientEnd="SeaGreen"  GradientBegin="192, 255, 192" BorderStyle="NotSet" CssClass=""></SatHeaderStyle>
					<DayHeaderStyle ForeColor="Navy" GradientLevel="150" Gradient="Bottom" GradientBegin="192, 192, 255"
						BackColor="192, 192, 255" BorderStyle="NotSet" CssClass=""></DayHeaderStyle>
					<TitleStyle Font-Size="11px" Font-Names="Tahoma" Font-Bold="True" GradientEnd="Gainsboro" BorderWidth="1px"
						ForeColor="White" GradientLevel="150"  BorderColor="Black" GradientBegin="DarkSlateBlue"
						BackColor="LightSteelBlue" BorderStyle="NotSet" CssClass=""></TitleStyle>
                    <EventTextStyle BorderStyle="NotSet" CssClass="" />
                    <TimeStyle BorderStyle="NotSet" CssClass="" />
                    <DayEventStyle BorderStyle="NotSet" CssClass="" />
                    <SatEventStyle BorderStyle="NotSet" CssClass="" />
                    <SunEventStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControlEnterprise:Month></td>
		</tr>
	</table>
</asp:Content>
