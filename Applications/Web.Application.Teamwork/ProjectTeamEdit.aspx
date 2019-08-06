<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Teamwork.ProjectTeamEdit, App_Web_projectteamedit.aspx.cdcab7d2" theme="Default" %>
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

	<TABLE Class="Normal" id="Table1" border="0">
		<TR>
			<TD vAlign="top">
				<TABLE id="Table2">
					<TR>
						<TD Class="NormalBold" id="LABEL_projid" runat="server">專案</TD>
					</TR>
					<TR>
						<TD><SmoothEnterpriseWebControl:inputselect id="FIELD_projid" runat="server"  ItemAll-Value="%" backcolor="#F0F0F0"
								cssClass="Normal" Required="True" ItemNoneDisplayed="True" ErrorMessage="Please Select「Project」!!" OnSelectedIndexChanged="FIELD_projid_SelectedIndexChanged" Editable="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:InputSelect></TD>
					</TR>
					<TR>
						<TD Class="NormalBold" id="LABEL_projphaseid" runat="server">專案階段</TD>
					</TR>
					<TR>
						<TD><SmoothEnterpriseWebControl:inputselect id="FIELD_projphaseid" runat="server"  ItemAll-Value="%" backcolor="#F0F0F0"
								cssClass="Normal" Required="True" ItemNoneDisplayed="True" ErrorMessage="Please Select「Project Phase」!!"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:InputSelect></TD>
					</TR>
					<TR>
						<TD Class="NormalBold" id="LABEL_roleid" runat="server">專案角色</TD>
					</TR>
					<TR>
						<TD><SmoothEnterpriseWebControl:inputselect id="FIELD_roleid" runat="server"  ItemAll-Value="%" backcolor="#F0F0F0"
								cssClass="Normal" Required="True" ItemNoneDisplayed="True" ErrorMessage="Please Select「Project Role」!!"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:InputSelect></TD>
					</TR>
					<TR>
						<TD Class="NormalBold" id="LABEL_uid" runat="server">成員</TD>
					</TR>
					<TR>
						<TD><SmoothEnterpriseWebControlEnterprise:PopupUser id="FIELD_uid" runat="server" BackColor="#F0F0F0" CssClass="Normal" Required="True"
								ErrorMessage="Please Select「Member」!!" DisplayField="name" FormatValueField="logonid" ValueField="id" FormatType="InputCombo"
								Gradient-GradientType="Top"></SmoothEnterpriseWebControlEnterprise:PopupUser>
                            <asp:CheckBox ID="FIELD_leader" runat="server" Text="專案階段負責人" /></TD>
					</TR>
					<TR>
						<TD Class="NormalBold" id="LABEL_description" runat="server">描述</TD>
					</TR>
					<TR>
						<TD><SmoothEnterpriseWebControl:inputtext id="FIELD_description" tabIndex="104" runat="server" Width="300px" BackColor="#F0F0F0"
								Height="100px" CssClass="Normal" ErrorMessage="請輸入「描述」!!" TextMode="MultiLine"
								MaxLength="100"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
	</TABLE>
	<table Class="Normal" border="0">
		<tr>
			<td><SmoothEnterpriseWebControl:inputbutton id="BUTTON_save" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom"
					Font-Bold="True" Text="儲存" width="80px" OnClick="BUTTON_save_Click"></SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BUTTON_back" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom"
					Font-Bold="True" Text="回上頁" width="80px" OnClick="BUTTON_back_Click"></SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BUTTON_delete" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom"
					Font-Bold="True" Text="刪除" width="80px" OnClick="BUTTON_delete_Click"></SmoothEnterpriseWebControl:inputbutton></td>
		</tr>
	</table>
</asp:Content>
