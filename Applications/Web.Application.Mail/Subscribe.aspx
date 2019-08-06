<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Mail.Subscribe, App_Web_subscribe.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server"
        Details="The desciption for this program" Caption="Program Name" Width="100%"
        CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
        <CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <table border="0" width="100%">
        <tr>
            <td>
                <table border="0">
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_name" runat="server" Text="電子報主題" CssClass="NormalBold" meta:resourcekey="LABEL_nameResource1"></asp:Label></td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="QUERY_name" TabIndex="101" runat="server"
                                CssClass="Normal" Width="200px" BackColor="#F0F0F0" MaxLength="200" Required="False"
                                ErrorMessage="Please Input「E-mail」!!" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_nameResource1" OnClickMore="" Personalize="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputButton ID="BUTTON_query" runat="server" CssClass="NormalBold"
                                BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060"
                                Font-Size="12px" Font-Names="Arial" Font-Bold="True" Gradient-GradientType="Bottom"
                                Text="查詢" Width="80px" OnClick="BUTTON_query_Click" meta:resourcekey="BUTTON_queryResource1" RunAtCient="False">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                            </SmoothEnterpriseWebControl:InputButton></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputButton ID="BUTTON_unsubscribe" runat="server" Font-Names="Arial"
                                Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                                BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom" Text="取消已訂閱的電子報"
                                Font-Bold="True" OnClick="BUTTON_unsubscribe_Click" meta:resourcekey="BUTTON_unsubscribeResource1" RunAtCient="False">
                                <Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
                            </SmoothEnterpriseWebControl:InputButton></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td id="TD_subscribe" runat="server">
                <SmoothEnterpriseWebControl:CheckBoxList ID="FIELD_mailgid" runat="server" Width="100%"
                    Column="5" CssClass="Normal" GroupCheck="False" BorderColor="#8080FF" meta:resourcekey="FIELD_mailgidResource1" Value="">
                    <GroupHeaderStyle Font-Bold="True" GradientEnd="Navy" GradientLevel="120" GradientBegin="128, 128, 255" BorderStyle="NotSet" CssClass="">
                    </GroupHeaderStyle>
                    <DescriptionStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:CheckBoxList>
            </td>
        </tr>
    </table>
    <table class="Normal" id="Table1" border="0">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_subscribe" runat="server" Font-Names="Arial"
                    Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                    BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom" Width="80px"
                    Text="訂閱" Font-Bold="True" OnClick="BUTTON_subscribe_Click" meta:resourcekey="BUTTON_subscribeResource1" RunAtCient="False">
                    <Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
                </SmoothEnterpriseWebControl:InputButton></td>
        </tr>
    </table>
</asp:Content>
