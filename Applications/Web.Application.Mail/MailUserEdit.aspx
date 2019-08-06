<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Mail.MailUserEdit, App_Web_mailuseredit.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

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
        CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
        <CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <table border="0" class="Normal">
        <tr>
            <td valign="top">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_mailgid" runat="server" Text="郵件群組" CssClass="NormalBold" meta:resourcekey="LABEL_mailgidResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputSelect ID="FIELD_mailgid" runat="server" Required="True"
                                ItemAll-Value="%" BackColor="#F0F0F0" CssClass="Normal" ButtonClick="True" ButtonIconUrl="" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_mailgidResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputSelect>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_email" runat="server" Text="E-mail" CssClass="NormalBold" meta:resourcekey="LABEL_emailResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_email" runat="server" BackColor="#F0F0F0"
                                CssClass="Normal" ErrorMessage="請輸入「E-mail」!!" TabIndex="101" MaxLength="200"
                                Width="300px" Required="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_emailResource1" OnClickMore="" Personalize="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="E-mail Format Error !!"
                                Display="None" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ControlToValidate="FIELD_email" EnableClientScript="False" meta:resourcekey="RegularExpressionValidator1Resource1"></asp:RegularExpressionValidator></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_name" runat="server" Text="名稱" CssClass="NormalBold" meta:resourcekey="LABEL_nameResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_name" runat="server" BackColor="#F0F0F0"
                                CssClass="Normal" ErrorMessage="請輸入「姓名」!!" TabIndex="102" MaxLength="100" Width="300px"
                                Required="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nameResource1" OnClickMore="" Personalize="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_mucategory" runat="server" Text="分類" CssClass="NormalBold" meta:resourcekey="LABEL_mucategoryResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControlEnterprise:SelectCode ID="FIELD_mucategory" runat="server"
                                CssClass="Normal" BackColor="#F0F0F0" TextBoxStyle="ThreeDStyle" CodeType="mucategory"
                                Editable="False" ItemAllDisplayed="True" ItemAddDisplayed="True" ButtonClick="True" ButtonIconUrl="" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAddUrl="/lib/app/addcode.aspx?ctype=mucategory" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_mucategoryResource1" Mode="Single" TextField="" Value="" ValueField="">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" />
                            </SmoothEnterpriseWebControlEnterprise:SelectCode>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_mustatus" runat="server" Text="狀態" CssClass="NormalBold" meta:resourcekey="LABEL_mustatusResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControlEnterprise:SelectCode ID="FIELD_mustatus" runat="server"
                                BackColor="#F0F0F0" CssClass="Normal" CodeType="mustatus" TextBoxStyle="ThreeDStyle" ButtonClick="True" ButtonIconUrl="" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_mustatusResource1" Mode="Single" TextField="" Value="" ValueField="">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControlEnterprise:SelectCode>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_remark" runat="server" Text="備註" CssClass="NormalBold" meta:resourcekey="LABEL_remarkResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_remark" TabIndex="102" runat="server"
                                Width="300px" BackColor="#F0F0F0" CssClass="Normal" MaxLength="100" ErrorMessage="Please Input「備註」!!"
                                Required="False" TextMode="MultiLine" Height="100px" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_remarkResource1" OnClickMore="" Personalize="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
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
                    Font-Size="12px" Font-Bold="True" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_saveResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Width="80px"
                    Text="回上頁" Gradient-GradientType="Bottom" CssClass="NormalBold" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
                    Font-Size="12px" Font-Bold="True" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_delete" runat="server" Text="刪除"
                    Width="80px" Gradient-GradientType="Bottom" CssClass="NormalBold" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
                    Font-Size="12px" Font-Bold="True" OnClick="BUTTON_delete_Click" meta:resourcekey="BUTTON_deleteResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
            </td>
        </tr>
    </table>
</asp:Content>
