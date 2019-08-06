<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Calendar.MySearch, App_Web_mysearch.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

<%@ Register Src="uc/CalendarNavigator.ascx" TagName="CalendarNavigator" TagPrefix="uc1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<uc1:CalendarNavigator ID="CalendarNavigator1" runat="server" />
	<table border="0">
		<tr Class="NormalBold">
			<td>
                <asp:Label ID="LABEL_daterange" runat="server" Text="日期 時間區間" meta:resourcekey="LABEL_daterangeResource1"></asp:Label></td>
			<td></td>
			<td>
			    <asp:Label ID="LABEL_eventname" runat="server" Text="事件名稱" meta:resourcekey="LABEL_eventnameResource1"></asp:Label></td>
			<td>
			    <asp:Label ID="LABEL_eventdetails" runat="server" Text="事件內容" meta:resourcekey="LABEL_eventdetailsResource1"></asp:Label></td>
		</tr>
		<tr>
			<td>
				<SmoothEnterpriseWebControl:DateRange id="DateRange1" runat="server" cssClass="Normal" DateWidth="110px" ButtonIconUrl="" DateFormat="YYYYMMDD" DateType="Date" meta:resourcekey="DateRange1Resource1" Personalize="False" RangeType="Today" Width="200px">
					<StartDate Text=""></StartDate>
					<EndDate Text=""></EndDate>
				</SmoothEnterpriseWebControl:DateRange>
			</td>
			<td></td>
			<td><SmoothEnterpriseWebControl:InputText id="QUERY_name" runat="server"  CssClass="Normal" BackColor="#F0F0F0"
					Personalize="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_nameResource1" OnClickMore="" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
			<td><SmoothEnterpriseWebControl:InputText id="QUERY_details" runat="server"  CssClass="Normal"
					BackColor="#F0F0F0" Personalize="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_detailsResource1" OnClickMore="" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
			<td><SmoothEnterpriseWebControl:InputButton id="BUTTON_query" runat="server" Text="查詢" width="80px" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" OnClick="BUTTON_query_Click" meta:resourcekey="BUTTON_queryResource1" RunAtCient="False">
                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
            </SmoothEnterpriseWebControl:InputButton></td>
		</tr>
	</table>
	<table border="0" width="100%">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:DataList id="DataList1" runat="server" BorderColor="Black" EnableCustom="True"
					CellPadding="3px" guid="" rows="10" gridlines="both" borderwidth="1px" borderstyle="Solid" NavigatorGradient="Left"
					HeaderGradient="Left" HeaderHeight="30px" SelectedColor="224, 224, 224" Font-Names="Arial" Font-Size="12px"
					SQL="select * from dgcalendardate where 1=0" Personalize="True" Width="736px" OnOnRenderCell="DataList1_OnRenderCell" BackImageURL="" Connected="False" ConnectionString="" CurrentColumn="" CurrentRow="0" IconCustom="" IconExport="" IconGoFirstPage="" IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage="" IconPages="" IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc="" meta:resourcekey="DataList1Resource1" SortColumn="" SortType="">
					<Columns>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="Id" DataName="id" Sortable="True" ID="DataList1_id" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_idResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="開始日期時間" Required="True" DataName="sdate" Sortable="True"
							ID="DataList1_sdate" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_sdateResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="結束日期時間" Required="True" DataName="edate" Sortable="True"
							ID="DataList1_edate" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_edateResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="事件名稱" Required="True" DataName="name" Sortable="True"
							ID="DataList1_name" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_nameResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="類別" DataName="category" Sortable="True" ID="DataList1_category" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_categoryResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="私人事件" DataName="private" Sortable="True"
							ID="DataList1_private" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_privateResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="建立人員" DataName="inituid" Sortable="True"
							ID="DataList1_inituid" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_inituidResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="建立日期" DataName="initdate" Sortable="True"
							ID="DataList1_initdate" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_initdateResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="最近修改人員" DataName="modifyname" Sortable="True" ID="DataList1_modifyuid" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_modifyuidResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="最近修改日期" DataName="modifydate" Sortable="True" ID="DataList1_modifydate" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_modifydateResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
					</Columns>
					<NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px" ForeColor="64, 64, 64"
						BorderColor="Silver" BackColor="224, 224, 224" CssClass=""></NavigatorStyle>
					<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="Black" BorderStyle="NotSet" CssClass=""></HeaderStyle>
					<SelectColumnStyle BackColor="242, 242, 242" BorderStyle="NotSet" CssClass=""></SelectColumnStyle>
					<SelectStyle BackColor="195, 210, 248" BorderStyle="NotSet" CssClass=""></SelectStyle>
					<GridLine LineColor="224, 224, 224" LineStyle="Solid" LineMode="Vertical" LineWidth="1px"></GridLine>
					<HoverStyle BackColor="230, 237, 255" BorderStyle="NotSet" CssClass=""></HoverStyle>
                    <RowStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControl:DataList>
			</td>
		</tr>
	</table>
	<table border="0">
	</table>
</asp:Content>
