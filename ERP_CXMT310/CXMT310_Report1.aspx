<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="CXMT310_Report1.aspx.cs" Inherits="CXMT310_Report1" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>

<%@ Register Assembly="CrystalDecisions.Web, Version=10.2.3600.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
        <Report FileName="ERP_CXMT310\CXMT310_Report1.rpt">
        </Report>
    </CR:CrystalReportSource>
    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true"
        ReportSourceID="CrystalReportSource1" />
</asp:Content>

