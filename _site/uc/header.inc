<%
  pathinfo=request.servervariables("path_info")	
  langprefs = Request.ServerVariables("HTTP_ACCEPT_LANGUAGE")
  langs = split(langprefs,",") 
  currlang = ""  ' (set default) 
  currlang=replace(langs(0),"-","")
  
  smoothenterprise_language=currlang
  
  if left(currlang,2)="en" then
	currlang=""
  end if

	if smoothenterprise_uid<>"" then
		set rsuser=server.createobject("adodb.recordset")
		sqluser="select name from dguser where logonid='" & smoothenterprise_uid & "'"
		rsuser.open sqluser,smoothconn,adOpenStatic,adLockReadonly
		if not rsuser.eof then
			smoothenterprise_uname=rsuser("name")
		end if
		set rsuser=nothing
	end if
	
class_title="medium"
class_description="small"
class_inputtext="normal"
class_inputlabel="normalbold"
class_viewtext="normal"
class_inputbutton="normalbold"
class_normal="normal"
defaultTableStyle=" cellpadding=1 cellspacing=0 border=0 style=""font-family:'Arial';font-size:12px;font-weight:normal;font-size:12px;background-color:#ffffff;"""
defaultContentFont="class=normal"
'defaultContentStyle="height=21"
defaultContentStyle="style=""border-right:#e0e0e0 1px Solid;"" "
defaultTitleFont="class=defaulttitlefont"
defaultTitleStyle="height=""30px"" style=""background:#000000;border-right:#e0e0e0 1px Solid"" "
pagefont="class=small"
if isobject(listinfo) then
	listinfo.ManualInsertRow=false
	listinfo.listeventhandle=false
	listinfo.ContentNotFound = "<font class=normalbold><font color=gray>- No record and information to be displayed -</font></font>"
	listinfo.DefaultTitleFont = defaultTitleFont
	listinfo.DefaultTitleStyle = defaultTitleStyle
	listinfo.DefaultContentFont = defaultContentFont
	listinfo.DefaultContentStyle = defaultContentStyle
	listinfo.TitleHighlight = "bgcolor=#666666 height=1"
	listinfo.TitleShadow = "bgcolor=#666666 height=1"
	listinfo.showHeader=true
	listinfo.DefaultTableStyle=defaulttablestyle
end if

%>

<!-- Double Green SmoothEnterprise.NET base template -->
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	<!--	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">-->
		<meta http-equiv="MSThemeCompatible" content="No">
		
		<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
		<html xmlns="http://www.w3.org/1999/xhtml" >


<link href="/App_Themes/Default/font.css" type="text/css" rel="stylesheet" />
<link href="/App_Themes/Default/form.css" type="text/css" rel="stylesheet" />
<link href="/App_Themes/Default/menu.css" type="text/css" rel="stylesheet" />
<link href="/App_Themes/Default/ui.css" type="text/css" rel="stylesheet" />

<LINK REL="stylesheet" TYPE="text/css" HREF="/smoothenterprise/themes/default.css">



	</head>
	<body bgcolor="#ffffff" style="margin:3px 3px 3px 3px">
		<table width="100%" class="normal" cellpadding="0" cellspacing="0" ID="Header_Table1">
			<tr>
				<td>
