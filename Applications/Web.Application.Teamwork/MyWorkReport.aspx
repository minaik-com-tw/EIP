<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Teamwork.MyWorkReport, App_Web_myworkreport.aspx.cdcab7d2" title="MyWorkReport List Page" theme="Default" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <table border="0">
        <tr Class="NormalBold">
            <td id="LABEL_projid" runat="server">
                專案</td>
            <td id="LABEL_projphaseid" runat="server">
                專案階段</td>
            <td id="LABEL_plandate" runat="server">
                計畫完成時間</td>
            <td id="LABEL_tasktypeid" runat="server">
                工作類別</td>
            <td id="LABEL_priority" runat="server">
                優先順序</td>
            <td id="LABEL_taskstatus" runat="server">
                工作狀態</td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputSelect ID="QUERY_projid" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal"  ItemAll-Value="%" ItemAllDisplayed="True" OnSelectedIndexChanged="QUERY_projid_SelectedIndexChanged">
                    <ErrorStyle BorderStyle="NotSet" />
                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:InputSelect>
            </td>
            <td>
                <SmoothEnterpriseWebControl:InputSelect ID="QUERY_projphaseid" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal"  ItemAll-Value="%" ItemAllDisplayed="True" ItemNoneDisplayed="True">
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:InputSelect>
            </td>
            <td>
                <SmoothEnterpriseWebControl:DateRange ID="QUERY_plandate" runat="server" CssClass="Normal"
                    RangeType="None" Personalize="True">
                    <StartDate Enabled="False" Text="" />
                    <EndDate Enabled="False" Text="" />
                </SmoothEnterpriseWebControl:DateRange>
            </td>
            <td>
                <SmoothEnterpriseWebControl:InputSelect ID="QUERY_tasktypeid" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal"  ItemAll-Value="%" ItemAllDisplayed="True" ItemNoneDisplayed="True">
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:InputSelect>
            </td>
            <td>
                <SmoothEnterpriseWebControl:InputSelect ID="QUERY_priority" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal"  ItemAll-Value="%" ErrorMessage="請輸入「優先順序」!!"
                    Value="3" ItemAllDisplayed="True">
                    <Items>
                        <SmoothEnterpriseWebControl:SelectItem ID="SelectItem1" runat="server" Gradient-GradientBegin=""
                            Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                             Text="最高" Value="1" />
                        <SmoothEnterpriseWebControl:SelectItem ID="SelectItem2" runat="server" Gradient-GradientBegin=""
                            Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                             Text="高" Value="2" />
                        <SmoothEnterpriseWebControl:SelectItem ID="SelectItem3" runat="server" Gradient-GradientBegin=""
                            Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="True"
                             Text="普通" Value="3" />
                        <SmoothEnterpriseWebControl:SelectItem ID="SelectItem4" runat="server" Gradient-GradientBegin=""
                            Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                             Text="低" Value="4" />
                        <SmoothEnterpriseWebControl:SelectItem ID="SelectItem5" runat="server" Gradient-GradientBegin=""
                            Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                             Text="待辦" Value="5" />
                    </Items>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:InputSelect>
            </td>
            <td>
                <SmoothEnterpriseWebControl:InputSelect ID="QUERY_taskstatus" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal"  ItemAll-Value="%" ItemAllDisplayed="True" ItemNoneDisplayed="True">
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:InputSelect>
            </td>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_query" runat="server" Text="查詢"
                    Width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px"
                    CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_query_Click">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
            </td>
        </tr>
    </table>
    <table border="0" width="100%">
        <tr>
            <td style="height: 320px">
                <SmoothEnterpriseWebControl:DataList ID="DataList1" runat="server" BorderColor="#000000"
                    RowNumber="True" RowAlign="Middle" NavigatorPos="Bottom" HeaderPos="Top" HeaderAlign="Middle"
                    EnablePrint="True" EnableExport="True" CellPadding="3px" BorderWidth="1px" BorderStyle="Solid"
                    HeaderHeight="30px" Font-Names="Arial" Font-Size="12px" SQL="SELECT * FROM dgtask"
                    Personalize="True" OnOnRenderCell="DataList1_OnRenderCell">
                    <Columns>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_projid" DataType="ViewText"
                            Caption="專案" DataName="projid_name" Required="True" Sortable="True" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_projphaseid" DataType="ViewText"
                            Caption="專案階段" DataName="projphaseid_name" Required="True" Sortable="True" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_name" DataType="ViewText" Caption="名稱"
                            DataName="name" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_detail" DataType="ViewArea"
                            Caption="工作說明" DataName="detail" Sortable="True" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_uid" DataType="ViewText" Caption="成員"
                            DataName="uid_name" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            runat="server" Visible="False">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_begindate" DataType="ViewText"
                            Caption="開始時間" DataName="begindate" Sortable="True" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_plandate" DataType="ViewText"
                            Caption="計畫完成時間" DataName="plandate" Required="True" Sortable="True" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_enddate" DataType="ViewText"
                            Caption="實際完成時間" DataName="enddate" Sortable="True" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server" Visible="False">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_closedate" DataType="ViewText"
                            Caption="結案時間" DataName="closedate" Sortable="True" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server" Visible="False">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_tasktypeid" DataType="ViewText"
                            Caption="工作類別" DataName="tasktypeid_name" Required="True" Sortable="True" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_remark" DataType="ViewText"
                            Caption="備註" DataName="remark" Sortable="True" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server" Visible="False">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_priority" DataType="ViewText"
                            Caption="優先順序" DataName="priority" Required="True" Sortable="True" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_pid" DataType="ViewText" Caption="父階工作"
                            DataName="pid" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            runat="server" Visible="False">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_planhours" DataType="ViewText"
                            Caption="計畫工作時數" DataName="planhours" Sortable="True" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server" Visible="False">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_workhours" DataType="ViewText"
                            Caption="實際工作時數" DataName="workhours" Sortable="True" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server" Visible="False">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_taskstatus" DataType="ViewText"
                            Caption="工作狀態" DataName="taskstatus_name" Required="True" Sortable="True" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_attachments" DataType="ViewText"
                            Caption="附件" DataName="attachments" Sortable="True" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server" Visible="False">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_inituid" DataType="ViewText"
                            Caption="建立人員" DataName="inituid" Sortable="True" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server" Visible="False">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_initdate" DataType="ViewText"
                            Caption="建立時間" DataName="initdate" Sortable="True" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server" Visible="False">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_modifyuid" DataType="ViewText"
                            Caption="更新人員" DataName="modifyuid" Sortable="True" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server" Visible="False">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_modifydate" DataType="ViewText"
                            Caption="更新時間" DataName="modifydate" Sortable="True" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server" Visible="False">
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
            </td>
        </tr>
    </table>
</asp:Content>
