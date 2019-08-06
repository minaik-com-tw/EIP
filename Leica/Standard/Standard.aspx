<%@ Page Title="IPQC Informaction List" Language="C#" MasterPageFile="~/_site/layout/ie_Edge.master" AutoEventWireup="true" CodeFile="Standard.aspx.cs" Inherits="Standard.Standard" StylesheetTheme="Default" Culture="Auto" UICulture="Auto" Debug="true" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server"
        Details="Leica Standard" Caption="Standard List" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
        <CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <header>
        <link href="js/standard.css" rel="stylesheet" />
        <script type="text/javascript"> 
            function chk_Del() {
                var pass = false;
                var list = "";
                $("input[name^='del_']").each(function () {
                    var value = $(this).attr("value");
                    var chk = $(this).prop("checked");
                    if (chk) {
                        pass = true;
                        if (list != "") {
                            list += ',';
                        }
                        list += value;
                    }
                });

                if (!pass) {
                    alert("請選擇要刪除的資料!!");
                }
                else {
                    $("#ctl00_ContentPlaceHolder1_del_item").val(list);

                }

                if (pass == true) {

                    if (confirm("要刪除資料??")) {
                        return pass;
                    }
                    else {
                        return false;
                    }
                }
                else {

                    return false;
                }

            }

        </script>
        <style>
   
        </style>
    </header>
    <asp:HiddenField ID="msg" Value="" runat="server" />
    <asp:HiddenField ID="del_item" Value="" runat="server" />
    <div style="width: 900px">
        <div class="tb1" style="padding:5px;border-bottom :1px solid #336774;width:100%" >
            <div class="tr">
                <div class="th">名稱</div>
                <div class="td">
                    <asp:Label ID="lab_standard" runat="server" ></asp:Label>
                </div>
                <div class="td">
                    <asp:Button ID="Btn_Add" runat="server" OnClick="Btn_Add_Click" Text="新增" />
                    <asp:Button ID="Btn_Del" runat="server" OnClick="Btn_Del_Click" OnClientClick="chk_Del()" Text="刪除" />
                    <a href="../build/build.aspx" class="sysBtn"  style="text-decoration:none;" >回基本設定</a>
                </div>
            </div>
             
        </div>
        
        <div style="padding:10px;" > 

            <SmoothEnterpriseWebControl:DataList ID="DataList1" runat="server" BorderColor="#8A6BBE" RowNumber="True" RowAlign="Middle"
                NavigatorPos="Bottom" HeaderPos="Top" HeaderAlign="Middle" EnablePrint="True" EnableExport="True"
                CellPadding="3px" BorderWidth="1px" BorderStyle="Solid" HeaderHeight="30px" Font-Names="Arial" Font-Size="12px"
                Personalize="True" OnOnRenderCell="DataList1_OnRenderCell">
                <Columns>

                    <SmoothEnterpriseWebControl:DataColumn ID="id" DataType="ViewText" Caption="id" DataName="rowid" Visible="false"></SmoothEnterpriseWebControl:DataColumn>
                    <SmoothEnterpriseWebControl:DataColumn ID="edit" Width="1%" DataAlign="Center" Caption="Edit" DataType="UserDefined"></SmoothEnterpriseWebControl:DataColumn>
                     
                    <SmoothEnterpriseWebControl:DataColumn ID="max" DataType="ViewText" Caption="上限" DataName="max"></SmoothEnterpriseWebControl:DataColumn>
                    <SmoothEnterpriseWebControl:DataColumn ID="min" DataType="ViewText" Caption="下限" DataName="min"></SmoothEnterpriseWebControl:DataColumn>
                    <SmoothEnterpriseWebControl:DataColumn ID="value" DataType="ViewText" Caption="抽樣數" DataName="value"></SmoothEnterpriseWebControl:DataColumn>
                    <SmoothEnterpriseWebControl:DataColumn ID="del" DataType="UserDefined" Caption="del" DataName="rowid" Visible="true"></SmoothEnterpriseWebControl:DataColumn>
                </Columns>
                <NavigatorStyle Font-Size="14px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px" ForeColor="64, 64, 64"
                    BorderColor="Silver" BackColor="224, 224, 224"></NavigatorStyle>


                <HeaderStyle Font-Bold="True" ForeColor="#A8D8B9" BackColor="#336774"></HeaderStyle>
                <SelectColumnStyle BackColor="242, 242, 242"></SelectColumnStyle>
                <SelectStyle BackColor="195, 210, 248"></SelectStyle>
                <GridLine LineColor="224, 224, 224" LineStyle="Solid" LineMode="Vertical" LineWidth="1px"></GridLine>
                <HoverStyle BackColor="230, 237, 255"></HoverStyle>
            </SmoothEnterpriseWebControl:DataList>

        </div>
    </div>
</asp:Content>
