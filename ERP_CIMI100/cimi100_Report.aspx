<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="cimi100_Report.aspx.cs" Inherits="Shipment.ShipmentReport" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="�ƥ�d�߳���" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table border="0">
	    <tr Class="NormalBold">
            <td>
                <asp:Label ID="Label4" runat="server" CssClass="NormalBold" Text="�t��"></asp:Label>
                &nbsp;
            </td>
	        
 	 	 	<td><asp:Label ID="LABEL_No" runat="server" CssClass="NormalBold" Text="�Ƹ�"></asp:Label></td>
 	 	 	<td><asp:Label ID="LABEL_Customer" runat="server" CssClass="NormalBold" Text="�~�W"></asp:Label></td>
 	 	 	<td><asp:Label ID="LABEL_Add_user" runat="server" CssClass="NormalBold" Text="�W��"></asp:Label></td>
            <td style="width: 139px">
                <asp:Label ID="Label1" runat="server" CssClass="NormalBold" Text="�w���Ƹ�"></asp:Label></td>
            <td style="width: 135px">
                <asp:Label ID="Label2" runat="server" CssClass="NormalBold" Text="�޳N���~�N�X"></asp:Label></td>
            <td style="width: 135px">
                <asp:Label ID="Label3" runat="server" CssClass="NormalBold" Text="�ۻs���~�N�X"></asp:Label></td>
 	 	 	<td>
                   &nbsp;<asp:Label ID="Label5" runat="server" CssClass="NormalBold" Text="EIP�渹"></asp:Label></td>
            <td style="width: 67px">
                <asp:Label ID="Label6" runat="server" CssClass="NormalBold" Text="���"></asp:Label></td>
            <td>
                <asp:Label ID="Label7" runat="server" CssClass="NormalBold" Text="�ӽФH"></asp:Label></td>
	        <td></td>
	    </tr>
	    <tr>
            <td style="height: 43px">
                <asp:DropDownList ID="QUERY_plantid" runat="server" BackColor="Transparent" meta:resourcekey="FIELD_plantidResource1"
                    Width="90px">
                    <asp:ListItem>Filter</asp:ListItem>
                </asp:DropDownList></td>
    	    
 	 	 	<td style="height: 43px"><SmoothEnterpriseWebControl:InputText id="QUERY_IMA01" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
 	 	 	<td style="height: 43px"><SmoothEnterpriseWebControl:InputText id="QUERY_IMA02" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                   <ErrorStyle BorderStyle="NotSet" CssClass="" />
               </SmoothEnterpriseWebControl:InputText></td>
 	 	 	<td style="height: 43px"><SmoothEnterpriseWebControl:InputText id="QUERY_IMA021" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
                   <td style="width: 139px; height: 43px">
                       <span style="font-size: 10pt"><SmoothEnterpriseWebControl:InputText id="QUERY_IMA133" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True">
                           <ErrorStyle BorderStyle="NotSet" CssClass="" />
                           <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                       </SmoothEnterpriseWebControl:InputText></span></td>
                   <td style="width: 135px; height: 43px">
                       <SmoothEnterpriseWebControl:InputText id="QUERY_IMA09" runat="server" CssClass="Normal" BackColor="#F0F0F0" Personalize="True">
                           <ErrorStyle BorderStyle="NotSet" CssClass="" />
                           <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                       </SmoothEnterpriseWebControl:InputText></td>
                   <td style="width: 135px; height: 43px">
                       <SmoothEnterpriseWebControl:InputText ID="QUERY_IMA10" runat="server" BackColor="#F0F0F0"
                           CssClass="Normal" Personalize="True">
                           <ErrorStyle BorderStyle="NotSet" />
                           <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                       </SmoothEnterpriseWebControl:InputText></td>
 	 	 	<td style="height: 43px">                
                   <SmoothEnterpriseWebControl:InputText ID="QUERY_no" runat="server" BackColor="Transparent"
                       CssClass="Normal" Personalize="True" Width="100px">
                       <ErrorStyle BorderStyle="NotSet" />
                       <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                   </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 67px; height: 43px">
                <SmoothEnterpriseWebControl:InputText ID="QUERY_DCC" runat="server" BackColor="Transparent"
                    CssClass="Normal" Personalize="True" Width="100px">
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="height: 43px">
                <SmoothEnterpriseWebControl:InputText ID="QUERY_add_user" runat="server" BackColor="Transparent"
                    CssClass="Normal" Personalize="True" Width="100px">
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText></td>
	        <td style="height: 43px">
	            <SmoothEnterpriseWebControl:InputButton ID="BUTTON_query" runat="server" Text="�d��" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_query_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>&nbsp;
	        </td>
	    </tr>
	</table>
	<table border="0" width="100%">
		<tr>
			<td style="width: 100%">
				<SmoothEnterpriseWebControl:DataList id="DataList1" runat="server" BorderColor="#000000" RowNumber="True" RowAlign="Middle" 
					NavigatorPos="Bottom" HeaderPos="Top" HeaderAlign="Middle" EnablePrint="True" EnableExport="True" 
					CellPadding="3px" borderwidth="1px" borderstyle="Solid" HeaderHeight="30px"  Font-Names="Arial" Font-Size="12px" 
					  SQL="select ima01,ima02,ima021,ima133,ima09,ima10 from MINAIK_IMA_FILE " Personalize="True" OnOnRenderCell="DataList1_OnRenderCell" Width="100%">
					<Columns>
					    
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn1" DataType="ViewText" Caption="�Ƹ�" DataName="ima01"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn2" DataType="ViewText" Caption="�~�W" DataName="ima02"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn3" DataType="ViewText" Caption="�W��" DataName="ima021"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn4" DataType="ViewText" Caption="�w���Ƹ�" DataName="ima133"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn5" DataType="ViewText" Caption="�޳N���~�N�X" DataName="ima09"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn6" DataType="ViewText" Caption="�ۻs���~�N�X" DataName="ima10"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn7" DataType="ViewText" Caption="�ӽмt��" DataName="plantid"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn8" DataType="ViewText" Caption="EIP�渹" DataName="no"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn11" DataType="ViewText" Caption="�Ȥ�Ƹ�" DataName="tc_imi02"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn12" DataType="ViewText" Caption="�Ȥ�Ƹ�����" DataName="tc_imi021"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn13" DataType="ViewText" Caption="�t�P" DataName="tc_imi031"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>

 	 	 	 	 	 	  
 	 	 	 	 	 	
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn9" DataType="ViewText" Caption="�ӽФ��" DataName="dname"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataColumn10" DataType="ViewText" Caption="�ӽФH��" DataName="cname"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" ></SmoothEnterpriseWebControl:DataColumn>

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