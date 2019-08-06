<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Flowwork.MyFlowReviewer, App_Web_myflowreviewer.aspx.cdcab7d2" stylesheettheme="Default" culture="Auto" uiculture="Auto" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server"
        Details="The desciption for this program" Caption="MyFlowReviewer List Page"
        Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px"
        IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
        <CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet">
        </DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <table border="0">
        <tr class="NormalBold">
            <td>
                <asp:Label ID="LABEL_text" runat="server" CssClass="NormalBold" Text="流程資訊" meta:resourcekey="LABEL_textResource1"></asp:Label></td>
            <td>
                <asp:Label ID="LABEL_fid" runat="server" CssClass="NormalBold" Text="審核流程" meta:resourcekey="LABEL_fidResource1"></asp:Label></td>
            <td>
                <asp:Label ID="LABEL_yearly" runat="server" CssClass="NormalBold" Text="年度" meta:resourcekey="LABEL_yearlyResource1"></asp:Label></td>
            <td>
                <asp:Label ID="LABEL_reviwstatus" runat="server" CssClass="NormalBold" Text="審核狀態"
                    meta:resourcekey="LABEL_reviwstatusResource1"></asp:Label></td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="QUERY_text" runat="server" CssClass="Normal"
                    BackColor="#F0F0F0" Personalize="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash"
                    DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False"
                    HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_textResource1" OnClickMore=""
                    Required="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td>
                <SmoothEnterpriseWebControl:InputSelect ID="QUERY_fid" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18"
                    ItemAll-Selected="False" ItemAll-Text="" ItemAllDisplayed="True" ButtonClick="True"
                    ButtonIconUrl="" Editable="False" EnabledHTC="True" ErrorMessage="" FadeSpeed="NoFade"
                    IsValid="True" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18"
                    ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_fidResource1"
                    Mode="Single" TextBoxStyle="ThreeDStyle" Value="" Personalize="True">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputSelect>
            </td>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="QUERY_yearly" runat="server" CssClass="Normal"
                    BackColor="#F0F0F0" Personalize="True" ToolTip="以 ',' 區隔 ( ex. 2005,2007 )" ButtonClick="True"
                    ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor=""
                    FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_yearlyResource1"
                    OnClickMore="" Required="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td>
                <SmoothEnterpriseWebControl:InputSelect ID="QUERY_reviewstatus" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" ItemAllDisplayed="True" Personalize="True">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <Items>
                        <SmoothEnterpriseWebControl:SelectItem ID="QUERY_reviewstatus_SelectItem1" runat="server"
                            Gradient-GradientBegin="" Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18"
                            Selected="False" Style="filter: ;" Text="待審核" Value="Pending" meta:resourcekey="QUERY_reviewstatus_SelectItem1Resource1" />
                        <SmoothEnterpriseWebControl:SelectItem ID="QUERY_reviewstatus_SelectItem2" runat="server"
                            Gradient-GradientBegin="" Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18"
                            Selected="False" Style="filter: ;" Text="已審核" Value="Review" meta:resourcekey="QUERY_reviewstatus_SelectItem2Resource1" />
                        <SmoothEnterpriseWebControl:SelectItem ID="QUERY_reviewstatus_SelectItem3" runat="server"
                            Gradient-GradientBegin="" Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18"
                            Selected="False" Style="filter: ;" Text="流程結束" Value="Finished" meta:resourcekey="QUERY_reviewstatus_SelectItem3Resource1" />
                    </Items>
                    <ErrorStyle BorderStyle="NotSet" />
                </SmoothEnterpriseWebControl:InputSelect>
            </td>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_query" runat="server" Text="查詢"
                    Width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px"
                    CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_query_Click"
                    meta:resourcekey="BUTTON_queryResource1" RunAtCient="False">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
            </td>
        </tr>
    </table>
    <table border="0" width="100%">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:DataList ID="DataList1" runat="server" BorderColor="Black"
                    CellPadding="3px" BorderWidth="1px" BorderStyle="Solid" HeaderHeight="30px" Font-Names="Arial"
                    Font-Size="12px" SQL="SELECT * FROM dgflowqueue" Personalize="True" OnOnRenderCell="DataList1_OnRenderCell"
                    BackImageURL="" Connected="False" ConnectionString="Provider=SQLOLEDB.1;Password=sa;Persist Security Info=True;User ID=sa;Initial Catalog=Smooth2005;Data Source=localhost"
                    CurrentColumn="" CurrentRow="0" IconCustom="" IconExport="" IconGoFirstPage=""
                    IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage="" IconPages=""
                    IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc="" meta:resourcekey="DataList1Resource1"
                    SortColumn="" SortType="" OnOnRenderRow="DataList1_OnRenderRow">
                    <Columns>
                        <SmoothEnterpriseWebControl:DataColumn Caption="多筆審核"
                            DataType="UserDefined" ID="DataList1_multiapproval" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" DataAlign="Left" CssClass="Normal" meta:resourcekey="DataList1_multiapprovalResource1"
                            runat="server" Required="True">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Caption="審核" DataType="UserDefined" ID="DataList1_edit"
                            DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" Width="1%" DataAlign="Center"
                            meta:resourcekey="DataList1_editResource1" runat="server" Required="True">
                            <Template>
                                &nbsp;<asp:ImageButton ID="ImageButton1" ImageUrl ="/lib/img/icon-edit.gif" runat="server" OnClick="ImageButton1_Click" />
                                <SmoothEnterpriseWebControl:InputText ID="fnkey" runat="server" BackColor="#F0F0F0"
                                    ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                                    ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="True" HTMLMode="Advance"
                                    IsValid="True" meta:resourcekey="fnkeyResource1" OnClickMore="" Personalize="False"
                                    Required="False">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                </SmoothEnterpriseWebControl:InputText>
                                <SmoothEnterpriseWebControl:InputText ID="fnview" runat="server" BackColor="#F0F0F0"
                                    ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                                    ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="True" HTMLMode="Advance"
                                    IsValid="True" meta:resourcekey="fnviewResource1" OnClickMore="" Personalize="False"
                                    Required="False">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                </SmoothEnterpriseWebControl:InputText>
                            </Template>
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_text" DataType="ViewText" Caption="流程資訊"
                            DataName="text" Required="True" Sortable="True" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_textResource1" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_fid" DataType="ViewText" Caption="審核流程"
                            DataName="fid_name" Required="True" Sortable="True" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_fidResource1" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_fnid" DataType="ViewText" Caption="審核節點"
                            DataName="fnid_text" Visible="False" Sortable="True" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_fnidResource1" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_requestuid" DataType="ViewText"
                            Caption="提案人員" DataName="requestuid_name" Sortable="True" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_requestuidResource1"
                            runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_requesturl" DataType="ViewText"
                            Caption="提案表單" DataName="requesturl" Visible="False" Sortable="True" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_requesturlResource1"
                            runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_initdate" DataType="ViewText" Caption="提案時間"
                            DataName="initdate" Sortable="True" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_initdateResource1" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_revieweruid" DataType="ViewText"
                            Caption="審核人員" DataName="revieweruid_name" Sortable="True" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_revieweruidResource1"
                            runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_reviewerurl" DataType="ViewText"
                            Caption="審核表單" DataName="reviewerurl" Visible="False" Sortable="True" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_reviewerurlResource1"
                            runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_receivedate" DataType="ViewText"
                            Caption="接收時間" DataName="receivedate" Visible="False" Sortable="True" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_receivedateResource1"
                            runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="">
                        </SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="待審天數" DataAlign="Right" DataName="pendingdays" Sortable="True"
							ID="DataList1_pendingdays" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_pendingdaysResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_reviewdate" DataType="ViewText"
                            Caption="審核時間" DataName="reviewdate" Sortable="True" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_reviewdateResource1"
                            runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_reviewresult" DataType="ViewText"
                            Caption="回覆" DataName="reviewresult" Sortable="True" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_reviewresultResource1"
                            runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_resulttype" DataType="ViewText"
                            Caption="回覆類別" DataName="resulttype" Visible="False" Sortable="True" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_resulttypeResource1"
                            runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_priority" DataType="ViewText"
                            Caption="優先順序" DataName="priority" Sortable="True" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" Visible="False" meta:resourcekey="DataList1_priorityResource1"
                            runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="">
                        </SmoothEnterpriseWebControl:DataColumn>

                        <SmoothEnterpriseWebControl:DataColumn Caption="檢視流程" DataType="UserDefined" ID="DataList1_view"
                            DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            DataAlign="Center" meta:resourcekey="DataList1_viewResource1"
                            runat="server">
                            <Template>
                                <asp:Image ID="IB_popupflowview" runat="server" ImageUrl="~/lib/img/icon-zoom.gif"
                                    meta:resourcekey="IB_popupflowviewResource1"></asp:Image>
                            </Template>
                        </SmoothEnterpriseWebControl:DataColumn>
                    </Columns>
                    <NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px"
                        ForeColor="64, 64, 64" BorderColor="Silver" BackColor="224, 224, 224" CssClass=""></NavigatorStyle>
                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="Black" BorderStyle="NotSet" CssClass="">
                    </HeaderStyle>
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
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_MultiApprovel" runat="server" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold"
                    Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_MultiApprovel_Click" RunAtCient="False" Text="審核" meta:resourcekey="BUTTON_MultiApprovelResource1">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
                <SmoothEnterpriseWebControl:InputText ID="MultiApprovel_Count" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" HiddenMode="True">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText>
                </td>
        </tr>
    </table>
</asp:Content>
