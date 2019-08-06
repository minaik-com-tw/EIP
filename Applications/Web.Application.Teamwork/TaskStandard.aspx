<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Teamwork.TaskStandard, App_Web_taskstandard.aspx.cdcab7d2" theme="Default" %>
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
			<TD id="LABEL_tasktypeid" runat="server">工作類別</TD>
			<td id="LABEL_name" runat="server">名稱</td>
			<td id="LABEL_detail" runat="server">說明</td>
			<td id="LABEL_stdhours" runat="server">標準工時</td>
		</tr>
		<tr>
			<TD>
				<SmoothEnterpriseWebControl:InputSelect id="QUERY_tasktypeid" runat="server"  backcolor="#F0F0F0" cssClass="Normal"
					ItemAllDisplayed="True" ItemAll-Gradient-GradientEnd=" " ItemAll-Gradient-GradientBegin=" " ItemAll-Selected="False"
					ItemAll-RowHeight="18"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:InputSelect></TD>
			<td><SmoothEnterpriseWebControl:InputText id="QUERY_name" runat="server" CssClass="Normal" BackColor="#F0F0F0"
					Personalize="true"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td>
			<td><SmoothEnterpriseWebControl:InputText id="QUERY_detail" runat="server" CssClass="Normal" BackColor="#F0F0F0"
					Personalize="true"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td>
			<td><SmoothEnterpriseWebControl:InputText id="QUERY_stdhours" runat="server" CssClass="Normal"
					BackColor="#F0F0F0" Personalize="true" Width="50px" FormatType="Number"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td>
			<td><SmoothEnterpriseWebControl:InputButton id="BUTTON_query" runat="server" Text="查詢" width="80px" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" OnClick="BUTTON_query_Click"></SmoothEnterpriseWebControl:InputButton></td>
			<td><SmoothEnterpriseWebControl:InputButton id="BUTTON_add" runat="server" Text="新增" width="80px" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" OnClick="BUTTON_add_Click"></SmoothEnterpriseWebControl:InputButton></td>
		</tr>
	</table>
	<table border="0" width="100%">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:DataList id="DataList1" runat="server" BorderColor="#000000" RowNumber="True" RowAlign="Middle"
					NavigatorPos="Bottom" HeaderPos="Top" HeaderAlign="Middle" EnablePrint="True" EnableExport="True" EnableCustom="True"
					CellPadding="3px" guid="" rows="10" gridlines="both" borderwidth="1px" borderstyle="Solid" NavigatorGradient="Left"
					HeaderGradient="Left" HeaderHeight="30px" SelectedColor="224, 224, 224" Font-Names="Arial" Font-Size="12px"
					SQL="select * from dgtaskstandard" Personalize="True" OnOnRenderCell="DataList1_OnRenderCell">
					<Columns>
						<SmoothEnterpriseWebControl:DataColumn DataType="CheckBox" DataAlign="Center" Width="1%" Required="True" ID="DataList1_chk"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="IconEdit" DataAlign="Center" Width="1%" ID="DataList1_edit"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="Id" DataName="id" Sortable="True" ID="DataList1_id"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="工作類別" DataName="tasktypeid_name" Sortable="True" ID="DataList1_tasktypeid"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="名稱" Required="True" DataName="name" Sortable="True"
							ID="DataList1_name"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="說明" Required="True" DataName="detail" Sortable="True"
							ID="DataList1_detail"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="標準工時" Required="True" DataName="stdhours" Sortable="True"
							ID="DataList1_stdhours"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="建立人員" DataName="inituid_name" Sortable="True"
							ID="DataList1_inituid"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="建立時間" DataName="initdate" Sortable="True"
							ID="DataList1_initdate"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="更新人員" DataName="modifyuid_name" Sortable="True"
							ID="DataList1_modifyuid"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="更新時間" DataName="modifydate" Sortable="True"
							ID="DataList1_modifydate"></SmoothEnterpriseWebControl:DataColumn>
					</Columns>
					<NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px" ForeColor="64, 64, 64"
						BorderColor="Silver" BackColor="224, 224, 224"></NavigatorStyle>
					<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="Black"></HeaderStyle>
					<SelectColumnStyle BackColor="242, 242, 242"></SelectColumnStyle>
					<SelectStyle BackColor="195, 210, 248"></SelectStyle>
					<GridLine LineColor="224, 224, 224" LineStyle="Solid" LineMode="Vertical" LineWidth="1px"></GridLine>
					<HoverStyle BackColor="230, 237, 255"></HoverStyle>
				</SmoothEnterpriseWebControl:DataList>
			</td>
		</tr>
	</table>
	<table border="0">
		<tr>
			<td><SmoothEnterpriseWebControl:InputButton id="BUTTON_delete" runat="server" Text="刪除" width="80px" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" OnClick="BUTTON_delete_Click"></SmoothEnterpriseWebControl:InputButton></td>
		</tr>
	</table>
</asp:Content>
