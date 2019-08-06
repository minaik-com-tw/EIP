<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="Shipment_Print.aspx.cs" Inherits="EMP_ADDReport" StylesheetTheme="Default" Culture="Auto" UICulture="Auto" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=10.2.3600.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<header>
    <script type="text/javascript">
        function confirm() {
            
            var attn = $("#ctl00_ContentPlaceHolder1_QUERY_Attn").val();

            var cartno1 = $("#ctl00_ContentPlaceHolder1_QUERY_CARTNO1").val();
            var pcs1 = $("#ctl00_ContentPlaceHolder1_QUERY_PCS1").val();
            var cartno2 = $("#ctl00_ContentPlaceHolder1_QUERY_CARTNO2").val();
            var pcs2 = $("#ctl00_ContentPlaceHolder1_QUERY_PCS2").val();


            
            if (attn.length > 60)
            {
                alert("attn string length limit is 60 ");
                return false;
            }


            if (isNaN(cartno1) || isNaN(pcs1) || isNaN(cartno2) || isNaN(pcs2))
            {
                alert("叫浪琩块计琌Τ粇");
                return false;
            }
            
            

            return true;
            
        }
    </script>

    
</header>
    <table border="0">
        <tr>
            <td style="width: 100px">
                <asp:Label ID="Label1" runat="server" CssClass="NormalBold" meta:resourcekey="Label3Resource1"
                    Text="Item"></asp:Label></td>
            <td style="width: 100px">
                <asp:Label ID="Label3" runat="server" CssClass="NormalBold" meta:resourcekey="Label3Resource1"
                    Text="俱絚絚计"></asp:Label></td>
            <td style="width: 100px">
                <asp:Label ID="LABEL_EMP_NO" runat="server" CssClass="NormalBold" meta:resourcekey="LABEL_EMP_NOResource1"
                    Text="俱絚计秖"></asp:Label></td>
            <td style="width: 100px">
                <asp:Label ID="Label2" runat="server" CssClass="NormalBold" meta:resourcekey="Label3Resource1"
                    Text="緇絚絚计"></asp:Label></td>
            <td style="width: 100px">
                <asp:Label ID="Label4" runat="server" CssClass="NormalBold" meta:resourcekey="LABEL_EMP_NOResource1"
                    Text="緇絚计秖"></asp:Label></td>
            <td style="width: 100px">
                <asp:Label ID="Label5" runat="server" CssClass="NormalBold" meta:resourcekey="LABEL_EMP_NOResource1"
                    Text="Attn to"></asp:Label></td>
            <td style="width: 100px"></td>
        </tr>
        <tr>
            <td style="width: 100px; height: 25px">&nbsp;<SmoothEnterpriseWebControl:InputText ID="QUERY_ITEM" runat="server" BackColor="#F0F0F0"
                CssClass="Normal" Width="90px">
                <ErrorStyle BorderStyle="NotSet" />
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 100px; height: 25px">&nbsp;<SmoothEnterpriseWebControl:InputText ID="QUERY_CARTNO1" runat="server" BackColor="#F0F0F0"
                CssClass="Normal" Width="90px">
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 100px; height: 25px">&nbsp;<SmoothEnterpriseWebControl:InputText ID="QUERY_PCS1" runat="server" BackColor="#F0F0F0"
                CssClass="Normal" Width="90px">
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 100px; height: 25px">
                <SmoothEnterpriseWebControl:InputText ID="QUERY_CARTNO2" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" Width="90px">
                    <ErrorStyle BorderStyle="NotSet" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 100px; height: 25px">
                <SmoothEnterpriseWebControl:InputText ID="QUERY_PCS2" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" Width="90px">
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 100px; height: 25px">
                <SmoothEnterpriseWebControl:InputText ID="QUERY_Attn" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" Width="90px"  >
                    <ErrorStyle BorderStyle="NotSet" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 100px; height: 25px">
                <SmoothEnterpriseWebControl:InputButton ID="InputButton1" runat="server" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold"
                    Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="InputButton1_Click" Text="癳" OnClientClick="return  confirm()" >
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom"></Gradient>
                </SmoothEnterpriseWebControl:InputButton>
            </td>
        </tr>
    </table>
    <br />
     
      <div>
        <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
            <Report FileName="shipment_print.rpt">
            </Report>
        </CR:CrystalReportSource>
    
    </div>
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true"
            ReportSourceID="CrystalReportSource1" />
    
</asp:Content>

