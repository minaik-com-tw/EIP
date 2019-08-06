<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Manager.SyncData, App_Web_syncdata.aspx.cdcab7d2" title="WebForm Edit Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
			<td vAlign="top"><asp:Label ID="LABEL_dataform" runat="server" Text="資料表" meta:resourcekey="LABEL_dataformResource1"></asp:Label></td>
			<td><SmoothEnterpriseWebControl:inputselect id="QUERY_tables" runat="server"  cssClass="Normal" backcolor="#F0F0F0"
					ItemAll-Value="%" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_tablesResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:InputSelect></td>
			<td vAlign="top"><SmoothEnterpriseWebControl:inputbutton id="QueryButton" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold" Font-Bold="True" Gradient-GradientType="Bottom"
					width="80px" Text="比對資料" OnClick="QueryButton_Click" meta:resourcekey="QueryButtonResource1" RunAtCient="False">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControl:inputbutton></td>
		</tr>
	</table>
	<table width="100%" border="0">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:DataList id="DataList1" runat="server" BackColor="WhiteSmoke" BorderColor="SteelBlue" Font-Size="12px"
					Font-Names="Arial" ForeColor="SteelBlue" CellPadding="2px" gridlines="both" borderwidth="1px" borderstyle="Solid"
					EnableCustom="True" NavigatorHeight="8px" BackImageURL="" Connected="False" ConnectionString="" CurrentColumn="" CurrentRow="0" IconCustom="" IconExport="" IconGoFirstPage="" IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage="" IconPages="" IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc="" meta:resourcekey="DataList1Resource1" SortColumn="" SortType="">
					<HoverStyle ForeColor="AliceBlue" GradientLevel="110" GradientBegin="SteelBlue" BackColor="SteelBlue" BorderStyle="NotSet" CssClass=""></HoverStyle>
					<SelectStyle Gradient="Left" GradientBegin="LightSteelBlue" BackColor="LightSteelBlue" BorderStyle="NotSet" CssClass=""></SelectStyle>
					<HeaderStyle Font-Bold="True" GradientEnd="AliceBlue" ForeColor="Azure" Gradient="Left" BorderColor="Azure"
						GradientBegin="SteelBlue" BackColor="SteelBlue" BorderStyle="NotSet" CssClass=""></HeaderStyle>
					<GridLine LineColor="Lavender" LineStyle="Solid" LineMode="Horizontal"></GridLine>
					<NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="None" ForeColor="SteelBlue" BorderColor="SteelBlue"
						BackColor="Lavender" CssClass=""></NavigatorStyle>
					<SelectColumnStyle BackColor="LightSteelBlue" BorderStyle="NotSet" CssClass=""></SelectColumnStyle>
                    <RowStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControl:DataList></td>
		</tr>
	</table>
	<table border="0">
	</table>
	<SmoothEnterpriseWebControl:inputbutton id="SyncButton" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
		BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold" Font-Bold="True" Gradient-GradientType="Bottom"
		width="80px" Text="開始同步" OnClick="SyncButton_Click" meta:resourcekey="SyncButtonResource1" RunAtCient="False">
		<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
	</SmoothEnterpriseWebControl:inputbutton>
</asp:Content>