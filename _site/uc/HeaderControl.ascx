<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HeaderControl.ascx.cs"
    Inherits="SmoothEnterprise.Web.Application.Layout.HeaderControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<header>
    <style>
        .TopMenu {
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
            CURSOR: default;
            BORDER-BOTTOM: steelblue 1px solid;
        }
    </style>
    <script>
        $(function () {

            var app_v = $("#ctl00_HeaderControl1_app_version").val();
            
            if (app_v != "") {

                var l_top = $("#ctl00_HeaderControl1_login_info4").offset().top;
                var l_left = $("#ctl00_HeaderControl1_login_info4").offset().left;

               // $("#app_ver").css({ 'top': l_top+10, 'left': l_left+150, 'background-color': 'red' });
                 $("#app_ver").css({ 'top': l_top+10, 'left': l_left+150 });
                $("#app_ver").html(app_v);
            }


        })


    </script>
</header>
<asp:HiddenField ID="app_version" runat="server" Value="" />

<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<table cellspacing="0" cellpadding="0" border="0" align="center" width="100%">
    <tr bgcolor="#4b6cbc">
        <td style="background-repeat: repeat-x; background-repeat: repeat-x; height: 100px; background-color: #ffffff; text-align: left; border-right: gray thin solid; border-top: gray thin solid; border-left: gray thin solid; border-bottom: gray thin solid;"
            valign="baseline" nowrap align="right" width="1014px">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Portal/img/testjpg2.jpg" /></td>
    </tr>
    <tr>
        <td bgcolor="#333333" colspan="1" style="background-color: #000024">
            <table style="font-weight: bold; font-size: 11px; color: white; font-family: Tahoma, 'Trebuchet MS', Verdana, Arial"
                cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr height="3">
                    <td nowrap width="20"></td>
                    <td nowrap width="100" bgcolor="#ffa800"></td>
                    <td nowrap width="1"></td>
                    <td nowrap width="100" bgcolor="#ff1300"></td>
                    <td nowrap width="1"></td>
                    <td nowrap width="100" bgcolor="#33cc66"></td>
                    <td nowrap width="1"></td>
                    <td nowrap width="99%" bgcolor="#000000"></td>
                    <td id="login_info3" nowrap width="1" bgcolor="#000000" rowspan="3" runat="server"></td>
                    <td background="/lib/img/bg-theme2grey.gif" rowspan="3">
                        <table id="top_ui" style="font-weight: bold; font-size: 11px; color: white; font-family: Tahoma, Arial"
                            cellspacing="0" cellpadding="0">
                            <tr>
                                <td id="login_info4" style="font-weight: normal; font-size: 11px; height: 13px;" nowrap width="200"
                                    runat="server"></td>
                            </tr>
                            <tr height="5">
                                <td></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr height="10">
                    <td></td>
                    <td class="TopMenu" id="MenuMy" style="behavior: url(/lib/htc/menu.htc)" background="/lib/img/bg-theme2topmenu.gif"
                        rowspan="2" runat="server" submenu="menu_my" menutype="topdown" dx="-1" dy="-3">&nbsp;&nbsp;<asp:Label ID="LABEL_menumy" runat="server" meta:resourcekey="LABEL_menumyResource1">我的個人</asp:Label></td>
                    <td></td>
                    <td class="TopMenu" id="MenuOption" style="behavior: url(/lib/htc/menu.htc)" background="/lib/img/bg-theme2topmenu.gif"
                        rowspan="2" runat="server" submenu="menu_options" menutype="topdown" dx="-1"
                        dy="-3">&nbsp;&nbsp;<asp:Label ID="LABEL_menuoption" runat="server" meta:resourcekey="LABEL_menuoptionResource1">選項設定</asp:Label></td>
                    <td></td>
                    <td class="TopMenu" id="MenuHelp" style="behavior: url(/lib/htc/menu.htc)" background="/lib/img/bg-theme2topmenu.gif"
                        rowspan="2" runat="server" submenu="menu_help" menutype="topdown" dx="-1" dy="-3">&nbsp;&nbsp;<asp:Label ID="LABEL_menuhelp" runat="server" meta:resourcekey="LABEL_menuhelpResource1"></asp:Label></td>
                    <td></td>
                    <td align="right" rowspan="2">
                        <asp:Label ID="Label1" runat="server" Text="語系"></asp:Label>
                        <SmoothEnterpriseWebControl:InputSelect ID="FIELD_language" runat="server" BackColor="#F0F0F0"
                            CssClass="Normal" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18"
                            ItemAll-Selected="False" ItemAll-Text="%" ItemAll-Value="222222222222"
                            ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False"
                            ItemNone-Text="111111111111" ItemNone-Value="111111111111"
                            OnSelectedIndexChanged="FIELD_language_SelectedIndexChanged">
                            <Items>
                                <SmoothEnterpriseWebControl:SelectItem ID="SelectItem2" runat="server" Gradient-GradientBegin=""
                                    Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                                    Style="filter: ;" Text="繁體中文" Value="zh-tw" />
                                <SmoothEnterpriseWebControl:SelectItem ID="SelectItem1" runat="server" Gradient-GradientBegin=""
                                    Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                                    Style="filter: ;" Text="English" Value="en-us" />
                                <SmoothEnterpriseWebControl:SelectItem ID="SelectItem3" runat="server" Gradient-GradientBegin=""
                                    Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                                    Style="filter: ;" Text="简体中文" Value="zh-cn" />
                                <SmoothEnterpriseWebControl:SelectItem ID="SelectItem4" runat="server" Gradient-GradientBegin=""
                                    Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                                    Style="filter: ;" Text="日本語" Value="ja-JP" />
                            </Items>
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            <ErrorStyle BorderStyle="NotSet" />
                        </SmoothEnterpriseWebControl:InputSelect>

                        <img src="/lib/img/icon-zoomer.gif" border="0" align="absMiddle" hspace="3">
                        <input id="keyword" name="keyword" style="border-right: darkgray 1px solid; border-top: darkgray 1px solid; font-size: 11px; border-left: darkgray 1px solid; color: white; border-bottom: darkgray 1px solid; font-family: Tahoma; background-color: dimgray"
                            type="text" runat="server">
                        <asp:Image ID="BUTTON_search" runat="server" ImageAlign="AbsMiddle" ImageUrl="/lib/img/btn-search.gif" meta:resourcekey="BUTTON_searchResource1" />&nbsp;
                        <asp:Image ID="BUTTON_searchmore" runat="server" ImageAlign="AbsMiddle" ImageUrl="/lib/img/btn-more.gif" meta:resourcekey="BUTTON_searchmoreResource1" />&nbsp;
                        <asp:Label ID="BUTTON_logout" runat="server" Style="cursor: default" Width="60px" meta:resourcekey="BUTTON_logoutResource1">Logout</asp:Label>
                        
                    </td>
                </tr>
                <tr height="14">
                    <td style="height: 14px"></td>
                    <td bgcolor="#c4c4c4" style="height: 14px"></td>
                    <td bgcolor="#c4c4c4" style="height: 14px"></td>
                    <td bgcolor="#c4c4c4" style="height: 14px"></td>

                </tr>
            </table>
        </td>
    </tr>
</table>
