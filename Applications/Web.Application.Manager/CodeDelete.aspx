<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Manager.CodeDelete, App_Web_codedelete.aspx.cdcab7d2" title="WebForm Delete Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server"
        Details="The desciption for this program" Caption="Program Name" Width="100%"
        CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight=""
        IconWidth="" meta:resourcekey="ContentDescriptorResource1">
        <CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet"
            CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <SmoothEnterpriseWebControl:PageJumper ID="PageJumper1" runat="server" ShowPageNumber="True"
        ButtonNextLabel="&gt;" ButtonPrevLabel="&lt;" ButtonType="Button" meta:resourcekey="PageJumper1Resource1">
        <ButtonStyle PaddingSize="2px" Width="20px" GradientEnd="64, 64, 64" BorderWidth="1px"
            BorderStyle="Solid" BorderColor="96, 96, 96" GradientBegin="224, 224, 224" BackColor="200, 200, 200"
            CssClass=""></ButtonStyle>
        <PageSelectedStyle BorderWidth="3px" BorderStyle="Solid" BorderColor="Black" BackColor="WhiteSmoke"
            CssClass=""></PageSelectedStyle>
        <PageNumberStyle Font-Size="10px" Font-Names="Arial" PaddingSize="2px" Width="10px"
            BorderWidth="1px" ForeColor="Black" BorderStyle="Solid" BorderColor="Gray" BackColor="White"
            CssClass=""></PageNumberStyle>
    </SmoothEnterpriseWebControl:PageJumper>
    <table border="0" class="Normal">
        <tr>
            <td valign="top">
                <table>
                    <tr>
                        <td class="NormalBold">
                            <asp:Label ID="LABEL_ctype" runat="server" Text="代碼類別" meta:resourcekey="LABEL_ctypeResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_ctype" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD"
                                ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance"
                                IsValid="True" meta:resourcekey="FIELD_ctypeResource1" OnClickMore="" Personalize="False"
                                Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td class="NormalBold">
                            <asp:Label ID="LABEL_code" runat="server" Text="代碼" meta:resourcekey="LABEL_codeResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_code" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD"
                                ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance"
                                IsValid="True" meta:resourcekey="FIELD_codeResource1" OnClickMore="" Personalize="False"
                                Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td class="NormalBold">
                            <asp:Label ID="LABEL_name" runat="server" Text="名稱" meta:resourcekey="LABEL_nameResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_name" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD"
                                ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance"
                                IsValid="True" meta:resourcekey="FIELD_nameResource1" OnClickMore="" Personalize="False"
                                Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td class="NormalBold">
                            <asp:Label ID="LABEL_seq" runat="server" Text="順序" meta:resourcekey="LABEL_seqResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_seq" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD"
                                ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance"
                                IsValid="True" meta:resourcekey="FIELD_seqResource1" OnClickMore="" Personalize="False"
                                Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td class="NormalBold">
                            <asp:Label ID="LABEL_iconurl" runat="server" Text="圖示連結" meta:resourcekey="LABEL_iconurlResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_iconurl" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD"
                                ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance"
                                IsValid="True" meta:resourcekey="FIELD_iconurlResource1" OnClickMore="" Personalize="False"
                                Required="False" Width="318px">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td class="NormalBold">
                            <asp:Label ID="LABEL_style" runat="server" Text="樣式" meta:resourcekey="LABEL_styleResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_style" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD"
                                ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance"
                                IsValid="True" meta:resourcekey="FIELD_styleResource1" OnClickMore="" Personalize="False"
                                Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td class="NormalBold">
                            <asp:Label ID="LABEL_remark" runat="server" Text="備註" meta:resourcekey="LABEL_remarkResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_remark" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD"
                                ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance"
                                IsValid="True" meta:resourcekey="FIELD_remarkResource1" OnClickMore="" Personalize="False"
                                Required="False" TextMode="MultiLine" Width="317px">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td class="NormalBold">
                            <asp:Label ID="LABEL_isdefault" runat="server" Text="預設選項 (同一類別中只能選設定一個預設選項)" meta:resourcekey="LABEL_isdefaultResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox ID="FIELD_isdefault" runat="server" Enabled="False"/></td>
                    </tr>
                    <tr>
                        <td class="NormalBold">
                            <asp:Label ID="LABEL_enabled" runat="server" Text="啟用" meta:resourcekey="LABEL_enabledResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="Normal">
                            <asp:CheckBox ID="FIELD_enabled" runat="server" Enabled="False" /></td>
                    </tr>
                    <tr>
                        <td class="NormalBold">
                            <asp:Label ID="LABEL_initname" runat="server" Text="初始人員" meta:resourcekey="LABEL_initnameResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_inituid" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD"
                                ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance"
                                IsValid="True" meta:resourcekey="FIELD_inituidResource1" OnClickMore="" Personalize="False"
                                Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td class="NormalBold">
                            <asp:Label ID="LABEL_initdate" runat="server" Text="初始日期" meta:resourcekey="LABEL_initdateResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_initdate" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD"
                                ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance"
                                IsValid="True" meta:resourcekey="FIELD_initdateResource1" OnClickMore="" Personalize="False"
                                Required="False" Width="190px">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td class="NormalBold">
                            <asp:Label ID="LABEL_modifyname" runat="server" Text="更新人員" meta:resourcekey="LABEL_modifynameResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_modifyuid" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD"
                                ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance"
                                IsValid="True" meta:resourcekey="FIELD_modifyuidResource1" OnClickMore="" Personalize="False"
                                Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td class="NormalBold">
                            <asp:Label ID="LABEL_modifydate" runat="server" Text="更新日期" meta:resourcekey="LABEL_modifydateResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_modifydate" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD"
                                ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance"
                                IsValid="True" meta:resourcekey="FIELD_modifydateResource1" OnClickMore="" Personalize="False"
                                Required="False" Width="192px">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="DeleteButton" runat="server" Gradient-GradientType="Bottom"
                    CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px"
                    BorderStyle="Solid" Font-Names="Arial" Font-Size="12px" Font-Bold="True" Text="刪除"
                    Width="80px" OnClick="DeleteButton_Click" meta:resourcekey="DeleteButtonResource1"
                    RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;</td>
            <td>
                &nbsp;<SmoothEnterpriseWebControl:InputButton ID="CancelButton" runat="server" BackColor="#C8C8C8"
                    BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" Font-Size="12px"
                    Font-Names="Arial" Gradient-GradientType="Bottom" CssClass="NormalBold" Width="80px"
                    Text="取消" Font-Bold="True" OnClick="CancelButton_Click" meta:resourcekey="CancelButtonResource1"
                    RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
