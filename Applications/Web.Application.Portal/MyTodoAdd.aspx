<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Portal.MyTodoAdd, App_Web_mytodoadd.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

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
        <tr class="NormalBold">
            <td>
                <asp:Label ID="LABEL_brief" runat="server" Text="概要" meta:resourcekey="LABEL_briefResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="FIELD_brief" runat="server" BackColor="#F0F0F0"
                    Width="400px" CssClass="Normal" Required="True" ErrorMessage="請輸入「概要」!!" Gradient-GradientType="Top"
                    ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD"
                    FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True"
                    meta:resourcekey="FIELD_briefResource1" OnClickMore="" Personalize="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        <tr class="NormalBold">
            <td>
                <asp:Label ID="LABEL_details" runat="server" Text="內容" meta:resourcekey="LABEL_detailsResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="FIELD_details" runat="server" BackColor="#F0F0F0"
                    Width="400px" CssClass="Normal" Height="100px" TextMode="MultiLine" ButtonClick="True"
                    ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor=""
                    FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_detailsResource1"
                    OnClickMore="" Personalize="False" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        <tr class="NormalBold">
            <td>
                <asp:Label ID="LABEL_category" runat="server" Text="分類" meta:resourcekey="LABEL_categoryResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputSelect ID="FIELD_category" runat="server" CssClass="Normal"
                    BackColor="#F0F0F0" Editable="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif"
                    ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl=""
                    ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText=""
                    ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text=""
                    ListPosition="Vertical" meta:resourcekey="FIELD_categoryResource1" Mode="Single"
                    TextBoxStyle="ThreeDStyle" Value="">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputSelect>
            </td>
        </tr>
        <tr class="NormalBold">
            <td>
                <asp:Label ID="LABEL_priority" runat="server" Text="優先順序" meta:resourcekey="LABEL_priorityResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputSelect ID="FIELD_priority" runat="server" CssClass="Normal"
                    BackColor="#F0F0F0" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif"
                    Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText=""
                    ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text=""
                    ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False"
                    ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_priorityResource1"
                    Mode="Single" TextBoxStyle="ThreeDStyle" Value="3">
                    <Items>
                        <SmoothEnterpriseWebControl:SelectItem Selected="False" RowHeight="18" Value="1"
                            IconUrl="" Text="1 ( High )" GroupText="" Style="filter: ;" Gradient-GradientBegin=""
                            Gradient-GradientEnd="" meta:resourcekey="SelectItemResource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
                        <SmoothEnterpriseWebControl:SelectItem Selected="False" RowHeight="18" Value="2"
                            IconUrl="" Text="2" GroupText="" Style="filter: ;" Gradient-GradientBegin=""
                            Gradient-GradientEnd="" meta:resourcekey="SelectItemResource2" runat="server"></SmoothEnterpriseWebControl:SelectItem>
                        <SmoothEnterpriseWebControl:SelectItem Selected="True" RowHeight="18" Value="3" IconUrl=""
                            Text="3 ( Normal )" GroupText="" Style="filter: ;" Gradient-GradientBegin=""
                            Gradient-GradientEnd="" meta:resourcekey="SelectItemResource3" runat="server"></SmoothEnterpriseWebControl:SelectItem>
                        <SmoothEnterpriseWebControl:SelectItem Selected="False" RowHeight="18" Value="4"
                            IconUrl="" Text="4" GroupText="" Style="filter: ;" Gradient-GradientBegin=""
                            Gradient-GradientEnd="" meta:resourcekey="SelectItemResource4" runat="server"></SmoothEnterpriseWebControl:SelectItem>
                        <SmoothEnterpriseWebControl:SelectItem Selected="False" RowHeight="18" Value="5"
                            IconUrl="" Text="5 ( Low )" GroupText="" Style="filter: ;" Gradient-GradientBegin=""
                            Gradient-GradientEnd="" meta:resourcekey="SelectItemResource5" runat="server"></SmoothEnterpriseWebControl:SelectItem>
                    </Items>
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputSelect>
            </td>
        </tr>
        <tr class="NormalBold">
            <td>
                <asp:Label ID="LABEL_targetdate" runat="server" Text="計畫完成時間" meta:resourcekey="LABEL_targetdateResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="FIELD_targetdate" runat="server" BackColor="#F0F0F0"
                    Width="120px" CssClass="Normal" FormatType="DateTime" ButtonClick="True" ButtonIconUrl=""
                    DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" HiddenMode="False"
                    HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_targetdateResource1"
                    OnClickMore="" Personalize="False" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        <tr class="NormalBold">
            <td>
                <asp:Label ID="LABEL_completedate" runat="server" Text="結案時間" meta:resourcekey="LABEL_completedateResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="FIELD_completedate" runat="server" BackColor="#F0F0F0"
                    Width="120px" CssClass="Normal" FormatType="DateTime" ButtonClick="True" ButtonIconUrl=""
                    DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" HiddenMode="False"
                    HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_completedateResource1"
                    OnClickMore="" Personalize="False" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        <tr class="NormalBold">
            <td>
                <asp:Label ID="LABEL_tdstatus" runat="server" Text="處理狀況" meta:resourcekey="LABEL_tdstatusResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControlEnterprise:SelectCode id="FIELD_tdstatus" runat="server"
                    cssClass="Normal" backcolor="#F0F0F0" CodeType="tdstatus" ValueField="id" TextField="name" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif"
                    Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText=""
                    ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text=""
                    ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False"
                    ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_tdstatusResource1"
                    Mode="Single" TextBoxStyle="ThreeDStyle" Value="ca12b804-a3dc-4c5d-926a-4ded9bdeae3a">
                    <gradient gradienttype="Top" gradientbegin="" gradientend=""></gradient>
                    <errorstyle borderstyle="NotSet" />
                </SmoothEnterpriseWebControlEnterprise:SelectCode>
            </td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_save" runat="server" BackColor="#C8C8C8"
                    BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" Font-Size="12px"
                    Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom" Width="80px"
                    Text="儲存" Font-Bold="True" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_saveResource1"
                    RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_savenext" runat="server" BackColor="#C8C8C8"
                    BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" Font-Size="12px"
                    Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom" Text="儲存後繼續操作"
                    Font-Bold="True" OnClick="BUTTON_savenext_Click" meta:resourcekey="BUTTON_savenextResource1"
                    RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" BackColor="#C8C8C8"
                    BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" Font-Size="12px"
                    Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom" Width="80px"
                    Text="回上頁" Font-Bold="True" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1"
                    RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
        </tr>
    </table>
</asp:Content>
