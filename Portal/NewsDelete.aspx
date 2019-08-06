<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Portal.NewsDelete, App_Web_newsdelete.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

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
    <SmoothEnterpriseWebControl:PageJumper ID="PageJumper1" runat="server" ShowPageNumber="True"
        ButtonNextLabel="&gt;" ButtonPrevLabel="&lt;" ButtonType="Button" meta:resourcekey="PageJumper1Resource1">
        <ButtonStyle Width="20px" BorderColor="96, 96, 96" BorderWidth="1px" BorderStyle="Solid"
            BackColor="200, 200, 200" GradientBegin="224, 224, 224" GradientEnd="64, 64, 64"
            PaddingSize="2px" CssClass=""></ButtonStyle>
        <PageSelectedStyle BorderColor="Black" BorderWidth="3px" BorderStyle="Solid" BackColor="WhiteSmoke"
            CssClass=""></PageSelectedStyle>
        <PageNumberStyle ForeColor="Black" Width="10px" Font-Names="Arial" Font-Size="10px"
            BorderColor="Gray" BorderWidth="1px" BorderStyle="Solid" BackColor="White" PaddingSize="2px"
            CssClass=""></PageNumberStyle>
    </SmoothEnterpriseWebControl:PageJumper>
    <table class="Normal" border="0">
        <tr>
            <td valign="top">
                <table border="0" class="Normal">
                    <tr class="NormalBold">
                        <td>
                            <asp:Label ID="LABEL_newsno" runat="server" Text="編號" meta:resourcekey="LABEL_newsnoResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText name="FIELD_newsno" ID="FIELD_newsno" runat="server"
                                CssClass="PanelWhite" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash"
                                DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False"
                                HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_newsnoResource1" OnClickMore=""
                                Personalize="False" Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr class="NormalBold">
                        <td>
                            <asp:Label ID="LABEL_description" runat="server" Text="描述" meta:resourcekey="LABEL_descriptionResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText name="FIELD_description" ID="FIELD_description"
                                runat="server" CssClass="PanelWhite" ReadOnly="True" ButtonClick="True" ButtonIconUrl=""
                                DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None"
                                HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_descriptionResource1"
                                OnClickMore="" Personalize="False" Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr class="NormalBold">
                        <td>
                            <asp:Label ID="LABEL_sdate" runat="server" Text="刊登日期" meta:resourcekey="LABEL_sdateResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText name="FIELD_sdate" ID="FIELD_sdate" runat="server"
                                CssClass="PanelWhite" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash"
                                DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False"
                                HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_sdateResource1" OnClickMore=""
                                Personalize="False" Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr class="NormalBold">
                        <td>
                            <asp:Label ID="LABEL_edate" runat="server" Text="刊登期限" meta:resourcekey="LABEL_edateResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText name="FIELD_edate" ID="FIELD_edate" runat="server"
                                CssClass="PanelWhite" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash"
                                DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False"
                                HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_edateResource1" OnClickMore=""
                                Personalize="False" Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr class="NormalBold">
                        <td>
                            <asp:Label ID="LABEL_linkurl" runat="server" Text="相關連結" meta:resourcekey="LABEL_linkurlResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText name="FIELD_linkurl" ID="FIELD_linkurl" runat="server"
                                CssClass="PanelWhite" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash"
                                DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False"
                                HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_linkurlResource1" OnClickMore=""
                                Personalize="False" Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox ID="FIELD_linkmode" runat="server" CssClass="NormalBold" Enabled="false"
                                meta:resourcekey="FIELD_linkmodeResource1" Text="開新視窗顯示" /></td>
                    </tr>
                    <tr class="NormalBold">
                        <td>
                            <asp:Label ID="LABEL_seq" runat="server" Text="順序" meta:resourcekey="LABEL_seqResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText name="FIELD_seq" ID="FIELD_seq" runat="server"
                                CssClass="PanelWhite" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash"
                                DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False"
                                HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_seqResource1" OnClickMore=""
                                Personalize="False" Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr class="NormalBold">
                        <td>
                            <asp:Label ID="LABEL_newscategory" runat="server" Text="分類" meta:resourcekey="LABEL_newscategoryResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControlEnterprise:SelectCode ID="FIELD_newscategory" runat="server"
                                CodeType="newscategory" CssClass="PanelWhite" ItemNoneDisplayed="True" ReadOnly="True">
                                <Gradient GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControlEnterprise:SelectCode>
                        </td>
                    </tr>
                    <tr class="NormalBold">
                        <td>
                            <asp:Label ID="LABEL_details" runat="server" Text="內容" meta:resourcekey="LABEL_detailsResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText name="FIELD_details" ID="FIELD_details" runat="server"
                                CssClass="PanelWhite" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash"
                                DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="HTML" HiddenMode="False"
                                HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_detailsResource1" OnClickMore=""
                                Personalize="False" Required="False" TextMode="MultiLine" Height="200px" Width="400px">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                </table>
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
                        <tr>
                            <td>
                                <img id="PREVIEW_imgdetail" alt="" src="/lib/img/img-noimage.gif" runat="server"></td>
                        </tr>
                    </table>
                </td>
        </tr>
    </table>
    <table id="Table1" cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_delete" runat="server" BackColor="#C8C8C8"
                    BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" Font-Size="12px"
                    Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom" Width="80px"
                    Text="刪除" Font-Bold="True" OnClick="BUTTON_delete_Click" meta:resourcekey="BUTTON_deleteResource1"
                    RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" BackColor="#C8C8C8"
                    BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" Font-Size="12px"
                    Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom" Width="80px"
                    Text="取消" Font-Bold="True" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1"
                    RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
        </tr>
    </table>
</asp:Content>
