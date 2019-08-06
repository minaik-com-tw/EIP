<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Security.RegisterCustomize, App_Web_registercustomize.aspx.dd4e8b7f" title="Untitled Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
		<CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table border="0">
		<tr>
			<td Class="NormalBold">
			    <asp:Label ID="LABEL_registeritems" runat="server" Text="請選擇要啟用的註冊認證項目" meta:resourcekey="LABEL_registeritemsResource1"></asp:Label></td>
		</tr>
		<tr>
			<td>
				<SmoothEnterpriseWebControl:CheckBoxList id="FIELD_registeritems" runat="server" Width="520px" cssClass="Normal" RadioUnCheck="True"
					BorderWidth="0px" BackColor="Lavender" Font-Bold="True" meta:resourcekey="FIELD_registeritemsResource1" Value="SmoothUser,ADUser,WindowUser">
					<GroupHeaderStyle Font-Bold="True" GradientEnd="192, 192, 0" ForeColor="White" GradientLevel="100"
						Gradient="Right" BorderColor="192, 192, 0" BackColor="Gray" BorderStyle="NotSet" CssClass=""></GroupHeaderStyle>
					<DescriptionStyle GradientEnd="Blue" ForeColor="Navy" GradientLevel="50" Gradient="Right" PaddingSize="3px"
						GradientBegin="White" BorderStyle="NotSet" CssClass=""></DescriptionStyle>
					<Items>
						<SmoothEnterpriseWebControl:CheckBoxListItem Selected="True" Text="SmoothEnterprise.NET User" Description="獨立型應用系統的使用者帳號認證模式，適用於企業內部或外部使用者的最佳安全性登入管理，同時也獨立於企業網路的使用者管理"
							Value="SmoothUser" GroupText="" meta:resourcekey="CheckBoxListItem1_registeritemsResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
						<SmoothEnterpriseWebControl:CheckBoxListItem Selected="True" Text="AD User" Description="配合企業 Active Directory 架構的使用者帳號登入認證方式，登入的帳號必須是已存在的 Active Directory 的註冊帳號，此類帳號的登入階段，必須通過網域的 Active Directory 認證"
							Value="ADUser" GroupText="" meta:resourcekey="CheckBoxListItem2_registeritemsResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
						<SmoothEnterpriseWebControl:CheckBoxListItem Selected="True" Text="Window User" Description="配合使用者端的登入認證(Windows 或 Active Directory)，系統會自動偵測目前登入帳號，並執行認證處理，不需再輸入帳號及密碼"
							Value="WindowUser" GroupText="" meta:resourcekey="CheckBoxListItem3_registeritemsResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
					</Items>
				</SmoothEnterpriseWebControl:CheckBoxList></td>
		</tr>
	</table>
	<TABLE id="Table1">
		<TR>
			<TD>
				<smoothenterprisewebcontrol:inputbutton id="BUTTON_save" Text="儲存" runat="server" backcolor="#C8C8C8"
                    bordercolor="#606060" borderstyle="Solid" borderwidth="1px" cssClass="NormalBold"
                    font-bold="True" font-names="Arial" font-size="12px" Width="80px" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_saveResource1" RunAtCient="False"><Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient></smoothenterprisewebcontrol:inputbutton>
                &nbsp;
                <smoothenterprisewebcontrol:inputbutton id="BUTTON_back" Text="回上頁" runat="server" backcolor="#C8C8C8"
                    bordercolor="#606060" borderstyle="Solid" borderwidth="1px" cssClass="NormalBold"
                    font-bold="True" font-names="Arial" font-size="12px" Width="80px" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False"><Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient></smoothenterprisewebcontrol:inputbutton>
				</TD>
		</TR>
	</TABLE>
</asp:Content>
