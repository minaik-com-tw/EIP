<%@ page language="C#" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Content.AuthtypeSet, App_Web_authtypeset.aspx.cdcab7d2" title="變更授權項目" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Application.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>      
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<html>
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <base target="_self"/>
</head>
<body style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0">
    <form id="form1" runat="server">
<table cellSpacing="0" cellPadding="6" border="0">
	<tr>
		<td>
				<table border="0">
					<tr>
						<td>
							<SmoothEnterpriseWebControl:DataList id="DataList1" runat="server" BorderColor="Gray" Font-Size="12px" Font-Names="Arial"
								gridlines="both" borderwidth="1px" borderstyle="Solid" Connected="False" HeaderHeight="30px" EnableCustom="False"
								EnableExport="False" EnablePrint="False" NavigatorPos="None" RowNumber="False" SQL="select * from dgcontent" OnOnRenderCell="DataList1_OnRenderCell" BackImageURL="" CellPadding="3px" ConnectionString="" CurrentColumn="" CurrentRow="0" IconCustom="" IconExport="" IconGoFirstPage="" IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage="" IconPages="" IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc="" meta:resourcekey="DataList1Resource1" SortColumn="" SortType="">
								<Columns>
									<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="內容檔案名稱" DataName="filename" ID="DataList1_filename" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_filenameResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
								</Columns>
								<NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px" ForeColor="64, 64, 64"
									BorderColor="Silver" BackColor="224, 224, 224" CssClass=""></NavigatorStyle>
								<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="Black" BorderStyle="NotSet" CssClass=""></HeaderStyle>
								<SelectStyle BackColor="LightSteelBlue" BorderStyle="NotSet" CssClass=""></SelectStyle>
								<GridLine LineColor="224, 224, 224" LineStyle="Solid" LineMode="Vertical" LineWidth="1px"></GridLine>
								<HoverStyle BackColor="230, 237, 255" BorderStyle="NotSet" CssClass=""></HoverStyle>
                                <SelectColumnStyle BorderStyle="NotSet" CssClass="" />
                                <RowStyle BorderStyle="NotSet" CssClass="" />
							</SmoothEnterpriseWebControl:DataList></td>
					</tr>
					<tr>
						<td>
							<SmoothEnterpriseWebControl:InputButton id="BUTTON_save" runat="server" BorderColor="#606060" Font-Bold="True" Font-Size="12px"
								Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px" BackColor="#C8C8C8" cssClass="NormalBold" Width="80px"
								Text="儲存" RunAtCient="False" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_saveResource1">
								<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
							</SmoothEnterpriseWebControl:InputButton>&nbsp;
							<SmoothEnterpriseWebControl:InputButton id="BUTTON_close" runat="server" BorderColor="#606060" Font-Bold="True" Font-Size="12px"
								Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px" BackColor="#C8C8C8" cssClass="NormalBold" RunAtCient="True"
								Width="80px" Text="關閉" meta:resourcekey="BUTTON_closeResource1">
								<Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
							</SmoothEnterpriseWebControl:InputButton>&nbsp;
							<SmoothEnterpriseWebControl:InputText id="FIELD_authvalue" runat="server" BackColor="#F0F0F0" CssClass="Normal" 
								HiddenMode="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_authvalueResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
				</table>
		</td>
	</tr>
</table>
</form>
