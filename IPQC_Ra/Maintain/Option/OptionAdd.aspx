<%@ Page Title="" Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="OptionAdd.aspx.cs" Inherits="Option.OptionAdd" StylesheetTheme="Default" Culture="Auto"
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
            Details="Input IPQC data" Caption="IPQC Add Page" Width="100%"
            CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
            <CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
            <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
        </SmoothEnterpriseWebControlEnterprise:Descriptor>

        <link href="../../script/css/normalize.css" rel="stylesheet" />
        <link href="../../script/css/mak_base.css" rel="stylesheet" />
        <script>
            function back() {
                location.replace("../option/option.aspx");
                return false;
            }

            function check() {
                var isPass = true;
                var cboType = $("#ctl00_ContentPlaceHolder1_cboType option:selected").val();
                var En = $("#ctl00_ContentPlaceHolder1_txtEn").val();
                var Tw = $("#ctl00_ContentPlaceHolder1_txtTw").val();
                var msg = new Array();

                if (cboType == "") {
                    msg.push("類別");
                }
                if (En == "") {
                    msg.push("EN");
                }

                if (msg.length > 0) {
                    isPass = false;
                    var show = "";
                    for (var i = 0; i < msg.length; i++) {
                        var txt = msg[i];
                        if (show != "") {
                            show += ",";
                        }
                        show += txt;
                    }

                    alert("These can't be empty [" + show + "]");
                }

                return isPass;

            }
        </script>
        </script>
        <style>
            .div_td {
                border: 5px solid #ffffff; 
                text-align: left;
            }

            .th {
                background-color: #ABD1B5;
                text-align: right;
                font-size: 20px;
                font-weight: bolder;
                color: aliceblue;
            }

            .sys_btn {
                margin: 10px 10px;
            }
        </style>
    </header>

    <div id="master" class="div_table" style="text-align: center; width: 60%;padding:2px 2px ;border:1px outset #446d4e">
        <div class="div_table">
            <div class="div_tr">
                <div class="div_td th">類別</div>
                <div class="div_td">
                    <asp:DropDownList ID="cboType" runat="server"></asp:DropDownList>
                </div>

            </div>
            <div class="div_tr">
                <div class="div_td th">
                    <div style="color: red; float: right">*</div>
                    英文
                </div>
                <div class="div_td">
                    <asp:TextBox ID="txtEn" runat="server" MaxLength="20"></asp:TextBox>
                </div>

            </div>
            <div class="div_tr">
                <div class="div_td th">中文</div>
                <div class="div_td">
                    <asp:TextBox ID="txtTw" runat="server" MaxLength="20"></asp:TextBox>
                </div>

            </div>
            <div class="div_tr">
                <div class="div_td th">預設</div>
                <div class="div_td"> 
                    <asp:RadioButtonList ID="rbt1" runat="server" RepeatDirection="Horizontal" >
                        <asp:ListItem Value="1">是</asp:ListItem>
                        <asp:ListItem Value="0">否</asp:ListItem>
                    </asp:RadioButtonList>

                </div>
            </div>
            
            </div>
            <div style="width: 100%; margin: 20px 10px;">
                <asp:Button ID="Btn_Save" runat="server" Text="儲存" OnClientClick="return check()" OnClick="Save_Click" CssClass="sys_btn " />
                <asp:Button ID="Btn_Continue" runat="server" Text="儲存後繼續" OnClientClick="return check()" OnClick="Btn_Continue_Click" CssClass="sys_btn " />
                
                <asp:Button ID="Cancel" runat="server" OnClientClick="return back()" Text="取消" CssClass="sys_btn" />
            </div>

        </div>
</asp:Content>
