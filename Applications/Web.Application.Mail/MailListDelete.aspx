<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Mail.MailListDelete, App_Web_maillistdelete.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server"
        Details="The desciption for this program" Caption="Program Name" Width="100%"
        CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
        <CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <SmoothEnterpriseWebControl:PageJumper ID="PageJumper1" runat="server" ShowPageNumber="True" ButtonNextLabel="&gt;" ButtonPrevLabel="&lt;" ButtonType="Button" meta:resourcekey="PageJumper1Resource1">
        <ButtonStyle PaddingSize="2px" Width="20px" GradientEnd="64, 64, 64" BorderWidth="1px"
            BorderStyle="Solid" BorderColor="96, 96, 96" GradientBegin="224, 224, 224" BackColor="200, 200, 200" CssClass="">
        </ButtonStyle>
        <PageSelectedStyle BorderWidth="3px" BorderStyle="Solid" BorderColor="Black" BackColor="WhiteSmoke" CssClass="">
        </PageSelectedStyle>
        <PageNumberStyle Font-Size="10px" Font-Names="Arial" PaddingSize="2px" Width="10px"
            BorderWidth="1px" ForeColor="Black" BorderStyle="Solid" BorderColor="Gray" BackColor="White" CssClass="">
        </PageNumberStyle>
    </SmoothEnterpriseWebControl:PageJumper>
    <table border="0" class="Normal">
        <tr>
            <td valign="top">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_name" runat="server" Text="群組名稱" CssClass="NormalBold" meta:resourcekey="LABEL_nameResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_name" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" TextMode="MultiLine" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nameResource1" OnClickMore="" Personalize="False" Required="False">
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
                                ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_inituidResource1" OnClickMore="" Personalize="False" Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_modifyuid" runat="server" Text="更新人員" CssClass="NormalBold" meta:resourcekey="LABEL_modifyuidResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_modifyuid" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_modifyuidResource1" OnClickMore="" Personalize="False" Required="False">
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
                        <td class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_remark" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" Width="300px" TextMode="MultiLine" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_remarkResource1" OnClickMore="" Personalize="False" Required="False">
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
                                ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_initdateResource1" OnClickMore="" Personalize="False" Required="False">
                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_modifydate" runat="server" Text="更新時間" CssClass="NormalBold" meta:resourcekey="LABEL_modifydateResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="Normal">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_modifydate" runat="server" CssClass="PanelWhite"
                                ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_modifydateResource1" OnClickMore="" Personalize="False" Required="False">
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
            </td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:DataList ID="DataList1" runat="server" Font-Names="Arial"
                    Font-Size="12px" BorderColor="Gray" gridlines="both" BorderWidth="1px" BorderStyle="Solid"
                    Connected="False" CellPadding="3px" EnableCustom="False" EnableExport="False"
                    EnablePrint="False" HeaderHeight="30px" BackColor="#E0E0E0"
                    SQL="select A.*,SU.name AS uid_name,DC.name AS mustatus_name,I.name AS inituid_name,M.name AS modifyuid_name from dgmailuser A LEFT OUTER JOIN dguser SU ON A.uid=SU.id LEFT OUTER JOIN dgcode DC ON A.mustatus=DC.id LEFT OUTER JOIN dguser I ON A.inituid=I.id LEFT OUTER JOIN dguser M ON A.modifyuid=M.id" BackImageURL="" ConnectionString="Provider=SQLOLEDB;Password=sa;Persist Security Info=True;User ID=sa;Data Source=DG-AXION;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=DG-AXION;Use Encryption for Data=False;Tag with column collation when possible=False;Initial Catalog=Smooth2005;" CurrentColumn="" CurrentRow="0" IconCustom="" IconExport="" IconGoFirstPage="" IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage="" IconPages="" IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc="" meta:resourcekey="DataList1Resource1" SortColumn="" SortType="">
                    <HeaderStyle Font-Bold="True" BackColor="Silver" BorderStyle="NotSet" CssClass=""></HeaderStyle>
                    <GridLine LineColor="224, 224, 224" LineStyle="Solid" LineMode="Vertical" LineWidth="1px">
                    </GridLine>
                    <NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px"
                        ForeColor="64, 64, 64" BorderColor="Silver" BackColor="224, 224, 224" CssClass=""></NavigatorStyle>
                    <Columns>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="系統使用者" DataName="uid_name"
                            ID="DataList1_uid" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_uidResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="名稱" DataName="name"
                            ID="DataList1_name" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_nameResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="郵件地址" DataName="email"
                            ID="DataList1_email" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_emailResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="最後寄送時間" DataName="sentdate"
                            ID="DataList1_sentdate" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_sentdateResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="狀態" DataName="mustatus_name"
                            ID="DataList1_mustatus" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_mustatusResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="建立人員" DataWrap="False"
                            DataName="inituid_name" ID="DataList1_inituid" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_inituidResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="建立時間" DataWrap="False"
                            DataName="initdate" ID="DataList1_initdate" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_initdateResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="更新人員" DataName="modifyuid_name"
                            ID="DataList1_modifyuid" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_modifyuidResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="更新時間" DataName="modifydate"
                            ID="DataList1_modifydate" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_modifydateResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                    </Columns>
                    <SelectStyle BorderStyle="NotSet" CssClass="" />
                    <RowStyle BorderStyle="NotSet" CssClass="" />
                    <HoverStyle BorderStyle="NotSet" CssClass="" />
                    <SelectColumnStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:DataList>
            </td>
        </tr>
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" border="0">
                    <tr>
                        <td>
                            <SmoothEnterpriseWebControl:InputButton ID="BUTTON_delete" runat="server" Font-Names="Arial"
                                Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                                BackColor="#C8C8C8" Gradient-GradientType="Bottom" CssClass="NormalBold" Font-Bold="True"
                                Text="刪除" Width="80px" OnClick="BUTTON_delete_Click" meta:resourcekey="BUTTON_deleteResource1" RunAtCient="False">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                            </SmoothEnterpriseWebControl:InputButton>&nbsp;</td>
                        <td>
                            &nbsp;
                            <SmoothEnterpriseWebControl:InputButton ID="BUTTON_cancel" runat="server" Font-Names="Arial"
                                Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                                BackColor="#C8C8C8" Gradient-GradientType="Bottom" CssClass="NormalBold" Font-Bold="True"
                                Text="取消" Width="80px" OnClick="BUTTON_cancel_Click" meta:resourcekey="BUTTON_cancelResource1" RunAtCient="False">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                            </SmoothEnterpriseWebControl:InputButton>&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
