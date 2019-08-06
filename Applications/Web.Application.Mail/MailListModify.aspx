<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Mail.MailListModify, App_Web_maillistmodify.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

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
    <table cellspacing="4" cellpadding="4" border="0">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="FIELD_id" TabIndex="100" runat="server"
                    BackColor="#F0F0F0" CssClass="Normal" HiddenMode="True" ErrorMessage="請輸入「Id」!!" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_idResource1" OnClickMore="" Personalize="False" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText>
                <table class="Normal" border="0">
                    <tr>
                        <td valign="top">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="LABEL_group_name" runat="server" Text="群組名稱" CssClass="NormalBold" meta:resourcekey="LABEL_group_nameResource1"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_name" TabIndex="101" runat="server"
                                            BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="請輸入「群組名稱」!!" MaxLength="50"
                                            Required="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nameResource1" OnClickMore="" Personalize="False">
                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                            </table>
                        </td>
                        <td valign="top">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="LABEL_remark" runat="server" Text="描述" CssClass="NormalBold" meta:resourcekey="LABEL_remarkResource1"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_remark" TabIndex="102" runat="server"
                                            BackColor="#F0F0F0" Width="300px" CssClass="Normal" ErrorMessage="請輸入「描述」!!"
                                            MaxLength="1073741823" TextMode="MultiLine" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_remarkResource1" OnClickMore="" Personalize="False" Required="False">
                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td bgcolor="#dfdfdf">
                <table class="Normal" border="0">
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="LABEL_email" runat="server" Text="郵件地址" CssClass="NormalBold" meta:resourcekey="LABEL_emailResource1"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="LABEL_name" runat="server" Text="名稱" CssClass="NormalBold" meta:resourcekey="LABEL_nameResource1"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="LABEL_mustatus" runat="server" Text="狀態" CssClass="NormalBold" meta:resourcekey="LABEL_mustatusResource1"></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="DETAIL_keystr" runat="server" HiddenMode="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="DETAIL_keystrResource1" OnClickMore="" Personalize="False" Required="False">
                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="DETAIL_email" runat="server" BackColor="#F0F0F0"
                                            Width="300px" CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="DETAIL_emailResource1" OnClickMore="" Personalize="False" Required="False">
                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="DETAIL_name" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="DETAIL_nameResource1" OnClickMore="" Personalize="False" Required="False">
                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <SmoothEnterpriseWebControlEnterprise:SelectCode ID="DETAIL_mustatus" runat="server"
                                            TextBoxStyle="ThreeDStyle" CodeType="mustatus" BackColor="White" CssClass="Normal" ButtonClick="True" ButtonIconUrl="" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="DETAIL_mustatusResource1" Mode="Single" TextField="" Value="" ValueField="">
                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControlEnterprise:SelectCode>
                                    </td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputButton ID="BUTTON_update" runat="server" BackColor="#C8C8C8"
                                            BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" Font-Size="12px"
                                            Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom" Width="80px"
                                            Text="更新" Font-Bold="True" OnClick="BUTTON_update_Click" meta:resourcekey="BUTTON_updateResource1" RunAtCient="False">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                                        </SmoothEnterpriseWebControl:InputButton><SmoothEnterpriseWebControl:InputButton
                                            ID="BUTTON_cancel" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
                                            BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold"
                                            Gradient-GradientType="Bottom" Width="80px" Text="取消" Font-Bold="True" OnClick="BUTTON_cancel_Click" meta:resourcekey="BUTTON_cancelResource1" RunAtCient="False">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                                        </SmoothEnterpriseWebControl:InputButton><SmoothEnterpriseWebControl:InputButton
                                            ID="BUTTON_add" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
                                            BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold"
                                            Gradient-GradientType="Bottom" Width="80px" Text="新增" Font-Bold="True" meta:resourcekey="BUTTON_addResource1" RunAtCient="False">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                                        </SmoothEnterpriseWebControl:InputButton></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:DataList ID="DataList1" runat="server" BorderColor="Black"
                                Font-Size="12px" Font-Names="Arial" gridlines="both" BorderWidth="1px" BorderStyle="Solid"
                                Connected="False" CellPadding="3px" EnableCustom="True" HeaderHeight="30px" SQL="select A.*,SU.name AS uid_name,DC.name AS mustatus_name,I.name AS inituid_name,M.name AS modifyuid_name from dgmailuser A LEFT OUTER JOIN dguser SU ON A.uid=SU.id LEFT OUTER JOIN dgcode DC ON A.mustatus=DC.id LEFT OUTER JOIN dguser I ON A.inituid=I.id LEFT OUTER JOIN dguser M ON A.modifyuid=M.id where 1=0"
                                OnOnRenderCell="DataList1_OnRenderCell" BackImageURL="" ConnectionString="Provider=SQLOLEDB;Password=sa;Persist Security Info=True;User ID=sa;Data Source=DG-AXION;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=DG-AXION;Use Encryption for Data=False;Tag with column collation when possible=False;Initial Catalog=Smooth2005;" CurrentColumn="" CurrentRow="0" IconCustom="" IconExport="" IconGoFirstPage="" IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage="" IconPages="" IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc="" meta:resourcekey="DataList1Resource1" SortColumn="" SortType="">
                                <Columns>
                                    <SmoothEnterpriseWebControl:DataColumn DataType="UserDefined" DataAlign="Center"
                                        Width="1%" ID="DataList1_edit" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_editResource1" runat="server">
                                        <Template>
                                            <SmoothEnterpriseWebControl:InputText ID="dl_keys" runat="server" BackColor="#F0F0F0"
                                                CssClass="Normal" HiddenMode="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="dl_keysResource1" OnClickMore="" Personalize="False" Required="False">
                                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            </SmoothEnterpriseWebControl:InputText>
                                            <SmoothEnterpriseWebControl:InputButton ID="DetailEditButton" OnClick="DetailBUTTON_edit_Click"
                                                runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060" BorderWidth="1px"
                                                BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold"
                                                Text="編輯" Font-Bold="True" meta:resourcekey="DetailEditButtonResource1" RunAtCient="False">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                                            </SmoothEnterpriseWebControl:InputButton>
                                        </Template>
                                    </SmoothEnterpriseWebControl:DataColumn>
                                    <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="系統使用者"
                                        DataName="uid_name" Sortable="True" ID="DataList1_uid" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_uidResource1" runat="server">
                                    </SmoothEnterpriseWebControl:DataColumn>
                                    <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="郵件地址" DataName="email"
                                        Sortable="True" ID="DataList1_email" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_emailResource1" runat="server">
                                    </SmoothEnterpriseWebControl:DataColumn>
                                    <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="名稱" DataName="name"
                                        Sortable="True" ID="DataList1_name" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_nameResource1" runat="server">
                                    </SmoothEnterpriseWebControl:DataColumn>
                                    <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="最後寄送日期" DataName="sentdate"
                                        Sortable="True" ID="DataList1_sentdate" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_sentdateResource1" runat="server">
                                    </SmoothEnterpriseWebControl:DataColumn>
                                    <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="狀態" DataName="mustatus_name"
                                        Sortable="True" ID="DataList1_mustatus" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_mustatusResource1" runat="server">
                                    </SmoothEnterpriseWebControl:DataColumn>
                                    <SmoothEnterpriseWebControl:DataColumn DataType="UserDefined" Width="1%" ID="DataList1_delete" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_deleteResource1" runat="server">
                                        <Template>
                                            <SmoothEnterpriseWebControl:InputButton ID="DetailBUTTON_delete" OnClick="DetailBUTTON_delete_Click"
                                                runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060" BorderWidth="1px"
                                                BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold"
                                                Text="刪除" Font-Bold="True" meta:resourcekey="DetailBUTTON_deleteResource1" RunAtCient="False">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                                            </SmoothEnterpriseWebControl:InputButton>
                                        </Template>
                                    </SmoothEnterpriseWebControl:DataColumn>
                                </Columns>
                                <NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px"
                                    ForeColor="64, 64, 64" BorderColor="Silver" BackColor="224, 224, 224" CssClass=""></NavigatorStyle>
                                <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="Black" BorderStyle="NotSet" CssClass=""></HeaderStyle>
                                <SelectColumnStyle BackColor="242, 242, 242" BorderStyle="NotSet" CssClass=""></SelectColumnStyle>
                                <SelectStyle BackColor="195, 210, 248" BorderStyle="NotSet" CssClass=""></SelectStyle>
                                <GridLine LineColor="224, 224, 224" LineStyle="Solid" LineMode="Vertical" LineWidth="1px">
                                </GridLine>
                                <HoverStyle BorderStyle="None" CssClass=""></HoverStyle>
                                <RowStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:DataList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table class="Normal" id="Table3" border="0">
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputButton ID="BUTTON_save" runat="server" BackColor="#C8C8C8"
                                BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" Font-Size="12px"
                                Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom" Width="80px"
                                Text="儲存" Font-Bold="True" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_saveResource1" RunAtCient="False">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                            </SmoothEnterpriseWebControl:InputButton>&nbsp;
                            <SmoothEnterpriseWebControl:InputButton ID="BUTTON_delete" runat="server" BackColor="#C8C8C8"
                                BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" Font-Size="12px"
                                Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom" Width="80px"
                                Text="刪除" Font-Bold="True" OnClick="BUTTON_delete_Click" meta:resourcekey="BUTTON_deleteResource2" RunAtCient="False">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                            </SmoothEnterpriseWebControl:InputButton>&nbsp;&nbsp;<SmoothEnterpriseWebControl:InputButton
                                ID="BUTTON_back" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
                                BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold"
                                Gradient-GradientType="Bottom" Width="80px" Text="回上頁" Font-Bold="True" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                            </SmoothEnterpriseWebControl:InputButton>&nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
