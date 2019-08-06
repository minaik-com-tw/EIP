<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Portal.NewsEdit, App_Web_newsedit.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

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
        CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight=""
        IconWidth="" meta:resourcekey="ContentDescriptorResource1">
        <CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet"
            CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <table class="Normal" border="0">
        <tr>
            <td valign="top">
                <table border="0" class="Normal">
                    <tr class="NormalBold">
                        <td style="width: 409px">
                            <asp:Label ID="LABEL_description" runat="server" Text="描述" meta:resourcekey="LABEL_descriptionResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 409px">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_description" runat="server" BackColor="#F0F0F0"
                                CssClass="Normal" Width="400px" Required="True" MaxLength="100" ErrorMessage="請輸入「描述」!!"
                                ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD"
                                FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True"
                                meta:resourcekey="FIELD_descriptionResource1" OnClickMore="" Personalize="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr class="NormalBold">
                        <td style="width: 409px">
                            <asp:Label ID="LABEL_sdate" runat="server" Text="刊登日期" meta:resourcekey="LABEL_sdateResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 409px">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_sdate" runat="server" BackColor="#F0F0F0"
                                CssClass="Normal" meta:resourcekey="FIELD_sdateResource1" FormatType="Date" Width="100px">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr class="NormalBold">
                        <td style="width: 409px">
                            <asp:Label ID="LABEL_edate" runat="server" Text="刊登期限" meta:resourcekey="LABEL_edateResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 409px">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_edate" runat="server" BackColor="#F0F0F0"
                                CssClass="Normal" meta:resourcekey="FIELD_edateResource1" FormatType="Date" Width="100px">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText>
                        </td>
                    </tr>
                    <tr class="NormalBold">
                        <td style="width: 409px">
                            <asp:Label ID="LABEL_linkurl" runat="server" Text="相關連結" meta:resourcekey="LABEL_linkurlResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 409px">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_linkurl" runat="server" BackColor="#F0F0F0"
                                CssClass="Normal" Width="400px" MaxLength="255" ButtonClick="True" ButtonIconUrl=""
                                DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None"
                                HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_linkurlResource1"
                                OnClickMore="" Personalize="False" Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox ID="FIELD_linkmode" runat="server" CssClass="NormalBold" meta:resourcekey="FIELD_linkmodeResource1"
                                Text="開新視窗顯示" /></td>
                    </tr>
                    <tr class="NormalBold">
                        <td style="width: 409px">
                            <asp:Label ID="LABEL_seq" runat="server" Text="順序" meta:resourcekey="LABEL_seqResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 409px">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_seq" runat="server" BackColor="#F0F0F0"
                                CssClass="Normal" Size="5" MaxLength="2" ButtonClick="True" ButtonIconUrl=""
                                DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None"
                                HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_seqResource1"
                                OnClickMore="" Personalize="False" Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr class="NormalBold">
                        <td style="width: 409px">
                            <asp:Label ID="LABEL_newscategory" runat="server" Text="分類" meta:resourcekey="LABEL_newscategoryResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 409px">
                            <SmoothEnterpriseWebControlEnterprise:SelectCode ID="FIELD_newscategory" runat="server"
                                BackColor="#F0F0F0" CodeType="newscategory" CssClass="Normal" ItemNoneDisplayed="True">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top"></Gradient>
                                <ErrorStyle BorderStyle="NotSet" />
                            </SmoothEnterpriseWebControlEnterprise:SelectCode>
                        </td>
                    </tr>
                    <tr class="NormalBold">
                        <td style="width: 409px">
                            <asp:Label ID="LABEL_details" runat="server" Text="內容" meta:resourcekey="LABEL_detailsResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 409px">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_details" runat="server" Width="400px"
                                TextMode="MultiLine" Gradient-GradientType="Top" BackColor="#F0F0F0" CssClass="Normal"
                                Height="200px" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD"
                                ErrorMessage="" FocusColor="" FormatType="HTML" HiddenMode="False" HTMLMode="Advance"
                                IsValid="True" meta:resourcekey="FIELD_detailsResource1" OnClickMore="" Personalize="False"
                                Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                </table>
            </td>
            <td width="1" height="1">
                <span style="border-right: 1px inset; border-top: 1px inset; font-size: 16px; margin: 0px 3px;
                    border-left: 1px inset; width: 1px; border-bottom: 1px inset; height: 100%" clear="all">
                </span>
            </td>
            <td valign="top">
                <table class="Normal" border="0">
                    <tr class="NormalBold">
                        <td>
                            <asp:Label ID="LABEL_imgdetail" runat="server" Text="相關圖檔" meta:resourcekey="LABEL_photoResource1"></asp:Label></td>
                    </tr>
                    <tr class="NormalBold">
                        <td>
                            <SmoothEnterpriseWebControl:InputFile ID="FIELD_imgdetail" runat="server" Width="300px"
                                BackColor="#F0F0F0" CssClass="Normal" meta:resourcekey="FIELD_imgdetailResource1">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            </SmoothEnterpriseWebControl:InputFile>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img id="PREVIEW_imgdetail" alt="" src="/lib/img/img-noimage.gif" runat="server"></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table border="0" class="Normal">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_save" runat="server" Width="80px"
                    Text="儲存" Gradient-GradientType="Bottom" CssClass="NormalBold" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
                    Font-Size="12px" Font-Bold="True" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_saveResource1"
                    RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_progauth" runat="server" Text="授權"
                    Width="80px" Gradient-GradientType="Bottom" CssClass="NormalBold" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
                    Font-Size="12px" Font-Bold="True" OnClick="BUTTON_progauth_Click" meta:resourcekey="BUTTON_progauthResource1"
                    RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_delete" runat="server" Text="刪除"
                    Width="80px" Gradient-GradientType="Bottom" CssClass="NormalBold" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
                    Font-Size="12px" Font-Bold="True" OnClick="BUTTON_delete_Click" meta:resourcekey="BUTTON_deleteResource1"
                    RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Width="80px"
                    Text="回上頁" Gradient-GradientType="Bottom" CssClass="NormalBold" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
                    Font-Size="12px" Font-Bold="True" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1"
                    RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
            </td>
        </tr>
    </table>
</asp:Content>
