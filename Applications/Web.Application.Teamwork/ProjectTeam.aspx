<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Teamwork.ProjectTeam, App_Web_projectteam.aspx.cdcab7d2" theme="Default" %>
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
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>

	<table border="0">
		<tr Class="NormalBold">
			<TD id="LABEL_projid" runat="server">專案</TD>
			<TD id="LABEL_projphaseid" runat="server">專案階段</TD>
			<TD id="LABEL_roleid" runat="server">專案角色</TD>
			<TD id="LABEL_uid" runat="server">成員</TD>
			<td id="LABEL_description" runat="server">描述</td>
		</tr>
		<tr>
			<TD>
				<SmoothEnterpriseWebControl:InputSelect id="QUERY_projid" runat="server"  backcolor="#F0F0F0" cssClass="Normal"
					ErrorMessage="Please Select「Project」!!" Personalize="True" ItemAllDisplayed="True" ItemAll-Gradient-GradientEnd=" "
					ItemAll-Gradient-GradientBegin=" " ItemAll-Selected="False" ItemAll-RowHeight="18"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:InputSelect></TD>
			<TD>
				<SmoothEnterpriseWebControlEnterprise:SelectCode id="QUERY_projphaseid" runat="server"  ItemAllDisplayed="True" Personalize="True"
					cssClass="Normal" backcolor="#F0F0F0" ValueField="id" TextField="name" CodeType="projphase"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControlEnterprise:SelectCode></TD>
			<TD>
				<SmoothEnterpriseWebControl:InputSelect id="QUERY_roleid" runat="server"  backcolor="#F0F0F0" cssClass="Normal"
					ErrorMessage="Please Select「Project Role」!!" Personalize="True" ItemAllDisplayed="True" ItemAll-Gradient-GradientEnd=" "
					ItemAll-Gradient-GradientBegin=" " ItemAll-Selected="False" ItemAll-RowHeight="18"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:InputSelect></TD>
			<TD>
				<SmoothEnterpriseWebControlEnterprise:PopupUser id="QUERY_uid" runat="server" BackColor="#F0F0F0" CssClass="Normal" Gradient-GradientType="Top"
					Required="False" ErrorMessage="Please Select「Member」!!" FormatType="InputCombo" DisplayField="name" FormatValueField="logonid"
					ValueField="id" Personalize="True" DisplayFieldHidden="True" Width="100px"></SmoothEnterpriseWebControlEnterprise:PopupUser></TD>
			<td><SmoothEnterpriseWebControl:InputText id="QUERY_description" runat="server" CssClass="Normal"
					BackColor="#F0F0F0" Personalize="true"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td>
			<td><SmoothEnterpriseWebControl:InputButton id="BUTTON_query" runat="server" Text="查詢" width="80px" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" OnClick="BUTTON_query_Click"></SmoothEnterpriseWebControl:InputButton></td>
			<td><SmoothEnterpriseWebControl:InputButton id="BUTTON_add" runat="server" Text="新增" width="80px" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" OnClick="BUTTON_add_Click"></SmoothEnterpriseWebControl:InputButton></td>
		</tr>
	</table>
	<table border="0" width="100%">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:DataList id="DataList1" runat="server" BorderColor="#000000" RowNumber="True" RowAlign="Middle"
					NavigatorPos="Bottom" HeaderPos="Top" HeaderAlign="Middle" EnablePrint="True" EnableExport="True" EnableCustom="True"
					CellPadding="3px" guid="" rows="10" gridlines="both" borderwidth="1px" borderstyle="Solid" NavigatorGradient="Left"
					HeaderGradient="Left" HeaderHeight="30px" SelectedColor="224, 224, 224" Font-Names="Arial" Font-Size="12px"
					SQL="select * from dgprojectteam" Personalize="True" OnOnRenderCell="DataList1_OnRenderCell">
					<Columns>
						<SmoothEnterpriseWebControl:DataColumn DataType="CheckBox" DataAlign="Center" Width="1%" Required="True" ID="DataList1_chk" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="IconEdit" DataAlign="Center" Width="1%" ID="DataList1_edit" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="專案" Required="True" DataName="projid_name" Sortable="True"
							ID="DataList1_projid" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="專案階段" Required="True" DataName="projphaseid_name" Sortable="True"
							ID="DataList1_projphaseid" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="專案角色" Required="True" DataName="roleid_name" Sortable="True"
							ID="DataList1_roleid" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="成員" Required="True" DataName="uid_name" Sortable="True"
							ID="DataList1_uid" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="負責人" Required="True" DataName="leader" Sortable="True"
							ID="DataList1_leader" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="描述" Required="True" DataName="description" Sortable="True"
							ID="DataList1_description" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="建立人員" DataName="inituid_name" Sortable="True"
							ID="DataList1_inituid" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="建立時間" DataName="initdate" Sortable="True"
							ID="DataList1_initdate" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="更新人員" DataName="modifyuid_name" Sortable="True"
							ID="DataList1_modifyuid" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="更新時間" DataName="modifydate" Sortable="True"
							ID="DataList1_modifydate" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server"></SmoothEnterpriseWebControl:DataColumn>
						<SmoothEnterpriseWebControl:DataColumn DataType="IconView" DataAlign="Center" Width="1%" ID="DataList1_view" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server"></SmoothEnterpriseWebControl:DataColumn>
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
			<td><SmoothEnterpriseWebControl:InputButton id="BUTTON_delete" runat="server" Text="刪除" width="80px" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" OnClick="BUTTON_delete_Click"></SmoothEnterpriseWebControl:InputButton>
					&nbsp;<SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold"
                    Font-Bold="True" Font-Names="Arial" Font-Size="12px" Gradient-GradientType="Bottom"
                    OnClick="BUTTON_back_Click" Text="回上頁" Visible="False" Width="80px">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
                </td>
		</tr>
	</table>
</asp:Content>
