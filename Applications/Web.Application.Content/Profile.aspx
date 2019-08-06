<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Content.ProfileList, App_Web_profile.aspx.cdcab7d2" title="檔案內容管理維護" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

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
                <asp:Label ID="LABEL_filepath" runat="server" Text="內容目錄" meta:resourcekey="LABEL_filepathResource1"></asp:Label></td>
            <td>
                <asp:Label ID="LABEL_filetype" runat="server" Text="內容類別" meta:resourcekey="LABEL_filetypeResource1"></asp:Label></td>
            <td>
                <asp:Label ID="LABEL_contenttypename" runat="server" Text="內容類型" meta:resourcekey="LABEL_contenttypenameResource1"></asp:Label></td>
            <td>
                <asp:Label ID="LABEL_cstatus" runat="server" Text="內容狀態" meta:resourcekey="LABEL_cstatusResource1"></asp:Label></td>
            <td>
                <asp:Label ID="LABEL_filename" runat="server" Text="內容檔案名稱" meta:resourcekey="LABEL_filenameResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputSelect ID="QUERY_filepath" runat="server" Personalize="True"
                    BackColor="#F0F0F0" CssClass="Normal" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif"
                    Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText=""
                    ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text=""
                    ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False"
                    ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_filepathResource1"
                    Mode="Single" TextBoxStyle="ThreeDStyle" Value="">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" />
                </SmoothEnterpriseWebControl:InputSelect>
            </td>
            <td>
                <SmoothEnterpriseWebControlEnterprise:SelectCode ID="QUERY_filetype" runat="server"
                    Personalize="True" BackColor="#F0F0F0" CssClass="Normal" ItemAllDisplayed="True"
                    TextField="name" CodeType="filetype" ValueField="id" Enabled="False" ButtonClick="True"
                    ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage=""
                    FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18"
                    ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl=""
                    ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical"
                    meta:resourcekey="QUERY_filetypeResource1" Mode="Single" TextBoxStyle="ThreeDStyle"
                    Value="">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" />
                </SmoothEnterpriseWebControlEnterprise:SelectCode>
            </td>
            <td>
                <SmoothEnterpriseWebControl:InputSelect ID="QUERY_ctypeid" runat="server" Personalize="True"
                    BackColor="#F0F0F0" CssClass="Normal" ItemAllDisplayed="True" ButtonClick="True"
                    ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage=""
                    FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18"
                    ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl=""
                    ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical"
                    meta:resourcekey="QUERY_ctypeidResource1" Mode="Single" TextBoxStyle="ThreeDStyle"
                    Value="">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" />
                </SmoothEnterpriseWebControl:InputSelect>
            </td>
            <td>
                <SmoothEnterpriseWebControlEnterprise:SelectCode ID="QUERY_cstatus" runat="server"
                    Personalize="True" BackColor="#F0F0F0" CssClass="Normal" ItemAllDisplayed="True"
                    TextField="name" CodeType="cstatus" ValueField="id" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif"
                    Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText=""
                    ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text=""
                    ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False"
                    ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_cstatusResource1"
                    Mode="Single" TextBoxStyle="ThreeDStyle" Value="">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" />
                </SmoothEnterpriseWebControlEnterprise:SelectCode>
            </td>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="QUERY_filename" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" Personalize="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash"
                    DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False"
                    HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_filenameResource1"
                    OnClickMore="" Required="False">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet"></ErrorStyle>
                </SmoothEnterpriseWebControl:InputText></td>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_query" runat="server" BackColor="#C8C8C8"
                    BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" Font-Size="12px"
                    Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom" Text="查詢"
                    Width="80px" Font-Bold="True" OnClick="BUTTON_query_Click" meta:resourcekey="BUTTON_queryResource1"
                    RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_add" runat="server" BackColor="#C8C8C8"
                    BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" Font-Size="12px"
                    Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom" Text="新增"
                    Width="80px" Font-Bold="True" OnClick="BUTTON_add_Click" meta:resourcekey="BUTTON_addResource1"
                    RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
        </tr>
    </table>
    <table width="100%" border="0">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:DataList ID="DataList1" runat="server" BorderColor="Black"
                    Font-Size="12px" Font-Names="Arial" Personalize="True" SQL="select * from dgcontent"
                    SelectedColor="224, 224, 224" HeaderHeight="30px" HeaderGradient="Left" NavigatorGradient="Left"
                    BorderStyle="Solid" BorderWidth="1px" gridlines="both" rows="10" guid="" CellPadding="3px"
                    EnableCustom="True" OnOnRenderCell="DataList1_OnRenderCell" BackImageURL="" Connected="False"
                    ConnectionString="" CurrentColumn="" CurrentRow="0" IconCustom="" IconExport=""
                    IconGoFirstPage="" IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage=""
                    IconPages="" IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc=""
                    meta:resourcekey="DataList1Resource1" SortColumn="" SortType="">
                    <Columns>
                        <SmoothEnterpriseWebControl:DataColumn DataType="CheckBox" DataAlign="Center" Width="1%"
                            Required="True" ID="DataList1_chk" DataStyle-BorderStyle="NotSet" DataStyle-CssClass=""
                            HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_chkResource1"
                            runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="UserDefined" DataAlign="Center"
                            Width="1%" Required="True" ID="DataList1_authority" DataStyle-BorderStyle="NotSet"
                            DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass=""
                            meta:resourcekey="DataList1_authorityResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="UserDefined" DataAlign="Center"
                            Required="True" ID="DataList1_icon" DataStyle-BorderStyle="NotSet" DataStyle-CssClass=""
                            HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_iconResource1"
                            runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="內容目錄" Width="100px"
                            Required="True" DataName="filepath" Sortable="True" ID="DataList1_filepath" DataStyle-BorderStyle="NotSet"
                            DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass=""
                            meta:resourcekey="DataList1_filepathResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="內容檔案名稱" Width="160px"
                            Required="True" DataName="filename" Sortable="True" ID="DataList1_filename" DataStyle-BorderStyle="NotSet"
                            DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass=""
                            meta:resourcekey="DataList1_filenameResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="內容顯示名稱" DataName="description"
                            Sortable="True" ID="DataList1_description" DataStyle-BorderStyle="NotSet" DataStyle-CssClass=""
                            HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_descriptionResource1"
                            runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="關聯內容" DataName="functionsetfilename"
                            Sortable="True" ID="DataList1_functioncid" DataStyle-BorderStyle="NotSet" DataStyle-CssClass=""
                            HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_functioncidResource1"
                            runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="內容類別"
                            DataName="filetypename" Sortable="True" ID="DataList1_filetype" DataStyle-BorderStyle="NotSet"
                            DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass=""
                            meta:resourcekey="DataList1_filetypeResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="內容類型" Required="True"
                            DataName="contenttypename" Sortable="True" ID="DataList1_ctypeid" DataStyle-BorderStyle="NotSet"
                            DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass=""
                            meta:resourcekey="DataList1_ctypeidResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="內容路徑名稱"
                            DataName="pathname" Sortable="True" ID="DataList1_pathname" DataStyle-BorderStyle="NotSet"
                            DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass=""
                            meta:resourcekey="DataList1_pathnameResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="可瀏覽" DataAlign="Center"
                            DataName="browsable" Sortable="True" ID="DataList1_browsable" DataStyle-BorderStyle="NotSet"
                            DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass=""
                            meta:resourcekey="DataList1_browsableResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="內容狀態" Required="True"
                            DataName="cstatusname" Sortable="True" ID="DataList1_cstatus" DataStyle-BorderStyle="NotSet"
                            DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass=""
                            meta:resourcekey="DataList1_cstatusResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="資料修改時間" DataName="modifydate"
                            Sortable="True" ID="DataList1_modifydate" DataStyle-BorderStyle="NotSet" DataStyle-CssClass=""
                            HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_modifydateResource1"
                            runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="UserDefined" Required="True" ID="DataList1_contentlog"
                            DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet"
                            HeaderStyle-CssClass="" meta:resourcekey="DataList1_contentlogResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="內容分類"
                            DataName="categoryname" Sortable="True" ID="DataList1_catid" DataStyle-BorderStyle="NotSet"
                            DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass=""
                            meta:resourcekey="DataList1_catidResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="所有人皆可讀取"
                            DataAlign="Center" DataName="everyone" Sortable="True" ID="DataList1_everyone"
                            DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet"
                            HeaderStyle-CssClass="" meta:resourcekey="DataList1_everyoneResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="內容編號"
                            DataName="nocode" Sortable="True" ID="DataList1_nocode" DataStyle-BorderStyle="NotSet"
                            DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass=""
                            meta:resourcekey="DataList1_nocodeResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="連結位址"
                            DataName="linkurl" Sortable="True" ID="DataList1_linkurl" DataStyle-BorderStyle="NotSet"
                            DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass=""
                            meta:resourcekey="DataList1_linkurlResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="內容圖示位址"
                            DataName="iconurl" Sortable="True" ID="DataList1_iconurl" DataStyle-BorderStyle="NotSet"
                            DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass=""
                            meta:resourcekey="DataList1_iconurlResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="圖示位址"
                            DataName="imgurl" Sortable="True" ID="DataList1_imgurl" DataStyle-BorderStyle="NotSet"
                            DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass=""
                            meta:resourcekey="DataList1_imgurlResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="顯示執行方式"
                            DataName="viewmode" Sortable="True" ID="DataList1_viewmode" DataStyle-BorderStyle="NotSet"
                            DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass=""
                            meta:resourcekey="DataList1_viewmodeResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="顯示執行位置"
                            DataName="viewtarget" Sortable="True" ID="DataList1_viewtarget" DataStyle-BorderStyle="NotSet"
                            DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass=""
                            meta:resourcekey="DataList1_viewtargetResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="是否顯示內容屬性"
                            DataName="viewprofile" Sortable="True" ID="DataList1_viewprofile" DataStyle-BorderStyle="NotSet"
                            DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass=""
                            meta:resourcekey="DataList1_viewprofileResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="搜尋關鍵值"
                            DataName="keywords" Sortable="True" ID="DataList1_keywords" DataStyle-BorderStyle="NotSet"
                            DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass=""
                            meta:resourcekey="DataList1_keywordsResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="內容生效日期"
                            DataName="effectdate" Sortable="True" ID="DataList1_effectdate" DataStyle-BorderStyle="NotSet"
                            DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass=""
                            meta:resourcekey="DataList1_effectdateResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="內容有效期限"
                            DataName="expiredate" Sortable="True" ID="DataList1_expiredate" DataStyle-BorderStyle="NotSet"
                            DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass=""
                            meta:resourcekey="DataList1_expiredateResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="備註說明"
                            DataName="remark" Sortable="True" ID="DataList1_remark" DataStyle-BorderStyle="NotSet"
                            DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass=""
                            meta:resourcekey="DataList1_remarkResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="授權項目"
                            DataName="authtypename" Sortable="True" ID="DataList1_authtypename" DataStyle-BorderStyle="NotSet"
                            DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass=""
                            meta:resourcekey="DataList1_authtypenameResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="授權角色"
                            DataName="authroles" Sortable="True" ID="DataList1_authroles" DataStyle-BorderStyle="NotSet"
                            DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass=""
                            meta:resourcekey="DataList1_authrolesResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="顯示順序"
                            DataAlign="Right" DataName="seq" Sortable="True" ID="DataList1_seq" DataStyle-BorderStyle="NotSet"
                            DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass=""
                            meta:resourcekey="DataList1_seqResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="UserDefined" Caption="檔案大小"
                            DataAlign="Right" DataName="filesize" ID="DataList1_filesize" DataStyle-BorderStyle="NotSet"
                            DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass=""
                            meta:resourcekey="DataList1_filesizeResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="Grade"
                            DataName="grade" Sortable="True" ID="DataList1_grade" DataStyle-BorderStyle="NotSet"
                            DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass=""
                            meta:resourcekey="DataList1_gradeResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="建立人員"
                            DataName="initusername" Sortable="True" ID="DataList1_inituid" DataStyle-BorderStyle="NotSet"
                            DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass=""
                            meta:resourcekey="DataList1_inituidResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="資料建立時間"
                            DataName="initdate" Sortable="True" ID="DataList1_initdate" DataStyle-BorderStyle="NotSet"
                            DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass=""
                            meta:resourcekey="DataList1_initdateResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="修改人員"
                            DataName="modifyusername" Sortable="True" ID="DataList1_modifyuid" DataStyle-BorderStyle="NotSet"
                            DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass=""
                            meta:resourcekey="DataList1_modifyuidResource1" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                    </Columns>
                    <NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px"
                        ForeColor="64, 64, 64" BorderColor="Silver" BackColor="224, 224, 224" CssClass="">
                    </NavigatorStyle>
                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="Black" BorderStyle="NotSet"
                        CssClass=""></HeaderStyle>
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
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_delete" runat="server" BackColor="#C8C8C8"
                    BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" Font-Size="12px"
                    Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom"
                    Text="刪除" Width="80px" Font-Bold="True" OnClick="BUTTON_delete_Click" meta:resourcekey="BUTTON_deleteResource1"
                    RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
            <td>
                <SmoothEnterpriseWebControl:CheckBoxList ID="CHECK_functioncid" runat="server" Width="300px"
                    Personalize="True" CssClass="Normal" ListDirection="Horizontal" OnSelectedIndexChanged="CHECK_functioncid_SelectedIndexChanged"
                    meta:resourcekey="CHECK_functioncidResource1" Value="">
                    <GroupHeaderStyle Font-Bold="True" GradientEnd="192, 192, 0" ForeColor="White" GradientLevel="100"
                        Gradient="Right" BorderColor="192, 192, 0" BackColor="Gray" BorderStyle="NotSet"
                        CssClass=""></GroupHeaderStyle>
                    <Items>
                        <SmoothEnterpriseWebControl:CheckBoxListItem Selected="False" Text="顯示全部的內容功能集合"
                            Description="" Value="Y" GroupText=""></SmoothEnterpriseWebControl:CheckBoxListItem>
                    </Items>
                    <DescriptionStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:CheckBoxList>
            </td>
        </tr>
    </table>
</asp:Content>
