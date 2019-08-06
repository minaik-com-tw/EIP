<%@ control language="c#" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Portal.uc.ContentRecently, App_Web_contentrecently.ascx.50d77b3" targetschema="http://schemas.microsoft.com/intellisense/ie5" enableviewstate="False" %>
<table width="100%" border="0" cellspacing="5" cellpadding="0" style="border-top-width: 1px;
    border-left-width: 1px; font-size: 11px; border-left-color: lightsteelblue; border-bottom-width: 1px;
    border-bottom-color: lightsteelblue; border-top-color: lightsteelblue; font-family: Tahoma;
    border-right-width: 1px; border-right-color: lightsteelblue">
    <tr>
        <td rowspan="4" width="1" nowrap background="/lib/img/bg-mask.gif">
        </td>
        <td rowspan="4" width="1" nowrap>
        </td>
        <td style="font-weight: bold; font-size: 11px">
            <span id="recentlytitle" runat="server">What's new !</span><img src="/lib/img/ani-new.gif"
                border="0" align="absmiddle" hspace="3"></td>
    </tr>
    <tr>
        <td height="1" bgcolor="#333333">
        </td>
    </tr>
    <tr>
        <td id="recentcontent" runat="server">
        </td>
    </tr>
    <tr>
        <td>
            &nbsp; &nbsp; &nbsp; &nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Content/RecentlyUpdate.aspx" meta:resourcekey="HyperLink1Resource1">More...</asp:HyperLink></td>
    </tr>
</table>
