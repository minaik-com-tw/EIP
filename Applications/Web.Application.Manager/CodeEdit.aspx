<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Manager.CodeEdit, App_Web_codeedit.aspx.cdcab7d2" title="WebForm Edit Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Application.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
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
    <table class="Normal" border="0">
        <tr>
            <td valign="top">
                <table>
                    <tr>
                        <td class="NormalBold">
                            <asp:Label ID="LABEL_ctype" runat="server" Text="代碼類別" meta:resourcekey="LABEL_ctypeResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_ctype" TabIndex="100" runat="server"
                                BackColor="#F0F0F0" CssClass="Normal" ReadOnly="True" MaxLength="20" ErrorMessage="請輸入「代碼類別」!!"
                                Required="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD"
                                FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True"
                                meta:resourcekey="FIELD_ctypeResource1" OnClickMore="" Personalize="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td class="NormalBold">
                            <asp:Label ID="LABEL_code" runat="server" Text="代碼" meta:resourcekey="LABEL_codeResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_code" TabIndex="101" runat="server"
                                BackColor="#F0F0F0" CssClass="Normal" MaxLength="2" ErrorMessage="請輸入「代碼」!!"
                                Required="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD"
                                FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True"
                                meta:resourcekey="FIELD_codeResource1" OnClickMore="" Personalize="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td class="NormalBold">
                            <asp:Label ID="LABEL_name" runat="server" Text="名稱" meta:resourcekey="LABEL_nameResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_name" TabIndex="102" runat="server"
                                BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="請輸入「名稱」!!" Required="True"
                                ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD"
                                FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True"
                                meta:resourcekey="FIELD_nameResource1" OnClickMore="" Personalize="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td class="NormalBold">
                            <asp:Label ID="LABEL_seq" runat="server" Text="順序" meta:resourcekey="LABEL_seqResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_seq" TabIndex="104" runat="server"
                                BackColor="#F0F0F0" CssClass="Normal" MaxLength="2" ErrorMessage="請輸入「順序」!!"
                                ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD"
                                FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True"
                                meta:resourcekey="FIELD_seqResource1" OnClickMore="" Personalize="False" Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td class="NormalBold">
                            <asp:Label ID="LABEL_iconurl" runat="server" Text="圖示連結" meta:resourcekey="LABEL_iconurlResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControlEnterprise:SelectIconURL ID="FIELD_iconurl" runat="server"
                                BackColor="White" CssClass="Normal" ItemNoneDisplayed="True" ButtonClick="True"
                                ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage=""
                                FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18"
                                ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl=""
                                ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical"
                                meta:resourcekey="FIELD_iconurlResource1" Mode="Single" TextBoxStyle="ThreeDStyle"
                                Value="">
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                <Gradient GradientBegin="" GradientEnd="" />
                            </SmoothEnterpriseWebControlEnterprise:SelectIconURL>
                            <font face="新細明體">&nbsp;</font>
                            <asp:Literal ID="FIELD_icon" runat="server" meta:resourcekey="FIELD_iconResource1"></asp:Literal></td>
                    </tr>
                    <tr>
                        <td class="NormalBold">
                            <asp:Label ID="LABEL_style" runat="server" Text="樣式" meta:resourcekey="LABEL_styleResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControlEnterprise:SelectStyle ID="FIELD_style" runat="server"
                                ItemNoneDisplayed="True" BackColor="White" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif"
                                Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText=""
                                ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text=""
                                ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False"
                                ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_styleResource1"
                                Mode="Single" TextBoxStyle="ThreeDStyle" Value="">
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                <Gradient GradientBegin="" GradientEnd="" />
                            </SmoothEnterpriseWebControlEnterprise:SelectStyle>
                        </td>
                    </tr>
                    <tr>
                        <td class="NormalBold">
                            <asp:Label ID="LABEL_isdefault" runat="server" Text="預設選項 (同一類別中只能選設定一個預設選項)" meta:resourcekey="LABEL_isdefaultResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox ID="FIELD_isdefault" runat="server" Checked="True" /></td>
                    </tr>
                    <tr>
                        <td class="NormalBold">
                            <asp:Label ID="LABEL_enabled" runat="server" Text="啟用" meta:resourcekey="LABEL_enabledResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox ID="FIELD_enabled" runat="server" /></td>
                    </tr>
                    <tr>
                        <td class="NormalBold">
                            <asp:Label ID="LABEL_remark" runat="server" Text="備註" meta:resourcekey="LABEL_remarkResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_remark" TabIndex="103" runat="server"
                                Width="240px" BackColor="#F0F0F0" CssClass="Normal" MaxLength="1073741823" ErrorMessage="請輸入「備註」!!"
                                TextMode="MultiLine" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash"
                                DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance"
                                IsValid="True" meta:resourcekey="FIELD_remarkResource1" OnClickMore="" Personalize="False"
                                Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table class="Normal" border="0">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="SaveButton" runat="server" Font-Names="Arial"
                    Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                    BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom" Font-Bold="True"
                    Text="儲存" Width="80px" OnClick="SaveButton_Click" meta:resourcekey="SaveButtonResource1"
                    RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
                <SmoothEnterpriseWebControl:InputButton ID="BackButton" runat="server" Font-Names="Arial"
                    Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                    BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom" Font-Bold="True"
                    Text="回上頁" Width="80px" OnClick="BackButton_Click" meta:resourcekey="BackButtonResource1"
                    RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
                <SmoothEnterpriseWebControl:InputButton ID="DeleteButton" runat="server" Font-Names="Arial"
                    Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                    BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom" Font-Bold="True"
                    Text="刪除" Width="80px" OnClick="DeleteButton_Click" meta:resourcekey="DeleteButtonResource1"
                    RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
        </tr>
    </table>
</asp:Content>
