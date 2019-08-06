<%@ page language="C#" masterpagefile="~/_site/layout/Program.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Content.PaintViewCount, App_Web_paintviewcount.aspx.cdcab7d2" title="ÂsÄý²Î­pªí" theme="Default" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl.Chart" TagPrefix="SmoothEnterpriseWebControl" %>      
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<SmoothEnterpriseWebControl:BarChart id="BarChart1" runat="server" BorderWidth="1" BorderStyle="Solid" Height="150" Width="80"
		BackColor="White">
		<Gradient GradientEnd="" GradientBegin=""></Gradient>
		<BarStyle Font-Size="Small" BackColor="Blue"></BarStyle>
	</SmoothEnterpriseWebControl:BarChart>
	<SmoothEnterpriseWebControl:PieChart id="PieChart1" runat="server" BorderWidth="1" BorderStyle="Solid" Height="200px"
		Width="200px">
		<PieStyle Font-Size="Small"></PieStyle>
	</SmoothEnterpriseWebControl:PieChart>
</asp:Content>
