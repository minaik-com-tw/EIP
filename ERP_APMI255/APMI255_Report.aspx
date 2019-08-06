<%@ Page Language="C#" MasterPageFile="~/_site/layout/Program.master" AutoEventWireup="true" CodeFile="APMI255_Report.aspx.cs" Inherits="APMI255_Report" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>


<%@ Register Assembly="CrystalDecisions.Web, Version=10.2.3600.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp;<CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
        <Report FileName="ERP_APMI255\APMI255_CrystalReport.rpt">
        </Report>
    </CR:CrystalReportSource>
    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true"
        ReportSourceID="CrystalReportSource1" DisplayToolbar="False" Height="50px" Width="350px" />
</asp:Content>

