<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="APMT420.aspx.cs" Inherits="ERP_APMT420.APMT420" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="APMT420 List Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table border="0" style="width: 900px; height: 50px">
	    <tr Class="NormalBold">
	        
 	 	 	<td style="width: 100px; height: 18px"><asp:Label ID="LABEL_no" runat="server" CssClass="NormalBold" Text="單據號碼"></asp:Label></td>
 	 	 	<td style="width: 100px; height: 18px"><asp:Label ID="LABEL_plantID" runat="server" CssClass="NormalBold" Text="廠區"></asp:Label></td>
 	 	 	<td style="width: 100px; height: 18px"><asp:Label ID="LABEL_pmk01" runat="server" CssClass="NormalBold" Text="ERP單號"></asp:Label></td>
 	 	 	<td style="width: 100px; height: 18px"><asp:Label ID="LABEL_pmk04" runat="server" CssClass="NormalBold" Text="請購日期起"></asp:Label></td><td style="width: 100px; height: 18px">
                   <asp:Label ID="Label1" runat="server" CssClass="NormalBold" Text="請購日期迄"></asp:Label></td>
 	 	 	<td style="width: 100px; height: 18px"><asp:Label ID="LABEL_gen02_3" runat="server" CssClass="NormalBold" Text="請購人員姓名"></asp:Label></td>
 	 	 	<td style="width: 100px; height: 18px"><asp:Label ID="LABEL_gem02_4" runat="server" CssClass="NormalBold" Text="請購部門"></asp:Label></td>
            <td style="width: 1533px; height: 18px">
                <asp:Label ID="Label2" runat="server" CssClass="NormalBold" Height="8px" Text="採購人員"
                    Width="98px"></asp:Label></td>
 	 	 	<td style="width: 99px; height: 18px"><asp:Label ID="LABEL_status" runat="server" CssClass="NormalBold" Text="單據狀態"></asp:Label></td>
	        <td style="height: 18px"></td>
	    </tr>
	    <tr>
    	    
 	 	 	<td style="width: 100px"><SmoothEnterpriseWebControl:InputText id="QUERY_no" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True" Width="100px"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                   <ErrorStyle BorderStyle="NotSet" />
               </SmoothEnterpriseWebControl:InputText></td>
 	 	 	<td style="width: 100px"><SmoothEnterpriseWebControl:InputText id="QUERY_plantID" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True" Width="100px"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                   <ErrorStyle BorderStyle="NotSet" CssClass="" />
               </SmoothEnterpriseWebControl:InputText></td>
 	 	 	<td style="width: 100px"><SmoothEnterpriseWebControl:InputText id="QUERY_pmk01" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True" Width="100px"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                   <ErrorStyle BorderStyle="NotSet" CssClass="" />
               </SmoothEnterpriseWebControl:InputText></td>
 	 	 	<td style="width: 100px">
                   <SmoothEnterpriseWebControl:InputText ID="QUERY_pmk04" runat="server" BackColor="#F0F0F0"
                       ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                       ErrorMessage="Please Input「SDATE」!!" FocusColor="" FormatType="Date" Height="20px"
                       HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_SDATEResource1"
                       OnClickMore="" Personalize="False" Required="False" Width="100px">
                       <ErrorStyle BorderStyle="NotSet" CssClass="" />
                       <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                   </SmoothEnterpriseWebControl:InputText></td>
                   <td style="width: 100px">
                       <SmoothEnterpriseWebControl:InputText ID="QUERY_pmk041" runat="server" BackColor="#F0F0F0"
                           ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                           ErrorMessage="Please Input「SDATE」!!" FocusColor="" FormatType="Date" Height="20px"
                           HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_SDATEResource1"
                           OnClickMore="" Personalize="False" Required="False" Width="100px">
                           <ErrorStyle BorderStyle="NotSet" />
                           <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                       </SmoothEnterpriseWebControl:InputText></td>
 	 	 	<td style="width: 100px"><SmoothEnterpriseWebControl:InputText id="QUERY_gen02_3" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True" Width="100px"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                   <ErrorStyle BorderStyle="NotSet" CssClass="" />
               </SmoothEnterpriseWebControl:InputText></td>
 	 	 	<td style="width: 100px"><SmoothEnterpriseWebControl:InputText id="QUERY_gem02_4" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True" Width="100px"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                   <ErrorStyle BorderStyle="NotSet" CssClass="" />
               </SmoothEnterpriseWebControl:InputText></td>
                   <td style="width: 1533px">
                       <SmoothEnterpriseWebControl:InputText id="QUERY_pur" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True" Width="100px">
                           <ErrorStyle BorderStyle="NotSet" />
                           <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                       </SmoothEnterpriseWebControl:InputText></td>
 	 	 	<td style="width: 99px">
                   <asp:DropDownList ID="QUERY_status" runat="server" Style="background-color: #cccccc"
                       Width="100px">
                       <asp:ListItem>Filter</asp:ListItem>
                       <asp:ListItem Value="Y">完成審核</asp:ListItem>
                       <asp:ListItem Value="N">未送審</asp:ListItem>
                       <asp:ListItem>送審中</asp:ListItem>
                       <asp:ListItem>退回</asp:ListItem>
                       <asp:ListItem>作廢</asp:ListItem>
                   </asp:DropDownList></td>
	        <td>
	            <SmoothEnterpriseWebControl:InputButton ID="BUTTON_query" runat="server" Text="查詢" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_query_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton></td>
	    </tr>
	</table>
	<table border="0" width="100%">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:DataList id="DataList1" runat="server" BorderColor="#000000" RowNumber="True" RowAlign="Middle" 
					NavigatorPos="Bottom" HeaderPos="Top" HeaderAlign="Middle" EnablePrint="True" EnableExport="True" 
					CellPadding="3px" borderwidth="1px" borderstyle="Solid" HeaderHeight="30px"  Font-Names="Arial" Font-Size="12px" 
					  SQL="SELECT a.id id,a.no no,a.plantid plantid,a.pmk01 pmk01,a.pmk02 pmk02,CONVERT(varchar(12) , a.pmk04, 111 ) pmk04,a.pmk06 pmk06,a.pmk12 pmk12,a.gen02_3 gen02_3,a.pmk13 pmk13,a.gem02_4 gem02_4,CASE (a.status )  WHEN 'Y' THEN '完成審核'  WHEN 'N' THEN '未送審'  else a.status  END status,c.name name, convert(char, d.reviewdate, 120) initdate FROM APMT420_IN_HEAD a LEFT JOIN APMT420_IN_BODY b ON NO=BNO left join dguser c on a.pur=c.id left join dgflowlog d on UPPER(substring(d.requesturl,34,60))=a.id and reviewerurl='/erp_apmt420/apmt420view.aspx' and status='Y' and text='ERP請購單電子簽核' group by a.no,a.plantid,a.pmk01,a.pmk02,a.pmk04,a.pmk06,a.pmk12,a.gen02_3,a.pmk13,a.gem02_4,a.status,a.id,c.name,d.reviewdate  " Personalize="True" OnOnRenderCell="DataList1_OnRenderCell" >
					<Columns>
					    
					    <SmoothEnterpriseWebControl:DataColumn ID="DataList1_edit" Width="1%" DataAlign="Center" DataType="IconEdit" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" runat="server"></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_no" DataType="ViewText" Caption="單據號碼" DataName="no"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_plantID" DataType="ViewText" Caption="廠區" DataName="plantID"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataColumn2" DataType="ViewText" Caption="廠商" DataName="pmc03"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmk01" DataType="ViewText" Caption="ERP單號" DataName="pmk01"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmk02" DataType="ViewText" Caption="單據性質" DataName="pmk02"   Sortable="True" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_gem02_4" DataType="ViewText" Caption="請購部門" DataName="gem02_4"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_gen02_3" DataType="ViewText" Caption="請購人員姓名" DataName="gen02_3"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataColumn1" DataType="ViewText" Caption="採購人員姓名" DataName="name"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmk04" DataType="ViewText" Caption="請購日期" DataName="pmk04"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataColumn3" DataType="ViewText" Caption="完成審核時間" DataName="reviewdate"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_status" DataType="ViewText" Caption="單據狀態" DataName="status"  Required="True" Sortable="True" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
					    <SmoothEnterpriseWebControl:DataColumn ID="DataList1_view" Width="1%" DataAlign="Center" DataType="IconView" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" runat="server"></SmoothEnterpriseWebControl:DataColumn>
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