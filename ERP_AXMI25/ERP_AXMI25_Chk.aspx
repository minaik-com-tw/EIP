<%@ Page Language="C#" MasterPageFile="~/_site/layout/ie7.master" AutoEventWireup="true" CodeFile="ERP_AXMI25_Chk.aspx.cs" Inherits="CNE.CNEChk" StylesheetTheme="Default" Culture="Auto" UICulture="Auto" %>


<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <%--<script type="text/javascript" src="js/jquery.min.js"></script>--%>
    <script language="javascript" type="text/javascript">

        function chk() {

            var isPass = true;
            var sDt = $("#ctl00_ContentPlaceHolder1_txt_sDt").val();
            var eDt = $("#ctl00_ContentPlaceHolder1_txt_eDt").val();

            //if (eDt == "" || eDt == null) {
            //    alert("請輸入申請日（終）");
            //    isPass = false;
            //}

            return isPass;
        }
        function send() {
            var r = confirm("拋轉xml???");
            return r;
        }

    </script>
    <asp:ScriptManager ID="ScriptManager" runat="server">
    </asp:ScriptManager>

    <div style="color: red">ERP 的OCC 必需是最新的資料，所以，批次更新，需要由舊的開始。</div>
    <table border="0">
        <tr class="NormalBold">
            <td align="center" style="background-color: #f0f0f0;">
                <asp:Label ID="Label5" runat="server" Text="申請日期(起)"></asp:Label></td>
            <td align="center" style="background-color: #f0f0f0;">
                <asp:Label ID="Label3" runat="server" Text="申請日期(迄)"></asp:Label></td>

            <td align="center" style="background-color: #f0f0f0;">
                <asp:Label ID="Label1" runat="server" Text="客戶代號"></asp:Label></td>
            <td><a href="http://eip.minaik.com.tw/ERP_AXMI25/ERP_AXMI25.aspx" target="_blank">客戶電子代號E化系統 </a>
            </td>

        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="txt_sDt" runat="server" FormatType="Date"
                    BackColor="#F0F0F0" CssClass="Normal">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText></td>

            <td>
                <SmoothEnterpriseWebControl:InputText ID="txt_eDt" runat="server" FormatType="Date"
                    BackColor="#F0F0F0" CssClass="Normal">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td>
                <asp:TextBox ID="custmer" runat="server"></asp:TextBox>
            </td>

            <td>
                <%--<SmoothEnterpriseWebControl:InputButton id="BUTTON_add" runat="server" Text="新增" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_add_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>--%>
                <SmoothEnterpriseWebControl:InputButton ID="btn_Qty" runat="server" Text="搜尋" Width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="btn_Qty_Click">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
            </td>

            <td>
                <%--<SmoothEnterpriseWebControl:InputButton id="BUTTON_add" runat="server" Text="新增" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_add_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>--%>
                <asp:Button ID="btn_OutXml" runat="server" OnClick="btn_OutXml_Click" OnClientClick="return send()" Text="重拋xml" />
            </td>

        </tr>


    </table>
    <asp:UpdatePanel runat="server" ID="up_list" UpdateMode="Conditional" ChildrenAsTriggers="true">
        <ContentTemplate>
            <asp:Label ID="lab_count" runat="server"></asp:Label><br />
            <asp:Label ID="lab_current" runat="server"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
    <font color='#009393'>欄位</font>
    <br>
    <font color="red">EIP</font>
    <br />
    <font color="#484891">ERP</font>

    <p style="background-color: #81c0c0; color: #ff6a00"><b><%=Error %></b></p>

    <%=Show %>
</asp:Content>
