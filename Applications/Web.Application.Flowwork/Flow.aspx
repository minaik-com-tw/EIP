<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Flowwork.Flow, App_Web_flow.aspx.cdcab7d2" title="Untitled Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Application.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>    
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
			<td><asp:Label ID="LABEL_flownamespace" runat="server" Text="流程命名空間" meta:resourcekey="LABEL_flownamespaceResource1"></asp:Label></td>
			<td><asp:Label ID="LABEL_flowclassname" runat="server" Text="流程物件名稱" meta:resourcekey="LABEL_flowclassnameResource1"></asp:Label></td>
			<td><asp:Label ID="LABEL_flowdescription" runat="server" Text="流程說明" meta:resourcekey="LABEL_flowdescriptionResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputselect id="QUERY_namespace" runat="server"  Personalize="True" cssClass="Normal"
					backcolor="#F0F0F0" ItemAllDisplayed="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_namespaceResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:InputSelect></td>
			<td><SmoothEnterpriseWebControl:inputtext id="QUERY_typename" runat="server" BackColor="#F0F0F0" CssClass="Normal" Personalize="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_typenameResource1" OnClickMore="" Required="False"
					><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
			<td><SmoothEnterpriseWebControl:inputtext id="QUERY_name" runat="server" BackColor="#F0F0F0" CssClass="Normal" Personalize="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_nameResource1" OnClickMore="" Required="False"
					><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
			<td><SmoothEnterpriseWebControl:inputbutton id="QueryButton" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" cssClass="NormalBold" Text="查詢" Font-Bold="True" OnClick="QueryButton_Click" meta:resourcekey="QueryButtonResource1" RunAtCient="False" Width="60px">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControl:inputbutton></td>
            <td>
                <SmoothEnterpriseWebControl:inputbutton id="BUTTON_deploy" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" cssClass="NormalBold" Text="佈署新流程" Font-Bold="True" OnClick="QueryButton_Click" meta:resourcekey="BUTTON_deployResource1" RunAtCient="true" OnClientClick="location.href='FlowDeploy.aspx';">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
		</tr>
	</table>
	<table width="100%" border="0">
		<tr>
			<td><SmoothEnterpriseWebControl:DATALIST id="DataList1" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="Black"
					SQL="select a.*, a.namespace+'.'+a.typename flowtype, b.name initname, c.name modifyname from dgflow a left join dguser b on a.inituid = b.id left join dguser c on a.modifyuid = c.id order by namespace, typename"
					SelectedColor="224, 224, 224" HeaderHeight="30px" HeaderGradient="Left" NavigatorGradient="Left" borderstyle="Solid"
					borderwidth="1px" gridlines="both" rows="10" guid="" CellPadding="3px" EnableCustom="True" OnOnRenderCell="DataList1_OnRenderCell" BackImageURL="" Connected="False" ConnectionString="Provider=SQLOLEDB.1;Password=sa;Persist Security Info=True;User ID=sa;Initial Catalog=demo2000;Data Source=localhost" CurrentColumn="" CurrentRow="0" IconCustom="" IconExport="" IconGoFirstPage="" IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage="" IconPages="" IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc="" meta:resourcekey="DataList1Resource1" SortColumn="" SortType="">
					<Columns>
						<SmoothEnterpriseWebControl:DataColumn DataType="IconView" Caption="檢視" DataAlign="Center" Width="1%" ID="DataList1_view" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_viewResource1"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="IconDelete" Caption="卸載" DataAlign="Center" Width="1%" ID="DataList1_del" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_delResource1"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="編譯涵式庫檔案" DataName="assembly" Sortable="True"
							ID="DataList1_assembly" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_assemblyResource1"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="流程類別名稱" DataName="namespace" Sortable="True"
							ID="DataList1_namespace" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_namespaceResource1"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="流程物件名稱" Width="200px" DataName="flowtype"
							Sortable="True" ID="DataList1_flowtypename" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_flowtypenameResource1"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="流程說明" Width="220px" Required="True" DataName="name"
							Sortable="True" ID="DataList1_flowdescription" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_flowdescriptionResource1"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="流程類別" DataName="ftype" Sortable="True"
							ID="DataList1_ftype" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_ftypeResource1"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="UserDefined" Caption="狀態" DataAlign="Center" HeaderStyle-ForeColor="Gold"
							ID="DataList1_status" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_statusResource1"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="建立人員" DataName="initname" Sortable="True"
							ID="DataList1_initname" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_initnameResource1"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="建立時間" DataName="initdate" Sortable="True"
							ID="DataList1_initdate" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_initdateResource1"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="修改人員" DataName="modifyname" Sortable="True" ID="DataList1_modifyname" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_modifynameResource1"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="修改時間" DataName="modifydate" Sortable="True" ID="DataList1_modifydate" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" meta:resourcekey="DataList1_modifydateResource1"></SmoothEnterpriseWebControl:DataColumn>
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
</asp:Content>
