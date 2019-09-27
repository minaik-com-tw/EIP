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
                border: 1px solid #808080;
                width: 145px;
            }

            .th {
                background-color: #904840;
                color: #FCFAF2;
                font-weight: bold;
                width: 100px;
            }

            .td input, .td select {
                width: 110px;
            }
        </style>

    </header>


    <asp:HiddenField ID="msg" Value="" runat="server" />
    <div id="seach" class="tb1 all" style="margin: 10px">
        <div class="tr">
            <div class="th"><%=getStr("program") %></div>
            
            <div class="td">
                <asp:DropDownList ID="ddl_program" runat="server"></asp:DropDownList>
            </div>
            <div class="th">
                <%=getStr("status") %>
            </div>
            <div class="td">
                <asp:DropDownList ID="ddl_status" runat="server"></asp:DropDownList>
            </div>
            <div class="th"><%=getStr("operator") %></div>
            <div class="td">
                <asp:TextBox ID="txt_h_operator" runat="server" CssClass="Muser"></asp:TextBox>
            </div>
        </div>
        <div class="tr">
            <div class="th"><%=getStr("kind") %></div>
            <div class="td">
                <asp:DropDownList ID="ddl_kind" runat="server"></asp:DropDownList>
            </div>
            <div class="th"><%=getStr("result") %></div>
            <div class="td">
                <asp:DropDownList ID="ddl_result" runat="server"></asp:DropDownList>
            </div>
            <div class="th"><%=getStr("product") %></div>
            <div class="td">
                <asp:DropDownList ID="ddl_product" runat="server"></asp:DropDownList>
            </div>
        </div>
        <div class="tr">
            <div class="th"><%=getStr("custmer") %></div>
            <div class="td">
                <asp:DropDownList id="ddl_custmer" runat="server" ></asp:DropDownList>
            </div>
            <div class="th"><%=getStr("insp_dt") %></div>
            <div class="td">
                <asp:TextBox runat="server" Text="" ID="txt_sDt" CssClass="date"></asp:TextBox>
            </div>
            <div class="td">
                <asp:TextBox runat="server" Text="" ID="txt_eDt" CssClass="date"></asp:TextBox>
            </div>
        </div>

    </div>
    <div class="tb1 all" style="margin: 10px">
        <div class="tr">
            <div class="td" style="width: 100%; text-align: right">
                <asp:Button ID="btn_query" runat="server" Text="query" OnClick="btn_query_Click" Width="80" />
                <asp:Button ID="Btn_add" runat="server" Text="add" OnClientClick="return Nomarl.goto('LeicaAdd.aspx')"  Width="80" />

            </div>
        </div>
    </div>
    <div style="border-top: 2px solid #904840; padding-top: 20px;">

        <SmoothEnterpriseWebControl:DataList ID="DataList1" runat="server" BorderColor="#666666" ForeColor="#734338" RowNumber="True" RowAlign="Middle"
            NavigatorPos="Bottom" HeaderPos="Top" HeaderAlign="Middle" EnablePrint="True" EnableExport="True" Width="100%"
            CellPadding="3px" BorderWidth="1px" BorderStyle="Solid" HeaderHeight="30px" Font-Names="Arial" Font-Size="Small" CurrentColumn="123"
            Personalize="True" OnOnRenderCell="DataList1_OnRenderCell">
            <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#69352F" Font-Size="Small"></HeaderStyle>
            <SelectStyle BackColor="#F4B6B4" ForeColor="#D0104C" Font-Bold="true" ></SelectStyle>
            <SelectColumnStyle BackColor="#F9ECE5"/>
            <HoverStyle BackColor="#F7D7D7"></HoverStyle>  
            <Columns>
                
                <SmoothEnterpriseWebControl:DataColumn ID="id" DataType="ViewText" Caption="id" DataName="rowid" Visible="false"></SmoothEnterpriseWebControl:DataColumn>
                <SmoothEnterpriseWebControl:DataColumn ID="edit" Width="1%" DataAlign="Center" Caption="Edit" DataType="UserDefined"></SmoothEnterpriseWebControl:DataColumn>
                
                <SmoothEnterpriseWebControl:DataColumn ID="status" Width="60" meta:resourcekey="status" DataType="ViewText" Caption="Status" DataName="status" Sortable="true"></SmoothEnterpriseWebControl:DataColumn>
                <SmoothEnterpriseWebControl:DataColumn ID="custmer" Width="100" meta:resourcekey="custmer" DataType="ViewText" Caption="custmer" DataName="custmer" Sortable="true"></SmoothEnterpriseWebControl:DataColumn>
                <SmoothEnterpriseWebControl:DataColumn ID="insp_no" Width="100" meta:resourcekey="insp_no" DataType="ViewText" Caption="Inspect No." DataName="insp_no" Sortable="true"></SmoothEnterpriseWebControl:DataColumn>
                <SmoothEnterpriseWebControl:DataColumn ID="insp_dt" Width="80" meta:resourcekey="insp_dt" DataType="ViewText" Caption="inspect date" DataName="insp_dt"></SmoothEnterpriseWebControl:DataColumn>
                <SmoothEnterpriseWebControl:DataColumn ID="operator" Width="65" meta:resourcekey="operator" DataType="ViewText" Caption="operator" DataName="operator"></SmoothEnterpriseWebControl:DataColumn>
                <SmoothEnterpriseWebControl:DataColumn ID="product" Width="80" meta:resourcekey="product" DataType="ViewText" Caption="product" DataName="product" Sortable="true"></SmoothEnterpriseWebControl:DataColumn>
                <SmoothEnterpriseWebControl:DataColumn ID="program" Width="80" meta:resourcekey="program" DataType="ViewText" Caption="Program" DataName="program" Sortable="true"></SmoothEnterpriseWebControl:DataColumn>
                <SmoothEnterpriseWebControl:DataColumn ID="kind" Width="65" meta:resourcekey="kind" DataType="ViewText" Caption="kind" DataName="kind"></SmoothEnterpriseWebControl:DataColumn>
                
                <SmoothEnterpriseWebControl:DataColumn ID="result" Width="65" meta:resourcekey="result" DataType="ViewText" Caption="result" DataName="result"></SmoothEnterpriseWebControl:DataColumn>
                
                <SmoothEnterpriseWebControl:DataColumn ID="view" Width="1%" DataAlign="Center" Caption="View" DataType="UserDefined"></SmoothEnterpriseWebControl:DataColumn>
            </Columns>  
              <NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px" ForeColor="64, 64, 64"
						BorderColor="Silver" BackColor="224, 224, 224" CssClass=""></NavigatorStyle>      
        </SmoothEnterpriseWebControl:DataList>

    </div>

</asp:Content>


