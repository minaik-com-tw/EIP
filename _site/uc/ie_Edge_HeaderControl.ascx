<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ie_Edge_HeaderControl.ascx.cs" Inherits="SmoothEnterprise.Web.Application.Layout.ie_Edge_HeaderControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<header>
    <style>
        .top_left_Menu {
            display: table;
            border-right: 1px outset #fff;
            float: left;
        }

            .top_left_Menu div {
                display: table-cell;
                height: 20px;
                background: url(/lib/img/bg-theme2topmenu.gif);
                padding: 2px 10px;
                vertical-align: middle;
            }

        .top_rigth_Menu {
            display: table;
            vertical-align: middle;
        }

            .top_rigth_Menu .cell {
                display: table-cell;
                height: 20px;
                text-align: left;
                padding: 2px;
            }


        .ls {
            BACKGROUND: #f0f0f0;
            FILTER: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff);
            DISPLAY: none;
        }

        .dgs_btn {
            background-image: url(/lib/img/btn-search.gif);
            background-color: #fff;
            border: 0px;
            width: 21px;
            height: 17px;
            padding: 1px;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
        }

        .logout {
            color: #fff;
            background-color: #000000;
            border: 0px;
        }

        .butn:hover {
            text-decoration: none;
        }
    </style>
    <script>
        function to_search(url) {

            var key = $("#ctl00_HeaderControl1_keyword").val();
            var go = url + key;
            Nomarl.goto(go);
            return true;
        }


    </script>
</header>


<div style="text-align: left; margin-top: 4px; padding: 0px; width: 100%">
    <div style="height: 100px; border: 1px solid gray; padding: 0px; background-color: #fff">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Portal/img/testjpg2.jpg" BorderWidth="0" />
    </div>
    <%--<div style="font-size: 11px; font-family: Tahoma, 'Trebuchet MS', Verdana, Arial; font-weight: bold; color: white; width: 100%; float: left; background-color: #000024; height: 2.5em; padding: 0px;">--%>
    <div style="background-color: #000024; height: 2.5em; color: #ffffff; margin: 0px; padding: 0px; font-size: 11px; font-family: Tahoma, 'Trebuchet MS', Verdana, Arial; font-weight: bold; color: white;">
        <div class="top_left_Menu" style="margin-left: 20px; padding: 0px; float: left">
            <div style="border-top: 2px solid  #ffa800; width: 90px; font-size: 1.0em;">
                <asp:Label ID="LABEL_menumy" runat="server" meta:resourcekey="LABEL_menumyResource1">我的個人</asp:Label>
            </div>
            <div style="border-top: 2px solid #ff1300; width: 90px; font-size: 1.0em;">
                <asp:Label ID="LABEL_menuoption" runat="server" meta:resourcekey="LABEL_menuoptionResource1">選項設定</asp:Label>
            </div>
            <div style="border-top: 2px solid #33cc66; width: 90px; font-size: 1.0em;">
                <asp:Label ID="LABEL_menuhelp" runat="server" meta:resourcekey="LABEL_menuhelpResource1">輔助工具</asp:Label>
            </div>
        </div>
        <div style="float: right">
            <div class="top_rigth_Menu">

                <div class="cell">語系</div>
                <div class="cell">
                    <asp:DropDownList runat="server" ID="FIELD_language" OnSelectedIndexChanged="FIELD_language_SelectedIndexChanged" AutoPostBack="true" Width="100" Font-Size="12px" Style="background: rgb(240, 240, 240);">
                        <asp:ListItem Text="繁體中文" Value="zh-tw" />
                        <asp:ListItem Text="简体中文" Value="zh-cn" />
                        <asp:ListItem Text="日本語" Value="ja-JP" />
                        <asp:ListItem Text="English" Value="en-us" />
                    </asp:DropDownList>
                </div>
                <div class="cell">

                    <img src="/lib/img/icon-zoomer.gif" border="0">
                    <asp:TextBox ID="keyword" runat="server" Height="15" Style="font-size: 11px; border-top: darkgray 1px solid; font-family: Tahoma; border-right: darkgray 1px solid; border-bottom: darkgray 1px solid; color: white; border-left: darkgray 1px solid; background-color: dimgray"></asp:TextBox>

                    <div style="float: right; padding-top: 2px;padding-right:30px">
                        <a href="#" onclick="to_search('/content/search.aspx?keyword=')" style="text-decoration: none; cursor: pointer; padding: 2px">
                            <img src="/lib/img/btn-search.gif" /></a>

                        <a href="#" onclick="to_search('/content/searchmore.aspx?keyword=')" style="text-decoration: none; cursor: pointer">
                            <img src="/lib/img/btn-more.gif" /></a>
                    </div>
                </div>


                <div class="cell" >
                    <%--<asp:LinkButton ID="BUTTON_logout" runat="server" meta:resourcekey="BUTTON_logoutResource1" OnClick="BUTTON_logout_Click1" style="TEXT-DECORATION: none" ForeColor="White">100 Logout</asp:LinkButton>--%>
                    

                    <asp:Button ID="BUTTON_logout" runat="server" OnClick="BUTTON_logout_Click" meta:resourcekey="BUTTON_logoutResource1" Text="登出" CssClass="logout" />

                </div>
                <div class="cell" style="background-image: url(/lib/img/bg-theme2grey.gif); width: 200px;">
                    <asp:Panel ID="login_info4" runat="server"></asp:Panel>
                </div> 
            </div>
        </div>
    </div>
    
</div>






