<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" codefile="APMI610.aspx.cs" inherits="ERP_APMI610.APMI610" stylesheettheme="Default" culture="Auto" uiculture="Auto" %>

<%@ register assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    namespace="SmoothEnterprise.Web.UI.WebControl" tagprefix="SmoothEnterpriseWebControl" %>
<%@ register assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    namespace="SmoothEnterprise.Web.UI.HTMLControl" tagprefix="SmoothEnterpriseWebControl" %>
<%@ register assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    namespace="SmoothEnterprise.Content.UI.WebControl" tagprefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:content id="Content1" contentplaceholderid="ContentPlaceHolder1" runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="APMI610 List Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table border="0" style="width: 1007px">
	    <tr Class="NormalBold">
	        
 	 	 	<td style="width: 140px; height: 21px"><asp:Label ID="LABEL_pmcsn" runat="server" CssClass="NormalBold" Text="EIP單號"></asp:Label>
                   </td>
 	 	 	<td style="width: 93px; height: 21px"><asp:Label ID="LABEL_pmcano" runat="server" CssClass="NormalBold" Text="申請單號"></asp:Label>
                   </td>
            <td style="width: 93px; height: 21px"><asp:Label ID="lab_plant" runat="server" CssClass="NormalBold" Text="廠區"></asp:Label>
                   </td>
            <td style="width: 150px; height: 21px">
                <asp:Label ID="Label1" runat="server" CssClass="NormalBold" Text="簡稱"></asp:Label>
                </td>
            <td style="width: 206px; height: 21px">
                <asp:Label ID="Label5" runat="server" CssClass="NormalBold" Text="申請人"></asp:Label></td>
            <td style="width: 206px; height: 21px">
                <asp:Label ID="LABEL_oga02" runat="server" CssClass="NormalBold" meta:resourcekey="LABEL_oga02Resource1"
                    Text="申請日期(起)"></asp:Label></td>
            <td style="width: 206px; height: 21px">
                <asp:Label ID="Label4" runat="server" CssClass="NormalBold" meta:resourcekey="Label1Resource1"
                    Text="申請日期(迄)"></asp:Label></td>
            <td style="height: 21px">
                <asp:Label ID="Label3" runat="server" CssClass="NormalBold" Text="單據狀態"></asp:Label></td>
	        <td style="height: 21px"></td>
	    </tr>
	    <tr>
    	    
 	 	 	<td style="width: 140px"><SmoothEnterpriseWebControl:InputText id="QUERY_pmcsn" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True" Width="110px"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                   <ErrorStyle BorderStyle="NotSet" CssClass="" />
               </SmoothEnterpriseWebControl:InputText></td>
 	 	 	<td style="width: 93px"><SmoothEnterpriseWebControl:InputText id="QUERY_pmcano" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True" Width="110px"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                   <ErrorStyle BorderStyle="NotSet" CssClass="" />
               </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 150px">
                <asp:DropDownList ID="ddl_plant" runat="server" CssClass="Normal" Style="background-color: #cccccc" Width="100px">
                           <asp:ListItem value="">Filter</asp:ListItem>
                           <asp:ListItem  Value="MINAIK">MINAIK</asp:ListItem>
                           <asp:ListItem  Value="GIT">君洋</asp:ListItem>
                       </asp:DropDownList></td>
            </td>
                   <td style="width: 150px">
                       <SmoothEnterpriseWebControl:InputText id="QUERY_pmca03" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True" Width="90px">
                           <ErrorStyle BorderStyle="NotSet" CssClass="" />
                           <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                       </SmoothEnterpriseWebControl:InputText>
                   </td>
                   <td style="width: 206px">
                       <SmoothEnterpriseWebControl:InputText id="TxtIniUser" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True" Width="90px">
                           <ErrorStyle BorderStyle="NotSet" />
                           <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                       </SmoothEnterpriseWebControl:InputText></td>
                   <td style="width: 206px">
                       <SmoothEnterpriseWebControl:InputText ID="QUERY_init01" runat="server" BackColor="#F0F0F0"
                           ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                           ErrorMessage="Please Input「SDATE」!!" FocusColor="" FormatType="Date" Height="20px"
                           HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_SDATEResource1"
                           OnClickMore="" Personalize="False" Required="False" Width="100px">
                           <ErrorStyle BorderStyle="NotSet" />
                           <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                       </SmoothEnterpriseWebControl:InputText></td>
                   <td style="width: 206px">
                       <SmoothEnterpriseWebControl:InputText ID="QUERY_init02" runat="server" BackColor="#F0F0F0"
                           ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                           ErrorMessage="Please Input「SDATE」!!" FocusColor="" FormatType="Date" Height="20px"
                           HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_SDATEResource1"
                           OnClickMore="" Personalize="False" Required="False" Width="100px">
                           <ErrorStyle BorderStyle="NotSet" />
                           <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                       </SmoothEnterpriseWebControl:InputText></td>
                   <td>
                       <asp:DropDownList ID="QUERY_status" runat="server" CssClass="Normal" meta:resourcekey="QUERY_statusResource1"
                           Style="background-color: #cccccc" Width="100px">
                           <asp:ListItem meta:resourceKey="ListItemResource1">Filter</asp:ListItem>
                           <asp:ListItem meta:resourceKey="ListItemResource2" Value="C">完成審核</asp:ListItem>
                           <asp:ListItem meta:resourceKey="ListItemResource3" Value="N">未送審</asp:ListItem>
                           <asp:ListItem meta:resourceKey="ListItemResource4" Value="Y">送審中</asp:ListItem>
                           <asp:ListItem meta:resourceKey="ListItemResource5" Value="R">退回</asp:ListItem>
                           <asp:ListItem Value="E">退回ERP</asp:ListItem>
                           <%--<asp:ListItem meta:resourceKey="ListItemResource6" Value="V">作廢</asp:ListItem>--%>
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
					ConnectionType="Custom" SQL="SELECT * FROM APMI610_IN" Personalize="True" OnOnRenderCell="DataList1_OnRenderCell">
					<Columns>
					    
					    <SmoothEnterpriseWebControl:DataColumn ID="DataList1_edit" Width="1%" DataAlign="Center" DataType="IconEdit" Caption="修改/送審" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server"></SmoothEnterpriseWebControl:DataColumn>
					    <SmoothEnterpriseWebControl:DataColumn ID="DataList1_view" Width="1%" DataAlign="Center" DataType="IconView" Caption="審核/瀏覽" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server"></SmoothEnterpriseWebControl:DataColumn>
					    
 	 	 	 	 	    <SmoothEnterpriseWebControl:DataColumn ID="DataList1_PlantID" DataType="ViewText" Caption="PlantID" DataName="PlantID" Visible="False"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="TDataColumn_pmcsn" DataType="ViewText" Caption="EIP單號" DataName="pmcsn"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmcaud15" DataType="ViewText" Caption="日期" DataName="pmcaud15"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmca00" DataType="ViewText" Caption="類別" DataName="pmca00"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmcano" DataType="ViewText" Caption="ERP單號" DataName="pmcano"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmca01" DataType="ViewText" Caption="供應廠商編號" DataName="pmca01"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmca03" DataType="ViewText" Caption="簡稱" DataName="pmca03"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmca17" DataType="ViewText" Caption="付款方式" DataName="pmca17"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmca22" DataType="ViewText" Caption="採購幣別" DataName="pmca22"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmcauser" DataType="ViewText" Caption="申請人" DataName="name"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmcagrup" DataType="ViewText" Caption="申請人部門" DataName="gem02_6"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmcamodu" DataType="ViewText" Caption="Pmcamodu" DataName="pmcamodu" Visible="False"  Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmcadate" DataType="ViewText" Caption="Pmcadate" DataName="pmcadate" Visible="False"  Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="TDataColumn1" runat="server" Caption="申請原因類別"
                            DataStyle-BorderStyle="NotSet" DataType="UserDefined" HeaderStyle-BorderStyle="NotSet">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataColumn2" runat="server" Caption="說明"
                            DataStyle-BorderStyle="NotSet" DataType="ViewText" HeaderStyle-BorderStyle="NotSet" DataName="RRDesc1">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataColumn3" runat="server" Caption="差異否" DataName="Datadiff"
                            DataStyle-BorderStyle="NotSet" DataType="UserDefined" HeaderStyle-BorderStyle="NotSet">
                        </SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColnmApp" DataType="UserDefined" Caption="目前審核者" DataName="name" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_status" DataType="UserDefined" Caption="單據狀態" DataName="status" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
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
</asp:content>
