<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Forum.ViewTopic, App_Web_viewtopic.aspx.cdcab7d2" title="主題" theme="Default" %>
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
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <span id="SPAN_defaulttopicheader"
        runat="server"><table align="center" bgcolor="#c0c0c0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td height="1">
                </td>
            </tr>
        </table>
        <table align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td bgcolor="#c0c0c0" height="24" width="1">
                </td>
                <td bgcolor="#ffffff" colspan="2">
                    <table cellpadding="0" cellspacing="1" width="100%">
                        <tr>
                            <td Class="NormalBold">
                                &nbsp;<img border="0" src="img/icon-home.gif" />
                                    <asp:Literal ID="LITERAL_header" runat="server"></asp:Literal></td>
                            <td align="right">
                                <asp:LinkButton ID="LinkButton_newTopic" runat="server" OnClick="LinkButton_newTopic_Click" CssClass="forumnormal" ToolTip="發表新的文章">﹝發表新主題﹞</asp:LinkButton><asp:LinkButton ID="LinkButton_notify" runat="server" CssClass="forumnormal" OnClick="LinkButton_notify_Click" ToolTip="設定新文章發表用email通知或取消">﹝通知﹞</asp:LinkButton></td>
                        </tr>
                    </table>
                </td>
                <td bgcolor="#c0c0c0" height="24" width="1">
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
    <asp:Literal ID="LITERAL_body" runat="server"></asp:Literal><span id="SPAN_defaulttopicbody"
        runat="server">
        <table align="center" border="0" cellpadding="0" cellspacing="0" Class="Normal" width="100%">
            <tr>
                <td bgcolor="#c0c0c0">
                    <table align="center" border="0" cellpadding="4" cellspacing="1" Class="Normal" width="100%">
                        <tr align="middle" bgcolor="#e0e0e0" Class="Normal">
                            <td width="5%">
                                &nbsp;</td>
                            <td id="LABEL_description" runat="server" width="54%">
                                主題</td>
                            <td id="LABEL_author" runat="server" width="15%">
                                作者</td>
                            <td id="LABEL_reply" runat="server" width="8%">
                                回覆</td>
                            <td id="LABEL_lastpost" runat="server" width="18%">
                                最後發表</td>
                        </tr>
                        <tr align="middle">
                            <td id="LABEL_notopic" runat="server" align="middle" bgcolor="#ffffff" colspan="5">
                                <font Class="Normal" color="red">尚未有主題</font>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </span>
    <br />
    <SmoothEnterpriseWebControl:pagejumper id="PageJumper1" runat="server" totalpage="10">
        <BUTTONSTYLE Width="20px" BorderColor="96, 96, 96" BorderWidth="1px" BorderStyle="Solid" BackColor="200, 200, 200"  GradientBegin="224, 224, 224" GradientEnd="64, 64, 64" PaddingSize="2px" />
        <PAGESELECTEDSTYLE BorderColor="Black" BorderWidth="3px" BorderStyle="Solid" BackColor="WhiteSmoke" />
        <PAGENUMBERSTYLE ForeColor="Black" Width="10px" Font-Names="Arial" Font-Size="10px" BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" BackColor="White" PaddingSize="2px" />
    </SmoothEnterpriseWebControl:pagejumper>
</asp:Content>
