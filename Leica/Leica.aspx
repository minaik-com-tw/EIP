<%@ Page Title="" Language="C#" MasterPageFile="~/_site/layout/ie_Edge.master" AutoEventWireup="true" CodeFile="Leica.aspx.cs" Inherits="Leica_Leica" Debug="true" StylesheetTheme="Edge"
    Culture="Auto" UICulture="Auto" meta:resourceKey="Page" %>



<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server"
        Details="PCN Base Setting" Caption="PCN Option setting" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
        <CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <header>
        <script src="../js/8D.js"></script>
        <link href="../js/8d.css" rel="stylesheet" />
        <script>


            function chkDatas() {
                var pass = true;
                var sDt = $("#ContentPlaceHolder1_txt_sDt").val();
                var eDt = $("#ContentPlaceHolder1_txt_eDt").val();
                var myStartDate = new Date(sDt);
                var myEndDate = new Date(eDt);

                // 天數，86400000是24*60*60*1000，除以86400000就是有幾天
                var day = (myEndDate - myStartDate) / 86400000;
                if (day > 31) {
                    alert("查詢日期期間請勿超出一個月");
                    pass = false;
                }

                return pass;
            }
        </script>
        <style>
          #seach .td {
                border: 1px solid #808080
            }
        </style>

    </header>


    <asp:HiddenField ID="msg" Value="" runat="server" />
    <div id="seach" class="tb1 all" style="margin: 10px">
        <div class="tr">
            <div class="th">
            </div>
            <div class="td"></div>
            <div class="th"></div>
            <div class="td"></div>
        </div>
        <div class="tr">
            <div class="th"></div>
            <div class="td"></div>
            <div class="th"></div>
            <div class="td"></div>
            <div class="th"></div>
            <div class="td"></div>
        </div>
        <div class="tr">
            <div class="th"></div>
            <div class="td"></div>
            <div class="th"></div>
            <div class="td"></div>
            <div class="th"></div>
            <div class="td"></div>
        </div>
      
    </div>
    <div class="tb1 all" style="margin: 10px">
          <div class="tr">
            <div class="td" style="width:100%;text-align:right">
                <asp:Button ID="btn_query" runat="server" Text="Query" />
                <asp:Button ID="btn_add" runat="server" Text="add" OnClientClick="return Nomarl.goto('LeicaAdd.aspx')" />

            </div>
        </div>
    </div>
    <div style="border-top: 2px solid #D1AC43; padding-top: 20px;">

        <SmoothEnterpriseWebControl:DataList ID="DataList1" runat="server" BorderColor="#BFD1E5" RowNumber="True" RowAlign="Middle"
            NavigatorPos="Bottom" HeaderPos="Top" HeaderAlign="Middle" EnablePrint="True" EnableExport="True" Width="100%"
            CellPadding="3px" BorderWidth="1px" BorderStyle="Solid" HeaderHeight="30px" Font-Names="Arial" Font-Size="Small"
            Personalize="True" OnOnRenderCell="DataList1_OnRenderCell">
            <Columns>
                <SmoothEnterpriseWebControl:DataColumn ID="id" DataType="ViewText" Caption="id" DataName="rowid" Visible="false"></SmoothEnterpriseWebControl:DataColumn>
                <SmoothEnterpriseWebControl:DataColumn ID="edit" Width="1%" DataAlign="Center" Caption="Edit" DataType="UserDefined"></SmoothEnterpriseWebControl:DataColumn>
                <SmoothEnterpriseWebControl:DataColumn ID="view" Width="1%" DataAlign="Center" Caption="View" DataType="UserDefined"></SmoothEnterpriseWebControl:DataColumn>

                <SmoothEnterpriseWebControl:DataColumn ID="dcc" Width="80" DataType="ViewText" Caption="DCC No" DataName="dcc_no" Sortable="true"></SmoothEnterpriseWebControl:DataColumn>
                <SmoothEnterpriseWebControl:DataColumn ID="exception" Width="105" meta:resourcekey="exception" DataType="ViewText" Caption="exception" DataName="exception" Sortable="true"></SmoothEnterpriseWebControl:DataColumn>
                <SmoothEnterpriseWebControl:DataColumn ID="init_date" Width="75" meta:resourcekey="init_dt" DataType="ViewText" Caption="init_date" DataName="init_date" Sortable="true"></SmoothEnterpriseWebControl:DataColumn>
                <SmoothEnterpriseWebControl:DataColumn ID="status" Width="65" meta:resourcekey="status2" DataType="ViewText" Caption="status" DataName="status"></SmoothEnterpriseWebControl:DataColumn>
                <SmoothEnterpriseWebControl:DataColumn ID="verify" Width="65" meta:resourcekey="verify" DataType="ViewText" Caption="verify" DataName="verify"></SmoothEnterpriseWebControl:DataColumn>
                <SmoothEnterpriseWebControl:DataColumn ID="coustomer" Width="65" meta:resourcekey="coustomer" DataType="ViewText" Caption="coustomer" DataName="coustomer"></SmoothEnterpriseWebControl:DataColumn>
                <SmoothEnterpriseWebControl:DataColumn ID="product" Width="65" meta:resourcekey="product" DataType="ViewText" Caption="product" DataName="product"></SmoothEnterpriseWebControl:DataColumn>
                <SmoothEnterpriseWebControl:DataColumn ID="module" Width="70" meta:resourcekey="module" DataType="ViewText" Caption="module" DataName="module"></SmoothEnterpriseWebControl:DataColumn>
                <SmoothEnterpriseWebControl:DataColumn ID="picture" Width="70" meta:resourcekey="picture" DataType="ViewText" Caption="picture" DataName="picture"></SmoothEnterpriseWebControl:DataColumn>
                <SmoothEnterpriseWebControl:DataColumn ID="subject" Width="200" meta:resourcekey="subject" DataType="ViewText" Caption="subject" DataName="subject"></SmoothEnterpriseWebControl:DataColumn>
                <SmoothEnterpriseWebControl:DataColumn ID="init_user" Width="70" meta:resourcekey="init_user" DataValue="ViewText" Caption="init_user" DataName="init_user"></SmoothEnterpriseWebControl:DataColumn>

            </Columns>
            <NavigatorStyle Font-Size="Small" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px" ForeColor="64, 64, 64"
                BorderColor="Silver" BackColor="224, 224, 224"></NavigatorStyle>


            <HeaderStyle Font-Bold="True" ForeColor="#325271" BackColor="#FFD151" Font-Size="Small"></HeaderStyle>
            <SelectColumnStyle BackColor="242, 242, 242"></SelectColumnStyle>
            <SelectStyle BackColor="195, 210, 248"></SelectStyle>
            <GridLine LineColor="224, 224, 224" LineStyle="Solid" LineMode="Vertical" LineWidth="1px"></GridLine>
            <HoverStyle BackColor="230, 237, 255"></HoverStyle>
        </SmoothEnterpriseWebControl:DataList>

    </div>

</asp:Content>


