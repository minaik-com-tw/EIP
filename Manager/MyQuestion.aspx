<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Manager.MyQuestion, App_Web_myquestion.aspx.cdcab7d2" title="WebForm List Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Application.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
		<CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor> 
	<table border="0">
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_fbno" runat="server" Text="問題編號" meta:resourcekey="LABEL_fbnoResource1"></asp:Label></td>
			<td>
			    <asp:Label ID="LABEL_fbdescription" runat="server" Text="問題描述" meta:resourcekey="LABEL_fbdescriptionResource1"></asp:Label></td>
			<td>
			    <asp:Label ID="LABEL_fbstatus" runat="server" Text="處理狀態" meta:resourcekey="LABEL_fbstatusResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext id="QUERY_fbno" runat="server" BackColor="#F0F0F0" CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_fbnoResource1" OnClickMore="" Personalize="False" Required="False" ><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
			<td><SmoothEnterpriseWebControl:inputtext id="QUERY_description" runat="server" BackColor="#F0F0F0" CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_descriptionResource1" OnClickMore="" Personalize="False" Required="False" ><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
			<td><FONT face="新細明體"><SmoothEnterpriseWebControlEnterprise:SelectCode id="QUERY_fbstatus" runat="server" cssClass="Normal" backcolor="White" ItemAllDisplayed="True"
						CodeType="fbstatus" ValueField="id" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_fbstatusResource1" Mode="Single" TextBoxStyle="ThreeDStyle" TextField="" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControlEnterprise:SelectCode></FONT></td>
			<td><SmoothEnterpriseWebControl:inputbutton id="QueryButton" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom"
					Font-Bold="True" width="80px" Text="查詢" OnClick="QueryButton_Click" meta:resourcekey="QueryButtonResource1" RunAtCient="False">
                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
            </SmoothEnterpriseWebControl:inputbutton></td>
		</tr>
	</table>
	<table width="100%" border="0">
		<tr>
			<td><SmoothEnterpriseWebControl:DATALIST id="DataList1" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="Black"
					SQL="select * from dgfeedback" SelectedColor="224, 224, 224" HeaderHeight="30px" HeaderGradient="Left" NavigatorGradient="Left"
					borderstyle="Solid" borderwidth="1px" gridlines="both" rows="10" guid="" CellPadding="3px" EnableCustom="True" OnOnRenderCell="DataList1_OnRenderCell" BackImageURL="" Connected="False" ConnectionString="" CurrentColumn="" CurrentRow="0" IconCustom="" IconExport="" IconGoFirstPage="" IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage="" IconPages="" IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc="" meta:resourcekey="DataList1Resource1" SortColumn="" SortType="">
					<Columns>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="編號" DataAlign="Right" DataName="fbno" Sortable="True"
							ID="DataList1_fbno" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_fbnoResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="問題類別" DataName="fbtypename" Sortable="True" ID="DataList1_fbtype" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_fbtypeResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="問題反應日期" DataName="fbdate" Sortable="True"
							ID="DataList1_fbdate" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_fbdateResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="問題反應網址" DataName="fburl" Sortable="True" ID="DataList1_fburl" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_fburlResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="問題描述" DataName="description" Sortable="True" ID="DataList1_fbdescription" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_fbdescriptionResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="結果" DataName="result" Sortable="True"
							ID="DataList1_result" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_resultResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="處理狀態" DataName="fbstatusname" Sortable="True" ID="DataList1_fbstatus" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_fbstatusResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="希望回覆的電子郵件" DataName="fbemail" Sortable="True"
							ID="DataList1_fbemail" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_fbemailResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="提問人" DataName="inituid" Sortable="True"
							ID="DataList1_inituid" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_inituidResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="提出日期" DataName="initdate" Sortable="True"
							ID="DataList1_initdate" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_initdateResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="更新人員" DataName="modifyuid" Sortable="True"
							ID="DataList1_modifyname" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_modifynameResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="更新日期" DataName="modifydate" Sortable="True"
							ID="DataList1_modifydate" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_modifydateResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="IconView" DataAlign="Center" Width="1%" ID="view" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="viewResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
					</Columns>
					<NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px" ForeColor="64, 64, 64"
						BorderColor="Silver" BackColor="224, 224, 224" CssClass=""></NavigatorStyle>
					<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="Black" BorderStyle="NotSet" CssClass=""></HeaderStyle>
					<SelectColumnStyle BackColor="242, 242, 242" BorderStyle="NotSet" CssClass=""></SelectColumnStyle>
					<SelectStyle BackColor="195, 210, 248" BorderStyle="NotSet" CssClass=""></SelectStyle>
					<GridLine LineColor="224, 224, 224" LineStyle="Solid" LineMode="Vertical" LineWidth="1px"></GridLine>
					<HoverStyle BackColor="230, 237, 255" BorderStyle="NotSet" CssClass=""></HoverStyle>
                <RowStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControl:DATALIST></td>
		</tr>
	</table>
	<table border="0">
	</table>
</asp:Content>
