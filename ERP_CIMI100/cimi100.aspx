<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="cimi100.aspx.cs" Inherits="ERP_CIMI100.cimi100_New" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>

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
		Caption="cimi100_New List Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table border="0">
	    <tr Class="NormalBold">
            <td>
                <asp:Label ID="Label2" runat="server" CssClass="NormalBold" Text="廠區"  meta:resourcekey="Label2Resource1"></asp:Label></td>
            <td>
                <asp:Label ID="Label1" runat="server" CssClass="NormalBold" Text="類型"  meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td>
                <asp:Label ID="LABEL_Status" runat="server" CssClass="NormalBold" Text="單據狀態" meta:resourcekey="LABEL_StatusResource1"></asp:Label></td>
            <td>
                <asp:Label ID="LABEL_no" runat="server" CssClass="NormalBold" Text="No"></asp:Label></td>
            <td>
                <asp:Label ID="Label3" runat="server" CssClass="NormalBold" meta:resourcekey="Label3Resource1"
                    Text="新增日期(起)"></asp:Label></td>
            <td>
                <asp:Label ID="Label4" runat="server" CssClass="NormalBold" meta:resourcekey="Label4Resource1"
                    Text="新增日期(迄)"></asp:Label></td>
            <td>
                <asp:Label ID="LABEL_Add_user" runat="server" CssClass="NormalBold" Text="新增人員"  meta:resourcekey="LABEL_Add_userResource1"></asp:Label></td>
	        <td></td>
	    </tr>
	    <tr>
            <td>
                <asp:DropDownList ID="QUERY_plantid" runat="server" BackColor="LightGray" meta:resourcekey="FIELD_plantidResource1"
                    Width="90px">
                    <asp:ListItem>Filter</asp:ListItem>
                </asp:DropDownList></td>
            <td>
                <asp:DropDownList ID="QUERY_mode" runat="server" Height="25px" meta:resourcekey="QUERY_statusResource1"
                    Style="background-color: #cccccc" Width="90px">
                    <asp:ListItem Text="Filter"></asp:ListItem>
                    <asp:ListItem Value="1" Text="料件新增"></asp:ListItem>
                    <asp:ListItem Value="2" Text="料抛拋轉"></asp:ListItem>
                    <asp:ListItem Value="3">料件變更</asp:ListItem>
                </asp:DropDownList></td>
            <td>
                <asp:DropDownList ID="QUERY_status" runat="server" Height="25px" meta:resourcekey="QUERY_statusResource1"
                    Style="background-color: #cccccc" Width="90px">
                    <asp:ListItem meta:resourcekey="ListItemResource1" Text="Filter"></asp:ListItem>
                    <asp:ListItem meta:resourcekey="ListItemResource2" Value="OK" Text="完成審核"></asp:ListItem>
                    <asp:ListItem meta:resourcekey="ListItemResource3" Value="N" Text="未送審"></asp:ListItem>
                    <asp:ListItem meta:resourcekey="ListItemResource4" Value="Y" Text="送審中"></asp:ListItem>
                    <asp:ListItem meta:resourcekey="ListItemResource5" Value="NO" Text="退回"></asp:ListItem>
                    <asp:ListItem meta:resourcekey="ListItemResource6" Value="V" Text="作廢"></asp:ListItem>
                </asp:DropDownList></td>
            <td>
                <SmoothEnterpriseWebControl:InputText id="QUERY_no" runat="server" CssClass="Normal" BackColor="LightGray" Personalize="True" Width="100px"><ErrorStyle BorderStyle="NotSet" CssClass="" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="QUERY_add_date" runat="server" BackColor="White"
                    CssClass="Normal" ErrorMessage="Please Input「Expect_date」!!" FormatType="Date"
                    MaxLength="0" Width="100px">
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="QUERY_add_date2" runat="server" BackColor="White"
                    CssClass="Normal" ErrorMessage="Please Input「Expect_date」!!" FormatType="Date"
                    MaxLength="0" Width="100px">
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td><SmoothEnterpriseWebControl:InputText id="QUERY_add_user" runat="server" CssClass="Normal" BackColor="LightGray" Personalize="True" Width="100px">
                <ErrorStyle BorderStyle="NotSet" />
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            </SmoothEnterpriseWebControl:InputText></td>
	        <td>
	            <SmoothEnterpriseWebControl:InputButton ID="BUTTON_query" runat="server"  meta:resourcekey="BUTTON_queryResource1" Text="查詢" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_query_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>
	            <SmoothEnterpriseWebControl:InputButton id="BUTTON_add" runat="server"  meta:resourcekey="BUTTON_addResource1" Text="料件建立新增" width="137px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_add_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>&nbsp;
	            <SmoothEnterpriseWebControl:InputButton id="BUTTON_add2" runat="server" Text="料件拋轉新增"  meta:resourcekey="BUTTON_add2Resource1" width="137px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_add2_Click">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;<SmoothEnterpriseWebControl:InputButton id="BUTTON_add3"  meta:resourcekey="BUTTON_add3Resource1" runat="server" Text="料件變更新增" width="137px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_add3_Click">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
	        </td>
	    </tr>
	</table>
	<table border="0" width="100%">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:DataList id="DataList1" runat="server" BorderColor="#000000" RowNumber="True" RowAlign="Middle" 
					NavigatorPos="Bottom" HeaderPos="Top" HeaderAlign="Middle" EnablePrint="True" EnableExport="True" 
					CellPadding="3px" borderwidth="1px" borderstyle="Solid" HeaderHeight="30px"  Font-Names="Arial" Font-Size="12px" 
					  SQL="SELECT * FROM cimi100_main" Personalize="True" OnOnRenderCell="DataList1_OnRenderCell" Width="700px" >
					<Columns>
					    
					    <SmoothEnterpriseWebControl:DataColumn ID="DataList1_edit" Caption="Edit" Width="1%" DataAlign="Center" DataType="UserDefined" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_editResource1" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
					    <SmoothEnterpriseWebControl:DataColumn ID="DataList1_view" Caption="View" Width="1%" DataAlign="Center" DataType="IconView" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_editResource1" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_no" DataType="ViewText" Caption="No" DataName="no"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_class_no" DataType="ViewText"   meta:resourcekey="DataList1_class_noResource1" Caption="類型" DataName="class_no_name"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_plantid" DataType="ViewText"  meta:resourcekey="DataList1_plantidResource1" Caption="廠區" DataName="plantid"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_add_date" DataType="ViewText"  meta:resourcekey="DataList1_add_dateResource1" Caption="新增日期" DataName="add_date"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_add_user" DataType="ViewText"  meta:resourcekey="DataList1_add_userResource1" Caption="新增人員" DataName="add_name"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_DCC" DataType="ViewText"  meta:resourcekey="DataList1_DCCResource1" Caption="文管人員" DataName="DCC_name"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_status" DataType="UserDefined" Width="100px"  meta:resourcekey="DataList1_statusResource1" Caption="單據狀態" DataName="status" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass=""  ></SmoothEnterpriseWebControl:DataColumn>
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