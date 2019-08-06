<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Forum.ViewPost, App_Web_viewpost.aspx.cdcab7d2" title="文章" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Application.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>    
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
		<CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <span id="SPAN_defaultpostheader"
        runat="server">
        <table align="center" bgcolor="#c0c0c0" cellpadding="0" cellspacing="0" style="color: #0000ff;
            text-decoration: underline" width="100%">
            <tr>
                <td height="1">
                </td>
            </tr>
        </table>
        <table align="center" cellpadding="0" cellspacing="0" style="color: #0000ff; text-decoration: underline"
            width="100%">
            <tr>
                <td bgcolor="#c0c0c0" height="24" width="1">
                </td>
                <td bgcolor="#ffffff" colspan="2">
                    <table cellpadding="0" cellspacing="1" width="100%">
                        <tr>
                            <td Class="NormalBold" style="height: 21px">
                                &nbsp;<img border="0" src="img/icon-home.gif" />
    <asp:Literal ID="LITERAL_header" runat="server" meta:resourcekey="LITERAL_headerResource1"></asp:Literal></td>
                            <td align="right" style="color: #0000ff; text-decoration: underline; height: 21px;">
                                <asp:LinkButton ID="LinkButton_newTopic" runat="server" CssClass="forumnormal" OnClick="LinkButton_newTopic_Click" ToolTip="發表新的文章">﹝發表新主題﹞</asp:LinkButton></td>
                        </tr>
                    </table>
                </td>
                <td bgcolor="#c0c0c0" height="24" style="color: #000000; text-decoration: underline"
                    width="1">
                </td>
            </tr>
        </table>
        <table align="center" bgcolor="#c0c0c0" cellpadding="0" cellspacing="0" style="color: #000000;
            text-decoration: underline" width="100%">
            <tr>
                <td height="1">
                </td>
            </tr>
        </table>
    </span>
    <br />
        <table align="center" bgcolor="#c0c0c0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td height="1">
                </td>
            </tr>
        </table>
        <table align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td bgcolor="#c0c0c0" height="24" width="1">
                </td>
                <td bgcolor="#e0e0e0" colspan="2">
                    <table cellpadding="0" cellspacing="1" width="100%">
                        <tr>
                            <td Class="NormalBold">
                                主題：<asp:Label ID="Label_description" runat="server"></asp:Label></td>
                            <td align="right">
                                    <asp:LinkButton ID="LinkButton_editTopic" runat="server" CssClass="forumnormal" OnClick="LinkButton_editTopic_Click">﹝編輯主題﹞</asp:LinkButton><asp:LinkButton
                                        ID="LinkButton_deleteTopic" runat="server" CssClass="forumnormal" OnClick="LinkButton_deleteTopic_Click">﹝刪除主題﹞</asp:LinkButton><asp:LinkButton
                                            ID="LinkButton_notify" runat="server" CssClass="forumnormal" OnClick="LinkButton_notify_Click"
                                            ToolTip="設定新文章發表用email通知或取消">﹝通知﹞</asp:LinkButton></td>
                        </tr>
                    </table>
                </td>
                <td bgcolor="#c0c0c0" height="24" style="font-size: 12pt" width="1">
                </td>
            </tr>
        </table>
        <table align="center" bgcolor="#c0c0c0" cellpadding="0" cellspacing="0" style="font-size: 12pt"
            width="100%">
            <tr>
                <td height="1">
                </td>
            </tr>
        </table>
        <asp:Literal ID="LITERAL_body" runat="server" meta:resourcekey="LITERAL_bodyResource1"></asp:Literal>
        <span id="SPAN_defaultpostbody" runat="server">
        <table align="center" cellpadding="0" cellspacing="0" style="font-size: 12pt" width="100%">
            <tr>
                <td bgcolor="#c0c0c0" height="24" width="1">
                </td>
                <td bgcolor="#c0c0c0">
                    <table bgcolor="#ffffff" cellpadding="0" cellspacing="8" width="100%">
                        <tr>
                            <td rowspan="5" valign="top" width="168">
                                &nbsp;<span style="text-decoration: underline"><span style="color: #0000ff"><font
                                    style="font-size: 12px; color: #8d8d8d"><b>暱稱</b></font><br />
                                </span></span>&nbsp;<img border="0" src="/Security/UserImage.aspx?id=&photo=1" width="120" /><br />
                                &nbsp;<font style="font-size: 12px; color: #8d8d8d">主題：<b>0</b></font><br />
                                &nbsp;<font style="font-size: 12px; color: #8d8d8d">文章：<b>0</b></font>
                            </td>
                            <td bgcolor="#c0c0c0" height="100%" rowspan="5" width="1">
                            </td>
                            <td valign="top" width="600">
                                <font style="font-size: 12px; color: #8d8d8d">標題：Subject</font></td>
                            <td align="right">
                                </td>
                        </tr>
                        <tr>
                            <td bgcolor="#c0c0c0" colspan="2" height="1">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" valign="top">
                                <table cellpadding="0" cellspacing="0" height="120" style="table-layout: fixed" width="100%">
                                    <tr>
                                        <td valign="top" width="32">
                                            &nbsp;</td>
                                        <td align="left" valign="top">
                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td align="left" valign="top">
                                                        <font style="font-size: 12px; color: #8d8d8d">引用：Quote</font></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top" width="32">
                                            &nbsp;</td>
                                        <td align="left" valign="top">
                                            <font style="font-size: 12px; color: #8d8d8d">內容：Content</font><br />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#c0c0c0" colspan="2" height="1">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <font style="font-size: 12px; color: #8d8d8d">
                                    <img align="absMiddle" alt="發表文章時間" src="img/icon-clock.gif" width="11" />&nbsp;</font></td>
                            <td align="right" valign="bottom" width="20%">
                                <font Class="NormalBold">﹝<a href="PostEdit.aspx?id=">編輯回應 | Edit Post</a>﹞&nbsp;﹝<a href="PostDelete.aspx?id=">
                                    刪除回應 | Delete Post</a>﹞</font>
                            </td>
                        </tr>
                    </table>
                </td>
                <td bgcolor="#c0c0c0" width="1">
                </td>
            </tr>
        </table>
        <table align="center" bgcolor="#c0c0c0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td height="1">
                </td>
            </tr>
        </table>
    </span>
    <br />
    <SmoothEnterpriseWebControl:pagejumper id="PageJumper1" runat="server" totalpage="10" ButtonNextLabel="&gt;" ButtonPrevLabel="&lt;" ButtonType="Button" CurrentPage="1" meta:resourcekey="PageJumper1Resource1" ShowPageNumber="True">
        <BUTTONSTYLE Width="20px" BorderColor="96, 96, 96" BorderWidth="1px" BorderStyle="Solid" BackColor="200, 200, 200"  GradientBegin="224, 224, 224" GradientEnd="64, 64, 64" PaddingSize="2px" CssClass="" />
        <PAGESELECTEDSTYLE BorderColor="Black" BorderWidth="3px" BorderStyle="Solid" BackColor="WhiteSmoke" CssClass="" />
        <PAGENUMBERSTYLE ForeColor="Black" Width="10px" Font-Names="Arial" Font-Size="10px" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" BackColor="White" PaddingSize="2px" CssClass="" />
    </SmoothEnterpriseWebControl:pagejumper>
</asp:Content>
