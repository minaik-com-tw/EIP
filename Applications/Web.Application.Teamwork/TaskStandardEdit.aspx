<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Teamwork.TaskStandardEdit, App_Web_taskstandardedit.aspx.cdcab7d2" theme="Default" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
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
						<TD Class="NormalBold" id="LABEL_tasktypeid" runat="server">工作類別</TD>
					</TR>
					<TR>
						<TD>
							<SmoothEnterpriseWebControl:InputSelect id="FIELD_tasktypeid" runat="server"  ErrorMessage="請輸入「工作類別」!!" Required="True"
								ItemNoneDisplayed="True" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Gradient-GradientBegin=" "
								ItemAll-Gradient-GradientEnd=" " cssClass="Normal" backcolor="#F0F0F0"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:InputSelect></TD>
					</TR>
					<TR>
						<TD Class="NormalBold" id="LABEL_name" runat="server">名稱</TD>
					</TR>
					<TR>
						<TD>
							<SmoothEnterpriseWebControl:InputText id="FIELD_name" tabIndex="101" runat="server" BackColor="#F0F0F0" CssClass="Normal"
								MaxLength="200" ErrorMessage="請輸入「名稱」!!" Gradient-GradientType="Top"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></TD>
					</TR>
					<TR>
						<TD Class="NormalBold" id="LABEL_detail" runat="server">說明</TD>
					</TR>
					<TR>
						<TD>
							<SmoothEnterpriseWebControl:InputText id="FIELD_detail" tabIndex="102" runat="server" Width="240px" BackColor="#F0F0F0"
								CssClass="Normal" MaxLength="1073741823" ErrorMessage="請輸入「說明」!!" TextMode="MultiLine"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></TD>
					</TR>
					<TR>
						<TD Class="NormalBold" id="LABEL_stdhours" runat="server">標準工時</TD>
					</TR>
					<TR>
						<TD>
							<SmoothEnterpriseWebControl:InputText id="FIELD_stdhours" tabIndex="103" runat="server" Width="50px" BackColor="#F0F0F0"
								CssClass="Normal" MaxLength="19" ErrorMessage="請輸入「標準工時」!!" FormatType="Number"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
	</TABLE>
	<table border="0" Class="Normal">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:InputButton id="BUTTON_save" runat="server" width="80px" Text="儲存" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" OnClick="BUTTON_save_Click"></SmoothEnterpriseWebControl:InputButton>&nbsp;
				<SmoothEnterpriseWebControl:InputButton id="BUTTON_back" runat="server" width="80px" Text="回上頁" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" OnClick="BUTTON_back_Click"></SmoothEnterpriseWebControl:InputButton>&nbsp;
				<SmoothEnterpriseWebControl:InputButton id="BUTTON_delete" runat="server" Text="刪除" width="80px" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" OnClick="BUTTON_delete_Click"></SmoothEnterpriseWebControl:InputButton>
			</td>
		</tr>
	</table>
</asp:Content>
