<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="CXMT310.aspx.cs" Inherits="ERP_CXMT310.CXMT310" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="CXMT310 List Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table border="0">
	    <tr Class="NormalBold">
 	 	 	<td><asp:Label ID="LABEL_plantid" runat="server" CssClass="NormalBold" Text="廠區"></asp:Label></td>
	        
 	 	 	<td><asp:Label ID="LABEL_no" runat="server" CssClass="NormalBold" Text="EIP報價單號"></asp:Label></td>
 	 	 	<td><asp:Label ID="LABEL_oqa01" runat="server" CssClass="NormalBold" Text="ERP報價單號"></asp:Label></td>
            <td style="width: 121px; height: 21px">
                <asp:Label ID="LABEL_oga02" runat="server" CssClass="NormalBold" meta:resourcekey="LABEL_oga02Resource1"
                    Text="報價日期(起)"></asp:Label></td>
            <td style="height: 21px">
                <asp:Label ID="Label1" runat="server" CssClass="NormalBold" meta:resourcekey="Label1Resource1"
                    Text="報價日期(迄)"></asp:Label></td>
            <td style="width: 29px; height: 21px">
                <asp:Label ID="LABEL_status" runat="server" CssClass="NormalBold" Text="狀態"></asp:Label></td>
	        <td></td>
	    </tr>
	    <tr>
 	 	 	<td><SmoothEnterpriseWebControl:InputText id="QUERY_plantid" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
    	    
 	 	 	<td><SmoothEnterpriseWebControl:InputText id="QUERY_no" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
 	 	 	<td><SmoothEnterpriseWebControl:InputText id="QUERY_oqa01" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
                   <td style="width: 121px">
                       <SmoothEnterpriseWebControl:InputText ID="QUERY_oqa02" runat="server" BackColor="#F0F0F0"
                           ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                           ErrorMessage="Please Input「SDATE」!!" FocusColor="" FormatType="Date" Height="20px"
                           HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_SDATEResource1"
                           OnClickMore="" Personalize="False" Required="False" Width="100px">
                           <ErrorStyle BorderStyle="NotSet" />
                           <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                       </SmoothEnterpriseWebControl:InputText></td>
                   <td>
                       <SmoothEnterpriseWebControl:InputText ID="QUERY_oqa02_2" runat="server" BackColor="#F0F0F0"
                           ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                           ErrorMessage="Please Input「SDATE」!!" FocusColor="" FormatType="Date" Height="20px"
                           HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_SDATEResource1"
                           OnClickMore="" Personalize="False" Required="False" Width="100px">
                           <ErrorStyle BorderStyle="NotSet" />
                           <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                       </SmoothEnterpriseWebControl:InputText></td>
                   <td style="width: 29px">
                       <asp:DropDownList ID="QUERY_status" runat="server" meta:resourcekey="QUERY_statusResource1"
                           Style="background-color: #cccccc" Width="100px">
                           <asp:ListItem meta:resourcekey="ListItemResource1">Filter</asp:ListItem>
                           <asp:ListItem meta:resourcekey="ListItemResource2" Value="完成審核">完成審核</asp:ListItem>
                           <asp:ListItem meta:resourcekey="ListItemResource3" Value="N">未送審</asp:ListItem>
                           <asp:ListItem meta:resourcekey="ListItemResource4" Value="Y">送審中</asp:ListItem>
                           <asp:ListItem meta:resourcekey="ListItemResource5">退回</asp:ListItem>
                           <asp:ListItem meta:resourcekey="ListItemResource6" Value="V">作廢</asp:ListItem>
                       </asp:DropDownList></td>
	        <td>
	            <SmoothEnterpriseWebControl:InputButton ID="BUTTON_query" runat="server" Text="查詢" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_query_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>
	            
	        </td>
	    </tr>
	</table>
	<table border="0" width="100%">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:DataList id="DataList1" runat="server" BorderColor="#000000" RowNumber="True" RowAlign="Middle" 
					NavigatorPos="Bottom" HeaderPos="Top" HeaderAlign="Middle" EnablePrint="True" EnableExport="True" 
					CellPadding="3px" borderwidth="1px" borderstyle="Solid" HeaderHeight="30px"  Font-Names="Arial" Font-Size="12px" 
					  SQL="select id,no,ver,plantid,l_azp03,oqa01,convert(char, oqa02, 111) oqa02,ta_oqa010,g_name,gem02_0,status from cxmt310_in_head " Personalize="True" OnOnRenderCell="DataList1_OnRenderCell">
					<Columns>
					    
					    <SmoothEnterpriseWebControl:DataColumn ID="DataList1_edit" Caption="修改" Width="1%" DataAlign="Center" DataType="UserDefined" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_editResource1"></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_no" DataType="ViewText" Caption="EIP單號" DataName="no"  Required="True" Sortable="True" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_ver" DataType="ViewText" Caption="版次" DataName="ver"   Sortable="True" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_plantid" DataType="ViewText" Caption="廠區" DataName="plantid"  Required="True" Sortable="True" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_l_azp03" DataType="ViewText" Caption="目的廠" DataName="l_azp03"   Sortable="True" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_oqa01" DataType="ViewText" Caption="ERP單號" DataName="oqa01"  Required="True" Sortable="True" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_oqa02" DataType="ViewText" Caption="日期" DataName="oqa02"   Sortable="True" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_ta_oqa010" DataType="ViewText" Caption="客戶" DataName="ta_oqa010"   Sortable="True" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_gem02_0" DataType="ViewText" Caption="部門" DataName="gem02_0"  Required="True" Sortable="True" ></SmoothEnterpriseWebControl:DataColumn>
					    <SmoothEnterpriseWebControl:DataColumn ID="DataList1_g_name" DataType="ViewText" Caption="申請人員" DataName="g_name"   Sortable="True" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_status" DataType="UserDefined" Caption="狀態" Width="70" DataName="status" Sortable="True" Required="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server"  meta:resourcekey="DataList1_statusResource1" ></SmoothEnterpriseWebControl:DataColumn>
					    <SmoothEnterpriseWebControl:DataColumn ID="DataList1_view" Caption="瀏覽" Width="1%" DataAlign="Center" DataType="IconView" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" meta:resourcekey="DataList1_viewResource1" ></SmoothEnterpriseWebControl:DataColumn>
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