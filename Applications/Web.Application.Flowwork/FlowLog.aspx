<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Flowwork.FlowLog, App_Web_flowlog.aspx.cdcab7d2" title="Untitled Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
		<CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table border="0">
		<tr Class="NormalBold">
			<TD>
			    <asp:Label ID="LABEL_flowinfo" runat="server" Text="待審資訊" meta:resourcekey="LABEL_flowinfoResource1"></asp:Label></TD>
			<td>
			    <asp:Label ID="LABEL_flowrequestdate" runat="server" Text="提案時間" meta:resourcekey="LABEL_flowrequestdateResource1"></asp:Label></td>
			<td>
			    <asp:Label ID="LABEL_requestname" runat="server" Text="提案人員" meta:resourcekey="LABEL_requestnameResource1"></asp:Label></td>
			<TD>
			    <asp:Label ID="LABEL_reviewname" runat="server" Text="審核人員" meta:resourcekey="LABEL_reviewnameResource1"></asp:Label></TD>
		</tr>
		<tr>
			<TD>
				<SmoothEnterpriseWebControl:inputtext id="QUERY_flow_text" runat="server" BackColor="#F0F0F0" CssClass="Normal" Personalize="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_flow_textResource1" OnClickMore="" Required="False"
					><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:inputtext></TD>
			<td><SmoothEnterpriseWebControl:daterange id="QUERY_flow_date" runat="server" cssClass="Normal" RangeType="None" ButtonIconUrl="" DateFormat="YYYYMMDD" DateType="Date" DateWidth="100px" meta:resourcekey="QUERY_flow_dateResource1" Personalize="False" Width="200px">
                <EndDate Text="" />
                <StartDate Text="" />
            </SmoothEnterpriseWebControl:daterange></td>
			<td><SmoothEnterpriseWebControlEnterprise:POPUPUSER id="QUERY_requestuid" runat="server" BackColor="#F0F0F0" Width="100px" CssClass="Normal"
					 DisplayFieldHidden="True" FormatType="InputCombo" ValueField="id" FormatValueField="name"
					DisplayField="name" Personalize="True" AuthType="" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_requestuidResource1" OnClickMore="" Required="False">
                <Gradient GradientBegin="" GradientEnd="" />
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControlEnterprise:POPUPUSER></td>
			<TD><SmoothEnterpriseWebControlEnterprise:POPUPUSER id="QUERY_revieweruid" runat="server" BackColor="#F0F0F0" Width="100px" CssClass="Normal"
					 DisplayFieldHidden="True" FormatType="InputCombo" ValueField="id" FormatValueField="name"
					DisplayField="name" Personalize="True" AuthType="" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_revieweruidResource1" OnClickMore="" Required="False">
                <Gradient GradientBegin="" GradientEnd="" />
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControlEnterprise:POPUPUSER></TD>
			<TD><SmoothEnterpriseWebControl:inputbutton id="QueryButton" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom"
					Font-Bold="True" width="80px" Text="查詢" OnClick="QueryButton_Click" meta:resourcekey="QueryButtonResource1" RunAtCient="False">
                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
            </SmoothEnterpriseWebControl:inputbutton></TD>
		</tr>
	</table>
	<table width="100%" border="0">
		<tr>
			<td><SmoothEnterpriseWebControl:DATALIST id="DataList1" runat="server" BorderColor="Black" Font-Size="12px" Font-Names="Arial" EnableCustom="True" CellPadding="3px" guid="" rows="10" gridlines="both" borderwidth="1px"
					borderstyle="Solid" NavigatorGradient="Left" HeaderGradient="Left" HeaderHeight="30px" SelectedColor="224, 224, 224"
					SQL="select * from flowlog where 1=0"
					Personalize="True" OnOnRenderCell="DataList1_OnRenderCell" BackImageURL="" Connected="False" ConnectionString="Provider=SQLOLEDB.1;Password=sa;Persist Security Info=True;User ID=sa;Initial Catalog=demo2000;Data Source=localhost" CurrentColumn="" CurrentRow="0" IconCustom="" IconExport="" IconGoFirstPage="" IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage="" IconPages="" IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc="" meta:resourcekey="DataList1Resource1" SortColumn="" SortType="">
					<Columns>
						<SmoothEnterpriseWebControl:DataColumn DataType="CheckBox" DataAlign="Center" Width="1%" Required="True" ID="DataList1_chk" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_chkResource1"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="待審資訊" DataName="text" Sortable="True" ID="DataList1_flowinfo" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_flowinfoResource1"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="提案內容連結" DataName="requesturl" Sortable="True"
							ID="DataList1_requesturl" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_requesturlResource1"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="提案時間" Required="True" DataName="flow_date" Sortable="True"
							ID="DataList1_flowrequestdate" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_flowrequestdateResource1"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="待審天數" DataAlign="Right" DataName="initdate" Sortable="True"
							ID="DataList1_pendingdays" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_pendingdaysResource1"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="提案人員" DataName="requestuid_name" Sortable="True" ID="DataList1_requestname" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_requestnameResource1"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="優先順序" DataName="priority" Sortable="True"
							ID="DataList1_priority" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_priorityResource1"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="建立時間" DataName="initdate" Sortable="True"
							ID="DataList1_initdate" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_initdateResource1"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="建立人員" DataName="inituid_name" Sortable="True"
							ID="DataList1_initname" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_initnameResource1"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="更新人員" DataName="modifyuid_name" Sortable="True"
							ID="DataList1_modifyname" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_modifynameResource1"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="更新時間" DataName="modifydate" Sortable="True"
							ID="DataList1_modifydate" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_modifydateResource1"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="UserDefined" DataAlign="Center" Width="15px" ID="DataList1_popupflowview" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_popupflowviewResource1">
							<Template>
								<asp:Image id="IB_popupflowview" runat="server" ImageUrl="/lib/img/icon-zoom.gif" meta:resourcekey="IB_popupflowviewResource1"></asp:Image>
							</Template>
						</SmoothEnterpriseWebControl:DataColumn>
					</Columns>
					<NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px" ForeColor="64, 64, 64"
						BorderColor="Silver" BackColor="224, 224, 224"></NavigatorStyle>
					<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="Black" BorderStyle="NotSet"></HeaderStyle>
					<SelectColumnStyle BackColor="242, 242, 242" BorderStyle="NotSet"></SelectColumnStyle>
					<SelectStyle BackColor="195, 210, 248" BorderStyle="NotSet"></SelectStyle>
					<GridLine LineColor="224, 224, 224" LineStyle="Solid" LineMode="Vertical" LineWidth="1px"></GridLine>
					<HoverStyle BackColor="230, 237, 255" BorderStyle="NotSet"></HoverStyle>
                <RowStyle BorderStyle="NotSet" />
				</SmoothEnterpriseWebControl:DATALIST></td>
		</tr>
	</table>
	<table border="0">
		<tr>
			<td><SmoothEnterpriseWebControl:inputbutton id="DeleteButton" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom"
					Font-Bold="True" width="80px" Text="刪除" OnClick="DeleteButton_Click" meta:resourcekey="DeleteButtonResource1" RunAtCient="False">
                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
            </SmoothEnterpriseWebControl:inputbutton></td>
		</tr>
	</table>
</asp:Content>