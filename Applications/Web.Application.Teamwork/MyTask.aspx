<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" culture="auto" uiculture="auto" inherits="SmoothEnterprise.Web.Application.Teamwork.MyTask, App_Web_mytask.aspx.cdcab7d2" theme="Default" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Application.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
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
            <TD id="LABEL_projid" runat="server">專案</TD>
			<TD id="LABEL_projphaseid" runat="server">專案階段</TD>
			<TD id="LABEL_uid" runat="server">成員</TD>
            <td id="LABEL_name" runat="server">
                名稱</td>
            <td id="LABEL_taskstatus" runat="server">
                工作狀態</td>
        </tr>
        <tr>
        <TD>
				<SmoothEnterpriseWebControl:InputSelect id="QUERY_projid" runat="server"  backcolor="#F0F0F0" cssClass="Normal"
					ErrorMessage="Please Select「Project」!!" Personalize="True" ItemAllDisplayed="True" ItemAll-Gradient-GradientEnd=" "
					ItemAll-Gradient-GradientBegin=" " ItemAll-Selected="False" ItemAll-RowHeight="18" ItemAll-GroupText="" ItemAll-IconUrl="" Value="" ItemAll-Text="%" ItemAll-Value="%"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                    <Items>
                    <SmoothEnterpriseWebControl:SelectItem  ID="QUERY_projid_itemnone" Text="- Private -" Value="" />
                    </Items>
                </SmoothEnterpriseWebControl:InputSelect></TD>
			<TD>
				<SmoothEnterpriseWebControlEnterprise:SelectCode id="QUERY_projphaseid" runat="server"  ItemAllDisplayed="True" Personalize="True"
					cssClass="Normal" backcolor="#F0F0F0" ValueField="id" TextField="name" CodeType="projphase" ItemAll-RowHeight="18"
					ItemAll-Selected="False" ItemAll-Gradient-GradientBegin=" " ItemAll-Gradient-GradientEnd=" " ButtonIconUrl="" ItemAll-GroupText="" ItemAll-IconUrl="" Value="" ItemAll-Text="%" ItemAll-Value="%"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" />
                     <Items>
                    <SmoothEnterpriseWebControl:SelectItem  ID="QUERY_projphaseid_itemnone" Text="- Private -" Value="" />
                    </Items>
                </SmoothEnterpriseWebControlEnterprise:SelectCode></TD>
			<TD>
                <SmoothEnterpriseWebControlEnterprise:PopupUser id="QUERY_uid" runat="server" BackColor="#F0F0F0" CssClass="Normal" Gradient-GradientType="Top"
					Required="False" ErrorMessage="Please Select「Member」!!" FormatType="InputCombo" DisplayField="name" FormatValueField="logonid"
					ValueField="id" Personalize="True" DisplayFieldHidden="True" Width="100px"></SmoothEnterpriseWebControlEnterprise:PopupUser></TD>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="QUERY_name" runat="server" CssClass="Normal"
                    BackColor="#F0F0F0" Personalize="true">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td>
                <SmoothEnterpriseWebControlEnterprise:SelectCode ID="QUERY_taskstatus" runat="server"
                    Personalize="True" ItemAllDisplayed="True" CssClass="Normal" BackColor="#F0F0F0"
                    CodeType="taskstatus" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Gradient-GradientBegin=" "
                    ItemAll-Gradient-GradientEnd=" " ItemNoneDisplayed="True" ItemAll-Value="%" ItemAll-Text="%">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                </SmoothEnterpriseWebControlEnterprise:SelectCode>
            </td>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_query" runat="server" Text="查詢"
                    Width="80px" Gradient-GradientType="Bottom" CssClass="NormalBold" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
                    Font-Size="12px" Font-Bold="True" OnClick="BUTTON_query_Click">
                </SmoothEnterpriseWebControl:InputButton></td>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_add" runat="server" Text="新增"
                    Width="80px" Gradient-GradientType="Bottom" CssClass="NormalBold" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
                    Font-Size="12px" Font-Bold="True" OnClick="BUTTON_add_Click">
                </SmoothEnterpriseWebControl:InputButton></td>
        </tr>
    </table>
    <table border="0" width="100%">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:DataList ID="DataList1" runat="server" BorderColor="#000000"
                    RowNumber="True" RowAlign="Middle" NavigatorPos="Bottom" HeaderPos="Top" HeaderAlign="Middle"
                    EnablePrint="True" EnableExport="True" EnableCustom="True" CellPadding="3px"
                    guid="" rows="10" gridlines="both" BorderWidth="1px" BorderStyle="Solid" NavigatorGradient="Left"
                    HeaderGradient="Left" HeaderHeight="30px" SelectedColor="224, 224, 224" Font-Names="Arial"
                    Font-Size="12px" SQL="select * from dgtask" Personalize="True" OnOnRenderCell="DataList1_OnRenderCell">
                    <Columns>
                        <SmoothEnterpriseWebControl:DataColumn DataType="CheckBox" DataAlign="Center" Width="1%"
                            Required="True" ID="DataList1_chk" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="IconEdit" DataAlign="Center" Width="1%"
                            ID="DataList1_edit" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="Id"
                            DataName="id" Sortable="True" ID="DataList1_id" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="專案"
                            DataName="projid_name" Sortable="True" ID="DataList1_projid" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server" Required="True">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="專案階段" DataName="projphaseid_name"
                            Sortable="True" ID="DataList1_projphaseid" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            runat="server" Required="True">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="成員"
                            DataName="uid_name" Sortable="True" ID="DataList1_uid" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server" Required="True">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="名稱" Required="True"
                            DataName="name" Sortable="True" ID="DataList1_name" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="工作說明"
                            DataName="detail" Sortable="True" ID="DataList1_detail" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="備註"
                            DataName="remark" Sortable="True" ID="DataList1_remark" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="開始時間" DataName="begindate"
                            Sortable="True" ID="DataList1_begindate" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="計畫完成時間" Required="True"
                            DataName="plandate" Sortable="True" ID="DataList1_plandate" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="計畫工作時數"
                            DataName="planhours" Sortable="True" ID="DataList1_planhours" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="實際完成時間"
                            DataName="enddate" Sortable="True" ID="DataList1_enddate" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="實際工作時數"
                            DataName="workhours" Sortable="True" ID="DataList1_workhours" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="結案時間"
                            DataName="closedate" Sortable="True" ID="DataList1_closedate" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="工作類別" DataName="tasktypeid_name"
                            Sortable="True" ID="DataList1_tasktypeid" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            runat="server" Visible="False">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="父階工作項目" DataName="pid"
                            Sortable="True" ID="DataList1_pid" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            runat="server" Visible="False">
                        </SmoothEnterpriseWebControl:DataColumn>
                        
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="工作狀態" Required="True"
                            DataName="taskstatus_name" Sortable="True" ID="DataList1_taskstatus" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="建立人員"
                            DataName="inituid_name" Sortable="True" ID="DataList1_inituid" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="建立時間"
                            DataName="initdate" Sortable="True" ID="DataList1_initdate" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="更新人員"
                            DataName="modifyuid_name" Sortable="True" ID="DataList1_modifyuid" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="更新時間"
                            DataName="modifydate" Sortable="True" ID="DataList1_modifydate" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_attachments" runat="server"
                            Caption="附件" DataStyle-BorderStyle="NotSet" DataType="UserDefined"
                            HeaderStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-CssClass="">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="IconView" DataAlign="Center" Width="1%"
                            ID="DataList1_view" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            runat="server">
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
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_delete" runat="server" Text="刪除"
                    Width="80px" Gradient-GradientType="Bottom" CssClass="NormalBold" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
                    Font-Size="12px" Font-Bold="True" OnClick="BUTTON_delete_Click">
                </SmoothEnterpriseWebControl:InputButton></td>
        </tr>
    </table>
</asp:Content>
