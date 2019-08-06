<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Mail.MailUser, App_Web_mailuser.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

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
    <table border="0">
        <tr>
            <td>
                <asp:Label ID="LABEL_mailgid" runat="server" Text="群組" CssClass="NormalBold" meta:resourcekey="LABEL_mailgidResource1"></asp:Label></td>
            <td>
                <asp:Label ID="LABEL_emailname" runat="server" Text="E-mail / 名稱" CssClass="NormalBold" meta:resourcekey="LABEL_emailnameResource1"></asp:Label></td>
            <td>
                <asp:Label ID="LABEL_mucategory" runat="server" Text="分類" CssClass="NormalBold" meta:resourcekey="LABEL_mucategoryResource1"></asp:Label></td>
            <td>
                <asp:Label ID="LABEL_mustatus" runat="server" Text="狀態" CssClass="NormalBold" meta:resourcekey="LABEL_mustatusResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputSelect ID="QUERY_mailgid" runat="server" Personalize="True"
                    BackColor="#F0F0F0" CssClass="Normal" ItemAll-Gradient-GradientEnd=" " ItemAll-Gradient-GradientBegin=" "
                    ItemAll-Selected="False" ItemAll-RowHeight="18" Mode="Single" ButtonClick="True" ButtonIconUrl="" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_mailgidResource1" TextBoxStyle="ThreeDStyle" Value="">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputSelect>
            </td>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="QUERY_emailname" runat="server" Width="200px"
                    BackColor="#F0F0F0" CssClass="Normal" Personalize="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_emailnameResource1" OnClickMore="" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td>
                <SmoothEnterpriseWebControlEnterprise:SelectCode ID="QUERY_mucategory" runat="server"
                    Personalize="True" BackColor="#F0F0F0" CssClass="Normal" ItemAllDisplayed="True"
                    CodeType="mucategory" TextBoxStyle="ThreeDStyle" ItemAll-GroupText="" ItemAll-IconUrl=""
                    ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemAll-Value="%"
                    ItemNoneDisplayed="True" ButtonClick="True" ButtonIconUrl="" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_mucategoryResource1" Mode="Single" TextField="" Value="" ValueField="">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" />
                </SmoothEnterpriseWebControlEnterprise:SelectCode>
            </td>
            <td>
                <SmoothEnterpriseWebControlEnterprise:SelectCode ID="QUERY_mustatus" runat="server"
                    Personalize="True" BackColor="#F0F0F0" CssClass="Normal" ItemAllDisplayed="True"
                    CodeType="mustatus" TextBoxStyle="ThreeDStyle" ButtonClick="True" ButtonIconUrl="" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_mustatusResource1" Mode="Single" TextField="" Value="" ValueField="">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControlEnterprise:SelectCode>
            </td>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_query" runat="server" Font-Names="Arial"
                    Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                    BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom" Font-Bold="True"
                    Width="80px" Text="查詢" OnClick="BUTTON_query_Click" meta:resourcekey="BUTTON_queryResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_add" runat="server" Font-Names="Arial"
                    Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                    BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom" Font-Bold="True"
                    Width="80px" Text="新增" OnClick="BUTTON_add_Click" meta:resourcekey="BUTTON_addResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
        </tr>
    </table>
    <table width="100%" border="0">
        <tr>
            <td style="width: 732px">
                <SmoothEnterpriseWebControl:DataList ID="DataList1" runat="server" Font-Names="Arial"
                    Font-Size="12px" BorderColor="Black" Personalize="True" SQL="select * from dgmailuser"
                    SelectedColor="224, 224, 224" HeaderHeight="30px" HeaderGradient="Left" NavigatorGradient="Left"
                    BorderStyle="Solid" BorderWidth="1px" gridlines="both" rows="10" guid="" CellPadding="3px"
                    EnableCustom="True" OnOnRenderCell="DataList1_OnRenderCell" BackImageURL="" Connected="False" ConnectionString="Provider=SQLOLEDB;Password=sa;Persist Security Info=True;User ID=sa;Data Source=DG-AXION;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=DG-AXION;Use Encryption for Data=False;Tag with column collation when possible=False;Initial Catalog=Smooth2005;" CurrentColumn="" CurrentRow="0" IconCustom="" IconExport="" IconGoFirstPage="" IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage="" IconPages="" IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc="" meta:resourcekey="DataList1Resource1" SortColumn="" SortType="">
                    <Columns>
                        <SmoothEnterpriseWebControl:DataColumn DataType="CheckBox" DataAlign="Center" Width="1%"
                            Required="True" ID="DataList1_chk" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_chkResource1">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="IconEdit" DataAlign="Center" Width="1%"
                            ID="DataList1_edit" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_editResource1">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="郵件群組"
                            DataName="mailgid_name" Sortable="True" ID="DataList1_mailgid" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            runat="server" meta:resourcekey="DataList1_mailgidResource1">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="E-mail" Required="True"
                            DataName="email" Sortable="True" ID="DataList1_email" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            runat="server" meta:resourcekey="DataList1_emailResource1">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="名稱" Required="True"
                            DataName="name" Sortable="True" ID="DataList1_name" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            runat="server" meta:resourcekey="DataList1_nameResource1">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="系統使用者"
                            DataName="uid" Sortable="True" ID="DataList1_uid" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            runat="server" meta:resourcekey="DataList1_uidResource1">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="分類" DataName="mucategory_name"
                            Sortable="True" ID="DataList1_mucategory" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" Required="True" runat="server" meta:resourcekey="DataList1_mucategoryResource1">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="狀態" DataName="mustatus_name"
                            Sortable="True" ID="DataList1_mustatus" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" Required="True" runat="server" meta:resourcekey="DataList1_mustatusResource1">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="建立時間" DataName="initdate"
                            Sortable="True" ID="DataList1_initdate" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_initdateResource1">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="最後發送時間"
                            DataName="sentdate" Sortable="True" ID="DataList1_sentdate" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            runat="server" meta:resourcekey="DataList1_sentdateResource1">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="建立人員" Required="True"
                            DataName="inituid_name" Sortable="True" ID="DataList1_inituid" Visible="False"
                            DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_inituidResource1">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="更新人員" Required="True"
                            DataName="modifyuid_name" Sortable="True" ID="DataList1_modifyuid" Visible="False"
                            DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_modifyuidResource1">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="更新時間" Required="True"
                            DataName="modifydate" Sortable="True" ID="DataList1_modifydate" Visible="False"
                            DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_modifydateResource1">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="IconView" DataAlign="Center" Width="1%"
                            ID="DataList1_view" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_viewResource1">
                        </SmoothEnterpriseWebControl:DataColumn>
                    </Columns>
                    <NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px"
                        ForeColor="64, 64, 64" BorderColor="Silver" BackColor="224, 224, 224">
                    </NavigatorStyle>
                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="Black" BorderStyle="NotSet"></HeaderStyle>
                    <SelectColumnStyle BackColor="242, 242, 242" BorderStyle="NotSet"></SelectColumnStyle>
                    <SelectStyle BackColor="195, 210, 248" BorderStyle="NotSet"></SelectStyle>
                    <GridLine LineColor="224, 224, 224" LineStyle="Solid" LineMode="Vertical" LineWidth="1px">
                    </GridLine>
                    <HoverStyle BackColor="230, 237, 255" BorderStyle="NotSet"></HoverStyle>
                    <RowStyle BorderStyle="NotSet" />
                </SmoothEnterpriseWebControl:DataList>
            </td>
        </tr>
    </table>
    <table border="0">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_delete" runat="server" Text="刪除"
                    Width="80px" Gradient-GradientType="Bottom" CssClass="NormalBold" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
                    Font-Size="12px" Font-Bold="True" OnClick="BUTTON_delete_Click" meta:resourcekey="BUTTON_deleteResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton><font face="新細明體">&nbsp;
                    <SmoothEnterpriseWebControl:InputButton ID="BUTTON_gogroup" runat="server" BackColor="#C8C8C8"
                        BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" Font-Size="12px"
                        Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom" Text="回群組維護"
                        Font-Bold="True" OnClick="BUTTON_gogroup_Click" meta:resourcekey="BUTTON_gogroupResource1" RunAtCient="False">
                        <Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
                    </SmoothEnterpriseWebControl:InputButton></font></td>
        </tr>
    </table>
</asp:Content>
