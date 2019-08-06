<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Content.Category, App_Web_category.aspx.cdcab7d2" title="檔案內容分類管理維護" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>    
	<table Class="Normal" border="0">
		<tr>
			<td vAlign="top" width="300">
				<table Class="Normal" width="100%" border="0">
					<tr>
						<td>
							<div style="OVERFLOW: auto"><asp:label id="LABEL_tree" runat="server" meta:resourcekey="LABEL_treeResource1"></asp:label></div>
						</td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_seq" runat="server" BackColor="#F0F0F0" CssClass="Normal" 
								HiddenMode="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_seqResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
				</table>
			</td>
			<td vAlign="top" width="10" background="/lib/img/vline.gif">&nbsp;</td>
			<td vAlign="top">
				<table border="0">
					<tr Class="NormalBold">
						<td><asp:Label ID="LABEL_categoryname" runat="server" Text="內容分類名稱" meta:resourcekey="LABEL_categorynameResource1"></asp:Label></td>
						<td><asp:Label ID="LABEL_remark" runat="server" Text="備註說明" meta:resourcekey="LABEL_remarkResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="QUERY_name" runat="server" BackColor="#F0F0F0" CssClass="Normal" Required="False"
								ErrorMessage="請輸入「內容分類名稱」!!"  Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_nameResource1" OnClickMore=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" />
                        </SmoothEnterpriseWebControl:inputtext></td>
						<td><SmoothEnterpriseWebControl:inputtext id="QUERY_remark" runat="server" BackColor="#F0F0F0" Width="420px" CssClass="Normal"
								ErrorMessage="請輸入「備註說明」!!"  Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_remarkResource1" OnClickMore="" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" />
                        </SmoothEnterpriseWebControl:inputtext></td>
						<td><SmoothEnterpriseWebControl:inputbutton id="BUTTON_add" runat="server" OnClick="BUTTON_add_Click" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
								BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom"
								width="80px" Text="新增" Font-Bold="True" meta:resourcekey="BUTTON_addResource1" RunAtCient="False">
								<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
							</SmoothEnterpriseWebControl:inputbutton></td>
					</tr>
				</table>
				<table width="100%" border="0">
					<tr>
						<td><SmoothEnterpriseWebControl:DATALIST id="DataList1" runat="server" BorderColor="Black" Font-Size="12px" Font-Names="Arial"
								Width="400px" Personalize="True" NavigatorPos="None" EnablePrint="False" EnableExport="False" EnableCustom="False" CellPadding="3px" guid=""
								rows="10" gridlines="both" borderwidth="1px" borderstyle="Solid" NavigatorGradient="Left" HeaderGradient="Left"
								HeaderHeight="30px" SelectedColor="224, 224, 224" SQL="select * from dgcategory where 1=0" OnOnRenderCell="DataList1_OnRenderCell" BackImageURL="" Connected="False" ConnectionString="" CurrentColumn="" CurrentRow="0" IconCustom="" IconExport="" IconGoFirstPage="" IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage="" IconPages="" IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc="" meta:resourcekey="DataList1Resource1" SortColumn="" SortType="">
								<Columns>
									<SmoothEnterpriseWebControl:DataColumn DataType="CheckBox" DataAlign="Center" Width="1%" Required="True" ID="DataList1_chk" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_chkResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
									<SmoothEnterpriseWebControl:DataColumn DataType="UserDefined" DataAlign="Center" Width="1%" Required="True" ID="DataList1_edit" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_editResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
									<SmoothEnterpriseWebControl:DataColumn DataType="UserDefined" Caption="內容分類名稱" Width="150px" Required="True" DataName="name"
										ID="DataList1_name" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_nameResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
									<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="備註說明" Width="350px" Required="True" DataName="remark"
										ID="DataList1_remark" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_remarkResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
									<SmoothEnterpriseWebControl:DataColumn DataType="UserDefined" Caption="顯示順序" DataAlign="Center" Required="True" DataName="seq"
										ID="DataList1_seq" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" meta:resourcekey="DataList1_seqResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
								</Columns>
								<NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px" ForeColor="64, 64, 64"
									BorderColor="Silver" BackColor="224, 224, 224"></NavigatorStyle>
								<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="Black" BorderStyle="NotSet"></HeaderStyle>
								<SelectColumnStyle BackColor="242, 242, 242" BorderStyle="NotSet"></SelectColumnStyle>
								<SelectStyle BackColor="195, 210, 248" BorderStyle="NotSet"></SelectStyle>
								<GridLine LineColor="224, 224, 224" LineStyle="Solid" LineMode="Vertical" LineWidth="1px"></GridLine>
								<HoverStyle BackColor="230, 237, 255" BorderStyle="NotSet"></HoverStyle>
                            <RowStyle BorderStyle="NotSet" />
							</SmoothEnterpriseWebControl:DATALIST></td>
					</tr>
				</table>
				<table border="0">
					<tr>
						<td><SmoothEnterpriseWebControl:inputbutton id="BUTTON_delete" runat="server" OnClick="BUTTON_delete_Click" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
								BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom"
								width="80px" Text="刪除" Font-Bold="True" meta:resourcekey="BUTTON_deleteResource1" RunAtCient="False">
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                        </SmoothEnterpriseWebControl:inputbutton>&nbsp;
							<SmoothEnterpriseWebControl:inputbutton id="BUTTON_new" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
								BorderColor="#606060" Font-Size="12px" Font-Names="Arial" Width="80px" Text="加入文件" Font-Bold="True" cssClass="NormalBold"
								RunAtCient="False" meta:resourcekey="BUTTON_newResource1">
								<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
							</SmoothEnterpriseWebControl:inputbutton></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</asp:Content>
