<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Flowwork.FlowRelationDelete, App_Web_flowrelationdelete.aspx.cdcab7d2" title="Untitled Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
		<CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table border="0" Class="Normal">
		<tr>
			<td Class="NormalBold">
				<asp:Label ID="LABEL_relationname" runat="server" Text="關聯名稱" meta:resourcekey="LABEL_relationnameResource1"></asp:Label></td>
		</tr>
		<tr>
			<td Class="Normal"><span name="FIELD_name" id="FIELD_name" runat="server"><FONT face="新細明體"></FONT></span></td>
		</tr>
		<tr>
			<td Class="NormalBold">
				<asp:Label ID="LABEL_description" runat="server" Text="描述" meta:resourcekey="LABEL_descriptionResource1"></asp:Label></td>
		</tr>
		<tr>
			<td Class="Normal"><span name="FIELD_description" id="FIELD_description" runat="server"><FONT face="新細明體"></FONT></span></td>
		</tr>
		<tr>
			<td Class="NormalBold">
				<asp:Label ID="LABEL_initname" runat="server" Text="初始人員" meta:resourcekey="LABEL_initnameResource1"></asp:Label></td>
		</tr>
		<tr>
			<td Class="Normal"><span name="FIELD_initname" id="FIELD_initname" runat="server"><FONT face="新細明體"></FONT></span></td>
		</tr>
		<tr>
			<td Class="NormalBold">
				<asp:Label ID="LABEL_initdate" runat="server" Text="初始日期" meta:resourcekey="LABEL_initdateResource1"></asp:Label></td>
		</tr>
		<tr>
			<td Class="Normal"><span name="FIELD_initdate" id="FIELD_initdate" runat="server"><FONT face="新細明體"></FONT></span></td>
		</tr>
		<tr>
			<td Class="NormalBold">
				<asp:Label ID="LABEL_modifyname" runat="server" Text="更新人員" meta:resourcekey="LABEL_modifynameResource1"></asp:Label></td>
		</tr>
		<tr>
			<td Class="Normal"><span name="FIELD_modifyname" id="FIELD_modifyname" runat="server"><FONT face="新細明體"></FONT></span></td>
		</tr>
		<tr>
			<td Class="NormalBold">
				<asp:Label ID="LABEL_modifydate" runat="server" Text="更新日期" meta:resourcekey="LABEL_modifydateResource1"></asp:Label></td>
		</tr>
		<tr>
			<td Class="Normal"><span name="FIELD_modifydate" id="FIELD_modifydate" runat="server"></span></td>
		</tr>
	</table>
	<table border="0" Class="Normal">
		<tr>
			<td>
			</td>
		</tr>
		<tr>
			<td>
				<SmoothEnterpriseWebControl:DataList id="DataList1" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="Gray"
					gridlines="both" borderwidth="1px" borderstyle="Solid" Connected="False" CellPadding="3px" EnableCustom="False"
					EnableExport="False" EnablePrint="False" HeaderHeight="30px" BackColor="#E0E0E0" SQL="select a.*,b.name as uname,c.name as initname from dgflowrelationuser a left join dguser b on a.uid=b.id left join dguser c on a.inituid=c.id where 1=0" BackImageURL="" ConnectionString="Provider=SQLOLEDB.1;Password=sa;Persist Security Info=True;User ID=sa;Initial Catalog=demo2000;Data Source=localhost" CurrentColumn="" CurrentRow="0" IconCustom="" IconExport="" IconGoFirstPage="" IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage="" IconPages="" IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc="" meta:resourcekey="DataList1Resource1" SortColumn="" SortType="">
					<Columns>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="使用者" Required="True" DataName="uname" ID="DataList1_user" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_userResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="初始人員" DataName="initname" ID="DataList1_initname" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_initnameResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="初始日期" DataName="initdate" ID="DataList1_initdate" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_initdateResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
					</Columns>
					<NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px" ForeColor="64, 64, 64"
						BorderColor="Silver" BackColor="224, 224, 224" CssClass=""></NavigatorStyle>
					<HeaderStyle Font-Bold="True" BackColor="Silver" BorderStyle="NotSet" CssClass=""></HeaderStyle>
					<GridLine LineColor="224, 224, 224" LineStyle="Solid" LineMode="Vertical" LineWidth="1px"></GridLine>
                    <SelectStyle BorderStyle="NotSet" CssClass="" />
                    <RowStyle BorderStyle="NotSet" CssClass="" />
                    <HoverStyle BorderStyle="NotSet" CssClass="" />
                    <SelectColumnStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControl:DataList></td>
		</tr>
		<tr>
			<td>
				<TABLE id="Table1" cellSpacing="0" cellPadding="0" border="0">
					<TR>
						<TD>
							<SmoothEnterpriseWebControl:PageJumper id="PageJumper1" runat="server" ShowPageNumber="False" ButtonNextLabel="&gt;" ButtonPrevLabel="&lt;" ButtonType="Button" meta:resourcekey="PageJumper1Resource1">
								<PAGESELECTEDSTYLE BorderColor="Black" BorderWidth="3px" BorderStyle="Solid" BackColor="Silver" CssClass=""></PAGESELECTEDSTYLE>
								<PAGENUMBERSTYLE ForeColor="Black" Width="18px" Font-Names="Arial" Font-Size="10px" BorderColor="Black"
									BorderWidth="1px" BorderStyle="Solid" PaddingSize="4px" CssClass=""></PAGENUMBERSTYLE>
                                <ButtonStyle BorderStyle="NotSet" CssClass="" />
							</SmoothEnterpriseWebControl:PageJumper></TD>
						<TD>
							<SmoothEnterpriseWebControl:inputbutton id="DeleteButton" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
								BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" Gradient-GradientType="Bottom" CssClass="NormalBold"
								Font-Bold="True" Text="刪除" width="80px" meta:resourcekey="DeleteButtonResource1" RunAtCient="False" OnClick="DeleteButton_Click">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                            </SmoothEnterpriseWebControl:inputbutton>&nbsp;</TD>
						<TD>&nbsp;
							<SmoothEnterpriseWebControl:inputbutton id="BackButton" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
								BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" Gradient-GradientType="Bottom" CssClass="NormalBold"
								Font-Bold="True" Text="取消" width="80px" meta:resourcekey="BackButtonResource1" RunAtCient="False" OnClick="BackButton_Click">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                            </SmoothEnterpriseWebControl:inputbutton>&nbsp;</TD>
					</TR>
				</TABLE>
			</td>
		</tr>
	</table>
</asp:Content>
