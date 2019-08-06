<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Security.UserAdd, App_Web_useradd.aspx.cdcab7d2" title="Untitled Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

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
        CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight=""
        IconWidth="" meta:resourcekey="ContentDescriptorResource1">
        <CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet"
            CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <table Class="Normal" width="100%" border="0">
        <tr>
            <td>
                <dl class="tabsheet" tabfontcolor="blue" tabcapalign="center" tabwidth="120" width="100%"
                    tabalign="left" sheetclass="tabsilverbody" tabclass="TabSilver">
                    <dt tabtitle="Account" active="active" id="tabtitle_Account" runat="server">
                        <table Class="Normal" border="0">
                            <tr>
                                <td valign="top">
                                    <table Class="Normal" id="TB_detail" border="0" runat="server">
                                        <tr Class="NormalBold">
                                            <td>
                                                <asp:Label ID="LABEL_utype" runat="server" Text="使用者類別" meta:resourcekey="LABEL_utypeResource1"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <SmoothEnterpriseWebControlEnterprise:SelectCode ID="FIELD_utype" runat="server"
                                                    BackColor="#F0F0F0" CssClass="Normal" Required="True" ValueField="id" TextField="name"
                                                    CodeType="utype" Value="64CA1E7D-B15F-43CB-A33A-D29DB9020892" ErrorMessage="Please Selected「Type」!!"
                                                    ReadOnly="True" OnSelectedIndexChanged="FIELD_utype_SelectedIndexChanged" ButtonClick="True"
                                                    ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" FadeSpeed="NoFade"
                                                    IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18"
                                                    ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl=""
                                                    ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical"
                                                    meta:resourcekey="FIELD_utypeResource1" Mode="Single" TextBoxStyle="ThreeDStyle">
                                                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                                </SmoothEnterpriseWebControlEnterprise:SelectCode>
                                            </td>
                                        </tr>
                                        <tr Class="NormalBold">
                                            <td>
                                                <asp:Label ID="LABEL_logonid" runat="server" Text="帳號" meta:resourcekey="LABEL_logonidResource1"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <SmoothEnterpriseWebControl:InputText ID="FIELD_logonid" runat="server" BackColor="#F0F0F0"
                                                    CssClass="Normal" Required="True" ErrorMessage="Please Input「Login Id」!!" MaxLength="50"
                                                    ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD"
                                                    FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True"
                                                    meta:resourcekey="FIELD_logonidResource1" OnClickMore="" Personalize="False">
                                                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                    <ErrorStyle BorderStyle="NotSet" />
                                                </SmoothEnterpriseWebControl:InputText></td>
                                        </tr>
                                        <tr Class="NormalBold" id="TRLABEL_pwd" runat="server">
                                            <td>
                                                <asp:Label ID="LABEL_pwd" runat="server" Text="密碼" meta:resourcekey="LABEL_pwdResource1"></asp:Label></td>
                                        </tr>
                                        <tr id="TRFIELD_pwd" runat="server">
                                            <td>
                                                <SmoothEnterpriseWebControl:InputText ID="FIELD_pwd" runat="server" BackColor="#F0F0F0"
                                                    CssClass="Normal" MaxLength="50" TextMode="Password" ButtonClick="True" ButtonIconUrl=""
                                                    DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None"
                                                    HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_pwdResource1"
                                                    OnClickMore="" Personalize="False" Required="False">
                                                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                                </SmoothEnterpriseWebControl:InputText></td>
                                        </tr>
                                        <tr Class="NormalBold" id="TRLABEL_pwd_confirm" runat="server">
                                            <td>
                                                <asp:Label ID="LABEL_pwd_confirm" runat="server" Text="密碼確認" meta:resourcekey="LABEL_pwd_confirmResource1"></asp:Label></td>
                                        </tr>
                                        <tr id="TRFIELD_pwd_confirm" runat="server">
                                            <td>
                                                <SmoothEnterpriseWebControl:InputText ID="FIELD_pwd_confirm" runat="server" BackColor="#F0F0F0"
                                                    CssClass="Normal" MaxLength="50" TextMode="Password" ButtonClick="True" ButtonIconUrl=""
                                                    DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None"
                                                    HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_pwd_confirmResource1"
                                                    OnClickMore="" Personalize="False" Required="False">
                                                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                                </SmoothEnterpriseWebControl:InputText><asp:CompareValidator ID="V_FIELD_pwd" runat="server"
                                                    ErrorMessage="密碼確認有誤!!" Display="None" ControlToValidate="FIELD_pwd" EnableClientScript="False"
                                                    ControlToCompare="FIELD_pwd_confirm" meta:resourcekey="V_FIELD_pwdResource1"></asp:CompareValidator></td>
                                        </tr>
                                        <tr Class="NormalBold" id="TRLABEL_userdomain" runat="server">
                                            <td>
                                                <asp:Label ID="LABEL_userdomain" runat="server" Text="登入網域" meta:resourcekey="LABEL_userdomainResource1"></asp:Label></td>
                                        </tr>
                                        <tr id="TRFIELD_userdomain" runat="server">
                                            <td>
                                                <SmoothEnterpriseWebControl:InputText ID="FIELD_userdomain" runat="server" Width="300px"
                                                    BackColor="#F0F0F0" CssClass="Normal" Required="True" ErrorMessage="Please Input「Domain Name」!!"
                                                    ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD"
                                                    FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True"
                                                    meta:resourcekey="FIELD_userdomainResource1" OnClickMore="" Personalize="False">
                                                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                    <ErrorStyle BorderStyle="NotSet" />
                                                </SmoothEnterpriseWebControl:InputText></td>
                                        </tr>
                                        <tr Class="NormalBold">
                                            <td>
                                                <asp:Label ID="LABEL_effectdate" runat="server" Text="生效日期" meta:resourcekey="LABEL_effectdateResource1"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <SmoothEnterpriseWebControl:InputText ID="FIELD_effectdate" runat="server" Width="100px"
                                                    BackColor="#F0F0F0" CssClass="Normal" FormatType="Date" ButtonClick="True" ButtonIconUrl=""
                                                    DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" HiddenMode="False"
                                                    HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_effectdateResource1"
                                                    OnClickMore="" Personalize="False" Required="False">
                                                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                                </SmoothEnterpriseWebControl:InputText></td>
                                        </tr>
                                        <tr Class="NormalBold">
                                            <td>
                                                <asp:Label ID="LABEL_expiredate" runat="server" Text="有效期限" meta:resourcekey="LABEL_expiredateResource1"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <SmoothEnterpriseWebControl:InputText ID="FIELD_expiredate" runat="server" Width="100px"
                                                    BackColor="#F0F0F0" CssClass="Normal" FormatType="Date" ButtonClick="True" ButtonIconUrl=""
                                                    DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" HiddenMode="False"
                                                    HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_expiredateResource1"
                                                    OnClickMore="" Personalize="False" Required="False">
                                                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                                </SmoothEnterpriseWebControl:InputText></td>
                                        </tr>
                                        <tr Class="NormalBold">
                                            <td>
                                                <asp:Label ID="LABEL_ucategory" runat="server" Text="使用者分類" meta:resourcekey="LABEL_ucategoryResource1"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <SmoothEnterpriseWebControlEnterprise:SelectCode ID="FIELD_ucategory" runat="server"
                                                    ValueField="id" TextField="name" CodeType="ucategory" ItemNoneDisplayed="True"
                                                    BackColor="#F0F0F0" CssClass="Normal" ItemAddDisplayed="True" ButtonClick="True"
                                                    ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage=""
                                                    FadeSpeed="NoFade" IsValid="True" ItemAddUrl="/lib/app/addcode.aspx?ctype=ucategory"
                                                    ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False"
                                                    ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18"
                                                    ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_ucategoryResource1"
                                                    Mode="Single" TextBoxStyle="ThreeDStyle" Value="">
                                                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                                </SmoothEnterpriseWebControlEnterprise:SelectCode>
                                            </td>
                                        </tr>
                                        <tr Class="NormalBold">
                                            <td>
                                                <asp:Label ID="LABEL_ustatus" runat="server" Text="使用帳號狀態" meta:resourcekey="LABEL_ustatusResource1"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <SmoothEnterpriseWebControlEnterprise:SelectCode ID="FIELD_ustatus" runat="server"
                                                    BackColor="#F0F0F0" CssClass="Normal" Required="True" ValueField="id" TextField="name"
                                                    CodeType="ustatus" ErrorMessage="Please Selected「User Account Status」!!" ItemNoneDisplayed="True"
                                                    ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False"
                                                    FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18"
                                                    ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl=""
                                                    ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical"
                                                    meta:resourcekey="FIELD_ustatusResource1" Mode="Single" TextBoxStyle="ThreeDStyle"
                                                    Value="">
                                                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                    <ErrorStyle BorderStyle="NotSet" />
                                                </SmoothEnterpriseWebControlEnterprise:SelectCode>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="1" height="1">
                                    <span style="border-right: 1px inset; border-top: 1px inset; font-size: 16px; margin: 0px 3px;
                                        border-left: 1px inset; width: 1px; border-bottom: 1px inset; height: 100%" clear="all">
                                    </span>
                                </td>
                                <td valign="top">
                                    <table Class="Normal" border="0">
                                        <tr Class="NormalBold">
                                            <td>
                                                <asp:Label ID="LABEL_gid" runat="server" Text="群組" meta:resourcekey="LABEL_gidResource1"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <SmoothEnterpriseWebControlEnterprise:SelectGroup ID="FIELD_gid" runat="server" BackColor="#F0F0F0"
                                                    CssClass="Normal" ItemNoneDisplayed="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif"
                                                    Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText=""
                                                    ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text=""
                                                    ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False"
                                                    ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_gidResource1"
                                                    Mode="Single" RootId="" TextBoxStyle="ThreeDStyle" Value="" EnabledHTC="False">
                                                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                    <ErrorStyle BorderStyle="NotSet" />
                                                </SmoothEnterpriseWebControlEnterprise:SelectGroup>
                                            </td>
                                        </tr>
                                        <tr Class="NormalBold">
                                            <td>
                                                <asp:Label ID="LABEL_role" runat="server" Text="角色" meta:resourcekey="LABEL_roleResource1"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <SmoothEnterpriseWebControl:MultiSelect ID="FIELD_role" runat="server" Width="400px"
                                                    Font-Size="12px" Font-Names="Arial" CssClass="normalblod" SelectBgColor1="204, 204, 204"
                                                    SelectBgColor2="Silver" text1="已選取角色" text2="未選取角色" Size="10" meta:resourcekey="FIELD_roleResource1"
                                                    Order="False" SelectedLabel="" SelectionLabel="" Value="">
                                                    <LabelStyle BorderStyle="NotSet" CssClass="" />
                                                </SmoothEnterpriseWebControl:MultiSelect>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </dt>
                    <dt tabtitle="Information" id="tabtitle_Information" runat="server">
                        <table Class="Normal" border="0">
                            <tr>
                                <td valign="top">
                                    <table Class="Normal" border="0">
                                        <tr Class="NormalBold">
                                            <td>
                                                <asp:Label ID="LABEL_name" runat="server" Text="名稱" meta:resourcekey="LABEL_nameResource1"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <SmoothEnterpriseWebControl:InputText ID="FIELD_name" runat="server" BackColor="#F0F0F0"
                                                    CssClass="Normal" Required="True" ErrorMessage="Please Input「Name」!!" MaxLength="50"
                                                    ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD"
                                                    FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True"
                                                    meta:resourcekey="FIELD_nameResource1" OnClickMore="" Personalize="False">
                                                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                    <ErrorStyle BorderStyle="NotSet" />
                                                </SmoothEnterpriseWebControl:InputText></td>
                                        </tr>
                                        <tr Class="NormalBold">
                                            <td>
                                                <asp:Label ID="LABEL_name1" runat="server" Text="暱稱" meta:resourcekey="LABEL_name1Resource1"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <SmoothEnterpriseWebControl:InputText ID="FIELD_name1" runat="server" BackColor="#F0F0F0"
                                                    CssClass="Normal" MaxLength="50" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash"
                                                    DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False"
                                                    HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_name1Resource1" OnClickMore=""
                                                    Personalize="False" Required="False">
                                                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                                </SmoothEnterpriseWebControl:InputText></td>
                                        </tr>
                                        <tr Class="NormalBold">
                                            <td>
                                                <asp:Label ID="LABEL_gender" runat="server" Text="性別" meta:resourcekey="LABEL_genderResource1"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="FIELD_gender" runat="server" CssClass="Normal" RepeatLayout="Flow"
                                                    RepeatDirection="Horizontal" meta:resourcekey="FIELD_genderResource1">
                                                    <asp:ListItem Value="M" Text="男" meta:resourcekey="ListItemResource1"></asp:ListItem>
                                                    <asp:ListItem Value="F" Text="女" meta:resourcekey="ListItemResource2"></asp:ListItem>
                                                </asp:RadioButtonList></td>
                                        </tr>
                                        <tr Class="NormalBold">
                                            <td>
                                                <asp:Label ID="LABEL_email" runat="server" Text="E-mail" meta:resourcekey="LABEL_emailResource1"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <SmoothEnterpriseWebControl:InputText ID="FIELD_email" runat="server" Width="300px"
                                                    BackColor="#F0F0F0" CssClass="Normal" MaxLength="100" ButtonClick="True" ButtonIconUrl=""
                                                    DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None"
                                                    HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_emailResource1"
                                                    OnClickMore="" Personalize="False" Required="False">
                                                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                                </SmoothEnterpriseWebControl:InputText></td>
                                        </tr>
                                        <tr Class="NormalBold">
                                            <td>
                                                <asp:Label ID="LABEL_remark" runat="server" Text="備註" meta:resourcekey="LABEL_remarkResource1"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <SmoothEnterpriseWebControl:InputText ID="FIELD_remark" runat="server" Width="300px"
                                                    BackColor="#F0F0F0" CssClass="Normal" Height="100px" TextMode="MultiLine" ButtonClick="True"
                                                    ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor=""
                                                    FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_remarkResource1"
                                                    OnClickMore="" Personalize="False" Required="False">
                                                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                                </SmoothEnterpriseWebControl:InputText></td>
                                        </tr>
                                        <tr Class="NormalBold">
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="1" height="1">
                                    <span style="border-right: 1px inset; border-top: 1px inset; font-size: 16px; margin: 0px 3px;
                                        border-left: 1px inset; width: 1px; border-bottom: 1px inset; height: 100%" clear="all">
                                    </span>
                                </td>
                                <td valign="top">
                                    <table Class="Normal" border="0">
                                        <tr Class="NormalBold">
                                            <td>
                                                <asp:Label ID="LABEL_photo" runat="server" Text="個人照片" meta:resourcekey="LABEL_photoResource1"></asp:Label></td>
                                        </tr>
                                        <tr Class="NormalBold">
                                            <td>
                                                <SmoothEnterpriseWebControl:InputFile ID="FIELD_photo" runat="server" Width="300px"
                                                    BackColor="#F0F0F0" CssClass="Normal" meta:resourcekey="FIELD_photoResource1">
                                                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                </SmoothEnterpriseWebControl:InputFile>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img id="PREVIEW_photo" alt="" src="/lib/img/img-noimage.gif" runat="server"></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </dt>
                </dl>
            </td>
        </tr>
    </table>
    <table Class="Normal" border="0">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_save" runat="server" BorderColor="#606060"
                    BorderStyle="Solid" BorderWidth="1px" BackColor="#C8C8C8" Font-Size="12px" Font-Names="Arial"
                    CssClass="NormalBold" Width="80px" Gradient-GradientType="Bottom" Text="儲存" Font-Bold="True"
                    OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_saveResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;<SmoothEnterpriseWebControl:InputButton
                    ID="BUTTON_savenext" runat="server" BorderColor="#606060" BorderStyle="Solid"
                    BorderWidth="1px" BackColor="#C8C8C8" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold"
                    Gradient-GradientType="Bottom" Text="儲存後繼續操作" Font-Bold="True" OnClick="BUTTON_savenext_Click"
                    meta:resourcekey="BUTTON_savenextResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" BorderColor="#606060"
                    BorderStyle="Solid" BorderWidth="1px" BackColor="#C8C8C8" Font-Size="12px" Font-Names="Arial"
                    CssClass="NormalBold" Width="80px" Gradient-GradientType="Bottom" Text="回上頁"
                    Font-Bold="True" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1"
                    RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
        </tr>
    </table>
</asp:Content>
