<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="ERP_APMI255.aspx.cs" Inherits="ERP_APMI255.ERP_APMI255" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="ERP_APMI255 List Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1" >
		<CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table border="0">
	    <tr Class="NormalBold">
            <td style="width: 118px">
                <asp:Label ID="Label1" runat="server" CssClass="NormalBold" 
                    Text="EIP核價單號" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td style="width: 102px">
                <asp:Label ID="Label3" runat="server" CssClass="NormalBold" 
                    Text="廠區" meta:resourcekey="Label3Resource1"></asp:Label></td>
            <td style="width: 108px">
                &nbsp;<asp:Label ID="LABEL_no" runat="server" CssClass="NormalBold" 
                    Text="ERP採購核價單號" meta:resourcekey="LABEL_noResource1"></asp:Label></td>
            <td style="width: 71px">
                <asp:Label ID="Label5" runat="server" CssClass="NormalBold" 
                    Text="廠商名稱" meta:resourcekey="Label5Resource1"></asp:Label></td>
            <td style="width: 103px">
                <asp:Label ID="LABEL_oga02" runat="server" CssClass="NormalBold" 
                    Text="核價日期(起)" meta:resourcekey="LABEL_oga02Resource1"></asp:Label></td>
            <td style="width: 97px">
                <asp:Label ID="Label2" runat="server" CssClass="NormalBold" 
                    Text="核價日期(迄)" meta:resourcekey="Label2Resource1"></asp:Label></td>
            <td style="width: 95px">
                <asp:Label ID="Label4" runat="server" CssClass="NormalBold" 
                    Text="狀態" meta:resourcekey="Label4Resource1"></asp:Label></td>
            <td style="width: 95px">
                <asp:Label ID="Label6" runat="server" CssClass="NormalBold" 
                    Text="申請人" ></asp:Label></td>
            
	        
	        <td></td>
	    </tr>
	    <tr>
            <td style="width: 118px">
                <SmoothEnterpriseWebControl:InputText ID="QUERY_no" runat="server" BackColor="#F0F0F0"
                    ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                    ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance"
                    IsValid="True"  OnClickMore="" Personalize="True"
                    Required="False" Width="120px" meta:resourcekey="QUERY_noResource1">
                    <ErrorStyle BorderStyle="NotSet" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 102px">
                <SmoothEnterpriseWebControl:InputText ID="QUERY_plantid" runat="server" BackColor="#F0F0F0"
                    ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                    ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance"
                    IsValid="True"  OnClickMore="" Personalize="True"
                    Required="False" Width="99px" meta:resourcekey="QUERY_plantidResource1">
                    <ErrorStyle BorderStyle="NotSet" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 108px">
                <SmoothEnterpriseWebControl:InputText ID="QUERY_pmi01" runat="server" BackColor="#F0F0F0"
                    ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                    ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance"
                    IsValid="True"  OnClickMore="" Personalize="True"
                    Required="False" Width="110px" meta:resourcekey="QUERY_pmi01Resource1">
                    <ErrorStyle BorderStyle="NotSet" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 71px">
                <SmoothEnterpriseWebControl:InputText ID="QUERY_pmc03_0" runat="server" BackColor="#F0F0F0"
                    ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                    ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance"
                    IsValid="True"  OnClickMore="" Personalize="True"
                    Required="False" Width="95px" meta:resourcekey="QUERY_pmc03_0Resource1">
                    <ErrorStyle BorderStyle="NotSet" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 103px">
                <SmoothEnterpriseWebControl:InputText ID="QUERY_pmi02" runat="server" BackColor="#F0F0F0"
                    ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                    ErrorMessage="Please Input「SDATE」!!" FocusColor="" FormatType="Date" Height="20px"
                    HiddenMode="False" HTMLMode="Advance" IsValid="True" 
                    OnClickMore="" Personalize="False" Required="False" Width="100px" meta:resourcekey="QUERY_pmi02Resource1">
                    <ErrorStyle BorderStyle="NotSet" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 97px">
                <SmoothEnterpriseWebControl:InputText ID="QUERY_pmi02_2" runat="server" BackColor="#F0F0F0"
                    ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                    ErrorMessage="Please Input「SDATE」!!" FocusColor="" FormatType="Date" Height="20px"
                    HiddenMode="False" HTMLMode="Advance" IsValid="True" 
                    OnClickMore="" Personalize="False" Required="False" Width="100px" meta:resourcekey="QUERY_pmi02_2Resource1">
                    <ErrorStyle BorderStyle="NotSet" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText></td>
             
            <td style="width: 95px">
                <asp:DropDownList ID="QUERY_status" runat="server" 
                    Style="background-color: #cccccc" Width="120px" Height="25px" meta:resourcekey="QUERY_statusResource1">
                    <asp:ListItem meta:resourcekey="ListItemResource1" >Filter</asp:ListItem>
                    <asp:ListItem  Value="OK" meta:resourcekey="ListItemResource2">完成審核</asp:ListItem>
                    <asp:ListItem  Value="N" meta:resourcekey="ListItemResource3">未送審</asp:ListItem>
                    <asp:ListItem  Value="Y" meta:resourcekey="ListItemResource4">送審中</asp:ListItem>
                    <asp:ListItem  Value="NO" meta:resourcekey="ListItemResource5">退回</asp:ListItem>
                    <asp:ListItem  Value="V" meta:resourcekey="ListItemResource6">作廢</asp:ListItem>
                </asp:DropDownList></td>
            <td style="width: 97px">
                 <SmoothEnterpriseWebControlEnterprise:PopupUser ID="Query_User" runat="server" MaxLength="20"
                        BackColor="#F0F0F0" DisplayField="name" FormatType="InputCombo" Width="120"
                        FormatValueField="logonid" ValueField="id">
                        <Gradient GradientBegin="" GradientEnd="" />
                        <ErrorStyle BorderStyle="NotSet" />
                    </SmoothEnterpriseWebControlEnterprise:PopupUser>

             </td>
    	    
	        <td>
                &nbsp;<SmoothEnterpriseWebControl:InputButton ID="BUTTON_query" runat="server" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold"
                    Font-Bold="True" Font-Names="Arial" Font-Size="12px" 
                    OnClick="BUTTON_query_Click" RunAtCient="False" Text="查詢" Width="80px" meta:resourcekey="BUTTON_queryResource1">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
	    </tr>
	</table>
	<table border="0" width="100%">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:DataList id="DataList1" runat="server" BorderColor="Black" 
					CellPadding="3px" borderwidth="1px" borderstyle="Solid" HeaderHeight="30px"  Font-Names="Arial" Font-Size="12px" 
					  SQL="select id,no,plantid,companyname,pmi01,CONVERT(varchar(12) , pmi02, 111 ) pmi02,
