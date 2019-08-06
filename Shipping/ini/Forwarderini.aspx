<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="Forwarderini.aspx.cs" Inherits="ForwarderData.ForwarderData" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="ForwarderData List Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table border="0">
	    <tr class="NormalBold">
	        
 	 	 	
 	 	 	<td><asp:Label ID="LABEL_ta_oga20" runat="server" CssClass="NormalBold" Text="供應商代號"></asp:Label></td>
 	 	 	<td><asp:Label ID="LABEL_pmc30" runat="server" CssClass="NormalBold" Text="供應商名稱"></asp:Label></td>
	        <td></td>
	    </tr>
	    <tr>
    	    
 	 	 	
 	 	 	<td><SmoothEnterpriseWebControl:InputText id="QUERY_ta_oga20" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
 	 	 	<td><SmoothEnterpriseWebControl:InputText id="QUERY_pmc30" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
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
					  SQL="SELECT * FROM ForwarderData" Personalize="True" OnOnRenderCell="DataList1_OnRenderCell">
					<Columns>
					    
					    <SmoothEnterpriseWebControl:DataColumn ID="DataList1_edit" Width="1%" DataAlign="Center" DataType="IconEdit"></SmoothEnterpriseWebControl:DataColumn>
					    <SmoothEnterpriseWebControl:DataColumn ID="DataList1_ta_oga20" DataType="ViewText" Caption="供應商代號" DataName="ta_oga20"  Required="True" Sortable="True" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmc30" DataType="ViewText" Caption="供應商名稱" DataName="pmc30"  Required="True" Sortable="True" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_account" DataType="ViewText" Caption="供應商帳號" DataName="account"  Required="True" Sortable="True" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_password" DataType="ViewText" Caption="供應商密碼" DataName="password"   Sortable="True" ></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_inituid" DataType="ViewText" Caption="建立者" DataName="innm"  Required="True" Sortable="True" ></SmoothEnterpriseWebControl:DataColumn>
					    <SmoothEnterpriseWebControl:DataColumn ID="DataList1_initdate" DataType="ViewText" Caption="建立時間" DataName="idate"  Required="True" Sortable="True" ></SmoothEnterpriseWebControl:DataColumn>
					    <SmoothEnterpriseWebControl:DataColumn ID="DataList1_modifyuid" DataType="ViewText" Caption="修改者" DataName="monm"  Required="True" Sortable="True" ></SmoothEnterpriseWebControl:DataColumn>
					    <SmoothEnterpriseWebControl:DataColumn ID="DataList1_modifydate" DataType="ViewText" Caption="修改時間" DataName="mdate"  Required="True" Sortable="True" ></SmoothEnterpriseWebControl:DataColumn>
					    	    			    					    
					   					    
					    
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
	        <td>
	            
	        </td>
	    </tr>
	</table>
</asp:Content>