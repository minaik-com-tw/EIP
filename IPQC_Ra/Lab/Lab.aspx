<%@ Page Title="IPQC Informaction List" Language="C#" MasterPageFile="~/_site/layout/ie7.master" AutoEventWireup="true" CodeFile="Lab.aspx.cs" Inherits="Lab.Lab" StylesheetTheme="Default" Culture="Auto" UICulture="Auto" Debug="true" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="IPQC inspect data List "
        Caption="IPQC List Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
        <CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <header> 
        <style>
            .table div.th {
                background-color:#00ffff;
                color: #1a245f; 
                
                width: 100px;
            }

             
        </style>
        <script type="text/javascript">

</script>
    </header>



    <div style="border-bottom: 2px solid #1a245f; padding: 5px 5px; margin: 5px 5px;">
        <div class="table">
            <div>
                <div class="th"><%=getStr("report_no") %></div>
                <div class="td">
                    <asp:TextBox ID="txt_no" runat="server" MaxLength="20" Width="120"></asp:TextBox>
                </div>
                <div class="th"><%=getStr("tooling") %> No</div>
                <div class="td">
                    <asp:TextBox ID="txt_Tooling" runat="server" MaxLength="20" Width="120"></asp:TextBox>
                </div>

                <div class="th"><%=getStr("product") %></div>
                <div class="td">
                    <asp:DropDownList ID="ddl_product" runat="server" Width="120"></asp:DropDownList>
                </div>

            </div>

            <div>
                <div class="th"><%=getStr("program") %></div>
                <div class="td">
                    <asp:DropDownList ID="ddl_program" runat="server" Width="120"></asp:DropDownList>
                </div>
                <div class="th"><%=getStr("test_type") %></div>
                <div class="td">
                    <asp:DropDownList ID="cbo_type" runat="server" Width="120"></asp:DropDownList>
                </div>
                <div class="th"><%=getStr("status") %></div>
                <div class="td">
                    <asp:DropDownList ID="ddl_status" runat="server" Width="120"></asp:DropDownList>
                </div>
            </div>
            <div>
                <div class="th"><%=getStr("received_dt") %></div>
                <div class="td" style="width:auto">
                    <asp:TextBox ID="txt_startDt" runat="server" CssClass="date"></asp:TextBox>~                    
                        
                </div>
                <div class="td">
                    <asp:TextBox ID="txt_endDt" runat="server" CssClass="date"></asp:TextBox>
                </div>
                <div class="td"></div>
                <div class="td">
                    <asp:Button ID="btn_qry" OnClick="btn_qry_Click" runat="server" ML_Tag="query" Text="Query" CssClass="sysBtn" Width="60" />

                </div>
            </div>

        </div>
    </div>
    <table border="0" width="100%">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:DataList ID="DataList1" runat="server" BorderColor="#000000" RowNumber="True" RowAlign="Middle"
                    NavigatorPos="Bottom" HeaderPos="Top" HeaderAlign="Middle" EnablePrint="True" EnableExport="True" Width="1000px"
                    CellPadding="3px" BorderWidth="1px" BorderStyle="Solid" HeaderHeight="30px" Font-Names="Arial" Font-Size="12px" OnOnRenderCell="DataList1_OnRenderCell"
                    Personalize="True">

                    <Columns>

                        <SmoothEnterpriseWebControl:DataColumn ID="edit" Width="1%" DataAlign="Center" Caption="Edit" DataType="UserDefined"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="view" Width="1%" DataAlign="Center" Caption="View" DataType="UserDefined"></SmoothEnterpriseWebControl:DataColumn>

                        <SmoothEnterpriseWebControl:DataColumn ID="rowid" DataType="ViewText" Caption="rowid" DataName="rowid" Visible="false"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="status" Width="50" meta:resourcekey="status" DataAlign="Center" Caption="status" DataType="UserDefined"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="maintain" meta:resourcekey="maintain" DataType="ViewText" Caption="maintain" DataName="modify_user"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="received_dt" meta:resourcekey="received_dt" DataType="ViewText" Caption="Received Date" DataName="received_dt" Sortable="true"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="manufacture_dt" meta:resourcekey="manufacture_dt" DataType="ViewText" Caption="Manufacture Date" DataName="manufacture_dt" Sortable="true"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="report_no" Width="90" meta:resourcekey="report_no" DataType="ViewText" Caption="Report No" DataName="ra_no" Sortable="true"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="test_type" meta:resourcekey="test_type" DataType="ViewText" Caption="Test Type" DataName="test_type"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="test_iteme" meta:resourcekey="test_iteme" DataType="ViewText" Caption="Test Item" DataName="test_item"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="sample" meta:resourcekey="sample" DataType="ViewText" Caption="Sample Quantity" DataName="Sample"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="applicant" meta:resourcekey="applicant" DataType="ViewText" Caption="Employee Name" DataName="applicant"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="program" Width="70" meta:resourcekey="program" DataType="ViewText" Caption="Program" DataName="program"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="material" Width="70" meta:resourcekey="material" DataType="ViewText" Caption="Material" DataName="material"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="result" meta:resourcekey="pass" DataType="UserDefined" Caption="Inspect Pass" DataName="result"></SmoothEnterpriseWebControl:DataColumn>
                    </Columns>
                    <NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px" ForeColor="64, 64, 64"
                        BorderColor="Silver" BackColor="224, 224, 224"></NavigatorStyle>
                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="Black"></HeaderStyle>
                    <SelectColumnStyle BackColor="242, 242, 242"></SelectColumnStyle>
                    <SelectStyle BackColor="195, 210, 248"></SelectStyle>
                    <GridLine LineColor="224, 224, 224" LineStyle="Solid" LineMode="Vertical" LineWidth="1px"></GridLine>
                    <HoverStyle BackColor="230, 237, 255"></HoverStyle>
                </SmoothEnterpriseWebControl:DataList>
            </td>
        </tr>

    </table>

</asp:Content>
