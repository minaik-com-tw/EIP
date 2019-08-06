<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="ERPFAcc.aspx.cs" Inherits="ERP_FLOW.ERPF" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>

<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="ERPF List Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table border="0">
	    <tr class="NormalBold">
	        
 	 	 	<td><asp:Label ID="LABEL_ERP_NAME" runat="server" CssClass="NormalBold" Text="程式代號" Visible="False"></asp:Label></td>
 	 	 	<td><asp:Label ID="LABEL_DEP_NAME" runat="server" CssClass="NormalBold" Text="部門代號一" Visible="False"></asp:Label></td>
 	 	 	<td style="width: 70px"><asp:Label ID="LABEL_PID" runat="server" CssClass="NormalBold" Text="管理者ID"></asp:Label></td>
	        <td>
                <SmoothEnterpriseWebControlEnterprise:PopupUser id="QUERY_PID" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" DisplayField="name" FormatType="InputCombo" FormatValueField="logonid"
                    Gradient-GradientType="Top" ValueField="id">
                    <gradient gradientbegin="" gradientend="" gradienttype="Top"></gradient>
                    <errorstyle borderstyle="NotSet" cssclass="" />
                </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
            <td style="width: 203px">
	            <SmoothEnterpriseWebControl:InputButton ID="BUTTON_query" runat="server" Text="查詢" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_query_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>
	            <SmoothEnterpriseWebControl:InputButton id="BUTTON_add" runat="server" Text="新增" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_add_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton></td>
	    </tr>
	    <tr>
    	    
 	 	 	<td>
                   <asp:DropDownList ID="DrpList" runat="server" Width="165px" Visible="False">
                   </asp:DropDownList></td>
 	 	 	<td><SmoothEnterpriseWebControl:InputText id="QUERY_DEP_NAME" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True" Visible="False"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                   <ErrorStyle BorderStyle="NotSet" CssClass="" />
               </SmoothEnterpriseWebControl:InputText></td>
 	 	 	<td style="width: 70px">
                   &nbsp;</td>
	        <td>
                &nbsp;
	        </td>
            <td style="width: 203px">
            </td>
	    </tr>
	</table>
	<table border="0" width="100%">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:DataList id="DataList1" runat="server" BorderColor="#000000" RowNumber="True" RowAlign="Middle" 
					NavigatorPos="Bottom" HeaderPos="Top" HeaderAlign="Middle" EnablePrint="True" EnableExport="True" 
					CellPadding="3px" borderwidth="1px" borderstyle="Solid" HeaderHeight="30px"  Font-Names="Arial" Font-Size="12px" 
					ConnectionType="Custom"  Personalize="True" OnOnRenderCell="DataList1_OnRenderCell" Width="835px">
					<Columns>
					    
					    <SmoothEnterpriseWebControl:DataColumn ID="DataList1_edit" Width="1%" DataAlign="Center" DataType="IconEdit" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server"></SmoothEnterpriseWebControl:DataColumn>
					    
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_ERP_NAME" DataType="ViewText" Caption="程式代號" DataName="ERP_NAME"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_DEP_NAME" DataType="ViewText" Caption="部門代號一" DataName="DEP_NAME"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_NO" DataType="ViewText" Caption="類別" DataName="NO"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_PNAME" DataType="ViewText" Caption="管理者姓名" DataName="PNAME"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataColumn1" runat="server" Caption="廠別"
                            DataName="Company" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" DataType="ViewText"
                            HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" Width="80px">
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