<%@ Page Title="人員列表" Language="C#" MasterPageFile="~/_site/layout/ie7.master" AutoEventWireup="true" CodeFile="FlowAdd.aspx.cs" Inherits="Maintain.FlowAdd" Culture="Auto" UICulture="Auto" Debug="true" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <header>
        <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
        <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server"
            Details="Input IPQC data" Caption="IPQC Add Page" Width="100%"
            CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
            <CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
            <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
        </SmoothEnterpriseWebControlEnterprise:Descriptor>

        <script>
            function back() {
                location.replace("../Maintain/Flow.aspx");
                return false;
            }
            $(function () {
                $("#ctl00_ContentPlaceHolder1_txt_user").attr("ReadOnly", "true");
            });
            function check() {
                var isPass = true;

                $(".required").each(function () {
                    var value = $(this).val();

                    $(this).parent().css("background-color", "#ffffff");

                    if (value == "") {
                        isPass = false;
                        $(this).parent().css("background-color", "red");
                    }
                });

                if (!isPass) {
                    alert("red item is required");
                }

                return isPass;
            }

            function getMember() {
                var w = 600;
                var h = 800;

                $.blockUI({
                    css: {
                        'top': '10px',
                        'left': ($(window).width() - 600) / 2 + 'px',
                        'cursor': 'default',
                        'width': w + 'px',
                        'height': h + 'px'
                    },
                    message: $('<iframe id="wiframe" name="wiframe" src="../../comm/Member.aspx" frameborder="0" scrolling="yes" style="width: ' + w + 'px; height:' + h + 'px;background-color: #ffffff;"></iframe>'),
                    onOverlayClick: $.unblockUI//點背景關閉視窗
                });
            }

            function parentResponse(id, account) {
                $("#ctl00_ContentPlaceHolder1_Uid").val(id);
                $("#ctl00_ContentPlaceHolder1_txt_user").val(account);
                $.unblockUI();
            }

            $(function () {
                var error = $("#ctl00_ContentPlaceHolder1_sMsg").val();

                if (error != "") {
                    alert(error);
                }
            });

        </script>

        <style>
             
            .table div .th {
                background-color: #95B200;
                color: azure;
                width:250px;
            }
        </style>
    </header>

    <asp:HiddenField ID="sMsg" runat="server" Value="" />
    <div id="master" class="div_table" style="text-align: center; width: 60%; padding: 2px 2px; border: 1px outset #446d4e">
        <div class="table">
            <div>
                <div class="th">簽核群組:</div>
                <div class="td" id="b">
                    <asp:DropDownList ID="cbo_level" runat="server" CssClass="required" Width="150"></asp:DropDownList>
                </div>

            </div>
            <div>
                <div class="th">
                    簽核抬頭:
                </div>
                <div class="td" id="a">
                    <asp:TextBox ID="txt_text" runat="server" MaxLength="50" CssClass="required" Width="150"></asp:TextBox>
                </div>

            </div>
            <div>
                <div class="th">
                    簽核人員:
                </div>
                <div class="td">
                    <div>
                        <asp:TextBox ID="txt_user" runat="server" Width="150" CssClass="required" ForeColor="#000000"></asp:TextBox>
                        <a href="#" id="member" onclick="getMember()" style="text-decoration: none;">
                            <img src="../../image/icon-man1.gif" style="width: 15px; height: 15px; border: 1px groove #808080; vertical-align: middle;" />
                        </a>
                    </div>
                    <asp:HiddenField ID="Uid" runat="server" />
                </div>
            </div>
            <div>
                <div class="th">僅核備(不簽核，僅送mail)</div>
                <div class="td">
                    <asp:RadioButtonList ID="rbt_mail" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1">是</asp:ListItem>
                        <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
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
