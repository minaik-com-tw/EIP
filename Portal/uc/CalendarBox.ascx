<%@ control language="C#" autoeventwireup="true" inherits="uc_CalendarBox, App_Web_calendarbox.ascx.50d77b3" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Calendar, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Calendar.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<SmoothEnterpriseWebControlEnterprise:Month ID="Month1" runat="server" BackColor="Gainsboro"
    BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" DayAlign="Right" DayHeaderHeight="20px"
    DayWidth="24px" Font-Names="Tahoma" MonthFormat="Long" OnOnDayEventEdit="Month1_OnDayEventEdit"
    TitleHeight="22px" Width="182px">
    <EventTextStyle BorderStyle="NotSet" CssClass="" />
    <EventStyle BorderColor="64, 64, 64" BorderStyle="Solid" BorderWidth="2px" CssClass=""
        GradientLevel="100" />
    <TimeStyle BorderStyle="NotSet" CssClass="" />
    <DayStyle BackColor="White" BorderStyle="NotSet" CssClass="" Gradient="Right" GradientBegin="224, 224, 224"
        GradientLevel="150" />
    <TitleStyle BackColor="LightSteelBlue" BorderColor="Black" BorderStyle="NotSet" BorderWidth="1px"
        CssClass="" Font-Bold="True" Font-Names="Tahoma" Font-Size="11px" ForeColor="White"
        Gradient="Top" GradientBegin="DarkSlateBlue" GradientEnd="Gainsboro" GradientLevel="150" />
    <DayEventStyle BorderStyle="NotSet" CssClass="" />
    <DayHeaderStyle BackColor="192, 192, 255" BorderStyle="NotSet" CssClass="" ForeColor="Navy"
        Gradient="Bottom" GradientBegin="192, 192, 255" GradientLevel="150" />
    <SatEventStyle BorderStyle="NotSet" CssClass="" />
    <TodayStyle BackColor="SlateBlue" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"
        CssClass="" Font-Bold="True" Font-Size="12px" ForeColor="White" Gradient="Left"
        GradientBegin="192, 192, 255" GradientEnd="DarkBlue" />
    <SunDayStyle BackColor="255, 192, 192" BorderStyle="NotSet" CssClass="" ForeColor="Maroon" />
    <SelectedDayStyle BorderStyle="NotSet" CssClass="" />
    <SunEventStyle BorderStyle="NotSet" CssClass="" />
    <SunHeaderStyle BorderStyle="NotSet" CssClass="" Gradient="Top" GradientBegin="255, 192, 192"
        GradientEnd="192, 0, 0" />
    <SatHeaderStyle BorderStyle="NotSet" CssClass="" Gradient="Top" GradientBegin="192, 255, 192"
        GradientEnd="SeaGreen" />
    <SatDayStyle BackColor="PaleGreen" BorderStyle="NotSet" CssClass="" ForeColor="Green" />
</SmoothEnterpriseWebControlEnterprise:Month>
