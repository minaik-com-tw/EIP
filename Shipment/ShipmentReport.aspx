<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="ShipmentReport.aspx.cs" Inherits="Shipment.ShipmentReport" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>
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
 	 	 	<td><asp:Label ID="LABEL_Customer" runat="server" CssClass="NormalBold" Text="Partno"></asp:Label></td>
 	 	 	<td><asp:Label ID="LABEL_Add_user" runat="server" CssClass="NormalBold" Text="Applicant"></asp:Label></td>
            <td style="width: 217px">
                <asp:Label ID="Label1" runat="server" CssClass="NormalBold" Text="MA commitment date revise (ETD)"></asp:Label></td>
            <td style="width: 135px">
                <asp:Label ID="Label2" runat="server" CssClass="NormalBold" Text="Customer PO"></asp:Label></td>
            <td style="width: 135px">
                <asp:Label ID="Label3" runat="server" CssClass="NormalBold" Text="NPI Engineer"></asp:Label></td>
 	 	 	<td><asp:Label ID="LABEL_Status" runat="server" CssClass="NormalBold" Text="Status"></asp:Label></td>
	        <td></td>
	    </tr>
	    <tr>
    	    
 	 	 	<td style="height: 43px"><SmoothEnterpriseWebControl:InputText id="QUERY_No" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
 	 	 	<td style="height: 43px"><SmoothEnterpriseWebControl:InputText id="QUERY_Partno" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                   <ErrorStyle BorderStyle="NotSet" CssClass="" />
               </SmoothEnterpriseWebControl:InputText></td>
 	 	 	<td style="height: 43px"><SmoothEnterpriseWebControl:InputText id="QUERY_Add_user" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
                   <td style="width: 217px; height: 43px">
                       <SmoothEnterpriseWebControl:InputText ID="QUERY_c_demand2a" runat="server" BackColor="#F0F0F0"
                           CssClass="Normal" FormatType="Date" Height="19px" Width="86px">
                           <ErrorStyle BorderStyle="NotSet" />
                           <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                       </SmoothEnterpriseWebControl:InputText><span style="font-size: 10pt">~<SmoothEnterpriseWebControl:InputText
                           ID="QUERY_c_demand2b" runat="server" BackColor="#F0F0F0" CssClass="Normal" FormatType="Date"
                           Height="19px" Width="84px">
                           <ErrorStyle BorderStyle="NotSet" CssClass="" />
                           <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                       </SmoothEnterpriseWebControl:InputText></span></td>
                   <td style="width: 135px; height: 43px">
                       <SmoothEnterpriseWebControl:InputText id="QUERY_customer_po" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True">
                           <ErrorStyle BorderStyle="NotSet" CssClass="" />
                           <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                       </SmoothEnterpriseWebControl:InputText></td>
                   <td style="width: 135px; height: 43px">
                       <SmoothEnterpriseWebControl:InputText ID="QUERY_NPI_Engineer" runat="server" BackColor="#F0F0F0"
                           CssClass="Normal" Personalize="True">
                           <ErrorStyle BorderStyle="NotSet" />
                           <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                       </SmoothEnterpriseWebControl:InputText></td>
 	 	 	<td style="height: 43px">                <asp:DropDownList ID="QUERY_status" runat="server" 
                    Style="background-color: #cccccc" Width="120px" Height="25px" meta:resourcekey="QUERY_statusResource1">
                    <asp:ListItem meta:resourcekey="ListItemResource1" >Filter</asp:ListItem>
                    <asp:ListItem  Value="OK" meta:resourcekey="ListItemResource2">完成審核</asp:ListItem>
                    <asp:ListItem  Value="N" meta:resourcekey="ListItemResource3">未送審</asp:ListItem>
                    <asp:ListItem  Value="Y" meta:resourcekey="ListItemResource4">送審中</asp:ListItem>
                    <asp:ListItem  Value="NO" meta:resourcekey="ListItemResource5">退回</asp:ListItem>
                    <asp:ListItem  Value="V" meta:resourcekey="ListItemResource6">作廢</asp:ListItem>
                </asp:DropDownList></td>
	        <td style="height: 43px">
	            <SmoothEnterpriseWebControl:InputButton ID="BUTTON_query" runat="server" Text="查詢" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_query_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>&nbsp;
	        </td>
	    </tr>
	</table>
	<table border="0" width="100%">
		<tr>
			<td style="width: 100%">
				<SmoothEnterpriseWebControl:DataList id="DataList1" runat="server" BorderColor="#000000" RowNumber="True" RowAlign="Middle" 
					NavigatorPos="Bottom" HeaderPos="Top" HeaderAlign="Middle" EnablePrint="True" EnableExport="True" 
					CellPadding="3px" borderwidth="1px" borderstyle="Solid" HeaderHeight="30px"  Font-Names="Arial" Font-Size="12px" 
					  SQL="select a.id id, a.No no, a.Ver ver,Plant,item, ERP_PO, Customer, C_PO, Purpose2, loc, name,CONVERT(char, Add_date, 111) Add_date,c.name cname, case Status when 'N' then '未送審' when 'Y' then '送審中' when 'OK' then '完成審核' else '退回' end flow_status, Component, DWG, Partno, Material, LCaption shipment_type, LV, HV, Qty, CONVERT(char, C_demand, 111) C_demand, CONVERT(char, C_demand2, 111) C_demand2, CONVERT(char, ETD, 111) ETD, Potential_P, Paper, Packing, B_no, Shipment_status, case when CONVERT(char, getdate(), 111)=CONVERT(char, C_demand, 111) then 'On-time' when CONVERT(char, C_demand2, 111)> CONVERT(char, C_demand, 111) then 'Delay' else 'In-Progress' end systemstatus , DATEDIFF (day,CONVERT(datetime,etd),CONVERT(datetime,getdate())) delay,npiname,lab_no,EngineeringTest No from shipment_head a left join Shipment_body b on a.id=b.aid left join dguser c on a.add_user=c.id left join NPI_Base_file d on b.Shipment_type=d.lid left join (SELECT aid,name npiname FROM Shipment_NPIEngineer left join dguser on npi_engineer1=id) e on a.id=e.aid " Personalize="True" OnOnRenderCell="DataList1_OnRenderCell" Width="100%">
					<Columns>
					    
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn1" DataType="ViewText" Caption="No" DataName="No"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn2" DataType="ViewText" Caption="Ver" DataName="Ver"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn3" DataType="ViewText" Caption="Plant" DataName="Plant"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn4" DataType="ViewText" Caption="Item" DataName="Item"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn5" DataType="ViewText" Caption="ERP_PO" DataName="ERP_PO"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn6" DataType="ViewText" Caption="Customer" DataName="Customer"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn7" DataType="ViewText" Caption="Customer_PO" DataName="C_PO"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn9" DataType="ViewText" Width="150px" Caption="LOC" DataName="loc"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn10" DataType="ViewText" Caption="Applicant" DataName="cname"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn11" DataType="ViewText" Caption="Add date" DataName="Add_date"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn12" DataType="ViewText" Caption="Flow Status" DataName="Flow_Status"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn13" DataType="ViewText" Caption="Component" DataName="Component"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn14" DataType="ViewText" Caption="DWG" DataName="DWG"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn15" DataType="ViewText" Caption="Partno" DataName="Partno"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn16" DataType="ViewText" Caption="Material" DataName="Material"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn17" DataType="ViewText" Caption="Shipment type" DataName="shipment_type"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn18" DataType="ViewText" Caption="LV" DataName="LV"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn19" DataType="ViewText" Caption="HV" DataName="HV"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn8" DataType="ViewText" Caption="Qty" DataName="Qty"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>

 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn28" DataType="ViewText" Caption="MA commitment date(ETD)" Width="65px" DataName="C_demand"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn29" DataType="ViewText" Caption="MA commitment date revise (ETD)" Width="65px" DataName="C_demand2"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn30" DataType="ViewText" Caption="Actual shipment date" DataName="ETD"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>

 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn20" DataType="ViewText" Caption="Potential_P" DataName="Potential_P"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn21" DataType="UserDefined" Caption="Paper" DataName="Paper"   DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn22" DataType="ViewText" Caption="Packing" DataName="Packing"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn23" DataType="ViewText" Caption="Bill of lading NO." DataName="B_no"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="Lab_NO" DataType="UserDefined" Width="150px" Caption="Lab no" DataName="lab_no"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn32" DataType="UserDefined" Caption="EngineeringTest No" DataName="EngineeringTest_No"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>

 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn24" DataType="ViewText" Caption="Approval Status" DataName="Shipment_status"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn25" DataType="ViewText" Caption="System status" DataName="systemstatus"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn26" DataType="ViewText" Caption="Delay" DataName="delay"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn27" DataType="ViewText" Caption="NPI_Engineer" DataName="npiname"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn33" DataType="ViewText" Caption="Purpose" DataName="purpose2"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn34" DataType="ViewText" Caption="BARCODE No." DataName="shipmentfile"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>


					</Columns>
					<NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px" ForeColor="64, 64, 64"
						BorderColor="Silver" BackColor="224, 224, 224"></NavigatorStyle>
					<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="Black" BorderStyle="NotSet"></HeaderStyle>
					<SelectColumnStyle BackColor="242, 242, 242" BorderStyle="NotSet"></SelectColumnStyle>
					<SelectStyle BackColor="195, 210, 248" BorderStyle="NotSet"></SelectStyle>
					<GridLine LineColor="224, 224, 224" LineStyle="Solid" LineMode="Vertical" LineWidth="1px"></GridLine>
					<HoverStyle BackColor="230, 237, 255" BorderStyle="NotSet"></HoverStyle>
                    <RowStyle BorderStyle="NotSet" />
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