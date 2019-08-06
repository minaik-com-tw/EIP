<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Calendar.MyMonth, App_Web_mymonth.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

<%@ Register Src="uc/CalendarNavigator.ascx" TagName="CalendarNavigator" TagPrefix="uc1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Calendar, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Calendar.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<uc1:CalendarNavigator ID="CalendarNavigator1" runat="server" />
	<SmoothEnterpriseWebControlEnterprise:MONTH id="Month1" runat="server" ViewCalendarID="00000000-0000-0000-0000-000000000000"
		CalendarID="00000000-0000-0000-0000-000000000000" EventAddAble="True" ShowTitle="False" DayHeaderAlign="Left" SelectedDate="2005-05-19" backcolor="White" YearMonth="7" TitleHeight="22px"
		TitleFormat="YearMonth" MonthFormat="Long" DayHeaderFormat="Long" CellSpacing="1" DayHeaderHeight="18px" DayAlign="Left" DisplayType="DateEvent" DayFormat="MonthDay" SatDayWidth="10%" SunDayWidth="10%"
		DayWidth="16%" EventHeight="30px" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="White" Width="100%" OnOnDailyView="Month1_OnDailyView" OnOnDayEventAdd="Month1_OnDayEventAdd" OnOnDayEventEdit="Month1_OnDayEventEdit" Align="Left" CellPadding="2" DayHeight="18px" EventEditable="True" meta:resourcekey="Month1Resource1" ShowDayHeader="True" ViewEventDetail="False" Year="2006">
		<SunDayStyle GradientEnd="255, 128, 128" ForeColor="Maroon" GradientLevel="100" Gradient="Left"
			GradientBegin="255, 192, 192" BackColor="MistyRose" BorderStyle="NotSet" CssClass=""></SunDayStyle>
		<SatHeaderStyle Font-Bold="True" GradientEnd="LightGreen" ForeColor="White" GradientLevel="150"
			Gradient="Left" GradientBegin="0, 64, 64" BackColor="SeaGreen" BorderStyle="NotSet" CssClass=""></SatHeaderStyle>
		<SelectedDayStyle BackColor="192, 255, 192" BorderStyle="NotSet" CssClass=""></SelectedDayStyle>
		<EventStyle BorderStyle="Solid" GradientEnd="White" BorderWidth="0px" GradientLevel="120" BorderColor="Lavender"
			PaddingSize="0px" GradientBegin="Gold" BackColor="White" CssClass=""></EventStyle>
		<SunEventStyle GradientEnd="MistyRose" GradientLevel="100" Gradient="Left" PaddingSize="0px" GradientBegin="255, 160, 160"
			BackColor="White" BorderStyle="NotSet" CssClass=""></SunEventStyle>
		<TodayStyle Font-Bold="True" BorderStyle="Solid" GradientEnd="192, 64, 0" BorderWidth="1px"
			ForeColor="Transparent" GradientLevel="100" Gradient="Left" BorderColor="OrangeRed" GradientBegin="255, 224, 192"
			BackColor="PeachPuff" CssClass=""></TodayStyle>
		<TitleStyle Font-Size="14pt" Font-Bold="True" ForeColor="Black"  BackColor="207, 218, 229" BorderStyle="NotSet" CssClass=""></TitleStyle>
		<EventTextStyle Font-Size="11px" Font-Names="Tahoma" ForeColor="Black" GradientLevel="50" BorderColor="Black" BorderStyle="NotSet" CssClass=""></EventTextStyle>
		<DayHeaderStyle Font-Size="11px" Font-Names="Tahoma" Font-Bold="True" GradientEnd="LightBlue" ForeColor="White"
			GradientLevel="200" Gradient="Left" GradientBegin="MidnightBlue" BackColor="CornflowerBlue" BorderStyle="NotSet" CssClass=""></DayHeaderStyle>
		<SatEventStyle GradientLevel="155" Gradient="Left" PaddingSize="0px" GradientBegin="192, 255, 192"
			BackColor="White" BorderStyle="NotSet" CssClass=""></SatEventStyle>
		<TimeStyle Font-Size="9px" Font-Names="Arial" Font-Bold="True" BorderStyle="Solid" GradientEnd="255, 255, 192"
			BorderWidth="1px" ForeColor="WhiteSmoke" GradientLevel="200" Gradient="Left" BorderColor="Black"
			PaddingSize="0px" GradientBegin="Gold" BackColor="ControlDarkDark" CssClass=""></TimeStyle>
		<DayStyle Font-Bold="True" GradientEnd="LightSteelBlue" ForeColor="SteelBlue" GradientLevel="150"
			Gradient="Left" GradientBegin="Lavender" BackColor="233, 238, 243" BorderStyle="NotSet" CssClass=""></DayStyle>
		<SunHeaderStyle GradientEnd="LightCoral" ForeColor="White" GradientLevel="150" Gradient="Left" GradientBegin="DarkRed"
			BackColor="Maroon" BorderStyle="NotSet" CssClass=""></SunHeaderStyle>
		<SatDayStyle GradientEnd="MediumSeaGreen" ForeColor="SeaGreen" Gradient="Left" GradientBegin="192, 255, 192"
			BackColor="192, 255, 192" BorderStyle="NotSet" CssClass=""></SatDayStyle>
        <DayEventStyle BorderStyle="NotSet" CssClass="" />
	</SmoothEnterpriseWebControlEnterprise:MONTH>
	<table border="0">
		<TR>
			<TD Class="NormalBold">
			    <asp:Label ID="LABEL_viewtype" runat="server" Text="事件檢視形式" meta:resourcekey="LABEL_viewtypeResource1"></asp:Label></TD>
			<TD><SmoothEnterpriseWebControl:CHECKBOXLIST id="CheckBoxList1" runat="server" Width="128px" cssClass="Normal" Column="2" CheckMode="SingleRadio" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged" meta:resourcekey="CheckBoxList1Resource1" Value="Name">
					<GroupHeaderStyle Font-Bold="True" GradientEnd="192, 192, 0" ForeColor="White" GradientLevel="100"
						Gradient="Right" BorderColor="192, 192, 0" BackColor="Gray" BorderStyle="NotSet" CssClass=""></GroupHeaderStyle>
					<Items>
						<SmoothEnterpriseWebControl:CheckBoxListItem Selected="True" Text="一般" Description="" Value="Name" GroupText="" meta:resourcekey="CheckBoxListItem1_viewtypeResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
						<SmoothEnterpriseWebControl:CheckBoxListItem Selected="False" Text="詳細" Description="" Value="Details" GroupText="" meta:resourcekey="CheckBoxListItem2_viewtypeResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
					</Items>
                <DescriptionStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControl:CHECKBOXLIST></TD>
		</TR>
	</table>
    
</asp:Content>
