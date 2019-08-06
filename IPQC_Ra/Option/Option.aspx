<%@ Page Title="IPQC Informaction List" Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="Option.aspx.cs" Inherits="Option.Option" StylesheetTheme="Default" Culture="Auto" UICulture="Auto" Debug="true" %>

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
                width: 160px;
            }

            .div_th {
                color: #1a245f;
                padding: 4px 2px;
                margin: 2px 2px;
                font-weight: bolder;
                text-align: right;
                width: 110px;
            }
        </style>
        <script type="text/javascript">
 
        </script>
    </header>


    <div style="border-bottom: 2px solid #1a245f; padding: 5px 5px; margin: 5px 5px;">
        <div class="div_table">
            <div class="div_tr">
                <div class="div_td div_th ML">Type</div>
                <div class="div_td">
                    <asp:DropDownList ID="cboType" runat="server"></asp:DropDownList> 
                </div>
                <div class="div_td div_th ML">Name</div>
                <div class="div_td">
                    <asp:TextBox ID="txtName" runat="server" MaxLength="20"></asp:TextBox>
                </div>
                <div class="div_td" style="width: 200px">
                    <asp:Button ID="Btn_Query" runat="server" OnClick="Btn_Query_Click" Text="Query" CssClass="smooth_btn ML" ML_Tag="query" />
                    <asp:Button ID="Btn_Add" runat="server" OnClick="Btn_Add_Click" Text="Add" CssClass="smooth_btn ML" ML_Tag="add"  />
                </div>
            </div>
        </div>
    </div>
    <table border="0" width="100%">
        <tr>
            <td> 
                <SmoothEnterpriseWebControl:DataList ID="DataList1" runat="server" BorderColor="#000000" RowNumber="True" RowAlign="Middle"
                    NavigatorPos="Bottom" HeaderPos="Top" HeaderAlign="Middle" EnablePrint="True" EnableExport="True"
                    CellPadding="3px" BorderWidth="1px" BorderStyle="Solid" HeaderHeight="30px" Font-Names="Arial" Font-Size="12px"
                    Personalize="True" OnOnRenderCell="DataList1_OnRenderCell">

                    <Columns>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_edit" Width="1%" DataAlign="Center" Caption="Edit" DataType="UserDefined"></SmoothEnterpriseWebControl:DataColumn>

                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_rowid" DataType="ViewText" Caption="rowid" DataName="rowid" Visible="false"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="type" DataType="ViewText" Caption="Type" DataName="kind"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="en" DataType="ViewText" Caption="英文" DataName="en"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="tw" DataType="ViewText" Caption="中文" DataName="tw"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="def" DataType="ViewText" Caption="預設" DataName="def"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="display" DataType="ViewText" Caption="顯示" DataName="display"></SmoothEnterpriseWebControl:DataColumn>

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
