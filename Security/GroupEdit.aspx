<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Security.GroupEdit, App_Web_groupedit.aspx.cdcab7d2" title="Untitled Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

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
    <dl class="tabsheet" tabfontcolor="blue" tabcapalign="center" tabwidth="120" width="100%"
        tabalign="left" sheetclass="tabsilverbody" tabclass="TabSilver">
        <dt tabtitle="Group" active="active" id="tabtitle_Group" runat="server">
            <table Class="Normal" border="0">
                <tr>
                    <td valign="top">
                        <table Class="Normal" border="0">
                            <tr Class="NormalBold">
                                <td>
                                    <asp:Label ID="LABEL_code" runat="server" Text="代碼" meta:resourcekey="LABEL_codeResource1"></asp:Label></td>
                            </tr>
                            <tr>
                                <td height="26">
                                    <SmoothEnterpriseWebControl:InputText ID="FIELD_code" runat="server" ErrorMessage="請輸入 [代碼] !"
                                        Required="True" CssClass="Normal" BackColor="#F0F0F0" MaxLength="50" ButtonClick="True"
                                        ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None"
                                        HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_codeResource1"
                                        OnClickMore="" Personalize="False">
                                        <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    </SmoothEnterpriseWebControl:InputText><asp:CustomValidator ID="V_FIELD_code" runat="server"
                                        ErrorMessage="此群組代碼已經存在!!" EnableClientScript="False" ControlToValidate="FIELD_code"
                                        Display="None" OnServerValidate="V_FIELD_code_ServerValidate" meta:resourcekey="V_FIELD_codeResource1"></asp:CustomValidator></td>
                            </tr>
                            <tr Class="NormalBold">
                                <td>
                                    <asp:Label ID="LABEL_name" runat="server" Text="名稱" meta:resourcekey="LABEL_nameResource1"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>
                                    <SmoothEnterpriseWebControl:InputText ID="FIELD_name" runat="server" ErrorMessage="請輸入 [名稱] !"
                                        Required="True" CssClass="Normal" BackColor="#F0F0F0" MaxLength="50" ButtonClick="True"
                                        ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None"
                                        HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nameResource1"
                                        OnClickMore="" Personalize="False">
                                        <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    </SmoothEnterpriseWebControl:InputText></td>
                            </tr>
                            <tr Class="NormalBold">
                                <td>
                                    <asp:Label ID="LABEL_pid" runat="server" Text="父層群組" meta:resourcekey="LABEL_pidResource1"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>
                                    <SmoothEnterpriseWebControlEnterprise:SelectGroup ID="FIELD_pid" runat="server" CssClass="Normal"
                                        BackColor="#F0F0F0" ItemNoneDisplayed="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif"
                                        Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText=""
                                        ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text=""
                                        ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False"
                                        ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_pidResource1"
                                        Mode="Single" RootId="" TextBoxStyle="ThreeDStyle" Value="">
                                        <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    </SmoothEnterpriseWebControlEnterprise:SelectGroup>
                                    <SmoothEnterpriseWebControl:InputText ID="FIELD_opids" runat="server" Width="0px"
                                        CssClass="Normal" BackColor="#F0F0F0" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash"
                                        DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False"
                                        HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_opidsResource1" OnClickMore=""
                                        Personalize="False" Required="False">
                                        <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    </SmoothEnterpriseWebControl:InputText></td>
                            </tr>
                            <tr Class="NormalBold">
                                <td>
                                    <asp:Label ID="LABEL_uid" runat="server" Text="管理人員" meta:resourcekey="LABEL_uidResource1"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>
                                    <SmoothEnterpriseWebControlEnterprise:PopupUser ID="FIELD_uid" runat="server" BackColor="#F0F0F0"
                                        Width="100px" CssClass="Normal" ValueField="id" FormatType="InputCombo" FormatValueField="logonid"
                                        DisplayField="name" AuthType="" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash"
                                        DateType="YYYYMMDD" DisplayFieldHidden="False" ErrorMessage="" FocusColor=""
                                        HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_uidResource1"
                                        OnClickMore="" Personalize="False" Required="False">
                                        <Gradient GradientBegin="" GradientEnd="" />
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
                            </tr>
                            <tr Class="NormalBold">
                                <td>
                                    <asp:Label ID="LABEL_remark" runat="server" Text="備註" meta:resourcekey="LABEL_remarkResource1"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>
                                    <SmoothEnterpriseWebControl:InputText ID="FIELD_remark" runat="server" CssClass="Normal"
                                        BackColor="#F0F0F0" TextMode="MultiLine" Width="240px" ButtonClick="True" ButtonIconUrl=""
                                        DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None"
                                        HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_remarkResource1"
                                        OnClickMore="" Personalize="False" Required="False">
                                        <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    </SmoothEnterpriseWebControl:InputText></td>
                            </tr>
                        </table>
                    </td>
                    <td height="1" width="1">
                        <span style="border-right: 1px inset; border-top: 1px inset; font-size: 16px; margin: 0px 3px;
                            border-left: 1px inset; width: 1px; border-bottom: 1px inset; height: 100%" clear="all">
                        </span>
                    </td>
                    <td valign="top">
                        <table Class="Normal" border="0">
                            <tr Class="NormalBold">
                                <td>
                                    <asp:Label ID="LABEL_photo" runat="server" Text="圖片" meta:resourcekey="LABEL_photoResource1"></asp:Label></td>
                            </tr>
                            <tr Class="NormalBold">
                                <td>
                                    <SmoothEnterpriseWebControl:InputFile ID="FIELD_photo" runat="server" CssClass="Normal"
                                        BackColor="#F0F0F0" Width="300px" meta:resourcekey="FIELD_photoResource1">
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
        <dt tabtitle="Group Users" id="tabtitle_GroupUsers" runat="server">
            <table Class="Normal" border="0">
                <tr Class="NormalBold">
                    <td>
                        <table Class="Normal" border="0">
                            <tr Class="NormalBold">
                                <td>
                                    <asp:Label ID="LABEL_groupusers" runat="server" Text="群組使用者" meta:resourcekey="LABEL_groupusersResource1"></asp:Label></td>
                            </tr>
                            <tr Class="NormalBold">
                                <td>
                                    <SmoothEnterpriseWebControl:MultiSelect ID="FIELD_groupusers" runat="server" Width="350px"
                                        Font-Size="12px" Font-Names="Arial" CssClass="normalblod" SelectBgColor2="Silver"
                                        SelectBgColor1="204, 204, 204" Size="12" SelectedLabel="加入本群組使用者" SelectionLabel="未加入群組使用者"
                                        meta:resourcekey="FIELD_groupusersResource1" Order="False" Value="">
                                        <LabelStyle Font-Size="12px" Font-Names="Arial" CssClass="Normal" BorderStyle="NotSet">
                                        </LabelStyle>
                                    </SmoothEnterpriseWebControl:MultiSelect>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </dt>
    </dl>
    <table Class="Normal" border="0" id="Table2">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_save" runat="server" Gradient-GradientType="Bottom"
                    CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px"
                    BorderStyle="Solid" Font-Names="Arial" Font-Size="12px" Font-Bold="True" Text="儲存"
                    Width="80px" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_saveResource1"
                    RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Gradient-GradientType="Bottom"
                    CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px"
                    BorderStyle="Solid" Font-Names="Arial" Font-Size="12px" Font-Bold="True" Text="回上頁"
                    Width="80px" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1"
                    RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_delete" runat="server" Gradient-GradientType="Bottom"
                    CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px"
                    BorderStyle="Solid" Font-Names="Arial" Font-Size="12px" Font-Bold="True" Text="刪除"
                    Width="80px" OnClick="BUTTON_delete_Click" meta:resourcekey="BUTTON_deleteResource1"
                    RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
            </td>
        </tr>
    </table>
</asp:Content>
