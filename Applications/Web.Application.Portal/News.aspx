<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Portal.News, App_Web_news.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
    <table border="0">
        <tr Class="NormalBold">
            <td>
                <asp:Label ID="LABEL_newsno" runat="server" Text="編號" meta:resourcekey="LABEL_newsnoResource1"></asp:Label></td>
            <td>
                <asp:Label ID="LABEL_description" runat="server" Text="描述" meta:resourcekey="LABEL_descriptionResource1"></asp:Label></td>
<td>
                <asp:Label ID="LABEL_newscategory" runat="server" Text="分類" meta:resourcekey="LABEL_newscategoryResource1"></asp:Label></td>
            <td>
                <asp:Label ID="LABEL_details" runat="server" Text="內容" meta:resourcekey="LABEL_detailsResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="QUERY_newsno" runat="server" CssClass="Normal"
                    BackColor="#F0F0F0" Personalize="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash"
                    DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False"
                    HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_newsnoResource1" OnClickMore=""
                    Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="QUERY_description" runat="server" CssClass="Normal"
                    BackColor="#F0F0F0" Personalize="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash"
                    DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False"
                    HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_descriptionResource1"
                    OnClickMore="" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText>
                </td>
            <td>
            <SmoothEnterpriseWebControlEnterprise:SelectCode id="QUERY_newscategory" runat="server" BackColor="#F0F0F0" ItemNoneDisplayed="True" cssClass="Normal" CodeType="newscategory" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemAll-Value="%" ItemAllDisplayed="True" Personalize="True">
                    <gradient gradientbegin="" gradientend="" gradienttype="Top"></gradient>
                    <errorstyle borderstyle="NotSet" CssClass=""  />
                </SmoothEnterpriseWebControlEnterprise:SelectCode>
            </td>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="QUERY_details" runat="server" CssClass="Normal"
                    BackColor="#F0F0F0" Personalize="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash"
                    DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False"
                    HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_detailsResource1" OnClickMore=""
                    Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_query" runat="server" Text="查詢"
                    Width="80px" Gradient-GradientType="Bottom" CssClass="NormalBold" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
                    Font-Size="12px" Font-Bold="True" OnClick="BUTTON_query_Click" meta:resourcekey="BUTTON_queryResource1"
                    RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_add" runat="server" Text="新增"
                    Width="80px" Gradient-GradientType="Bottom" CssClass="NormalBold" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
                    Font-Size="12px" Font-Bold="True" OnClick="BUTTON_add_Click" meta:resourcekey="BUTTON_addResource1"
                    RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
        </tr>
    </table>
    <table border="0" width="100%">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:DataList ID="DataList1" runat="server" BorderColor="Black"
                    EnableCustom="True" CellPadding="3px" rows="10" gridlines="both" BorderWidth="1px"
                    BorderStyle="Solid" NavigatorGradient="Left" HeaderGradient="Left" HeaderHeight="30px"
                    SelectedColor="224, 224, 224" Font-Names="Arial" Font-Size="12px" SQL="select A.*,I.name AS inituid_name,M.name AS modifyuid_name from dgnews A LEFT OUTER JOIN dguser I ON A.inituid=I.id LEFT OUTER JOIN dguser M ON A.modifyuid=M.id"
                    Description="Site News" Personalize="True" OnOnRenderCell="DataList1_OnRenderCell"
                    BackImageURL="" Connected="False" ConnectionString="Provider=SQLOLEDB;Password=sa;Persist Security Info=True;User ID=sa;Data Source=DG-AXION;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=DG-AXION;Use Encryption for Data=False;Tag with column collation when possible=False;Initial Catalog=Smooth2005;"
                    CurrentColumn="" CurrentRow="0" IconCustom="" IconExport="" IconGoFirstPage=""
                    IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage="" IconPages=""
                    IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc="" meta:resourcekey="DataList1Resource1"
                    SortColumn="" SortType="">
                    <Columns>
                        <SmoothEnterpriseWebControl:DataColumn DataType="CheckBox" DataAlign="Center" Width="1%"
                            Required="True" ID="chk" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" meta:resourcekey="chkResource1"
                            runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="IconEdit" DataAlign="Center" Width="1%"
                            ID="edit" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="editResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="編號" Width="50px"
                            DataName="newsno" Sortable="True" ID="DataList1_newsno" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            meta:resourcekey="DataList1_newsnoResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="描述" Required="True"
                            DataName="description" Sortable="True" ID="DataList1_description" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            meta:resourcekey="DataList1_descriptionResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="刊登日期" Required="True"
                            DataName="sdate" Sortable="True" ID="DataList1_sdate" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            meta:resourcekey="DataList1_sdateResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="刊登期限" Required="True"
                            DataName="edate" Sortable="True" ID="DataList1_edate" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            meta:resourcekey="DataList1_edateResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="分類" Required="True"
                            DataName="newscategory_name" Sortable="True" ID="DataList1_newscategory" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            meta:resourcekey="DataList1_newscategoryResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="內容"
                            DataName="details" Sortable="True" ID="DataList1_details" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            meta:resourcekey="DataList1_detailsResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="相關連結"
                            DataName="linkurl" Sortable="True" ID="DataList1_linkurl" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            meta:resourcekey="DataList1_linkurlResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="UserDefined" Caption="開新視窗"
                            DataName="linkmode" Sortable="True" ID="DataList1_linkmode" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            meta:resourcekey="DataList1_linkmodeResource1" runat="server" DataAlign="Center">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="建立人員"
                            DataName="inituid" Sortable="True" ID="DataList1_inituid" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            meta:resourcekey="DataList1_inituidResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="建立時間"
                            DataName="initdate" Sortable="True" ID="DataList1_initdate" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            meta:resourcekey="DataList1_initdateResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="更新人員" DataName="modifyuid_name"
                            Sortable="True" ID="DataList1_modifyuid" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_modifyuidResource1"
                            runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="更新時間" DataName="modifydate"
                            Sortable="True" ID="DataList1_modifydate" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_modifydateResource1"
                            runat="server">
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
                    Font-Size="12px" Font-Bold="True" OnClick="BUTTON_delete_Click" meta:resourcekey="BUTTON_deleteResource1"
                    RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
        </tr>
    </table>
</asp:Content>
