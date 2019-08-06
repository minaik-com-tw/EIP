<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Manager.Performancelog, App_Web_performancelog.aspx.cdcab7d2" title="WebForm List Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Application.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
		<CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor> 
	<table border="0">
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_server" runat="server" Text="伺服器" meta:resourcekey="LABEL_serverResource1"></asp:Label></td>
			<td>
			    <asp:Label ID="LABEL_dateinterval" runat="server" Text="時間區間" meta:resourcekey="LABEL_dateintervalResource1"></asp:Label></td>
		</tr>
		<tr Class="NormalBold">
			<td><SmoothEnterpriseWebControl:inputselect id="QUERY_machinename" runat="server" Width="128px"  backcolor="#F0F0F0"
					cssClass="Normal" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_machinenameResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:InputSelect></td>
			<td>
				<SmoothEnterpriseWebControl:DateRange id="QUERY_pdatetime" runat="server" cssClass="Normal" DateType="DateTime" RangeType="None" ButtonIconUrl="" DateFormat="YYYYMMDD" DateWidth="120px" meta:resourcekey="QUERY_pdatetimeResource1" Personalize="False" Width="200px">
                    <EndDate Text="" />
                    <StartDate Text="" />
					
				</SmoothEnterpriseWebControl:DateRange></td>
			<td><SmoothEnterpriseWebControl:inputbutton id="QueryButton" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" Gradient-GradientType="Bottom" CssClass="NormalBold"
					width="80px" Font-Bold="True" Text="更新" OnClick="QueryButton_Click" meta:resourcekey="QueryButtonResource1" RunAtCient="False">
                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
            </SmoothEnterpriseWebControl:inputbutton>
				<SmoothEnterpriseWebControl:InputButton id="RedirectButton" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" Gradient-GradientType="Bottom" cssClass="NormalBold"
					Text="圖形顯示" Font-Bold="True" OnClick="RedirectButton_Click" meta:resourcekey="RedirectButtonResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
		</tr>
	</table>
	<SmoothEnterpriseWebControl:datalist id="DataList1" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="Black"
		SQL="select * from dgperformance where 1=0"
		HeaderHeight="30px" EnableCustom="True" CellPadding="3px"
		borderstyle="Solid" borderwidth="1px" gridlines="both" BackImageURL="" Connected="False" ConnectionString="" CurrentColumn="" CurrentRow="0" IconCustom="" IconExport="" IconGoFirstPage="" IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage="" IconPages="" IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc="" meta:resourcekey="DataList1Resource1" SortColumn="" SortType="">
		<HoverStyle BackColor="230, 237, 255" BorderStyle="NotSet" CssClass=""></HoverStyle>
		<SelectStyle BackColor="195, 210, 248" BorderStyle="NotSet" CssClass=""></SelectStyle>
		<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="Black" BorderStyle="NotSet" CssClass=""></HeaderStyle>
		<GridLine LineColor="224, 224, 224" LineStyle="Solid" LineMode="Vertical" LineWidth="1px"></GridLine>
		<NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px" ForeColor="64, 64, 64"
			BorderColor="Silver" BackColor="224, 224, 224" CssClass=""></NavigatorStyle>
		<SelectColumnStyle BackColor="242, 242, 242" BorderStyle="NotSet" CssClass=""></SelectColumnStyle>
		<Columns>
			<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="伺服器" Required="True" DataName="machinename" ID="DataList1_machinename" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_machinenameResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
			<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="記錄時間" Required="True" DataName="pdatetime" Sortable="True"
				ID="DataList1_pdatetime" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_pdatetimeResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
			<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="CPU 使用率" DataName="cpuusage" Sortable="True" ID="DataList1_cpuusage" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_cpuusageResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
			<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="可使用的記憶體" DataAlign="Right" DataName="availableram"
				Sortable="True" ID="DataList1_availableram" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_availableramResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
			<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="總記憶體" DataName="totalram" ID="DataList1_totalram" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_totalramResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
			<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="Scheduler 使用率" DataName="schedulerusage" Sortable="True"
				ID="DataList1_schedulerusage" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_schedulerusageResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
			<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="備註" DataName="remark" ID="DataList1_remark" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_remarkResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
		</Columns>
        <RowStyle BorderStyle="NotSet" CssClass="" />
	</SmoothEnterpriseWebControl:datalist>
</asp:Content>
