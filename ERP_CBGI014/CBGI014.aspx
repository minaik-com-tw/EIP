<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="CBGI014.aspx.cs" Inherits="ERP_CBGI014.CBGI014" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="CBGI014 List Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table border="0" style="width: 990px">
	    <tr class="NormalBold">
	        
 	 	 	<td><asp:Label ID="LABEL_PlantId" runat="server" CssClass="NormalBold" Text="廠別"></asp:Label></td>
 	 	 	<td><asp:Label ID="LABEL_tc_cba00" runat="server" CssClass="NormalBold" Text="預算代號"></asp:Label></td>
 	 	 	<td><asp:Label ID="LABEL_gem02_0" runat="server" CssClass="NormalBold" Text="部門名稱"></asp:Label></td>
 	 	 	<td><asp:Label ID="LABEL_sn" runat="server" CssClass="NormalBold" Text="單號"></asp:Label></td>
            <td>
                <asp:Label ID="Label1" runat="server" CssClass="NormalBold" Text="類別"></asp:Label></td>
 	 	 	<td><asp:Label ID="LABEL_Status" runat="server" CssClass="NormalBold" Text="單據狀態"></asp:Label></td>
	        <td></td>
	    </tr>
	    <tr>
    	    
 	 	 	<td style="height: 25px"><SmoothEnterpriseWebControl:InputText id="QUERY_PlantId" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
 	 	 	<td style="height: 25px"><SmoothEnterpriseWebControl:InputText id="QUERY_tc_cba00" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
 	 	 	<td style="height: 25px"><SmoothEnterpriseWebControl:InputText id="QUERY_gem02_0" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
 	 	 	<td style="height: 25px"><SmoothEnterpriseWebControl:InputText id="QUERY_sn" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
                   <td style="height: 25px">
                       <asp:DropDownList ID="ListType" runat="server" CssClass="Normal" meta:resourcekey="QUERY_statusResource1"
                       Style="background-color: #cccccc" Width="100px">
                           <asp:ListItem meta:resourceKey="ListItemResource1">Filter</asp:ListItem>
                           <asp:ListItem meta:resourceKey="ListItemResource2" Value="1">1:電腦軟硬體</asp:ListItem>
                           <asp:ListItem meta:resourceKey="ListItemResource3" Value="2">2:非電腦軟硬體</asp:ListItem>
                       </asp:DropDownList></td>
 	 	 	<td style="height: 25px">
                   <asp:DropDownList ID="QUERY_status" runat="server" CssClass="Normal" meta:resourcekey="QUERY_statusResource1"
                       Style="background-color: #cccccc" Width="100px">
                       <asp:ListItem meta:resourceKey="ListItemResource1">Filter</asp:ListItem>
                       <asp:ListItem meta:resourceKey="ListItemResource2" Value="C">完成審核</asp:ListItem>
                       <asp:ListItem meta:resourceKey="ListItemResource3" Value="N">未送審</asp:ListItem>
                       <asp:ListItem meta:resourceKey="ListItemResource4" Value="Y">送審中</asp:ListItem>
                       <asp:ListItem meta:resourceKey="ListItemResource5" Value="T">退回EIP</asp:ListItem>
                       <asp:ListItem Value="E">退回ERP</asp:ListItem>
                       <asp:ListItem meta:resourceKey="ListItemResource6" Value="V">作廢</asp:ListItem>
                   </asp:DropDownList></td>
	        <td style="height: 25px">
	            <SmoothEnterpriseWebControl:InputButton ID="BUTTON_query" runat="server" Text="查詢" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_query_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>&nbsp;
                <SmoothEnterpriseWebControl:InputButton ID="InputButton1" runat="server" Text="查詢(ALL)" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="InputButton1_Click">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
	    </tr>
	</table>
	<table border="0" width="100%">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:DataList id="DataList1" runat="server" BorderColor="#000000" RowNumber="True" RowAlign="Middle" 
					NavigatorPos="Bottom" HeaderPos="Top" HeaderAlign="Middle" EnablePrint="True" EnableExport="True" 
					CellPadding="3px" borderwidth="1px" borderstyle="Solid" HeaderHeight="30px"  Font-Names="Arial" Font-Size="12px" 
					ConnectionType="Custom" SQL="SELECT * FROM CBGI014_Head" Personalize="True" OnOnRenderCell="DataList1_OnRenderCell" Width="1116px" Height="337px">
					<Columns>
					    
					    <SmoothEnterpriseWebControl:DataColumn ID="DataList1_edit" Width="1%" DataAlign="Center" DataType="UserDefined" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" Caption="審核"></SmoothEnterpriseWebControl:DataColumn>
					    <SmoothEnterpriseWebControl:DataColumn ID="DataList1_view" Width="1%" DataAlign="Center" DataType="IconView" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" Caption="瀏覽"></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_sn" DataType="ViewText" Caption="單號" DataName="sn"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_inidate" DataType="ViewText" Caption="建單日期" DataName="inidate"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
					    
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_PlantId" DataType="ViewText" Caption="廠別" DataName="PlantId"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_tc_cba00" DataType="ViewText" Caption="預算代號" DataName="tc_cba00"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_tc_cba01" DataType="ViewText" Caption="部門代號" DataName="tc_cba01"  Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_gem02_0" DataType="ViewText" Caption="部門名稱" DataName="gem02_0"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_tc_cba02" DataType="ViewText" Caption="預算分類" DataName="tc_cba02"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_tc_cbauser" DataType="ViewText" Caption="Tc_cbauser" DataName="tc_cbauser" Visible="False"  Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_tc_cbagrup" DataType="ViewText" Caption="Tc_cbagrup" DataName="tc_cbagrup" Visible="False"  Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_gen02_1" DataType="ViewText" Caption="需求者" DataName="gen02_1"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_ver" DataType="ViewText" Caption="版本" DataName="ver"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
					<SmoothEnterpriseWebControl:DataColumn ID="DataColnm" DataType="UserDefined" Caption="目前審核者" DataName="name" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_Status" DataType="UserDefined" Caption="單據狀態" DataName="Status"  Required="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
					
					
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