<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="EngineeringTest.aspx.cs" Inherits="EngineeringTest.EngineeringTest" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>

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
		Caption="EngineeringTest List Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table border="0">
	    <tr Class="NormalBold">
	        
 	 	 	<td style="height: 19px"><asp:Label ID="no" runat="server" CssClass="NormalBold" Text="試作單號"></asp:Label></td>
 	 	 	<td style="height: 19px"><asp:Label ID="LABEL_cima01" runat="server" CssClass="NormalBold" Text="成品料號"></asp:Label></td>
 	 	 	<td style="height: 19px"><asp:Label ID="LABEL_makes_no" runat="server" CssClass="NormalBold" Text="製令編號"></asp:Label></td>
            <td style="width: 78px; height: 19px">
                <asp:Label ID="Label21" runat="server" CssClass="NormalBold" Text="料號客戶別"></asp:Label></td>
 	 	 	<td style="height: 19px; width: 107px;"><asp:Label ID="LABEL_add_user" runat="server" CssClass="NormalBold" Text="新增人員"></asp:Label></td><td style="height: 19px">
                   <asp:Label ID="LABEL_add_date" runat="server" CssClass="NormalBold" Text="新增日期起"></asp:Label></td>
 	 	 	<td style="height: 19px"><asp:Label ID="Label1" runat="server" CssClass="NormalBold" Text="新增日期迄"></asp:Label></td>
 	 	 	<td style="height: 19px"><asp:Label ID="LABEL_status" runat="server" CssClass="NormalBold" Text="狀態"></asp:Label></td>
	        <td style="height: 19px"></td>
	    </tr>
	    <tr>
    	    
 	 	 	<td><SmoothEnterpriseWebControl:InputText id="QUERY_no" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True" Width="90px"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                   <ErrorStyle BorderStyle="NotSet" CssClass="" />
               </SmoothEnterpriseWebControl:InputText></td>
 	 	 	<td><SmoothEnterpriseWebControl:InputText id="QUERY_cima01" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
 	 	 	<td><SmoothEnterpriseWebControl:InputText id="QUERY_makes_no" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True" Width="90px"><ErrorStyle BorderStyle="NotSet" />
                   <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
               </SmoothEnterpriseWebControl:InputText></td>
                   <td style="width: 78px">
                       <SmoothEnterpriseWebControl:InputText id="QUERY_ccima01" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True" Width="90px">
                           <ErrorStyle BorderStyle="NotSet" CssClass="" />
                           <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                       </SmoothEnterpriseWebControl:InputText></td>
 	 	 	<td style="width: 107px">
                   <SmoothEnterpriseWebControlEnterprise:PopupUser id="QUERY_add_user" runat="server"
                       AuthType="" BackColor="#E0E0E0" ButtonClick="True" ButtonIconUrl="" CssClass="Normal"
                       DateSeparator="Slash" DateType="YYYYMMDD" DisplayField="name" DisplayFieldHidden="True"
                       ErrorMessage="" FocusColor="" FormatType="InputCombo" FormatValueField="name"
                       HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_deputyuidResource1"
                       OnClickMore="OpenShowModalDialog();" Personalize="True" Required="False" ValueField="id"
                       Width="100px">
                       <gradient gradientbegin="" gradientend=""></gradient>
                       <errorstyle borderstyle="NotSet" CssClass="" />
                   </SmoothEnterpriseWebControlEnterprise:PopupUser></td><td>
                       <SmoothEnterpriseWebControl:InputText ID="QUERY_add_date" runat="server" BackColor="White"
                           CssClass="Normal" ErrorMessage="Please Input「Expect_date」!!" FormatType="Date"
                           MaxLength="0">
                           <ErrorStyle BorderStyle="NotSet" CssClass="" />
                           <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                       </SmoothEnterpriseWebControl:InputText></td>
                   <td>
                       <SmoothEnterpriseWebControl:InputText ID="QUERY_add_date2" runat="server" BackColor="White"
                           CssClass="Normal" ErrorMessage="Please Input「Expect_date」!!" FormatType="Date"
                           MaxLength="0">
                           <ErrorStyle BorderStyle="NotSet" CssClass="" />
                           <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                       </SmoothEnterpriseWebControl:InputText></td>
 	 	 	<td>
                   <asp:DropDownList ID="QUERY_status" runat="server" meta:resourcekey="QUERY_statusResource1"
                       Style="background-color: #cccccc" Width="100px">
                       <asp:ListItem meta:resourceKey="ListItemResource1">Filter</asp:ListItem>
                       <asp:ListItem meta:resourceKey="ListItemResource2" Value="完成審核">完成審核</asp:ListItem>
                       <asp:ListItem meta:resourceKey="ListItemResource3" Value="N">未送審</asp:ListItem>
                       <asp:ListItem meta:resourceKey="ListItemResource4" Value="Y">送審中</asp:ListItem>
                       <asp:ListItem meta:resourceKey="ListItemResource5">退回</asp:ListItem>
                       <asp:ListItem meta:resourceKey="ListItemResource6" Value="V">作廢</asp:ListItem>
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
					  SQL="select a.id,no,plantid,
                            CASE (rd_level)  WHEN '1' THEN '工程試作'  WHEN '2' THEN '小量生產'  else rd_level  END rd_level
                            ,cima01,cima02,oduction_amount,convert(char, add_date, 111) add_date,
                            name add_user,convert(char, expect_date, 111) expect_date,makes_no,
                            CASE (status )  WHEN 'Y' THEN '送審中'  WHEN 'N' THEN '未送審'  else status  END status 
                            from EngineeringTest_head a left join dguser b on a.add_user=b.id" Personalize="True" OnOnRenderCell="DataList1_OnRenderCell" Height="322px" Width="100%">
					<Columns>
					    
					    <SmoothEnterpriseWebControl:DataColumn ID="DataList1_edit" Width="1%" DataAlign="Center" DataType="UserDefined" Caption="修改" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server"></SmoothEnterpriseWebControl:DataColumn>
					    
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_id" DataType="ViewText" Caption="Id" DataName="id" Visible="False"  Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_no" DataType="ViewText" Caption="試作單號" DataName="no"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_plantid" DataType="ViewText" Caption="廠區" DataName="plantid"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_rd_level" DataType="ViewText" Caption="研發階段" DataName="rd_level"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_cima01" DataType="ViewText" Caption="成品料號" DataName="cima01"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_cima02" DataType="ViewText" Caption="品名" DataName="cima02"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_oduction_amount" DataType="ViewText" Caption="生產數量" DataName="oduction_amount"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn2" DataType="ViewText" Caption="預定生產日期" DataName="try_date"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_expect_date" DataType="ViewText" Caption="預計完成日" DataName="expect_date"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_makes_no" DataType="UserDefined" Caption="製令號碼" DataName="makes_no"  Required="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" Width="10%" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_add_user" DataType="ViewText" Caption="申請人" DataName="add_user"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_add_date" DataType="ViewText" Caption="新增日期" DataName="add_date"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" Width="70px" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_status" DataType="UserDefined" Caption="狀態" DataName="status"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" Width="70px" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_print" Width="1%" DataAlign="Center" DataType="UserDefined" Caption="列印" DataName="print" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server"></SmoothEnterpriseWebControl:DataColumn>
					    <SmoothEnterpriseWebControl:DataColumn ID="DataList1_view" Width="1%" DataAlign="Center" DataType="IconView" Caption="瀏覽" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server"></SmoothEnterpriseWebControl:DataColumn>
					    
					    
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