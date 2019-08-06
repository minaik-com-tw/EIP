<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="NewsProgAuth, App_Web_newsprogauth.aspx.cdcab7d2" theme="Default" culture="Auto" uiculture="Auto" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
                <SmoothEnterpriseWebControlEnterprise:Descriptor ID="Descriptor1" runat="server"
                    BorderColor="#E0E0E0" BorderStyle="Solid" BorderWidth="1px" CssClass="Normal"
                    Height="40px">
                    <CaptionStyle BorderStyle="NotSet" CssClass="" />
                    <DetailsStyle BorderStyle="NotSet" CssClass="" />
                    <Template>
                        <br />
                        <br />
                <asp:Label ID="LABEL_news_description" runat="server" Text="News Description"></asp:Label>
                    </Template>
                </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <table border="0">
        <tr>
            <td style="background-color: #cccccc">
                <SmoothEnterpriseWebControl:CheckBoxList ID="CHECK_everyone" runat="server" CssClass="NormalBold"
                    ListDirection="Horizontal" meta:resourcekey="CHECK_everyoneResource1" Value=""
                    Width="536px">
                    <GroupHeaderStyle BackColor="Gray" BorderColor="192, 192, 0" BorderStyle="NotSet" Font-Bold="True" ForeColor="White" Gradient="Right" GradientEnd="192, 192, 0"
                        GradientLevel="100"></GroupHeaderStyle>
                    <Items>
                        <SmoothEnterpriseWebControl:CheckBoxListItem Selected="False" Text="所有人皆可讀取" Description=""
                            Value="Y" GroupText="" meta:resourcekey="CheckBoxListItem_everyoneResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
                    </Items>
                    <DescriptionStyle BorderStyle="NotSet"></DescriptionStyle>
                </SmoothEnterpriseWebControl:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControlEnterprise:ProgAuth ID="ProgAuth1" runat="server" CssClass="Normal"
                    Font-Bold="True" Font-Names="Arial" Font-Size="12px">
                    <AuthTypes>
                        <SmoothEnterpriseWebControlEnterprise:AuthItem AuthName="檢視" AuthType="V" />
                    </AuthTypes>
                </SmoothEnterpriseWebControlEnterprise:ProgAuth>
            </td>
        </tr>
    </table>
    <table border="0">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_save" OnClick="BUTTON_save_Click"
                    runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060" BorderWidth="1px"
                    BorderStyle="Solid" BackColor="#C8C8C8" meta:resourcekey="BUTTON_saveResource1"
                    CssClass="NormalBold" Text="儲存" Gradient-GradientType="Bottom" RunAtCient="False"
                    Font-Bold="True" Width="80px">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;<SmoothEnterpriseWebControl:InputButton
                    ID="BUTTON_back" OnClick="BUTTON_back_Click" runat="server" Font-Names="Arial"
                    Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                    BackColor="#C8C8C8" meta:resourcekey="BUTTON_backResource1" CssClass="NormalBold"
                    Text="回上頁" Gradient-GradientType="Bottom" RunAtCient="False" Font-Bold="True"
                    Width="80px">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
            </td>
        </tr>
    </table>
</asp:Content>
