<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Developer.InputText, App_Web_inputtext.aspx.87a0902e" stylesheettheme="Default" culture="Auto" uiculture="Auto" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server"
        Details="SmoothEnterprise.Web.UI.HTMLControl.InputText" Caption="Class Library"
        Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px"
        IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
        <CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet">
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
                        <td Class="Normal" style="height:30px">
                            SmoothEnterprise.Web.UI.HTMLControl.<strong>InputText</strong>
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
                                    <td Class="Normal" style="background-color: #ffffff; height: 18px;" valign="top">
                                    </td>
                                    <td Class="Normal" style="background-color: #ffffff; height: 18px;" valign="top">
                                        FormatType
                                    </td>
                                    <td Class="Normal" style="background-color: #ffffff; height: 18px;" valign="top">
                                        <asp:Label ID="D_formattype" runat="server" Text="�]�w��r�����J���榡���O"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        DateType</td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_datetype" runat="server">�]�w������榡�Ʀr��(��FormatType��Date�榡��)</asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        DateSeparator</td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_dateseparator" runat="server">�]�w������Ϲj�Ÿ�(��FormatType��Date�榡��)</asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        HTMLMode</td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_htmlmode" runat="server">�]�wHTML���s��Ҧ�(��FormatType��HTML�榡��)</asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        ButtonIconUrl</td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_buttoniconurl" runat="server" Text="�ۭq�\����s�ϥ�(��FormatType��InputCombo�榡��)"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        OnClickMore</td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_onclickmore" runat="server" Text="�ۭq�\����sOnClick�ƥ�(JavaScript�y�k)(��FormatType��InputCombo�榡��)"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        HiddenMode</td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_hiddenmode" runat="server">�]�w���������</asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        Personalize</td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_personalize" runat="server">�]�w�O�_�ҥέӤH�ƥ\��</asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        Required</td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_required" runat="server">�O�_�ҥΪť�����</asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        ErrorMessage</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_rrrormessage" runat="server">�����ҥ��Ѯɪ����~�T��</asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        Text</td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_text" runat="server">���o�γ]�w��J�r���</asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        FormatText</td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_formattext" runat="server" Text="���o�榡�ƫ᪺��J�r��"></asp:Label></td>
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
                            <asp:Label ID="L_demo" runat="server" Text="�i��"></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <table width="100%" style="border-right: #003300 1px solid; border-top: #003300 1px solid;
                                border-left: #003300 1px solid; border-bottom: #003300 1px solid">
                                <tr>
                                    <td Class="NormalBold" style="color: #ffffff; background-color: #003300;" align="center">
                                        Style
                                    </td>
                                    <td width="99%" Class="NormalBold" style="color: #ffffff; background-color: #003300;"
                                        align="center">
                                        Properties Setting
                                    </td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="background-color: #ffffff;" valign="top">
                                        <strong>Default</strong><br />
                                        <SmoothEnterpriseWebControl:InputText ID="InputText1" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        &lt;Default Setting&gt;</td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        <strong>Date</strong><br />
                                        <SmoothEnterpriseWebControl:InputText ID="InputText2" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal" FormatType="Date">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        FormatType : Date</td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        <strong>Number</strong> (�u���J�Ʀr)<br />
                                        <SmoothEnterpriseWebControl:InputText ID="InputText3" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal" FormatType="Number">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        FormatType : Number</td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        <strong>HTML</strong><br />
                                        <SmoothEnterpriseWebControl:InputText ID="InputText4" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal" FormatType="HTML" Height="85px" Width="420px">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        FormatType : HTML</td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        <strong>InputCombo</strong><br />
                                        <SmoothEnterpriseWebControl:InputText ID="InputText6" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal" FormatType="InputCombo" ButtonClick="True" OnClickMore="alert('Input Combo');">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        FormatType : InputCombo<br />
                                        OnClickMore : "alert('Input Combo');"</td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        <strong>Required Field</strong><br />
                                        <SmoothEnterpriseWebControl:InputText ID="InputText5" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal" ErrorMessage="Please Input�uRequired Field�v!!" Personalize="False"
                                            Required="True">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText>
                                        <SmoothEnterpriseWebControl:InputButton ID="InputButton1" runat="server" BackColor="#C8C8C8"
                                            BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold"
                                            Font-Bold="True" Font-Names="Arial" Font-Size="12px" Text="Test">
                                            <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                                        </SmoothEnterpriseWebControl:InputButton></td>
                                    <td Class="Normal" style="background-color: #ffffff" valign="top">
                                        Required : true<br />
                                        ErrorMessage : "Please Input�uRequired Field�v!!"</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
