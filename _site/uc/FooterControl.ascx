<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FooterControl.ascx.cs"
    Inherits="SmoothEnterprise.Web.Application.Layout.FooterControl" %>
<div class="FloatPanel" id="menu_my" style="display: none; position: absolute; top: -100px;">
    <table cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td>
                <table style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                    border-bottom: black 1px solid" bgcolor="#62abfa" background="/lib/img/bg-menu.jpg">
                    <tr>
                        <td valign="top" width="140" height="200">
                            <table style="font-weight: bold; font-size: 11px; font-family: Tahoma, Arial" cellspacing="3"
                                cellpadding="0" width="100%">
                                <tr>
                                    <td width="20">
                                    </td>
                                    <td valign="bottom">
                                        <font color="#5ea2d7"><b><span id="title_personal" runat="server"><asp:Label ID="LABEL_titlepersonal" runat="server" meta:resourcekey="LABEL_titlepersonalResource1">個人化</asp:Label></span></b></font></td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td bgcolor="#70b4e9" height="2">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <img hspace="3" src="/lib/img/icon-home.gif" vspace="3" border="0"></td>
                                    <td class="MenuItem" id="menu_home" height="20" runat="server" linkurl="/" dx="-25"
                                        dy="-2">
                                        &nbsp;&nbsp;&nbsp;<asp:Label ID="LABEL_menuhome" runat="server" meta:resourcekey="LABEL_menuhomeResource1">我的首頁</asp:Label></td>
                                </tr>
                                <!--					<TR>
						<TD></TD>
						<TD class="MenuItem" height="20">&nbsp;&nbsp;&nbsp;My Email</TD>
					</TR> -->
					                                <tr>
                                    <td>
                                    </td>
                                    <td class="MenuItem" id="menu_loginout" height="20" runat="server" linkurl="/security/login.aspx">
                                        &nbsp;&nbsp;&nbsp;<asp:Label ID="LABEL_loginout" runat="server" meta:resourcekey="LABEL_loginoutResource1">登入</asp:Label></td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td class="MenuItem" id="menu_profile" height="20" runat="server" linkurl="/security/profile.aspx">
                                        &nbsp;&nbsp;&nbsp;<asp:Label ID="LABEL_menuprofile" runat="server" meta:resourcekey="LABEL_menuprofileResource1" visible="false">帳號管理</asp:Label></td>
                                </tr>
                                <tr id="TR_LABEL_menuprsonalize" runat="server" visible="false">
                                    <td>
                                    </td>
                                    <td class="MenuItem" id="menu_personalize" height="20" runat="server">
                                        &nbsp;&nbsp;&nbsp;<asp:Label ID="LABEL_menuprsonalize" runat="server" meta:resourcekey="LABEL_menuprsonalizeResource1">個人化設定</asp:Label></td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td class="MenuItem" height="20">
                                        <font color="#03a957">
                                        &nbsp;&nbsp;&nbsp;<asp:Label ID="LABEL_titlegeneral" runat="server" meta:resourcekey="LABEL_titlegeneralResource1">一般功能</asp:Label></font></td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td bgcolor="#23be5e" height="2">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td class="MenuItem" id="menu_news" height="20" runat="server" linkurl="/portal/mynews.aspx">
                                        &nbsp;&nbsp;&nbsp;<asp:Label ID="LABEL_menunews" runat="server" meta:resourcekey="LABEL_menunewsResource1" visible="false">最新消息</asp:Label></td>
                                </tr>

                            </table>
                        </td>
                    </tr>
                </table>
            </td>
            <td width="2" bgcolor="#000000" style="filter: alpha(opacity=30)">
            </td>
        </tr>
        <tr>
            <td colspan="2" height="2" bgcolor="#000000" style="filter: alpha(opacity=30)">
            </td>
        </tr>
    </table>
</div>
<div class="FloatPanel" id="menu_mylinks" style="display: none; position: absolute; top: -100px;" runat="server">
    <table cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td>
                <table style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                    border-bottom: black 1px solid" bgcolor="#62abfa" background="/lib/img/bg-menu.jpg">
                    <tr>
                        <td valign="top" width="140">
                            <table style="font-weight: bold; font-size: 11px; font-family: Tahoma, Arial" cellspacing="3"
                                cellpadding="0" width="100%" id="menu_definedlinks" runat="server">
                                <tr>
                                    <td width="20">
                                        &nbsp;</td>
                                    <td class="MenuItem" id="menu_addlink" height="20" runat="server">
                                        &lt;&nbsp;Add Link...&nbsp;&gt;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
            <td width="2" bgcolor="#000000" style="filter: alpha(opacity=30)">
                <font face="新細明體"></font>
            </td>
        </tr>
        <tr>
            <td colspan="2" height="2" bgcolor="#000000" style="filter: alpha(opacity=30)">
            </td>
        </tr>
    </table>
