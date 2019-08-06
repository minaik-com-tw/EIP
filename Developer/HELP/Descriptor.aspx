<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Developer.Descriptor, App_Web_descriptor.aspx.87a0902e" stylesheettheme="Default" culture="Auto" uiculture="Auto" %>

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
        Details="SmoothEnterprise.Content.UI.WebControl.Descriptor" Caption="Class Library"
        Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px"
        IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
        <CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass="">
        </DetailsStyle>
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
                            SmoothEnterprise.Content.UI.WebControl.<strong>Descriptor </strong>
                        </td>
                    </tr>
                    <tr>
                        <td Class="Normal" style="border-top: #009900 1px solid;">
                            Descriptor����|�۰ʨ��o�ثe�����b�t�ΤW�����e��T�A�۰ʴ���Caption�PDetails�ݩʡC<br />
                        �ϥΫe���A�����������t�Τ��e�޲z�A�ó]�wCaption�PDetails�ݩ�</tr>
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
                                        Caption</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_caption" runat="server" Text="�]�w�������e�����D�W��"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        Details</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_details" runat="server" Text="�]�w�������e���y�z��r"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        IconURL</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_iconurl" runat="server" Text="���w�����ϥܦ�}"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        PageURL</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_pageurl" runat="server" Text="���w����ܺ������e��T�������s����}�A�����w�w�]���ثe����"></asp:Label></td>
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
                                        <SmoothEnterpriseWebControlEnterprise:Descriptor ID="Descriptor1" runat="server"
                                            BorderColor="#E0E0E0" BorderStyle="Solid" BorderWidth="1px" CssClass="Normal"
                                            Height="40px">
                                        </SmoothEnterpriseWebControlEnterprise:Descriptor>
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" style="border-right: #003300 1px solid; border-top: #003300 1px solid;
                                border-left: #003300 1px solid; border-bottom: #003300 1px solid; font-size: 12px;
                                font-family: Sans-Serif, Verdana, Arial, Tahoma;">
                                <tr style="color: #000000">
                                    <td Class="Normal" style="background-color: #ffffff">
                                        <strong>IconURL : </strong><span style="color: #000099">[�ʺA�i��]</span>&nbsp;<br />
                                        <SmoothEnterpriseWebControlEnterprise:SelectIconURL ID="SelectIconURL1" runat="server"
                                            BackColor="#F0F0F0" CssClass="Normal" OnSelectedIndexChanged="SelectIconURL1_SelectedIndexChanged">
                                        </SmoothEnterpriseWebControlEnterprise:SelectIconURL>
                                    </td>
                                    <td Class="Normal" style="background-color: #ffffff">
                                        ���w�����ϥܦ�}</td>
                                </tr>
                                                                <tr style="color: #000000">
                                    <td Class="Normal" style="background-color: #ffffff">
                                        <strong>PageURL : </strong><span style="color: #000099">[�ʺA�i��]</span>&nbsp;<br />
                                        <SmoothEnterpriseWebControlEnterprise:SelectContent ID="SelectContent1" runat="server"
                                            BackColor="#F0F0F0" CssClass="Normal" OnSelectedIndexChanged="SelectContent1_SelectedIndexChanged"
                                            ValueField="linkurl">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControlEnterprise:SelectContent>
                                    </td>
                                    <td Class="Normal" style="background-color: #ffffff">
                                        ���w����ܺ������e��T�������s����}</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
