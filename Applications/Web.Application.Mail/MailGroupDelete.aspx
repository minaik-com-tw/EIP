<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Mail.MailGroupDelete, App_Web_mailgroupdelete.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
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
                        <td>
                            <asp:Label ID="LABEL_name" runat="server" Text="名稱" CssClass="NormalBold" meta:resourcekey="LABEL_nameResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_name" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" Width="200px" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash"
                                DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False"
                                HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nameResource1" OnClickMore=""
                                Personalize="False" Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_mgcategory" runat="server" Text="分類" CssClass="NormalBold" meta:resourcekey="LABEL_mgcategoryResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControlEnterprise:SelectCode ID="FIELD_mgcategory" runat="server"
                                ReadOnly="True" ValueField="id" TextField="name" CodeType="mgcategory" CssClass="PanelWhite"
                                Enabled="False" ItemNoneDisplayed="True" BackColor="White" ButtonClick="True"
                                ButtonIconUrl="" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True"
                                ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False"
                                ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18"
                                ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_mgcategoryResource1"
                                Mode="Single" TextBoxStyle="ThreeDStyle" Value="">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControlEnterprise:SelectCode>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_subscribe" runat="server" Text="是否允許訂閱" CssClass="NormalBold"
                                meta:resourcekey="LABEL_subscribeResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:CheckBoxList ID="FIELD_subscribe" runat="server" Width="100px"
                                CssClass="Normal" meta:resourcekey="FIELD_subscribeResource1" Value="">
                                <GroupHeaderStyle Font-Bold="True" GradientEnd="192, 192, 0" ForeColor="White" GradientLevel="100"
                                    Gradient="Right" BorderColor="192, 192, 0" BackColor="Gray" BorderStyle="NotSet"
                                    CssClass=""></GroupHeaderStyle>
                                <Items>
                                    <SmoothEnterpriseWebControl:CheckBoxListItem Enabled="False" Selected="False" Text="Yes"
                                        Description="" Value="Y" GroupText="" meta:resourcekey="CheckBoxListItem1Resource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
                                </Items>
                                <DescriptionStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:CheckBoxList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_remark" runat="server" Text="說明" CssClass="NormalBold" meta:resourcekey="LABEL_remarkResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_remark" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" Width="200px" Height="100px" TextMode="MultiLine" ButtonClick="True"
                                ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor=""
                                FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_remarkResource1"
                                OnClickMore="" Personalize="False" Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_inituid" runat="server" Text="建立人員" CssClass="NormalBold" meta:resourcekey="LABEL_inituidResource1"></asp:Label></td>
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
                        <td>
                            <asp:Label ID="LABEL_initdate" runat="server" Text="建立時間" CssClass="NormalBold" meta:resourcekey="LABEL_initdateResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_initdate" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD"
                                ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance"
                                IsValid="True" meta:resourcekey="FIELD_initdateResource1" OnClickMore="" Personalize="False"
                                Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_modifyuid" runat="server" Text="更新人員" CssClass="NormalBold"
                                meta:resourcekey="LABEL_modifyuidResource1"></asp:Label></td>
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
                        <td>
                            <asp:Label ID="LABEL_modifydate" runat="server" Text="更新時間" CssClass="NormalBold"
                                meta:resourcekey="LABEL_modifydateResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_modifydate" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD"
                                ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance"
                                IsValid="True" meta:resourcekey="FIELD_modifydateResource1" OnClickMore="" Personalize="False"
                                Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td style="height: 20px">
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_delete" runat="server" Gradient-GradientType="Bottom"
                    CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px"
                    BorderStyle="Solid" Font-Names="Arial" Font-Size="12px" Font-Bold="True" Text="刪除"
                    Width="80px" OnClick="BUTTON_delete_Click" meta:resourcekey="BUTTON_deleteResource1"
                    RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;</td>
            <td style="height: 20px">
                &nbsp;<SmoothEnterpriseWebControl:InputButton ID="BUTTON_cancel" runat="server" BackColor="#C8C8C8"
                    BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" Font-Size="12px"
                    Font-Names="Arial" Gradient-GradientType="Bottom" CssClass="NormalBold" Width="80px"
                    Text="取消" Font-Bold="True" OnClick="BUTTON_cancel_Click" meta:resourcekey="BUTTON_cancelResource1"
                    RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