pmc03_0,pmi05,gen02_1,ta_pmi01,status from apmi255_in_head" Personalize="True" OnOnRenderCell="DataList1_OnRenderCell" Width="844px" BackImageURL="" Connected="False" ConnectionString="Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Data Source=ANNLINV\SQLEXPRESS;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=ANNLINV;Use Encryption for Data=False;Tag with column collation when possible=False;;Initial Catalog=AnnSmooth;" CurrentColumn="" CurrentRow="0" IconCustom="" IconExport="" IconGoFirstPage="" IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage="" IconPages="" IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc=""  SortColumn="" SortType="" meta:resourcekey="DataList1Resource1">
					<Columns>
					    
					    <SmoothEnterpriseWebControl:DataColumn ID="DataList1_edit" Caption="修改" Width="1%" DataAlign="Center" DataType="UserDefined" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_editResource1"></SmoothEnterpriseWebControl:DataColumn>
					    
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_id" DataType="ViewText" Caption="Id" DataName="id" Visible="False"  Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" meta:resourcekey="DataList1_idResource1"  ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_no" DataType="ViewText" Caption="單據號碼" DataName="no"    Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" meta:resourcekey="DataList1_noResource1" ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_plantid" DataType="ViewText" Caption="廠區" DataName="plantid"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" meta:resourcekey="DataList1_plantidResource1"  ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmi01" DataType="ViewText" Caption="ERP核價單號" DataName="pmi01"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" meta:resourcekey="DataList1_pmi01Resource1"  ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmi02" DataType="ViewText" Caption="核價日期" DataName="pmi02"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" meta:resourcekey="DataList1_pmi02Resource1"  ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmc03_0" DataType="ViewText" Caption="廠商名稱" DataName="pmc03_0"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" meta:resourcekey="DataList1_pmc03_0Resource1"  ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_pmi05" DataType="ViewText" Caption="分量計價" DataName="pmi05"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataAlign="Center" DataStyle-CssClass="" HeaderStyle-CssClass="" meta:resourcekey="DataList1_pmi05Resource1"  ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_gen02_1" DataType="ViewText" Caption="申請人" DataName="gen02_1"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" meta:resourcekey="DataList1_gen02_1Resource1"  ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_ta_pmi01" DataType="ViewText" Caption="簽核流程" DataName="ta_pmi01"   Sortable="True" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" meta:resourcekey="DataList1_ta_pmi01Resource1"  ></SmoothEnterpriseWebControl:DataColumn>
 	 	 	 	 	 	<SmoothEnterpriseWebControl:DataColumn ID="DataList1_status" DataType="UserDefined" Caption="單據狀態" DataName="status" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" meta:resourcekey="DataList1_statusResource1"  ></SmoothEnterpriseWebControl:DataColumn>
					    <SmoothEnterpriseWebControl:DataColumn ID="DataList1_view" Caption="瀏覽" Width="1%" DataAlign="Center" DataType="IconView" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataStyle-CssClass="" HeaderStyle-CssClass="" meta:resourcekey="DataList1_viewResource1" ></SmoothEnterpriseWebControl:DataColumn>
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