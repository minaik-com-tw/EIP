<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Forum.MyForum, App_Web_myforum.aspx.cdcab7d2" title="我的討論區" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

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
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server"
        Details="The desciption for this program" Caption="Program Name" Width="100%"
        CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
        <CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <table border="0">
        <tr Class="NormalBold">
            <td>
                <asp:Label ID="LABEL_forumname" runat="server" Text="討論區名稱" meta:resourcekey="LABEL_forumnameResource1"></asp:Label></td>
            <td>
                <asp:Label ID="LABEL_forumcategory" runat="server" Text="分類" meta:resourcekey="LABEL_forumcategoryResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="QUERY_name" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" Personalize="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_nameResource1" OnClickMore="" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="QUERY_category" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" Personalize="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_categoryResource1" OnClickMore="" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_query" runat="server" Width="80px"
                    Font-Names="Arial" Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                    BackColor="#C8C8C8" Font-Bold="True" CssClass="NormalBold" Text="查詢" OnClick="BUTTON_query_Click" meta:resourcekey="BUTTON_queryResource1" RunAtCient="False">
                    <Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_signup" runat="server" BackColor="#C8C8C8"
                    BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" Font-Size="12px"
                    Font-Names="Arial" Width="80px" Text="加入討論區" CssClass="NormalBold" Font-Bold="True"
                    OnClick="BUTTON_signup_Click" meta:resourcekey="BUTTON_signupResource1" RunAtCient="False">
                    <Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
                </SmoothEnterpriseWebControl:InputButton></td>
        </tr>
    </table>
    <br>
    <asp:Literal ID="LITERAL_body" runat="server" meta:resourcekey="LITERAL_bodyResource1"></asp:Literal>
    <span id="SPAN_defaultforumbody" runat="server">
        <table cellspacing="0" cellpadding="0" border="0" width="100%" align="center" Class="Normal">
            <tr>
                <td bgcolor="#c0c0c0">
                    <div id="category" class="dropdownpanel" width="100%" titleheight="20" titleClass="NormalBold"
                        titlecaption="※ N/A ※" titlealign="left">
                        <table Class="Normal" border="0" cellspacing="1" cellpadding="4" width="100%" align="center">
                            <tr Class="Normal" bgcolor="#e0e0e0" align="center">
                                <td width="5%">
                                    &nbsp;</td>
                                <td width="46%">
                                    <asp:Label ID="LABEL_forum" runat="server" Text="討論區" meta:resourcekey="LABEL_forumResource1"></asp:Label></td>
                                <td width="8%">
                                    <asp:Label ID="LABEL_topic" runat="server" Text="主題" meta:resourcekey="LABEL_topicResource1"></asp:Label></td>
                                <td width="8%">
                                    <asp:Label ID="LABEL_post" runat="server" Text="帖數" meta:resourcekey="LABEL_postResource1"></asp:Label></td>
                                <td width="18%">
                                    <asp:Label ID="LABEL_lastpost" runat="server" Text="最後發表" meta:resourcekey="LABEL_lastpostResource1"></asp:Label></td>
                                <td width="15%">
                                    <asp:Label ID="LABEL_admin" runat="server" Text="版主" meta:resourcekey="LABEL_adminResource1"></asp:Label></td>
                            </tr>
                            <tr align="center">
                                <td bgcolor="#f8fcf1" colspan="6" align="center">
                                    <asp:Label ID="LABEL_noforum" runat="server" Text="尚未加入討論區" CssClass="Normal" ForeColor="Red" meta:resourcekey="LABEL_noforumResource1"></asp:Label></td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </span>
</asp:Content>
