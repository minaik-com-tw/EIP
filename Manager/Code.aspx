<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Manager.Code, App_Web_code.aspx.cdcab7d2" title="WebForm List Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
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
                <asp:Label ID="LABEL_ctype" runat="server" Text="代碼類別" meta:resourcekey="LABEL_ctypeResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputSelect ID="QUERY_ctype" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" ItemNoneDisplayed="True" OnSelectedIndexChanged="QUERY_ctype_SelectedIndexChanged"
                    ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False"
                    ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl=""
                    ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText=""
                    ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text=""
                    ListPosition="Vertical" meta:resourcekey="QUERY_ctypeResource1" Mode="Single"
                    TextBoxStyle="ThreeDStyle" Value="" Personalize="True">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" />
                </SmoothEnterpriseWebControl:InputSelect>
            </td>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="AddButton" runat="server" Text="新增" Width="80px"
                    Gradient-GradientType="Bottom" CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060"
                    BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial" Font-Size="12px" Font-Bold="True"
                    OnClick="AddButton_Click" meta:resourcekey="AddButtonResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
        </tr>
    </table>
    <table border="0" width="100%">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:DataList ID="DataList1" runat="server" BorderColor="Black"
                    EnableCustom="True" CellPadding="3px" guid="" rows="10" gridlines="both" BorderWidth="1px"
                    BorderStyle="Solid" NavigatorGradient="Left" HeaderGradient="Left" HeaderHeight="30px"
                    SelectedColor="224, 224, 224" Font-Names="Arial" Font-Size="12px" SQL="select * from dgcode where 1=0"
                    Personalize="True" OnOnRenderCell="DataList1_OnRenderCell" BackImageURL="" Connected="False"
                    ConnectionString="" CurrentColumn="" CurrentRow="0" IconCustom="" IconExport=""
                    IconGoFirstPage="" IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage=""
                    IconPages="" IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc=""
                    meta:resourcekey="DataList1Resource1" SortColumn="" SortType="">
                    <Columns>
                        <SmoothEnterpriseWebControl:DataColumn DataType="CheckBox" DataAlign="Center" Width="1%"
                            Required="True" ID="DataList1_chk" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            meta:resourcekey="DataList1_chkResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="IconEdit" DataAlign="Center" Width="1%"
                            ID="DataList1_edit" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            meta:resourcekey="DataList1_editResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="代碼類別" Required="True"
                            DataName="ctype" Sortable="True" ID="DataList1_ctype" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_ctypeResource1"
                            runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="代碼" DataName="code"
                            Sortable="True" ID="DataList1_code" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            meta:resourcekey="DataList1_codeResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="名稱" Required="True"
                            DataName="name" Sortable="True" ID="DataList1_name" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_nameResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="順序" DataName="seq"
                            Sortable="True" ID="DataList1_seq" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            meta:resourcekey="DataList1_seqResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="系統控制" DataAlign="Center"
                            DataName="systemcontrol" Sortable="True" ID="DataList1_systemcontrol" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_systemcontrolResource1"
                            runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="UserDefined" Caption="圖示" DataAlign="Center"
                            DataName="iconurl" ID="DataList1_icon" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            meta:resourcekey="DataList1_iconResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="初始人員"
                            DataName="initname" Sortable="True" ID="DataList1_initname" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_initnameResource1"
                            runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="初始日期"
                            DataName="initdate" Sortable="True" ID="DataList1_initdate" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_initdateResource1"
                            runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_isdefault" runat="server" Caption="預設"
                            DataName="isdefault" DataStyle-BorderStyle="NotSet" DataType="ViewText" HeaderStyle-BorderStyle="NotSet"
                            Sortable="True" DataAlign="Center" DataStyle-CssClass="" HeaderStyle-CssClass="" meta:resourcekey="DataList1_isdefaultResource1">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_enabled" runat="server" Caption="啟用"
                            DataName="enabled" DataStyle-BorderStyle="NotSet" DataType="ViewText" HeaderStyle-BorderStyle="NotSet"
                            Sortable="True" DataAlign="Center" DataStyle-CssClass="" HeaderStyle-CssClass="" meta:resourcekey="DataList1_enabledResource1">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="更新人員" DataName="modifyname"
                            Sortable="True" ID="DataList1_modifyname" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            meta:resourcekey="DataList1_modifynameResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="更新日期" DataName="modifydate"
                            Sortable="True" ID="DataList1_modifydate" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            meta:resourcekey="DataList1_modifydateResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                    </Columns>
                    <NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px"
                        ForeColor="64, 64, 64" BorderColor="Silver" BackColor="224, 224, 224"></NavigatorStyle>
                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="Black" BorderStyle="NotSet">
                    </HeaderStyle>
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
                <SmoothEnterpriseWebControl:InputButton ID="DeleteButton" runat="server" Text="刪除"
                    Width="80px" Gradient-GradientType="Bottom" CssClass="NormalBold" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
                    Font-Size="12px" Font-Bold="True" OnClick="DeleteButton_Click" meta:resourcekey="DeleteButtonResource1"
                    RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
        </tr>
    </table>
</asp:Content>
