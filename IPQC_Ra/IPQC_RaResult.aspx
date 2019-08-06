<%@ Page Title="IPQC Informaction List" Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="IPQC_RaResult.aspx.cs" Inherits="IPQC_Ra.IPQC_RaResult" StylesheetTheme="Default" Culture="Auto" UICulture="Auto" Debug="true" %>

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
        <link href="../../script/css/normalize.css" rel="stylesheet" />
        <link href="../../script/css/mak_base.css" rel="stylesheet" />
        <style>
            .div_td {
                text-align: left;
                padding: 4px 2px;
                height: 30px;
                
            }

            .div_th {
                color: #1a245f;
                padding: 4px 2px;
                margin: 2px 2px;
                font-size:12px;
                width: 110px;
            }
        </style>
        <script type="text/javascript">
 
        </script>
    </header>



    <div style="border-bottom: 2px solid #1a245f; padding: 5px 5px; margin: 5px 5px;">
        <div class="div_table">
            <div class="div_tr">
                <div class="div_td div_th ML"><%=getStr("report_no") %></div>
                <div class="div_td">
                    <asp:TextBox ID="txt_no" runat="server" MaxLength="20" Width="120"></asp:TextBox>
                </div>
                <div class="div_td div_th ML"><%=getStr("applicant") %></div>
                <div class="div_td">
                    <asp:TextBox ID="txt_applicant" runat="server" MaxLength="20" Width="120"></asp:TextBox>
                </div>
                <div class="div_td div_th ML"><%=getStr("received_dt") %></div>
                <div class="div_td">
                    <SmoothEnterpriseWebControl:InputText ID="txt_startDt" FormatType="Date" DateFormat="YYYYMMDD" Width="120" runat="server"></SmoothEnterpriseWebControl:InputText>
                </div>
                <div class="div_td">
                    <SmoothEnterpriseWebControl:InputText ID="txt_endDt" FormatType="Date" DateFormat="YYYYMMDD" Width="120" runat="server"></SmoothEnterpriseWebControl:InputText>
                </div>

            </div>
            <div class="div_tr">
                <div class="div_td div_th ML"><%=getStr("test_type") %></div>
                <div class="div_td">
                    <asp:DropDownList ID="cbo_type" runat="server" Width="120"></asp:DropDownList>
                </div>
               
                <div class="div_td div_th ML"><%=getStr("tooling") %> No</div>
                <div class="div_td">
                    <asp:TextBox ID="txt_Tooling" runat="server" MaxLength="20" Width="120"></asp:TextBox>
                </div>
                <div class="div_td div_th ML"><%=getStr("status") %></div>
                <div class="div_td">
                    <asp:DropDownList ID="cbo_status" runat="server" Width="120"></asp:DropDownList>
                </div>
                <div class="div_td" style="width: 200px">
                    <asp:Button ID="Btn_Query" runat="server" CssClass="smooth_btn ML" ML_Tag="query" Text="Query" />
           
                </div>
            </div>
        </div>
    </div>
    <table border="0" width="100%">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:DataList ID="DataList1" runat="server" BorderColor="#000000" RowNumber="True" RowAlign="Middle"
                    NavigatorPos="Bottom" HeaderPos="Top" HeaderAlign="Middle" EnablePrint="True" EnableExport="True" Width="90%"
                    CellPadding="3px" BorderWidth="1px" BorderStyle="Solid" HeaderHeight="30px" Font-Names="Arial" Font-Size="12px" OnOnRenderCell="DataList1_OnRenderCell"
                    Personalize="True">

                    <Columns>
                        
                        <SmoothEnterpriseWebControl:DataColumn ID="view" Width="3%" DataAlign="Center" Caption="View" DataType="UserDefined"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="rowid" DataType="ViewText" Caption="rowid" DataName="rowid" Visible="false"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="result" meta:resourcekey="pass" DataType="UserDefined" Caption="Inspect Pass" DataName="result"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="received_dt" meta:resourcekey="received_dt" DataType="ViewText" Caption="Received Date" DataName="received_dt" Sortable="true" ></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="manufacture_dt" meta:resourcekey="manufacture_dt" DataType="ViewText" Caption="Manufacture Date" DataName="manufacture_dt" Sortable="true" ></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="report_no" meta:resourcekey="report_no" DataType="ViewText" Caption="Report No" DataName="ra_no" Sortable="true" ></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="test_type" meta:resourcekey="test_type" DataType="ViewText" Caption="Test Type" DataName="test_type"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="test_iteme" meta:resourcekey="test_iteme" DataType="ViewText" Caption="Test Item" DataName="test_item"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="sample" meta:resourcekey="sample" DataType="ViewText" Caption="Sample Quantity" DataName="Sample"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="dept_nm" meta:resourcekey="dept_nm" DataType="ViewText" Caption="Department" DataName="dept_nm"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="applicant" meta:resourcekey="applicant" DataType="ViewText" Caption="Employee Name" DataName="applicant"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="program" meta:resourcekey="program" DataType="ViewText" Caption="Program" DataName="program"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="material" meta:resourcekey="material" DataType="ViewText" Caption="Material" DataName="material"></SmoothEnterpriseWebControl:DataColumn>
                        
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
        <tr>
            <td>
                <asp:Button ID="Btn_Del" OnClick="Btn_Del_Click" runat="server" Text="Del" CssClass="smooth_btn ML" ML_Tag="del" Visible="false" />
            </td>
        </tr>

    </table>

</asp:Content>
