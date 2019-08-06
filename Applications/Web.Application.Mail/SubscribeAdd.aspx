<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Mail.SubscribeAdd, App_Web_subscribeadd.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

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
                <SmoothEnterpriseWebControl:CheckBoxList ID="FIELD_mailgid" runat="server" Width="100%"
                    Column="5" CssClass="Normal" GroupCheck="False" BorderColor="#8080FF" meta:resourcekey="FIELD_mailgidResource1" Value="">
                    <GroupHeaderStyle Font-Bold="True" GradientEnd="Navy" GradientLevel="120" GradientBegin="128, 128, 255" BorderStyle="NotSet" CssClass="">
                    </GroupHeaderStyle>
                    <DescriptionStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:CheckBoxList>
                <SmoothEnterpriseWebControl:InputText ID="FIELD_selected_mailgid" runat="server"
                    BackColor="#F0F0F0" CssClass="Normal" HiddenMode="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_selected_mailgidResource1" OnClickMore="" Personalize="False" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText>
            </td>
        </tr>
        <tr>
            <td id="TD_subscribe">
                <table border="0">
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_email" runat="server" Text="E-mail" CssClass="NormalBold" meta:resourcekey="LABEL_emailResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_email" TabIndex="101" runat="server"
                                BackColor="#F0F0F0" Width="300px" CssClass="Normal" ErrorMessage="Please Input「E-mail」!!"
                                Required="True" MaxLength="200" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_emailResource1" OnClickMore="" Personalize="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="「E-mail」Format Error !!"
                                ControlToValidate="FIELD_email" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                EnableClientScript="False" Display="None" meta:resourcekey="RegularExpressionValidator1Resource1"></asp:RegularExpressionValidator></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_name" runat="server" Text="Name" CssClass="NormalBold" meta:resourcekey="LABEL_nameResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_name" TabIndex="101" runat="server"
                                BackColor="#F0F0F0" Width="300px" CssClass="Normal" ErrorMessage="Please Input「Name」!!"
                                Required="True" MaxLength="200" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nameResource1" OnClickMore="" Personalize="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="NormalBold" id="TD_login" runat="server">
                <table border="0">
                    <tr>
                        <td id="TD_logindescription" runat="server">
                            &nbsp;<asp:Label ID="Label3" runat="server"
                                Text="If You are sute user , Please login first" CssClass="NormalBold" meta:resourcekey="Label3Resource1"></asp:Label>&nbsp;</td>
                        <td>
                            <SmoothEnterpriseWebControl:InputButton ID="BUTTON_login" runat="server" Font-Names="Arial"
                                Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                                BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom" Width="80px"
                                Text="登入" Font-Bold="True" OnClick="BUTTON_login_Click" meta:resourcekey="BUTTON_loginResource1" RunAtCient="False">
                                <Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
                            </SmoothEnterpriseWebControl:InputButton></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table class="Normal" id="Table1" border="0">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_accept" runat="server" Font-Names="Arial"
                    Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                    BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom" Width="80px"
                    Text="確認訂閱" Font-Bold="True" OnClick="BUTTON_accept_Click" meta:resourcekey="BUTTON_acceptResource1" RunAtCient="False">
                    <Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Font-Names="Arial"
                    Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                    BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom" Font-Bold="True"
                    Text="回上頁" Width="80px" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
