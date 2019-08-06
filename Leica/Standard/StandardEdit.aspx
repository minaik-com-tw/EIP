<%@ Page Title="" Language="C#" MasterPageFile="~/_site/layout/ie_Edge.master" AutoEventWireup="true" CodeFile="StandardEdit.aspx.cs" Inherits="Standard.StandardEdit" StylesheetTheme="Default" Culture="Auto"
    UICulture="Auto" Debug="true" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <header>
        <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server"
            Details="Leica Standard" Caption="Standard Edit" Width="100%"
            CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
            <CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
            <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
        </SmoothEnterpriseWebControlEnterprise:Descriptor>
        <link href="js/standard.css" rel="stylesheet" />
        <script>
            function Success(standard) {

                alert("修改成功");
                Nomarl.goto("standard.aspx?standard_id=" + standard);
            }
        </script>
    </header>
    
    <asp:HiddenField ID="rowid" runat="server" />
    <asp:HiddenField ID="standard" runat="server" />
    <asp:HiddenField ID="msg" runat="server" />
    <div>

        <div style="text-align: left; color: #FC9F4D; padding: 10px; font-size: 1.3em;">
            <i class="fas fa-angle-double-right">
                <asp:Label ID="txt_standard" runat="server"></asp:Label></i>
        </div>
        <div style="border: 1px solid #336774; width: 60%; padding: 4px">

            <div class="tb1">

                <div class="tr">

                    <div class="th">上限</div>
                    <div class="td">
                        <asp:label ID="lab_max" runat="server" CssClass="required" Text="0"></asp:label>
                    </div>
                </div>
                <div class="tr">
                    <div class="th">下限</div>
                    <div class="td">
                        <asp:label ID="lab_min" runat="server" CssClass="required" Text="0"></asp:label>
                    </div>
                </div>
                <div class="tr">
                    <div class="th">抽樣數</div>
                    <div class="td">
                        <asp:TextBox ID="txt_val" runat="server" CssClass="required" Text="0"></asp:TextBox>
                    </div>
                </div>

            </div>
            <div class="td" style="width: 60%; padding: 5px; padding-left: 20%;">
                <asp:Button ID="Btn_Save" runat="server" Text="儲存" OnClientClick="return chk()"/>
                <asp:Button ID="Btn_Back" runat="server" OnClientClick="return Nomarl.goto()" Text="回上頁" />
            </div>
        </div>
    </div>
</asp:Content>
