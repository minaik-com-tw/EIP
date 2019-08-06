<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Developer.CategoryContent, App_Web_categorycontent.aspx.87a0902e" stylesheettheme="Default" culture="Auto" uiculture="Auto" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Application.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server"
        Details="SmoothEnterprise.Content.UI.WebControl.CategoryContent" Caption="Class Library"
        Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px"
        IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
        <CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet"
            CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <table style="width: 80%;">
        <tr>
            <td valign="top">
                <table width="100%" style="background-color: #339933; filter: progid:DXImageTransform.Microsoft.Gradient(startColorStr='#FFFFFFF', endColorStr='#55AAFFAA', gradientType='1');
                    border-right: #000099 1px solid; border-top: #000099 1px solid; border-left: #000099 1px solid;
                    border-bottom: #000099 1px solid;">
                    <tr>
                        <td Class="NormalBold" style="font-size: 14px; border-bottom: #009900 thin solid;">
                            <asp:Label ID="L_classname" runat="server" Text="���O�W��"></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal" style="height: 30px">
                            SmoothEnterprise.Content.UI.WebControl.<strong>CategoryContent</strong>
                        </td>
                    </tr>
                    <tr>
                        <td Class="Normal" style="border-top: #009900 1px solid;">
                            CategoryContent����|�۰ʨ��o�t�ΤW�Ҧ�������T�Τ��e��T�A�۰ʱN�ثe�ϥΪ̩ұ��v���e�H���h���𪬵��c��ܡC<br />
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="5">
            </td>
        </tr>
        <tr>
            <td Class="Normal">
                <table width="100%">
                    <tr>
                        <td Class="NormalBold" style="font-size: 14px; border-bottom: #009900 thin solid;
                            height: 20px;">
                            <asp:Label ID="L_properties" runat="server" Text="�ݩ�"></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <table width="100%" style="border-right: #003300 1px solid; border-top: #003300 1px solid;
                                border-left: #003300 1px solid; border-bottom: #003300 1px solid">
                                <tr>
                                    <td width="1%" Class="NormalBold" style="color: #ffffff; background-color: #003300;"
                                        align="center">
                                    </td>
                                    <td width="20%" Class="NormalBold" style="color: #ffffff; background-color: #003300;"
                                        align="center">
                                        Name
                                    </td>
                                    <td Class="NormalBold" style="color: #ffffff; background-color: #003300;" align="center">
                                        Description
                                    </td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        DisplayMode</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_DisplayMode" runat="server" Text="��ܸ����ܪ��Ҧ�"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        NewWithinDays</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_NewWithinDays" runat="server" Text="�]�w�A�̪�X�Ѥ��s�W�����e���s�����e"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        ReviseWithinDays</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_ReviseWithinDays" runat="server" Text="�]�w�A�̪�X�Ѥ���s�����e����s�����e"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        OrderType</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_OrderType" runat="server" Text="�]�w���e�ƧǪ��̾�"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        ShowContent</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_ShowContent" runat="server" Text="�]�w�O�_��ܤ����U�����e���"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        ShowFooter</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_ShowFooter" runat="server" Text="�]�w�O�_��ܭ����έp��T"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        ViewType</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_ViewType" runat="server" Text="�]�w������ܤ覡"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        EnableCategoryLink</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_EnableCategoryLink" runat="server" Text="�]�w�O�_�ҥΤ����s��"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        Personalize</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_personalize" runat="server">�]�w�O�_�ҥέӤH�ƥ\��ΫȨ������ܥ\��</asp:Label></td>
                                </tr>
                                
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        Columns</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_Columns" runat="server" Text="�]�w�������ήi�{�����ƥ�"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        ExpandedLevel</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_ExpandedLevel" runat="server" Text="�]�w����(�t���e)�i�}�����h��"></asp:Label></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="5">
            </td>
        </tr>
        <tr>
            <td Class="Normal">
                <table width="100%">
                    <tr>
                        <td Class="NormalBold" style="font-size: 14px; border-bottom: #009900 thin solid;
                            height: 20px;">
                            <asp:Label ID="L_Demo" runat="server" Text="�i��"></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <table width="100%">
                                <tr>
                                    <td width="1%">
                                        <SmoothEnterpriseWebControlEnterprise:CategoryContent ID="CategoryContent1" runat="server">
                                            <CategoryStyle BorderStyle="NotSet" CssClass="" />
                                            <ContentStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControlEnterprise:CategoryContent>
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" style="border-right: #003300 1px solid; border-top: #003300 1px solid;
                                border-left: #003300 1px solid; border-bottom: #003300 1px solid; font-size: 12px;
                                font-family: Sans-Serif, Verdana, Arial, Tahoma;">
                                <tr style="color: #000000">
                                    <td Class="Normal" style="background-color: #ffffff">
                                        <strong>DisplayMode : </strong><span style="color: #000099">[�ʺA�i��]</span>&nbsp;<br />
                                        <asp:RadioButtonList ID="RB_DisplayMode" runat="server" AutoPostBack="True" CssClass="Normal"
                                            OnSelectedIndexChanged="RB_DisplayMode_SelectedIndexChanged" RepeatDirection="Horizontal">
                                            <asp:ListItem Selected="True">Mode1</asp:ListItem>
                                            <asp:ListItem>Mode2</asp:ListItem>
                                        </asp:RadioButtonList></td>
                                    <td Class="Normal" style="background-color: #ffffff">
                                        Mode1 : �|��ܤ����ԲӸ��<br />
                                        Mode2 : ����ܤ����W��</td>
                                </tr>
                                
                                <tr style="color: #000000">
                                    <td Class="Normal" style="background-color: #ffffff">
                                        <strong>ShowContent : </strong><span style="color: #000099">[�ʺA�i��]</span>&nbsp;<br />
                                        <asp:CheckBox ID="CB_ShowContent" runat="server" AutoPostBack="True" Checked="True"
                                            CssClass="Normal" OnCheckedChanged="CB_ShowContent_CheckedChanged" Text="true" /></td>
                                    <td Class="Normal" style="background-color: #ffffff">
                                        �]�w�O�_��ܤ����U�����e���</td>
                                </tr>
                                <tr style="color: #000000">
                                    <td Class="Normal" style="background-color: #ffffff">
                                        <strong>ShowFooter : </strong><span style="color: #000099">[�ʺA�i��]</span>&nbsp;<br />
                                        <asp:CheckBox ID="CB_ShowFooter" runat="server" AutoPostBack="True" Checked="True"
                                            CssClass="Normal" OnCheckedChanged="CB_ShowFooter_CheckedChanged" Text="true" /></td>
                                    <td Class="Normal" style="background-color: #ffffff">
                                        �]�w�O�_��ܭ����έp��T</td>
                                </tr>
                                <tr style="color: #000000">
                                    <td Class="Normal" style="background-color: #ffffff">
                                        <strong>EnableCategoryLink : </strong><span style="color: #000099">[�ʺA�i��]</span>&nbsp;<br />
                                        <asp:CheckBox ID="CB_EnableCategoryLink" runat="server" AutoPostBack="True" Checked="True"
                                            CssClass="Normal" OnCheckedChanged="CB_EnableCategoryLink_CheckedChanged" Text="true" /></td>
                                    <td Class="Normal" style="background-color: #ffffff">
                                        �]�w�O�_�ҥΤ����s��</td>
                                </tr>
                                
                                <tr style="color: #000000">
                                    <td Class="Normal" style="background-color: #ffffff">
                                        <strong>Columns : </strong><span style="color: #000099">[�ʺA�i��]</span>&nbsp;<br />
                                        <asp:DropDownList ID="DD_Columns" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DD_Columns_SelectedIndexChanged">
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem Selected="True">2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td Class="Normal" style="background-color: #ffffff">
                                        �]�w�������ήi�{�����ƥ�</td>
                                </tr>
                                <tr style="color: #000000">
                                    <td Class="Normal" style="background-color: #ffffff">
                                        <strong>ExpandedLevel : </strong><span style="color: #000099">[�ʺA�i��]</span>&nbsp;<br />
                                        <asp:DropDownList ID="DD_ExpandedLevel" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DD_ExpandedLevel_SelectedIndexChanged">
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem Selected="True">2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td Class="Normal" style="background-color: #ffffff">
                                        �]�w����(�t���e)�i�}�����h��</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
