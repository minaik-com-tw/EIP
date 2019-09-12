<%@ Page Title="IPQC Informaction List" Language="C#" MasterPageFile="~/_site/layout/ie_Edge.master" AutoEventWireup="true" CodeFile="Build.aspx.cs" Inherits="Build.Build" StylesheetTheme="Default" Culture="Auto" UICulture="Auto" Debug="true" %>

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
        Details="Leica Base Setting" Caption="Leica Option setting" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
        <CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <header>
        <link href="js/build.css" rel="stylesheet" />
         <script type="text/javascript">

            function chk_Del(msg) {
                var pass = false;


                var list = "";
                $("input[name^='Del_']").each(function () {
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
                    alert("請選擇"+msg+"資料!!");
                    
                }
                else {
                    $("#ctl00_ContentPlaceHolder1_del_item").val(list); 
                }

                if (pass == true) {

                    if (confirm("確定"+msg+"資料?")) {
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
          
    </header>

    <asp:HiddenField ID="del_item" Value="" runat="server" />
    <asp:HiddenField ID="msg" Value="" runat="server" />
    <div style="width: 800px">
        <div id="seach" class="tb1">
            <div class="tr">
                <div class="th">選項</div>
                <div class="td">
                    <asp:DropDownList ID="ddl_menu" runat="server" AutoPostBack="true"></asp:DropDownList>
                    <asp:Label ID="lab_remark"  runat="server"  ForeColor="Red"></asp:Label>
                </div>
                <div class="td">
                    <asp:Button ID="Btn_Add" runat="server" OnClick="Btn_Add_Click" Text="新增" />
                    <asp:Button ID="Btn_Visable" runat="server" OnClick="Btn_Visable_Click" Text="不顯示" OnClientClick="return chk_Del('不顯示')" />
                            
                </div>
            </div>

        </div>

        <div style="padding: 10px 0px 10px 0px">

            <SmoothEnterpriseWebControl:DataList ID="DataList1" runat="server" BorderColor="#ccccd6" RowNumber="True" RowAlign="Middle"
                NavigatorPos="Bottom" HeaderPos="Top" HeaderAlign="Middle" EnablePrint="True" EnableExport="True" ForeColor="#525288"
                CellPadding="3px" BorderWidth="1px" BorderStyle="Solid" HeaderHeight="30px" Font-Names="Arial" Font-Size="14px"
                Personalize="True" OnOnRenderCell="DataList1_OnRenderCell">
                <Columns>
                    <SmoothEnterpriseWebControl:DataColumn ID="EDIT" DataType="UserDefined" Caption="id" DataName="rowid" Visible="true"></SmoothEnterpriseWebControl:DataColumn>
                    <SmoothEnterpriseWebControl:DataColumn ID="id" DataType="ViewText" Caption="id" DataName="rowid" Visible="false"></SmoothEnterpriseWebControl:DataColumn>
                    <SmoothEnterpriseWebControl:DataColumn ID="kind" DataType="ViewText" Caption="類別" DataName="tag"></SmoothEnterpriseWebControl:DataColumn>
                    <SmoothEnterpriseWebControl:DataColumn ID="en" Width="100px" DataType="UserDefined" Caption="英文" DataName="en"></SmoothEnterpriseWebControl:DataColumn>
                    <SmoothEnterpriseWebControl:DataColumn ID="tw"  Width="100px" DataType="ViewText" Caption="中文" DataName="tw"></SmoothEnterpriseWebControl:DataColumn>
                    <SmoothEnterpriseWebControl:DataColumn ID="def" DataType="ViewText" Caption="預設" DataName="def"></SmoothEnterpriseWebControl:DataColumn>
                    <SmoothEnterpriseWebControl:DataColumn ID="display" DataType="ViewText" Caption="不顯示" DataName="display"></SmoothEnterpriseWebControl:DataColumn>
                    <SmoothEnterpriseWebControl:DataColumn ID="del" DataType="UserDefined" Caption="選擇" DataName="id" Visible="true"></SmoothEnterpriseWebControl:DataColumn>
                </Columns>
                <NavigatorStyle Font-Size="14px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px" ForeColor="64, 64, 64"
                    BorderColor="Silver" BackColor="224, 224, 224"></NavigatorStyle>  
                <HeaderStyle Font-Bold="True" ForeColor="#525288" BackColor="#ccccd6"></HeaderStyle>
                <SelectColumnStyle BackColor="242, 242, 242"></SelectColumnStyle>
                <SelectStyle BackColor="195, 210, 248"></SelectStyle>
                <GridLine LineColor="224, 224, 224" LineStyle="Solid" LineMode="Vertical" LineWidth="1px"></GridLine>
                <HoverStyle BackColor="230, 237, 255"></HoverStyle>
            </SmoothEnterpriseWebControl:DataList>

        </div>
        <div style="text-align:left" >
            <asp:Button ID="Btn_Del" runat="server" OnClick="Btn_Del_Click" Text="Del" OnClientClick="return chk_Del('刪除')" title="僅供MIS使用" />
        </div>
    </div>
</asp:Content>
