<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Teamwork.ProjectTeamAdd, App_Web_projectteamadd.aspx.cdcab7d2" theme="Default" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
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

	<table border="0" Class="Normal">
		<tr>
			<td valign="top"><table>
					<tr>
						<td id="LABEL_projid" runat="server" Class="NormalBold">專案</td>
					</tr>
					<tr>
						<td>
							<SmoothEnterpriseWebControl:InputSelect id="FIELD_projid" runat="server"  ItemAll-Value="%" backcolor="#F0F0F0"
								cssClass="Normal" ErrorMessage="Please Select「Project」!!" Required="True" ItemNoneDisplayed="True" OnSelectedIndexChanged="FIELD_projid_SelectedIndexChanged"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:InputSelect></td>
					</tr>
					<tr>
						<td id="LABEL_projphaseid" runat="server" Class="NormalBold">專案階段</td>
					</tr>
					<tr>
						<td>
							<SmoothEnterpriseWebControl:InputSelect id="FIELD_projphaseid" runat="server"  ItemNoneDisplayed="True" Required="True"
								ErrorMessage="Please Select「Project Phase」!!" cssClass="Normal" backcolor="#F0F0F0" ItemAll-Value="%"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:InputSelect></td>
					</tr>
					<tr>
						<td id="LABEL_roleid" runat="server" Class="NormalBold">專案角色</td>
					</tr>
					<tr>
						<td>
							<SmoothEnterpriseWebControl:InputSelect id="FIELD_roleid" runat="server"  ItemAll-Value="%" backcolor="#F0F0F0"
								cssClass="Normal" ErrorMessage="Please Select「Project Role」!!" Required="True" ItemNoneDisplayed="True"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:InputSelect></td>
					</tr>
					<tr>
						<td id="LABEL_uid" runat="server" Class="NormalBold">成員</td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControlEnterprise:PopupUser id="FIELD_uid" runat="server" BackColor="#F0F0F0" CssClass="Normal" Required="True"
								ErrorMessage="Please Select「Member」!!" DisplayField="name" FormatValueField="logonid" ValueField="id" FormatType="InputCombo"
								Gradient-GradientType="Top"></SmoothEnterpriseWebControlEnterprise:PopupUser>
                            <asp:CheckBox ID="FIELD_leader" runat="server" Text="設定為負責人" /></td>
					</tr>
					<tr>
						<td id="LABEL_description" runat="server" Class="NormalBold">描述</td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:InputText id="FIELD_description" runat="server" BackColor="#F0F0F0"
								CssClass="Normal" ErrorMessage="請輸入「描述」!!" tabIndex="104" MaxLength="100" Width="300px" Height="100px" TextMode="MultiLine"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<table border="0" Class="Normal">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:InputButton id="BUTTON_save" runat="server" width="80px" Text="儲存" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" OnClick="BUTTON_save_Click"></SmoothEnterpriseWebControl:InputButton>&nbsp;
				<SmoothEnterpriseWebControl:InputButton id="BUTTON_savenext" runat="server" Text="儲存後繼續操作" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" OnClick="BUTTON_save_Click"></SmoothEnterpriseWebControl:InputButton>&nbsp;
				<SmoothEnterpriseWebControl:InputButton id="BUTTON_back" runat="server" width="80px" Text="回上頁" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" OnClick="BUTTON_back_Click"></SmoothEnterpriseWebControl:InputButton>
			</td>
		</tr>
	</table>
</asp:Content>
