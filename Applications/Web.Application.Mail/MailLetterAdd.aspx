<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Mail.MailLetterAdd, App_Web_mailletteradd.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Application.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
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
    <table class="Normal" border="0">
        <tr>
            <td valign="top">
                <table>
                    <tbody>
                        <tr>
                            <td width="1%">
                                <asp:Label ID="LABEL_sendermail" runat="server" Text="寄件人E-mail" CssClass="NormalBold" meta:resourcekey="LABEL_sendermailResource1"></asp:Label></td>
                            <td>
                                <asp:Label ID="LABEL_sender" runat="server" Text="寄件人名稱" CssClass="NormalBold" meta:resourcekey="LABEL_senderResource1"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ID="FIELD_sendermail" TabIndex="100" runat="server"
                                    Width="300px" BackColor="#F0F0F0" CssClass="Normal" Required="True" MaxLength="100"
                                    ErrorMessage="請輸入「寄件人E-mail」!!" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_sendermailResource1" OnClickMore="" Personalize="False">
                                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                </SmoothEnterpriseWebControl:InputText></td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ID="FIELD_sender" TabIndex="100" runat="server"
                                    Width="300px" BackColor="#F0F0F0" CssClass="Normal" Required="True" MaxLength="100"
                                    ErrorMessage="請輸入「寄件人」!!" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_senderResource1" OnClickMore="" Personalize="False">
                                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                </SmoothEnterpriseWebControl:InputText></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="LABEL_subject" runat="server" Text="主題" CssClass="NormalBold" meta:resourcekey="LABEL_subjectResource1"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <SmoothEnterpriseWebControl:InputText ID="FIELD_subject" TabIndex="100" runat="server"
                                    Width="600px" BackColor="#F0F0F0" CssClass="Normal" Required="True" MaxLength="100"
                                    ErrorMessage="請輸入「主題」!!" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_subjectResource1" OnClickMore="" Personalize="False">
                                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                </SmoothEnterpriseWebControl:InputText></td>
                        </tr>
                        <tr>
                            <td width="1%">
                                <asp:Label ID="LABEL_mailcategory" runat="server" Text="分類" CssClass="NormalBold" meta:resourcekey="LABEL_mailcategoryResource1"></asp:Label></td>
                            <td>
                                <asp:Label ID="LABEL_volume" runat="server" Text="期別" CssClass="NormalBold" meta:resourcekey="LABEL_volumeResource1"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <SmoothEnterpriseWebControlEnterprise:SelectCode ID="FIELD_mailcategory" runat="server"
                                    BackColor="#F0F0F0" CodeType="mailcategory" CssClass="Normal" ItemNoneDisplayed="True" ButtonClick="True" ButtonIconUrl="" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_mailcategoryResource1" Mode="Single" TextBoxStyle="ThreeDStyle" TextField="" Value="" ValueField="">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                    <ErrorStyle BorderStyle="NotSet" />
                                </SmoothEnterpriseWebControlEnterprise:SelectCode>
                            </td>
                            <td class="NormalBold">
                                <SmoothEnterpriseWebControl:InputText ID="FIELD_volume" runat="server" BackColor="#F0F0F0"
                                    CssClass="Normal" MaxLength="2" Size="5" ErrorMessage="請輸入「期別」!!" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_volumeResource1" OnClickMore="" Personalize="False" Required="False">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                </SmoothEnterpriseWebControl:InputText>
                                <asp:Label ID="LABEL1" runat="server" Text="* 請輸入數字 ex:1;10;20" CssClass="NormalBold" ForeColor="Red" meta:resourcekey="LABEL1Resource1"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="LABEL_body" runat="server" Text="信件內容" CssClass="NormalBold" meta:resourcekey="LABEL_bodyResource1"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <SmoothEnterpriseWebControl:InputHTML ID="FIELD_body" runat="server" Width="600px"
                                    Height="300px" Required="True" ErrorMessage="請輸入「信件內容」!!" BackColor="#F0F0F0"
                                    CssClass="Normal" Gradient="Left" imgSrc="" IsValid="True" meta:resourcekey="FIELD_bodyResource1" Mode="Advance" Value="">
                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                </SmoothEnterpriseWebControl:InputHTML>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </table>
    <table class="Normal" border="0">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_save" runat="server" Font-Names="Arial"
                    Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                    BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom" Font-Bold="True"
                    Text="儲存" Width="80px" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_saveResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_savenext" runat="server" Font-Names="Arial"
                    Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                    BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom" Font-Bold="True"
                    Text="儲存後繼續操作" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_savenextResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Font-Names="Arial"
                    Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                    BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom" Font-Bold="True"
                    Text="回上頁" Width="80px" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
        </tr>
    </table>
</asp:Content>
