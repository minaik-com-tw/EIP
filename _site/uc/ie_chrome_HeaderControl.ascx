<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ie_chrome_HeaderControl.ascx.cs" Inherits="SmoothEnterprise.Web.Application.Layout.ie_chrome_HeaderControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>

<style>
    /*.TopMenu {
        BORDER-RIGHT: #333333 1px solid;
        BORDER-TOP: #333333 1px solid;
        BORDER-LEFT: #333333 1px solid;
        BORDER-BOTTOM: #333333 1px solid;
    }

    .TopMenuOn {
        BORDER-RIGHT: #202020 1px solid;
        BORDER-TOP: #000000 3px solid;
        BORDER-LEFT: #202020 1px solid;
        BORDER-BOTTOM: #202020 1px solid;
        BACKGROUND-COLOR: #202020;
    }

    .MenuItem {
        BORDER-TOP-WIDTH: 1px;
        PADDING-RIGHT: 1px;
        PADDING-LEFT: 1px;
        BORDER-LEFT-WIDTH: 1px;
        BORDER-BOTTOM-WIDTH: 1px;
        PADDING-BOTTOM: 1px;
        BEHAVIOR: url(/lib/htc/menu.htc) url(/smoothenterprise/data/1.0/lib/htc/menu.htc);
        PADDING-TOP: 1px;
        BORDER-RIGHT-WIDTH: 1px;
    }

    .MenuItemOn {
        BORDER-RIGHT: steelblue 1px solid;
        BORDER-TOP: steelblue 1px solid;
        BEHAVIOR: url(/lib/htc/menu.htc) url(/smoothenterprise/data/1.0/lib/htc/menu.htc);
        BORDER-LEFT: steelblue 1px solid;
        CURSOR: hand;
        BORDER-BOTTOM: steelblue 1px solid;
    }*/

    .row {
        float: left;
    }

        .row div {
            float: left;
            width: auto;
            background: url(/lib/img/bg-theme2topmenu.gif);
            border-right: 1px groove #ffffff;
            padding: 5px 5px 5px 5px;
        }

    .dg_s1 {
        font-size: 12px;
        margin-bottom: -1px;
        border-top: 0px;
        font-family: sans-serif, verdana, arial, tahoma;
        border-right: 0px;
        width: 72px;
        background: #f0f0f0;
        margin-top: -1px;
        border-bottom: 0px;
        font-weight: 400;
        color: #000000;
        font-style: normal;
        padding-left: 3px;
        filter: progid:dximagetransform.microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff);
        border-left: 0px;
        z-index: 9
    }

    .max div {

        border:1px solid #33cc66
        
    }
</style>

<div style="margin: 0px; padding: 0px" class="max" >
    
    <div style="height: 100px; border: 1px solid gray; padding: 0px 0px 0px 0px; background-color:#fff">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Portal/img/testjpg2.jpg" BorderWidth="2" BorderColor="YellowGreen" />
    </div>
    <div style="font-size: 11px; font-family: Tahoma, 'Trebuchet MS', Verdana, Arial; font-weight: bold; color: white; width: 1014px; float: left; background-color: #000024; height: 2.5em; padding: 0px;">

        <div class="row" style="text-align: left; float: left; margin-left: 20px">
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
        <div class="row" style="display:table;text-align: right; float: left; vertical-align:middle; padding-left: 100px;">

            <div>語系</div>
            <div style="padding: 2px">
                <asp:DropDownList runat="server" ID="FIELD_language" OnSelectedIndexChanged="FIELD_language_SelectedIndexChanged" AutoPostBack="true" Width="100"
                    Style="font-size: 14px; margin-bottom: -1px; border-top: 0px; font-family: Sans-Serif, Verdana, Arial, Tahoma; border-right: 0px; background: #f0f0f0; margin-top: -1px; border-bottom: 0px; font-weight: 400; color: #000000; font-style: normal; padding-left: 3px; filter: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff); border-left: 0px; z-index: 9">
                    <asp:ListItem Text="繁體中文" Value="zh-tw" />
                    <asp:ListItem Text="简体中文" Value="zh-cn" />
                    <asp:ListItem Text="日本語" Value="ja-JP" />
                    <asp:ListItem Text="English" Value="en-us" />
                </asp:DropDownList>
            </div>
            <div style="padding: 2px">
                <img src="/lib/img/icon-zoomer.gif" border="0" align="absMiddle" hspace="3">
                <asp:TextBox ID="keyword" runat="server" Height="15" Style="font-size: 11px; border-top: darkgray 1px solid; font-family: Tahoma; border-right: darkgray 1px solid; border-bottom: darkgray 1px solid; color: white; border-left: darkgray 1px solid; background-color: dimgray"></asp:TextBox>
                <asp:ImageButton ID="BUTTON_search" runat="server" ImageAlign="AbsMiddle" ImageUrl="/lib/img/btn-search.gif" meta:resourcekey="BUTTON_searchResource1" OnClick="BUTTON_search_Click" />
                <asp:ImageButton ID="BUTTON_searchmore" runat="server" ImageAlign="AbsMiddle" ImageUrl="/lib/img/btn-more.gif" meta:resourcekey="BUTTON_searchmoreResource1" OnClick="BUTTON_searchmore_Click" />

            </div>
            <div style="text-align: left; padding: 2px; height: 22px; background-image: url(/lib/img/bg-theme2grey.gif)">
                <div style="padding-left: 50px">
                    <asp:LinkButton ID="BUTTON_logout" runat="server" meta:resourcekey="BUTTON_logoutResource1" OnClick="BUTTON_logout_Click1" Style="text-decoration: none" ForeColor="White">Logout</asp:LinkButton>
                </div>
                <div>
                    <asp:Label ID="login_info3" runat="server" Font-Size="X-Small"></asp:Label>
                </div>

                <div style="margin: 0px; padding: 0px;">
                    <asp:Panel ID="login_info4" Font-Size="Small" Height="15" Style="padding: 0px; margin: 0px" runat="server"></asp:Panel>
                </div>
            </div>
        </div> 
    </div>
    <div></div>
</div>
