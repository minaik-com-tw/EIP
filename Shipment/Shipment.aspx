<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="Shipment.aspx.cs" Inherits="Shipment.Shipment" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="NPI出貨及送樣流程" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table border="0">
	    <tr Class="NormalBold">
	        
 	 	 	<td><asp:Label ID="LABEL_No" runat="server" CssClass="NormalBold" Text="No"></asp:Label></td>
 	 	 	<td><asp:Label ID="LABEL_Customer" runat="server" CssClass="NormalBold" Text="Customer"></asp:Label></td>
 	 	 	<td><asp:Label ID="LABEL_Add_user" runat="server" CssClass="NormalBold" Text="User"></asp:Label></td>
            <td style="width: 131px">
                <asp:Label ID="Label1" runat="server" CssClass="NormalBold" Text="Customer PO"></asp:Label></td>
            <td style="width: 131px">
                <asp:Label ID="Label2" runat="server" CssClass="NormalBold" Text="NPI Engineer"></asp:Label></td>
 	 	 	<td><asp:Label ID="LABEL_Status" runat="server" CssClass="NormalBold" Text="System Status"></asp:Label></td>
	        <td></td>
	    </tr>
	    <tr>
    	    
 	 	 	<td><SmoothEnterpriseWebControl:InputText id="QUERY_No" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
 	 	 	<td><SmoothEnterpriseWebControl:InputText id="QUERY_Customer" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
 	 	 	<td><SmoothEnterpriseWebControl:InputText id="QUERY_Add_user" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
                   <td style="width: 131px">
                       <SmoothEnterpriseWebControl:InputText id="QUERY_Customer_PO" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True">
                           <ErrorStyle BorderStyle="NotSet" CssClass="" />
                           <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                       </SmoothEnterpriseWebControl:InputText></td>
                   <td style="width: 131px">
                       <SmoothEnterpriseWebControl:InputText id="QUERY_NPI_Engineer" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True">
                           <ErrorStyle BorderStyle="NotSet" />
                           <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                       </SmoothEnterpriseWebControl:InputText></td>
 	 	 	<td>                <asp:DropDownList ID="QUERY_status" runat="server" 
                    Style="background-color: #cccccc" Width="120px" Height="25px" meta:resourcekey="QUERY_statusResource1">
                    <asp:ListItem meta:resourcekey="ListItemResource1" >Filter</asp:ListItem>
                    <asp:ListItem  Value="OK" meta:resourcekey="ListItemResource2">完成審核</asp:ListItem>
                    <asp:ListItem  Value="N" meta:resourcekey="ListItemResource3">未送審</asp:ListItem>
                    <asp:ListItem  Value="Y" meta:resourcekey="ListItemResource4">送審中</asp:ListItem>
                    <asp:ListItem  Value="NO" meta:resourcekey="ListItemResource5">退回</asp:ListItem>
                    <asp:ListItem  Value="V" meta:resourcekey="ListItemResource6">作廢</asp:ListItem>
                </asp:DropDownList></td>
	        <td>
	            <SmoothEnterpriseWebControl:InputButton ID="BUTTON_query" runat="server" Text="查詢" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_query_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>
	            <SmoothEnterpriseWebControl:InputButton id="BUTTON_add" runat="server" Text="新增" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_add_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>
	        </td>
	    </tr>
	</table>
	<table border="0" width="100%">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:DataList id="DataList1" runat="server" BorderColor="#000000" RowNumber="True" RowAlign="Middle" 
					NavigatorPos="Bottom" HeaderPos="Top" HeaderAlign="Middle" EnablePrint="True" EnableExport="True" 
					CellPadding="3px" borderwidth="1px" borderstyle="Solid" HeaderHeight="30px"  Font-Names="Arial" Font-Size="12px" 
					  SQL="SELECT a.id id,no,ver,plant,erp_po,customer,c_po,CONVERT(varchar(12) , add_date, 111 ) add_date,status,b.name add_user,ISNULL(c.name,b.name) npiengineer
FROM Shipment_head a left join dguser b on a.add_user=b.idleft join (select aid,name from shipment_npiengineer left join dguser on npi_engineer1=id) c on a.id=c.aid" Personalize="True" OnOnRenderCell="DataList1_OnRenderCell" Width="1101px">
					<Columns>
					    
					    <SmoothEnterpriseWebControl:DataColumn ID="DataList1_edit" Caption="Edit/Send" Width="1%" DataAlign="Center" DataType="UserDefined" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_editResource1"></SmoothEnterpriseWebControl:DataColumn>
					    <SmoothEnterpriseWebControl:DataColumn ID="DataList1_view" Caption="View" Width="1%" DataAlign="Center" DataType="IconView" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_viewResource1" HeaderAlign="Center" DataStyle-CssClass="" HeaderStyle-CssClass="" ></SmoothEnterpriseWebControl:DataColumn>
					    <SmoothEnterpriseWebControl:DataColumn ID="DataList1_copy" Caption="Copy" Width="1%" DataAlign="Center" DataType="UserDefined" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_editResource1" HeaderAlign="Center" ></SmoothEnterpriseWebControl:DataColumn>
					    <SmoothEnterpriseWebControl:DataColumn ID="DataList1_Change" Caption="Change" Width="1%" DataAlign="Center" DataType="UserDefined" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_editResource1" HeaderAlign="Center" ></SmoothEnterpriseWebControl:DataColumn>

					    <SmoothEnterpriseWebControl:DataColumn ID="DataList1_Other" Caption="Other" Width="1%" DataAlign="Center" DataType="UserDefined" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_editResource1" HeaderAlign="Center" ></SmoothEnterpriseWebControl:DataColumn>

 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_id" DataType="ViewText" Caption="Id" DataName="id" Visible="False"  Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_No" Width="100px" DataType="ViewText" Caption="No" DataName="No"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_Ver" Width="40px"  DataType="ViewText" Caption="Ver" DataName="Ver"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_plant" DataType="ViewText" Caption="Plant" DataName="plant"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" ></SmoothEnterpriseWebControl:DataColumn>

 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_Customer" DataType="ViewText" Caption="Customer" DataName="Customer"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_C_PO" DataType="ViewText" Caption="Customer PO" DataName="C_PO"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_Component" DataType="ViewText" Caption="Component" DataName="Component"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_Add_user" DataType="ViewText" Caption="User" DataName="username"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_Add_date" DataType="ViewText" Caption="Add date" DataName="Add_date"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_npiengineer" Width="100px" DataType="ViewText" Caption="NPI Engineer" DataName="npiengineer"  Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" ></SmoothEnterpriseWebControl:DataColumn>

 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_status" DataType="UserDefined" Caption="System Status" DataName="status" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_statusResource1"  ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_print" Caption="Print" Width="1%" DataAlign="Center" DataType="UserDefined" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_editResource1" HeaderAlign="Center" ></SmoothEnterpriseWebControl:DataColumn>

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
	    <tr>
	        <td>
	            
	        </td>
	    </tr>
	</table>
</asp:Content>