<style> .topmenu { BORDER-RIGHT: #333333 1px solid; BORDER-TOP: #333333 1px solid; BORDER-LEFT: #333333 1px solid; BORDER-BOTTOM: #333333 1px solid }
	.topmenuon { BORDER-RIGHT: #202020 1px solid; BORDER-TOP: #000000 3px solid; BORDER-LEFT: #202020 1px solid; BORDER-BOTTOM: #202020 1px solid; BACKGROUND-COLOR: #202020 }
	.menuitem { BORDER-TOP-WIDTH: 1px; PADDING-RIGHT: 1px; PADDING-LEFT: 1px; BORDER-LEFT-WIDTH: 1px; BORDER-BOTTOM-WIDTH: 1px; PADDING-BOTTOM: 1px; BEHAVIOR: url(/lib/htc/menu.htc); PADDING-TOP: 1px; BORDER-RIGHT-WIDTH: 1px }
	.menuitemon { BORDER-RIGHT: steelblue 1px solid; BORDER-TOP: steelblue 1px solid; BEHAVIOR: url(/lib/htc/menu.htc) ; BORDER-LEFT: steelblue 1px solid; CURSOR: hand; BORDER-BOTTOM: steelblue 1px solid }
</style>
<table cellspacing="0" cellpadding="0" width="100%" border="0">
    <tr bgcolor="#4b6cbc">
        <td width="1%">
            <img src="/lib/img/img-theme2logo.gif" id="ctl00_HeaderControl1_img_logo" vspace="0" border="0" /></td>
        <td style="background-image: url(/lib/img/bg-theme2header.jpg); background-repeat: repeat"
            valign="baseline" nowrap align="right" width="99%">
            <table cellspacing="5">
                <tr>
                    <td id="ctl00_HeaderControl1_date_info" style="border-right: #9999ff 1px solid; padding-right: 5px; border-top: #9999ff 1px solid;
                        padding-left: 5px; font-size: 11px; padding-bottom: 2px; margin: 5px; border-left: #9999ff 1px solid;
                        color: #ffffff; padding-top: 2px; border-bottom: #9999ff 1px solid; font-family: Tahoma, Arial">
                        <% if currlang="zhtw" then response.write year(date()) & "年" & month(date()) & "月" & day(date()) & "日" else response.write formatdatetime(date(),1)%>
                    </td>

                    <td>
                    </td>
                </tr>
            </table>
            <table id="ctl00_HeaderControl1_login_info1" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td width="200" bgcolor="#575757" height="3">
                    </td>
	</tr>
</table>

        </td>
    </tr>
    <tr>
        <td align="right" colspan="2">
            <table id="ctl00_HeaderControl1_login_info2" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td width="200" bgcolor="#575757" height="1">
                    </td>
	</tr>
</table>

        </td>
    </tr>
    <tr>
        <td bgcolor="#333333" colspan="2">
            <table style="font-weight: bold; font-size: 11px; color: white; font-family: Tahoma, 'Trebuchet MS', Verdana, Arial"
                cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr height="3">
                    <td nowrap width="20">
                    </td>
                    <td nowrap width="100" bgcolor="#ffa800">
                    </td>
                    <td nowrap width="1">
                    </td>
                    <td nowrap width="100" bgcolor="#ff1300">
                    </td>
                    <td nowrap width="1">
                    </td>
                    <td nowrap width="100" bgcolor="#33cc66">
                    </td>
                    <td nowrap width="1">
                    </td>
                    <td nowrap width="99%" bgcolor="#000000">
                    </td>
                    <td id="ctl00_HeaderControl1_login_info3" nowrap="nowrap" width="1" bgcolor="#000000" rowspan="3">
                    </td>

                    <td background="/lib/img/bg-theme2grey.gif" rowspan="3">
                        <table style="font-weight: bold; font-size: 11px; color: white; font-family: Tahoma, Arial"
                            cellspacing="0" cellpadding="0">
                            <tr>
                                <td id="ctl00_HeaderControl1_login_info4" style="font-weight: normal; font-size: 11px" nowrap="nowrap" width="200">&nbsp;<img src="/Security/UserImage.aspx?id={1D933141-E015-47FE-A6F2-846231264AC0}" align=absmiddle border=1 height=20>&nbsp;<%if currlang="zhtw" then response.write "您登入為" else response.write "You are" end if%>&nbsp;<b><%=smoothenterprise_uname%></b></td>

                            </tr>
                            <tr height="5">
                                <td>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr height="10">
                    <td>
                    </td>
                    <td id="ctl00_HeaderControl1_MenuMy" class="topmenu" style="behavior: url(/lib/htc/menu.htc)" background="/lib/img/bg-theme2topmenu.gif" rowspan="2" submenu="menu_my" menutype="topdown" dx="-1" dy="-3">
                        &nbsp;&nbsp;<%if currlang="zhtw" then response.write "我的個人" else response.write "My" end if%></td>

                    <td>
                    </td>
                    <td id="ctl00_HeaderControl1_MenuOption" class="topmenu" style="behavior: url(/lib/htc/menu.htc)" background="/lib/img/bg-theme2topmenu.gif" rowspan="2" submenu="menu_options" menutype="topdown" dx="-1" dy="-3">
                        &nbsp;&nbsp;<%if currlang="zhtw" then response.write "選項設定" else response.write "Options" end if%></td>

                    <td>
                    </td>
                    <td id="ctl00_HeaderControl1_MenuHelp" class="topmenu" style="behavior: url(/lib/htc/menu.htc)" background="/lib/img/bg-theme2topmenu.gif" rowspan="2" submenu="menu_help" menutype="topdown" dx="-1" dy="-3">
                        &nbsp;&nbsp;<%if currlang="zhtw" then response.write "輔助說明" else response.write "Online Help" end if%></td>

                    <td>
                    </td>
                    <td align="right" rowspan="2">
                        <img src="/lib/img/icon-zoomer.gif" border="0" align="absMiddle" hspace="3"><input name="ctl00$HeaderControl1$keyword" type="text" id="ctl00_HeaderControl1_keyword" style="border-right: darkgray 1px solid; border-top: darkgray 1px solid;
                            font-size: 11px; border-left: darkgray 1px solid; color: white; border-bottom: darkgray 1px solid;
                            font-family: Tahoma; background-color: dimgray" />
                        <img id="ctl00_HeaderControl1_BUTTON_search" onclick="location.href='/content/search.aspx?keyword='+ctl00_HeaderControl1_keyword.value;" src="/lib/img/btn-search.gif" align="absmiddle" style="border-width:0px;cursor:pointer;" />&nbsp;<img id="ctl00_HeaderControl1_BUTTON_searchmore" onclick="location.href='/content/searchmore.aspx?keyword='+ctl00_HeaderControl1_keyword.value;" src="/lib/img/btn-more.gif" align="absmiddle" style="border-width:0px;cursor:pointer;" />&nbsp;&nbsp;
                    </td>
                </tr>
                <tr height="14">
                    <td>
                    </td>
                    <td bgcolor="#c4c4c4">
                    </td>
                    <td bgcolor="#c4c4c4">
                    </td>
                    <td bgcolor="#c4c4c4">
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td bgcolor="#c4c4c4" colspan="2" height="2">
        </td>
    </tr>
</table>
<div class="floatpanel" id="menu_my" style="display: none">
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
                                        <font color="#5ea2d7"><b><span id="ctl00_HeaderControl1_title_personal"><%if currlang="zhtw" then response.write "個人化" else response.write "Personalize" end if%></span></b></font></td>
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
                                    <td id="ctl00_HeaderControl1_menu_home" class="menuitem" height="20" linkurl="/portal/default.aspx" dx="-25" dy="-2" submenu="ctl00_HeaderControl1_menu_mylinks">
                                        &nbsp;&nbsp;&nbsp;<%if currlang="zhtw" then response.write "我的首頁" else response.write "My Home" end if%></td>

                                </tr>
                                <!--					<TR>
						<TD></TD>
						<TD class="menuitem" height="20">&nbsp;&nbsp;&nbsp;My Email</TD>
					</TR> -->
                                <tr>
                                    <td>
                                    </td>
                                    <td id="ctl00_HeaderControl1_menu_profile" class="menuitem" height="20" linkurl="/Security/MyProfile.aspx">
                                        &nbsp;&nbsp;&nbsp;<%if currlang="zhtw" then response.write "帳號管理" else response.write "My Account" end if%></td>

                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td id="ctl00_HeaderControl1_menu_personalize" class="menuitem" height="20">
                                        &nbsp;&nbsp;&nbsp;<%if currlang="zhtw" then response.write "個人化設定" else response.write "Personalize" end if%></td>

                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td valign="bottom" height="20">
                                        <font color="#03a957"><b><span id="ctl00_HeaderControl1_title_general"><%if currlang="zhtw" then response.write "一般功能" else response.write "General" end if%></span></b></font></td>
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
                                    <td id="ctl00_HeaderControl1_menu_news" class="menuitem" height="20" linkurl="/portal/mynews.aspx">
                                        &nbsp;&nbsp;&nbsp;<%if currlang="zhtw" then response.write "最新消息" else response.write "My News" end if%></td>

                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td id="ctl00_HeaderControl1_menu_loginout" class="menuitem" height="20" linkurl="/security/logout.aspx?target=/">&nbsp;&nbsp;&nbsp;<%if currlang="zhtw" then response.write "登出" else response.write "Logout" end if%></td>

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
<div id="ctl00_HeaderControl1_menu_mylinks" class="floatpanel" style="display: none">
    <table cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td>
                <table style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                    border-bottom: black 1px solid" bgcolor="#62abfa" background="/lib/img/bg-menu.jpg">
                    <tr>
                        <td valign="top" width="140">
                            <table id="ctl00_HeaderControl1_menu_definedlinks" style="font-weight: bold; font-size: 11px; font-family: Tahoma, Arial" cellspacing="3" cellpadding="0" width="100%">
	<tr>
		<td width="20">
                                        &nbsp;</td>
		<td id="ctl00_HeaderControl1_menu_addlink" class="menuitem" height="20" linkurl="/Portal/AddFavorite.aspx?linkurl=<%=pathinfo%>">
                                        &lt;&nbsp;Add Link...&nbsp;&gt;</td>
   
        <%
			sqllink="select linkurl,description from dgfavorite order by seq"
			set rslink=server.createobject("adodb.recordset")
			rslink.open sqllink,smoothconn,adOpenStatic,adLockReadonly
			while not rslink.eof
		%>
		 </tr>
		<td width="20">
                                        &nbsp;</td>
		<td class="menuitem" height="20" linkurl="<%=rslink("linkurl")%>"><%=rslink("description")%></td></tr>
		<%		
				rslink.movenext()
			wend
			set rslink=nothing
        %>
	
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
<div class="floatpanel" id="menu_options" style="display: none">
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
                                        <b><span id="ctl00_HeaderControl1_title_browser"><%if currlang="zhtw" then response.write "瀏覽器" else response.write "Browser" end if%></span></b></td>
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
                                    <td id="ctl00_HeaderControl1_menu_sethome" class="menuitem" height="20">
                                        &nbsp;&nbsp;&nbsp;<%if currlang="zhtw" then response.write "設定為首頁" else response.write "Set as Home" end if%></td>

                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td id="ctl00_HeaderControl1_menu_setfavorite" class="menuitem" height="20" linkurl="Javascript:window.external.AddFavorite(location.href,document.title)">
                                        &nbsp;&nbsp;&nbsp;<%if currlang="zhtw" then response.write "加入我的最愛" else response.write "Add to Favoriate" end if%></td>

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
<div class="floatpanel" id="menu_help" style="display: none">
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
                                        <b><span id="ctl00_HeaderControl1_title_support"><%if currlang="zhtw" then response.write "支援" else response.write "Support" end if%></span></b></td>
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
                                    <td id="ctl00_HeaderControl1_menu_helps" class="menuitem" height="20">
                                        &nbsp;&nbsp;&nbsp;<%if currlang="zhtw" then response.write "輔助說明" else response.write "Online Help" end if%></td>

                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td id="ctl00_HeaderControl1_menu_sendquestion" class="menuitem" height="20" linkurl="/manager/sendquestion.aspx?url=/Portal/Default.aspx">
                                        &nbsp;&nbsp;&nbsp;<%if currlang="zhtw" then response.write "線上求助" else response.write "Send Feedback" end if%></td>

                                </tr>
                                <tr>
                                    <td height="10">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td valign="bottom" height="20">
                                        <font color="#03a957"><b><span id="ctl00_HeaderControl1_title_about"><%if currlang="zhtw" then response.write "關於...." else response.write "About...." end if%></span></b></font></td>
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
                                    <td id="ctl00_HeaderControl1_menu_product" class="menuitem" height="20">
                                        &nbsp;&nbsp;&nbsp;<%if currlang="zhtw" then response.write "產品資訊" else response.write "Product Information" end if%></td>

                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td id="ctl00_HeaderControl1_menu_dgweb" class="menuitem" height="20" linkurl="http://www.doublegreen.com">
                                        &nbsp;&nbsp;&nbsp;<%if currlang="zhtw" then response.write "遠綠資訊科技" else response.write "Link to Double Green" end if%></td>

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




