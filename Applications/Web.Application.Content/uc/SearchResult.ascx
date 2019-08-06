<%@ control language="C#" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Content.uc.SearchResult, App_Web_searchresult.ascx.50d77b3" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>

<SmoothEnterpriseWebControl:DATALIST id="DataList1" runat="server" BorderColor="Gray" gridlines="both" borderwidth="1px"
	borderstyle="Solid" EnableExport="False" EnablePrint="False" Font-Names="Arial" Font-Size="12px" HeaderHeight="30px"
	SQL="select * from dgcontent" OnOnRenderCell="DataList1_OnRenderCell" BackImageURL="" CellPadding="3px" Connected="False" ConnectionString="" CurrentColumn="" CurrentRow="0" IconCustom="" IconExport="" IconGoFirstPage="" IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage="" IconPages="" IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc="" meta:resourcekey="DataList1Resource1" SortColumn="" SortType="">
	<Columns>
		<SmoothEnterpriseWebControl:DataColumn DataType="UserDefined" Caption="內容顯示名稱" Width="150px" Required="True" DataName="description"
			ID="DataList1_description" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_descriptionResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
		<SmoothEnterpriseWebControl:DataColumn DataType="UserDefined" Caption="備註說明" Width="300px" Required="True" DataName="remark"
			ID="DataList1_remark" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_remarkResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
		<SmoothEnterpriseWebControl:DataColumn DataType="UserDefined" Caption="連結位址" Width="150px" Required="True" DataName="linkurl"
			ID="DataList1_linkurl" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_linkurlResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
		<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="資料修改時間" Required="True" DataName="modifydate" Sortable="True"
			ID="DataList1_modifydate" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_modifydateResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
	</Columns>
	<NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px" ForeColor="64, 64, 64"
		BorderColor="Silver" BackColor="224, 224, 224" CssClass=""></NavigatorStyle>
	<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="Black" BorderStyle="NotSet" CssClass=""></HeaderStyle>
	<SelectStyle BackColor="LightSteelBlue" BorderStyle="NotSet" CssClass=""></SelectStyle>
	<GridLine LineColor="224, 224, 224" LineStyle="Solid" LineMode="Vertical" LineWidth="1px"></GridLine>
	<HoverStyle BackColor="230, 237, 255" BorderStyle="NotSet" CssClass=""></HoverStyle>
    <RowStyle BorderStyle="NotSet" CssClass="" />
    <SelectColumnStyle BorderStyle="NotSet" CssClass="" />
</SmoothEnterpriseWebControl:DATALIST>
