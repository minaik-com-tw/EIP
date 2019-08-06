<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="UserRole, App_Web_userrole.aspx.cdcab7d2" stylesheettheme="Default" culture="Auto" uiculture="Auto" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Application.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server"
        Details="查詢使用者所屬角色的對照表" Caption="使用者角色對照表" Width="100%"
        CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight=""
        IconWidth="" meta:resourcekey="ContentDescriptorResource1">
        <CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <table border="0">
        <tr class="NormalBold">
            <td>
                <asp:Label ID="LABLE_user" runat="server" meta:resourcekey="LABLE_userResource1" >使用者 <font size="1" color="red">(帳號or名稱)</font></asp:Label></td>
            <td>
                <asp:Label ID="LABEL_gid" runat="server" Text="群組" meta:resourcekey="LABEL_gidResource1"></asp:Label></td>
            <td>
                <asp:Label ID="LABEL_role" runat="server" Text="角色" meta:resourcekey="LABEL_roleResource1"></asp:Label></td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="QUERY_user" runat="server" BackColor="#F0F0F0"
                    CssClass="normal" Personalize="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_userResource1" OnClickMore="" Required="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td>
                <SmoothEnterpriseWebControlEnterprise:SelectGroup ID="QUERY_gid" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" Personalize="True" ItemAll-RowHeight="18" ItemAll-Selected="False"
                    ItemNone-RowHeight="18" ItemNone-Selected="False" ItemAll-GroupText="" ItemAll-IconUrl=""
                    ItemAll-Text="%" ItemAll-Value="%" ItemAllDisplayed="True" ItemNone-GroupText=""
                    ItemNone-IconUrl="" ItemNoneDisplayed="True" ButtonClick="True"
                    Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemNone-Text=""
                    ListPosition="Vertical" Mode="Single" RootId="" TextBoxStyle="ThreeDStyle" Value="%" EnabledHTC="True" meta:resourcekey="QUERY_gidResource1">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControlEnterprise:SelectGroup>
            </td>
            <td>
                <SmoothEnterpriseWebControl:InputSelect ID="QUERY_role" runat="server" BackColor="#F0F0F0"
                    CssClass="normal" ItemAll-Value="%" ItemAllDisplayed="True" Personalize="True" ButtonClick="True" ButtonIconUrl="" Editable="False" EnabledHTC="True" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_roleResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" />
                </SmoothEnterpriseWebControl:InputSelect>
            </td>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="QueryButton" runat="server" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold"
                    Font-Bold="True" Font-Names="Arial" Font-Size="12px" Gradient-GradientType="Bottom"
                    OnClick="QueryButton_Click" RunAtCient="False" Text="查詢" Width="80px" meta:resourcekey="QueryButtonResource1">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_exportexcel" runat="server" Font-Names="Arial"
                    Font-Size="12px" BackColor="#C8C8C8" BorderWidth="1px" BorderStyle="Solid" BorderColor="#606060"
                    CssClass="NormalBold" Gradient-GradientType="Bottom" Font-Bold="True" Text="匯出 Excel"
                    Width="80px" RunAtCient="False" OnClick="BUTTON_exportexcel_Click" meta:resourcekey="BUTTON_exportexcelResource1">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
            </td>
        </tr>
    </table>
    <table width="100%" border="0">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:DataList ID="DataList1" runat="server" Font-Names="Arial"
                    Font-Size="12px" BorderColor="Black" Description="使用者角色對照表" HeaderHeight="30px"
                    EnableCustom="True" CellPadding="3px" SQL="SELECT A.*,G.name AS gid_name,IU.name AS inituid_name, MU.name AS modifyuid_name FROM dguser A LEFT OUTER JOIN dggroup G ON A.gid=G.id LEFT OUTER JOIN dguser IU ON A.inituid = IU.id LEFT OUTER JOIN dguser MU ON A.modifyuid = MU.id"
                    SelectedColor="224, 224, 224" HeaderGradient="Left" NavigatorGradient="Left"
                    BorderStyle="Solid" BorderWidth="1px" gridlines="both" rows="10" guid="" OnOnRenderCell="DataList1_OnRenderCell"
                    BackImageURL="" Connected="False" CurrentColumn="" CurrentRow="0" IconCustom=""
                    IconExport="" IconGoFirstPage="" IconGoLastPage="" IconGoNextPage="" IconGoPage=""
                    IconGoPrevPage="" IconPages="" IconPageSize="" IconPrint="" IconSort="" IconSortAsc=""
                    IconSortDesc="" SortColumn="" SortType="" ConnectionString="Provider=SQLOLEDB.1;Password=sa;Persist Security Info=True;User ID=sa;Initial Catalog=smooth2005;Data Source=localhost" meta:resourcekey="DataList1Resource1">
                    <Columns>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_logonid" runat="server" DataStyle-BorderStyle="NotSet"
                            DataType="ViewArea" HeaderStyle-BorderStyle="NotSet" Caption="帳號" DataName="logonid"
                            Required="True" Sortable="True" DataStyle-CssClass="" HeaderStyle-CssClass="" meta:resourcekey="DataList1_logonidResource1">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_name" runat="server" DataStyle-BorderStyle="NotSet"
                            DataType="ViewArea" HeaderStyle-BorderStyle="NotSet" Caption="名稱" DataName="name"
                            Required="True" Sortable="True" DataStyle-CssClass="" HeaderStyle-CssClass="" meta:resourcekey="DataList1_nameResource1">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_gid" runat="server" DataStyle-BorderStyle="NotSet"
                            DataType="ViewArea" HeaderStyle-BorderStyle="NotSet" Caption="群組" DataName="gid_name"
                            Required="True" Sortable="True" DataStyle-CssClass="" HeaderStyle-CssClass="" meta:resourcekey="DataList1_gidResource1">
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
</asp:Content>
