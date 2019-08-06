<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="AXMT610.aspx.cs" Inherits="ERP_AXMT610.AXMT610" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="AXMT610 List Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
		<CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table border="0">
	    <tr Class="NormalBold">
	        
 	 	 	<td style="height: 21px"><asp:Label ID="LABEL_no" runat="server" CssClass="NormalBold" Text="信用放行單號" meta:resourcekey="LABEL_noResource1"></asp:Label></td>
 	 	 	<td style="height: 21px"><asp:Label ID="LABEL_plantid" runat="server" CssClass="NormalBold" Text="廠區" meta:resourcekey="LABEL_plantidResource1"></asp:Label></td>
            <td style="height: 21px">
                <asp:Label ID="Label3" runat="server" CssClass="NormalBold" meta:resourcekey="LABEL_plantid2Resource1"
                    Text="目的廠區"></asp:Label></td>
 	 	 	<td style="height: 21px"><asp:Label ID="LABEL_oga01" runat="server" CssClass="NormalBold" Text="出通單號" meta:resourcekey="LABEL_oga01Resource1"></asp:Label></td>
            <td style="width: 119px; height: 21px">
                <asp:Label ID="Label4" runat="server" CssClass="NormalBold" meta:resourcekey="Label4_Resource1"
                    Text="部門"></asp:Label></td>
            <td style="height: 21px">
                <asp:Label ID="Label2" runat="server" CssClass="NormalBold" meta:resourcekey="Label2Resource1"
                    Text="客戶"></asp:Label></td>
 	 	 	<td style="width: 121px; height: 21px"><asp:Label ID="LABEL_oga02" runat="server" CssClass="NormalBold" Text="出通日期(起)" meta:resourcekey="LABEL_oga02Resource1"></asp:Label></td>
            <td style="height: 21px">
                <asp:Label ID="Label1" runat="server" CssClass="NormalBold" Text="出通日期(迄)" meta:resourcekey="Label1Resource1"></asp:Label></td>
 	 	 	<td style="width: 29px; height: 21px"><asp:Label ID="LABEL_status" runat="server" CssClass="NormalBold" Text="狀態" meta:resourcekey="LABEL_statusResource1"></asp:Label></td>
	        <td style="height: 21px"></td>
	    </tr>
	    <tr>
    	    
 	 	 	<td><SmoothEnterpriseWebControl:InputText id="QUERY_no" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_noResource1" OnClickMore="" Required="False"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                   <ErrorStyle BorderStyle="NotSet" CssClass="" />
               </SmoothEnterpriseWebControl:InputText></td>
 	 	 	<td><SmoothEnterpriseWebControl:InputText id="QUERY_plantid" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_plantidResource1" OnClickMore="" Required="False" Width="90px"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                   <ErrorStyle BorderStyle="NotSet" />
               </SmoothEnterpriseWebControl:InputText></td>
                   <td>
                       <SmoothEnterpriseWebControl:InputText id="QUERY_plantid2" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_plantidResource1" OnClickMore="" Required="False" Width="90px">
                           <ErrorStyle BorderStyle="NotSet" CssClass="" />
                           <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                       </SmoothEnterpriseWebControl:InputText></td>
 	 	 	<td><SmoothEnterpriseWebControl:InputText id="QUERY_oga01" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_oga01Resource1" OnClickMore="" Required="False"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                   <ErrorStyle BorderStyle="NotSet" CssClass="" />
               </SmoothEnterpriseWebControl:InputText></td>
                   <td style="width: 119px">
                       <SmoothEnterpriseWebControl:InputText id="InpDeptnm" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_oga01Resource1" OnClickMore="" Required="False">
                           <ErrorStyle BorderStyle="NotSet" />
                           <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                       </SmoothEnterpriseWebControl:InputText></td>
                   <td>
                       <SmoothEnterpriseWebControl:InputSelect ID="QUERY_COM" runat="server" BackColor="#F0F0F0"
                           ButtonClick="True" ButtonIconUrl="" CssClass="Normal" Editable="False" EnabledHTC="True"
                           ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl=""
                           ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemAll-Value="%"
                           ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False"
                           ItemNone-Text="" ListPosition="Vertical" Mode="Single" TextBoxStyle="ThreeDStyle"
                           Value="System.Data.SqlClient">
                           <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                           <ErrorStyle BorderStyle="NotSet" />
                       </SmoothEnterpriseWebControl:InputSelect>
                   </td>
 	 	 	<td style="width: 121px">
                   <SmoothEnterpriseWebControl:InputText ID="QUERY_oga02" runat="server" BackColor="#F0F0F0"
                       ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                       ErrorMessage="Please Input「SDATE」!!" FocusColor="" FormatType="Date" Height="20px"
                       HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_SDATEResource1"
                       OnClickMore="" Personalize="False" Required="False" Width="100px">
                       <ErrorStyle BorderStyle="NotSet" CssClass="" />
                       <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                   </SmoothEnterpriseWebControl:InputText></td>
                   <td>
                       <SmoothEnterpriseWebControl:InputText ID="QUERY_oga02_2" runat="server" BackColor="#F0F0F0"
                           ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                           ErrorMessage="Please Input「SDATE」!!" FocusColor="" FormatType="Date" Height="20px"
                           HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_SDATEResource1"
                           OnClickMore="" Personalize="False" Required="False" Width="100px">
                           <ErrorStyle BorderStyle="NotSet" CssClass="" />
                           <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                       </SmoothEnterpriseWebControl:InputText></td>
 	 	 	<td style="width: 29px">
                   <asp:DropDownList ID="QUERY_status" runat="server" Style="background-color: #cccccc"
                       Width="100px" meta:resourcekey="QUERY_statusResource1">
                       <asp:ListItem meta:resourcekey="ListItemResource1">Filter</asp:ListItem>
                       <asp:ListItem Value="完成審核" meta:resourcekey="ListItemResource2">完成審核</asp:ListItem>
                       <asp:ListItem Value="N" meta:resourcekey="ListItemResource3">未送審</asp:ListItem>
                       <asp:ListItem Value="Y" meta:resourcekey="ListItemResource4">送審中</asp:ListItem>
                       <asp:ListItem meta:resourcekey="ListItemResource5">退回</asp:ListItem>
                       <asp:ListItem Value="V" meta:resourcekey="ListItemResource6">作廢</asp:ListItem>
                   </asp:DropDownList></td>
	        <td>
	            <SmoothEnterpriseWebControl:InputButton ID="BUTTON_query" runat="server" Text="查詢" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_query_Click" meta:resourcekey="BUTTON_queryResource1" RunAtCient="False"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>
	            
	        </td>
	    </tr>
	</table>
    
	<table border="0" width="100%">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:DataList id="DataList1" runat="server" BorderColor="Black" 
					CellPadding="3px" borderwidth="1px" borderstyle="Solid" HeaderHeight="30px"  Font-Names="Arial" Font-Size="12px" 
					  SQL="SELECT * FROM AXMT610_IN_HEAD" Personalize="True" OnOnRenderCell="DataList1_OnRenderCell" BackImageURL="" Connected="False"  CurrentColumn="" CurrentRow="0" IconCustom="" IconExport="" IconGoFirstPage="" IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage="" IconPages="" IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc="" meta:resourcekey="DataList1Resource1" SortColumn="" SortType="">
					<Columns>
					    
					    <SmoothEnterpriseWebControl:DataColumn ID="DataList1_edit" Width="1%" DataAlign="Center" DataType="UserDefined" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_editResource1"></SmoothEnterpriseWebControl:DataColumn>
					    
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_id" DataType="ViewText" Caption="Id" DataName="id" Visible="False" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_idResource1" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_no" DataType="ViewText" Caption="放行單號" DataName="no"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_noResource1" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_no_order" DataType="ViewText" Caption="版次" DataName="no_order"  Required="True"  DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_no_orderResource1" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_plantid" DataType="ViewText" Caption="廠區" DataName="plantid"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_plantidResource1" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_oga03" DataType="ViewText" Caption="目的廠區" DataName="l_azp03"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_oga03Resource1" ></SmoothEnterpriseWebControl:DataColumn>

 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_oga01" DataType="ViewText" Caption="通知單號" DataName="oga01"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_oga01Resource1" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_oga02" DataType="ViewText" Caption="通知日期" DataName="oga02"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_oga02Resource1" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_oga011" DataType="ViewText" Caption="出貨單號" DataName="oga11"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_oga011Resource1" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_occ02_0" DataType="ViewText" Caption="客戶名稱" DataName="occ02_1" Sortable="True"    DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_occ02_0Resource1" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_gem02_3" DataType="ViewText" Caption="部門" DataName="gem02_3"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_gem02_3Resource1" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_gen02_4" DataType="ViewText" Caption="業務人員" DataName="gen02_4"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_gen02_4Resource1" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_status" DataType="UserDefined" Caption="狀態" Width="70" DataName="status" Sortable="True" Required="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server"  meta:resourcekey="DataList1_statusResource1" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn DataType="ViewText"   Caption="原幣出貨$" Width="100px" DataName="oga50"  ID="DataColumn6" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_oga50Resource1" runat="server" DataAlign="right" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText"   Caption="信用額度" Width="85px" DataName="tot"  ID="DataColumn7" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_totResource1" runat="server" DataAlign="right" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText"   Caption="信用餘額" Width="85px" DataName="bal"  ID="bal" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_balResource1" runat="server" DataAlign="right" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText"  Caption="&lt;30天逾期" Width="80px" DataName="l_amt01"  ID="l_amt01" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_l_amt01Resource1" runat="server" DataAlign="right" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText"  Caption="&gt;30天逾期" Width="80px" DataName="l_amt02"  ID="DataColumn13" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_l_amt02Resource1" runat="server" DataAlign="right" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText"  Caption="未30天逾期" Width="80px" DataName="l_amt03"  ID="DataColumn5" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_l_amt03Resource1" runat="server" DataAlign="right" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText"  Caption="申請人超限原因" Width="70px" DataName="Reason_user"  ID="DataColumn8" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_Reason_userResource1" runat="server" DataStyle-Font-Size="XX-Small" DataAlign="Center" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText"  Caption="申請人改善方案" Width="70px" DataName="Improve_user"  ID="DataColumn9" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_Improve_userResource1" runat="server" DataStyle-Font-Size="XX-Small" DataAlign="Center" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText"  Caption="申請人備註" Width="70px" DataName="annotate_user"  ID="DataColumn2" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_Improve_userResource1" runat="server" DataStyle-Font-Size="XX-Small" DataAlign="Center" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>

						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText"  Caption="多角業務超限原因" Width="70px" DataName="Reason_salse"  ID="DataColumn10" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_Reason_salseResource1" runat="server" DataStyle-Font-Size="XX-Small" DataAlign="Center" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText"  Caption="多角業務改善方案" Width="70px" DataName="Improve_salse"  ID="DataColumn11" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_Improve_salseResource1" runat="server" DataStyle-Font-Size="XX-Small" DataAlign="Center" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText"  Caption="多角業務備註" Width="70px" DataName="annotate_salse"  ID="DataColumn1" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_Improve_salseResource1" runat="server" DataStyle-Font-Size="XX-Small" DataAlign="Center" DataStyle-CssClass="" HeaderStyle-CssClass=""></SmoothEnterpriseWebControl:DataColumn>

						<SmoothEnterpriseWebControl:DataColumn DataType="UserDefined" Caption="附件" DataAlign="Center" Width="70px" ID="DataList1_pro" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_proResource1" runat="server" DataStyle-Font-Size="XX-Small"></SmoothEnterpriseWebControl:DataColumn>

					    <SmoothEnterpriseWebControl:DataColumn ID="DataList1_view" Width="1%" DataAlign="Center" DataType="UserDefined" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_viewResource1"></SmoothEnterpriseWebControl:DataColumn>
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