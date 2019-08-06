<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Portal.Reminder, App_Web_reminder.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

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
    <table border="0">
        <tr class="NormalBold">
            <td>
                <asp:Label ID="LABEL_typename" runat="server" Text="類別名稱" meta:resourcekey="LABEL_typenameResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="QUERY_typename" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" Personalize="True" Gradient-GradientType="Top" ButtonClick="True"
                    ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor=""
                    FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_typenameResource1"
                    OnClickMore="" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_query" runat="server" Font-Names="Arial"
                    Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                    BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom" Font-Bold="True"
                    Width="80px" Text="查詢" OnClick="BUTTON_query_Click" meta:resourcekey="BUTTON_queryResource1"
                    RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_add" runat="server" Font-Names="Arial"
                    Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                    BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom" Font-Bold="True"
                    Width="80px" Text="新增" OnClick="BUTTON_add_Click" meta:resourcekey="BUTTON_addResource1"
                    RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
        </tr>
    </table>
    <table width="100%" border="0">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:DataList ID="DataList1" runat="server" Font-Names="Arial"
                    Font-Size="12px" BorderColor="Black" Personalize="True" SQL="select * from dgportalreminder"
                    SelectedColor="224, 224, 224" HeaderHeight="30px" HeaderGradient="Left" NavigatorGradient="Left"
                    BorderStyle="Solid" BorderWidth="1px" gridlines="both" rows="10" guid="" CellPadding="3px"
                    EnableCustom="True" Description="Reminder" BackImageURL="" Connected="False"
                    ConnectionString="Provider=SQLOLEDB;Password=sa;Persist Security Info=True;User ID=sa;Data Source=DG-AXION;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=DG-AXION;Use Encryption for Data=False;Tag with column collation when possible=False;Initial Catalog=Smooth2005;"
                    CurrentColumn="" CurrentRow="0" IconCustom="" IconExport="" IconGoFirstPage=""
                    IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage="" IconPages=""
                    IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc="" meta:resourcekey="DataList1Resource1"
                    SortColumn="" SortType="" OnOnRenderCell="DataList1_OnRenderCell">
                    <Columns>
                        <SmoothEnterpriseWebControl:DataColumn DataType="CheckBox" DataAlign="Center" Width="1%"
                            Required="True" ID="DataList1_chk" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_chkResource1"
                            runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="IconEdit" DataAlign="Center" Width="1%"
                            ID="DataList1_edit" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_editResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="類別名稱" Required="True"
                            DataName="typename" Sortable="True" ID="DataList1_typename" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            meta:resourcekey="DataList1_typenameResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="顯示名稱" DataName="text"
                            Sortable="True" ID="DataList1_text" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_textResource1"
                            runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="預設網址" DataName="defaulturl"
                            Sortable="True" ID="DataList1_defaulturl" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_defaulturlResource1"
                            runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="UserDefined" Caption="總是顯示" ID="DataList1_visibletype" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_visibletypeResource1"
                            runat="server" DataAlign="Center">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="UserDefined" Caption="開新視窗" ID="DataList1_viewmode" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_viewmodeResource1"
                            runat="server" DataAlign="Center">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="UserDefined" Caption="啟用" ID="DataList1_enabled" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_enabledResource1"
                            runat="server" DataAlign="Center">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="順序" DataName="seq"
                            Sortable="True" ID="DataList1_seq" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_seqResource1"
                            runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="初始人員" DataName="initname"
                            Sortable="True" ID="DataList1_inituid" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_inituidResource1"
                            runat="server" Visible="False">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="初始日期" DataName="initdate"
                            Sortable="True" ID="DataList1_initdate" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_initdateResource1"
                            runat="server" Visible="False">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="更新人員" DataName="modifyname"
                            Sortable="True" ID="DataList1_modifyuid" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_modifyuidResource1"
                            runat="server" Visible="False">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="更新日期" DataName="modifydate"
                            Sortable="True" ID="DataList1_modifydate" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_modifydateResource1"
                            runat="server" Visible="False">
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
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_delete" runat="server" Font-Names="Arial"
                    Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                    BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom" Font-Bold="True"
                    Width="80px" Text="刪除" OnClick="BUTTON_delete_Click" meta:resourcekey="BUTTON_deleteResource1"
                    RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
        </tr>
    </table>
</asp:Content>