</div>
<div class="FloatPanel" id="menu_options" style="display: none; position: absolute; top: -100px;">
    <table cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td>
                <table style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                    border-bottom: black 1px solid" bgcolor="#62abfa" background="/lib/img/bg-menu.jpg">
                    <tr>
                        <td valign="top" width="140" height="200">
                            <table style="font-weight: bold; font-size: 11px; font-family: Tahoma, Arial" cellspacing="3"
                                cellpadding="0" width="100%">
                                <tr>
                                    <td width="20">
                                    </td>
                                    <td style="color: #5ea2d7" valign="bottom">
                                        <b><span id="title_browser" runat="server"><asp:Label ID="LABEL_titlebrowser" runat="server" meta:resourcekey="LABEL_titlebrowserResource1">瀏覽器</asp:Label></span></b></td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td bgcolor="#70b4e9" height="2">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td class="MenuItem" id="menu_sethome" height="20" runat="server">
                                        &nbsp;&nbsp;&nbsp;<asp:Label ID="LABEL_menisethome" runat="server" meta:resourcekey="LABEL_menisethomeResource1">設定為首頁</asp:Label></td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td class="MenuItem" id="menu_setfavorite" height="20" runat="server" linkurl="Javascript:window.external.AddFavorite(location.href,document.title)">
                                        &nbsp;&nbsp;&nbsp;<asp:Label ID="LABEL_menusetfavorite" runat="server" meta:resourcekey="LABEL_menusetfavoriteResource1">加入我的最愛</asp:Label></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
            <td width="2" bgcolor="#000000" style="filter: alpha(opacity=30)">
            </td>
        </tr>
        <tr>
            <td colspan="2" height="2" bgcolor="#000000" style="filter: alpha(opacity=30)">
            </td>
        </tr>
    </table>
</div>
<div class="FloatPanel" id="menu_help" style="display: none; position: absolute; top: -100px;">
    <table cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td>
                <table style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                    border-bottom: black 1px solid" bgcolor="#62abfa" background="/lib/img/bg-menu.jpg">
                    <tr>
                        <td valign="top" width="170" height="200">
                            <table style="font-weight: bold; font-size: 11px; font-family: Tahoma, Arial" cellspacing="3"
                                cellpadding="0" width="100%">
                                <tr>
                                    <td width="20">
                                    </td>
                                    <td style="color: #5ea2d7" valign="bottom">
                                        <b><span id="title_support" runat="server"><asp:Label ID="LABEL_titlesupport" runat="server" meta:resourcekey="LABEL_titlesupportResource1"　Visible="False">支援</asp:Label></span></b></td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td bgcolor="#70b4e9" height="2">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td class="MenuItem" id="menu_helps" height="20" runat="server">
                                        &nbsp;&nbsp;&nbsp;<asp:Label ID="LABEL_menuhelps" runat="server" meta:resourcekey="LABEL_menuhelpsResource1" Visible="False">輔助說明</asp:Label></td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td class="MenuItem" id="menu_sendquestion" height="20" runat="server" linkurl="/manager/sendquestion.aspx">
                                        &nbsp;&nbsp;&nbsp;<asp:Label ID="LABEL_menusendquastion" runat="server" meta:resourcekey="LABEL_menusendquastionResource1"　Visible="False">線上求助</asp:Label></td>
                                </tr>
                                <tr>
                                    <td height="10">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td valign="bottom" height="20">
                                        <font color="#03a957"><b><span id="title_about" runat="server"><asp:Label ID="LABEL_titleabout" runat="server" meta:resourcekey="LABEL_titleaboutResource1"　Visible="False">關於....</asp:Label></span></b></font></td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td bgcolor="#23be5e" height="2">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td class="MenuItem" id="menu_product" height="20" runat="server">
                                        &nbsp;&nbsp;&nbsp;<asp:Label ID="LABEL_menuproduct" runat="server" meta:resourcekey="LABEL_menuproductResource1"　Visible="False">產品資訊</asp:Label></td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td class="MenuItem" id="menu_dgweb" height="20" runat="server" linkurl="http://www.doublegreen.com">
                                        &nbsp;&nbsp;&nbsp;<asp:Label ID="LABEL_menudgweb" runat="server" meta:resourcekey="LABEL_menudgwebResource1"　Visible="False">遠綠資訊科技</asp:Label></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
            <td width="2" bgcolor="#000000" style="filter: alpha(opacity=30)">
            </td>
        </tr>
        <tr>
            <td colspan="2" height="2" bgcolor="#000000" style="filter: alpha(opacity=30)">
            </td>
        </tr>
    </table>
</div>
<table width="100%" cellspacing="0" cellpadding="0" border="0" Class="PanelWhite" align="center">
    <tr class="Smaller">
        <td height="26" bgcolor="#e6e6e6" nowrap width="1%">
            &nbsp;<span id="ver_info" runat="server">EIP for Microsoft .NET Framework 2.0 ,瀏覽器最適版本IE7,建議最佳解析度為1024*768或以上</span>&nbsp;</td>
        <td nowrap width="1%">
            <span id="dev_tools" runat="server"></span>
        </td>
        <td width="1" nowrap bgcolor="#d0d0d0">
        </td>
        <td width="99%">
             
        </td>

        <td height="26" bgcolor="#e6e6e6" nowrap width="1%">
            &nbsp;<span id="ver_second" runat="server"></span>&nbsp;</td>
    </tr>
</table>

