<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true"
    CodeFile="IPQC.aspx.cs" Inherits="IPQC.IPQC" StylesheetTheme="Default" Culture="Auto"
    UICulture="Auto" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server"
        Details="The desciption for this program" Caption="IPQC List Page" Width="100%"
        CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
        <CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <table border="0">
        <tr class="NormalBold">
            <td>
                <%=getStr("record_dt") %>
            </td>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="FIELD_sDate" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" ErrorMessage="Please Input「SDate」!!" FormatType="Date" MaxLength="0"
                    Width="90px">
                    <ErrorStyle BorderStyle="NotSet" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText>~
                <SmoothEnterpriseWebControl:InputText ID="FIELD_eDate" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" ErrorMessage="Please Input「SDate」!!" FormatType="Date" MaxLength="0"
                    Width="90px">
                    <ErrorStyle BorderStyle="NotSet" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText>
            </td>
            <td>
                <%=getStr("program") %>
            </td>
            <td>
                <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="FIELD_Program_SelectedIndexChanged"
                    ID="FIELD_Program" />
            </td>
            <td>
                <%=getStr("dimension") %>
            </td>
            <td>
                <asp:DropDownList ID="FIELD_SIZE" runat="server" />
            </td>
        </tr>
        <tr class="NormalBold">
            <td>
                <%=getStr("station") %>
            </td>
            <td>
                <asp:DropDownList ID="FEILD_STATION" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                <%=getStr("product") %>
                
            </td>
            <td>
                <asp:DropDownList ID="FIELD_Product" runat="Server" />
            </td>
            <td>
                <%=getStr("appearance") %>
                
            </td>
            <td>
                <asp:DropDownList ID="FIELD_Appearance" runat="server" />
            </td>
        </tr>
        <tr class="NormalBold">
            <td>
                <%=getStr("customer") %>
                
            </td>
            <td>
                <asp:DropDownList ID="FIELD_customer" AutoPostBack="true" OnSelectedIndexChanged="FIELD_customer_SelectedIndexChanged"
                    runat="server" />
            </td>
            <td>
                <%=getStr("stage") %>
                
            </td>
            <td>
                <asp:DropDownList ID="FIELD_step" runat="server" />
            </td>
            <td>
                <%=getStr("disposition") %>
                
            </td>
            <td>
                <asp:TextBox ID="FIELD_no" runat="server" />
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_query" runat="server" Text="查詢" meta:resourcekey="BUTTON_queryResource1" Width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_query_Click">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_add" runat="server" Text="新增" meta:resourcekey="BUTTON_addResource" Width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_add_Click">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>

            </td>
        </tr>
    </table>
    <table border="0" width="100%">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:DataList ID="DataList1" runat="server" BorderColor="#000000"
                    RowNumber="True" RowAlign="Middle" NavigatorPos="Bottom" HeaderPos="Top" HeaderAlign="Middle"
                    EnablePrint="True" EnableExport="True" CellPadding="3px" BorderWidth="1px" BorderStyle="Solid"
                    HeaderHeight="30px" Font-Names="Arial" Font-Size="12px" ConnectionType="Custom"
                    SQL="SELECT * FROM IPQC order by IPQC_NO desc" Personalize="True" OnOnRenderCell="DataList1_OnRenderCell">
                    <Columns>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_edit" Width="1%" DataAlign="Center"
                            DataType="UserDefined" DataStyle-BorderStyle="NotSet" HeaderAlign="Center" HeaderStyle-BorderStyle="NotSet"
                            runat="server" Caption="Edit">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_view" Width="1%" DataAlign="Center"
                            DataType="IconView">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_IPQC_NO" DataType="ViewText"
                            Caption="異常單號碼" meta:resourcekey="disposition" DataName="IPQC_NO" Sortable="True">
                        </SmoothEnterpriseWebControl:DataColumn>

                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_isState" DataType="ViewText" meta:resourcekey="application" Caption="審核狀態" DataName="isState" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server"></SmoothEnterpriseWebControl:DataColumn>

                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_initdate" DataType="ViewText"
                            Caption="開案日期-時間" meta:resourcekey="record_dt" DataName="initdate" Sortable="True">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_sheet_NO" DataType="ViewText"
                            Caption="工單號碼" meta:resourcekey="traveling" DataName="sheet_NO" Sortable="True" s>
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_station" DataType="ViewText"
                            Caption="異常站別" meta:resourcekey="station" DataName="station">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_customer" DataType="ViewText"
                            Caption="客戶名稱" meta:resourcekey="customer" DataName="CUS_CN">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_Program_Name" DataType="ViewText"
                            Caption="機種名稱" meta:resourcekey="program" DataName="PRA" Sortable="True">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_Product_Name" DataType="ViewText"
                            Caption="產品名稱" meta:resourcekey="product" DataName="PRO" Sortable="True">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_PN" DataType="ViewText" meta:resourcekey="pn" Caption="產品圖號" Sortable="True"
                            DataName="LCaption">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_Rev" DataType="ViewText" meta:resourcekey="rev" Caption="產品版本" Sortable="True"
                            DataName="Rev">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_Stage" DataType="ViewText" meta:resourcekey="stage" Caption="產品階段"
                            DataName="Stage">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_Defect_Rat" DataType="ViewText"
                            meta:resourcekey="defect_rate" Caption="抽驗不良率" DataName="Defect_Rat">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_Description" DataType="ViewText" meta:resourcekey="discription" Caption="異常描述" DataName="Description">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_inituser" DataType="ViewText" meta:resourcekey="peson" Caption="開案人員" DataName="NAME">
                        </SmoothEnterpriseWebControl:DataColumn>
                    </Columns>
                    <NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px"
                        ForeColor="64, 64, 64" BorderColor="Silver" BackColor="224, 224, 224"></NavigatorStyle>
                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="Black"></HeaderStyle>
                    <SelectColumnStyle BackColor="242, 242, 242"></SelectColumnStyle>
                    <SelectStyle BackColor="195, 210, 248"></SelectStyle>
                    <GridLine LineColor="224, 224, 224" LineStyle="Solid" LineMode="Vertical" LineWidth="1px"></GridLine>
                    <HoverStyle BackColor="230, 237, 255"></HoverStyle>
                </SmoothEnterpriseWebControl:DataList>
            </td>
        </tr>
    </table>
    <table border="0">
        <tr>
            <td></td>
        </tr>
    </table>
</asp:Content>
