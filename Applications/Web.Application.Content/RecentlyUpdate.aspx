<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Content.RecentlyUpdate, App_Web_recentlyupdate.aspx.cdcab7d2" title="�̷s��s���e�s��" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
			<td><asp:Label ID="LABEL_modifydate" runat="server" Text="��s�ɶ�" meta:resourcekey="LABEL_modifydateResource1"></asp:Label></td>
		</tr>
		<tr>
			<td>
				<SmoothEnterpriseWebControl:InputSelect id="QUERY_modifydate" runat="server"  backcolor="#F0F0F0" cssClass="Normal"
					ItemAll-IsValid="True" ItemAll-Gradient-GradientEnd=" " ItemAll-Gradient-GradientBegin=" " ItemAll-Selected="False"
					ItemAll-Text="%" ItemAll-RowHeight="18" Personalize="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-Value="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_modifydateResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="week">
					<Items>
						<SmoothEnterpriseWebControl:SelectItem  Selected="True" RowHeight="18"
							Value="week" IconUrl="" Text="�L�h�@�P����" GroupText="" ID="SELECT_week" IsValid="True" CookieID="" ErrorMessage=""
							style="FILTER:;" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SELECT_weekResource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
						<SmoothEnterpriseWebControl:SelectItem  Selected="False" RowHeight="18"
							Value="weeks" IconUrl="" Text="�L�h��P����" GroupText="" ID="SELECT_weeks" style="FILTER:;" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SELECT_weeksResource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
						<SmoothEnterpriseWebControl:SelectItem  Selected="False" RowHeight="18"
							Value="month" IconUrl="" Text="�L�h�@�Ӥ뤺" GroupText="" ID="SELECT_month" IsValid="True" CookieID="" ErrorMessage=""
							style="FILTER:;" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SELECT_monthResource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
					</Items>
				<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputSelect></td>
			<td><SmoothEnterpriseWebControl:InputButton id="BUTTON_query" runat="server" Text="�d��" width="80px" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" OnClick="BUTTON_query_Click" meta:resourcekey="BUTTON_queryResource1" RunAtCient="False">
                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
            </SmoothEnterpriseWebControl:InputButton></td>
		</tr>
	</table>
	<table border="0" width="100%">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:DataList id="DataList1" runat="server" BorderColor="Black" EnablePrint="False" EnableExport="False" EnableCustom="True"
					CellPadding="3px" guid="" rows="10" gridlines="both" borderwidth="1px" borderstyle="Solid" NavigatorGradient="Left"
					HeaderGradient="Left" HeaderHeight="30px" SelectedColor="224, 224, 224" Font-Names="Arial" Font-Size="12px"
					SQL="select * from dgcontent" Personalize="True" OnOnRenderCell="DataList1_OnRenderCell" BackImageURL="" Connected="False" ConnectionString="" CurrentColumn="" CurrentRow="0" IconCustom="" IconExport="" IconGoFirstPage="" IconGoLastPage="" IconGoNextPage="" IconGoPage="" IconGoPrevPage="" IconPages="" IconPageSize="" IconPrint="" IconSort="" IconSortAsc="" IconSortDesc="" meta:resourcekey="DataList1Resource1" SortColumn="" SortType="">
					<Columns>
						<SmoothEnterpriseWebControl:DataColumn DataType="UserDefined" DataAlign="Center" Required="True" ID="DataList1_icon" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_iconResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="UserDefined" Caption="���e��ܦW��" DataName="description" ID="DataList1_description" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_descriptionResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="���e�ɮצW��" DataName="filename" Sortable="True" ID="DataList1_filename" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_filenameResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="���e����" DataName="categoryname" Sortable="True" ID="DataList1_catid" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_catidResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="�s����}" DataName="linkurl" Sortable="True"
							ID="DataList1_linkurl" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_linkurlResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn ID="DataList1_remark" Caption="�Ƶ�����" Visible="False" Sortable="True" DataType="ViewText"
							DataName="remark" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_remarkResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="��ܰ����m" DataName="viewtarget" Sortable="True"
							ID="DataList1_viewtarget" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_viewtargetResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="�O�_��ܤ��e�ݩ�" DataName="viewprofile" Sortable="True"
							ID="DataList1_viewprofile" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_viewprofileResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="�إߤH��" DataName="initname" Sortable="True"
							ID="DataList1_inituid" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_inituidResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="��ƫإ߮ɶ�" DataName="initdate" Sortable="True"
							ID="DataList1_initdate" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_initdateResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="�ק�H��" DataName="modifyname" Sortable="True" ID="DataList1_modifyuid" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_modifyuidResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="��ƭק�ɶ�" Required="True" DataName="modifydate" Sortable="True"
							ID="DataList1_modifydate" DataStyle-BorderStyle="NotSet" DataStyle-CssClass="" HeaderStyle-BorderStyle="NotSet" HeaderStyle-CssClass="" meta:resourcekey="DataList1_modifydateResource1" runat="server"></SmoothEnterpriseWebControl:DataColumn>
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
	</table>
</asp:Content>
