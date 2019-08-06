<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Mail.MailGroup, App_Web_mailgroup.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

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
                <asp:Label ID="LABEL_name" runat="server" Text="名稱 / 說明" meta:resourcekey="LABEL_nameResource1"></asp:Label></td>
            <td>
                <asp:Label ID="LABEL_mgcategory" runat="server" Text="分類" meta:resourcekey="LABEL_mgcategoryResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="QUERY_name" runat="server" CssClass="Normal"
                    BackColor="#F0F0F0" Personalize="True" Width="300px" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_nameResource1" OnClickMore="" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td>
                <SmoothEnterpriseWebControlEnterprise:SelectCode ID="QUERY_mgcategory" runat="server"
                    Personalize="True" BackColor="#F0F0F0" CssClass="Normal" CodeType="mgcategory"
                    ItemAllDisplayed="True" ItemNoneDisplayed="True" ItemAll-Gradient-GradientEnd=" "
                    ItemAll-Gradient-GradientBegin=" " ItemAll-Selected="False" ItemAll-RowHeight="18"
                    ItemAll-Value="%" ItemAll-Text="%" ValueField="id" TextField="name" ButtonClick="True" ButtonIconUrl="" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_mgcategoryResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControlEnterprise:SelectCode>
            </td>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_query" runat="server" Text="查詢"
                    Width="80px" Gradient-GradientType="Bottom" CssClass="NormalBold" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
                    Font-Size="12px" Font-Bold="True" OnClick="BUTTON_query_Click" meta:resourcekey="BUTTON_queryResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_add" runat="server" Text="新增"
                    Width="80px" Gradient-GradientType="Bottom" CssClass="NormalBold" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
                    Font-Size="12px" Font-Bold="True" OnClick="BUTTON_add_Click" meta:resourcekey="BUTTON_addResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
        </tr>
    </table>
    <table border="0" width="100%">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:DataList ID="DataList1" runat="server" BorderColor="Black" EnableCustom="True" CellPadding="3px"
                    guid="" rows="10" gridlines="both" BorderWidth="1px" BorderStyle="Solid" NavigatorGradient="Left"
                    HeaderGradient="Left" HeaderHeight="30px" SelectedColor="224, 224, 224" Font-Names="Arial"
                    Font-Size="12px" SQL="select * from dgmailgroup" Personalize="True" OnOnRenderCell="DataList1_OnRenderCell" BackImageURL="" Connected="False" ConnectionString="Provider=SQLOLEDB;Password=sa;Persist Security Info=True;User ID=sa;Data Source=DG-AXION;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=DG-AXION;Use Encryption for Data=False;Tag with column collation when possible=False;Initial Catalog=Smooth2005;" CurrentColumn="" CurrentRow="0" IconCustom="" IconExport="" IconGoFirstPage="" IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage="" IconPages="" IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc="" meta:resourcekey="DataList1Resource1" SortColumn="" SortType="">
                    <Columns>
                        <SmoothEnterpriseWebControl:DataColumn DataType="CheckBox" DataAlign="Center" Width="1%"
                            Required="True" ID="DataList1_chk" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_chkResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="IconEdit" DataAlign="Center" Width="1%"
                            ID="DataList1_edit" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_editResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="UserDefined" DataAlign="Center"
                            Width="1%" ID="DataList1_view" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_viewResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="ID"
                            DataName="id" Sortable="True" ID="DataList1_id" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_idResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="名稱" Required="True"
                            DataName="name" Sortable="True" ID="DataList1_name" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_nameResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn HeaderAlign="Center" DataType="ViewText" Caption="最新/訂閱人數"
                            DataAlign="Center" Width="110px" DataName="usercount" Sortable="True" ID="DataList1_usercount" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_usercountResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="分類" DataName="mgcategory_name"
                            Sortable="True" ID="DataList1_mgcategory" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_mgcategoryResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn HeaderAlign="Center" DataType="ViewText" Caption="允許訂閱"
                            DataAlign="Center" Width="70px" DataName="subscribe" Sortable="True" ID="DataList1_subscribe" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_subscribeResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="說明" Required="True"
                            DataName="remark" Sortable="True" ID="DataList1_remark" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_remarkResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="建立人員"
                            DataName="inituid_name" Sortable="True" ID="DataList1_inituid" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_inituidResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="建立時間"
                            DataName="initdate" Sortable="True" ID="DataList1_initdate" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_initdateResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="更新人員"
                            DataName="modifyuid_name" Sortable="True" ID="DataList1_modifyuid" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_modifyuidResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="更新時間"
                            DataName="modifydate" Sortable="True" ID="DataList1_modifydate" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_modifydateResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="UserDefined" ID="DataList1_addscheduler" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_addschedulerResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                    </Columns>
                    <NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px"
                        ForeColor="64, 64, 64" BorderColor="Silver" BackColor="224, 224, 224" CssClass=""></NavigatorStyle>
                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="Black" BorderStyle="NotSet" CssClass=""></HeaderStyle>
                    <SelectColumnStyle BackColor="242, 242, 242" BorderStyle="NotSet" CssClass=""></SelectColumnStyle>
                    <SelectStyle BackColor="195, 210, 248" BorderStyle="NotSet" CssClass=""></SelectStyle>
                    <GridLine LineColor="224, 224, 224" LineStyle="Solid" LineMode="Vertical" LineWidth="1px">
                    </GridLine>
                    <HoverStyle BackColor="230, 237, 255" BorderStyle="NotSet" CssClass=""></HoverStyle>
                    <RowStyle BorderStyle="NotSet" CssClass="" />
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
                </SmoothEnterpriseWebControl:InputButton></td>
        </tr>
    </table>
</asp:Content>
