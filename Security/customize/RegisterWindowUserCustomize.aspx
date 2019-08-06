<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Security.RegisterWindowUserCustomize, App_Web_registerwindowusercustomize.aspx.dd4e8b7f" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
		<CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table border="0">
		<tr>
			<td Class="NormalBold">
			    <asp:Label ID="LABEL_domainname" runat="server" Text="請輸入註冊Windows認證的網域(電腦)名稱" meta:resourcekey="LABEL_domainnameResource1"></asp:Label></td>
		</tr>
		<tr>
			<td>
                <smoothenterprisewebcontrol:inputtext id="FIELD_domainname" runat="server" backcolor="#F0F0F0"
                    cssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_domainnameResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" />
                </SmoothEnterpriseWebControl:inputtext>
				</td>
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
                    font-bold="True" font-names="Arial" font-size="12px" Width="80px" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False"><Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient></smoothenterprisewebcontrol:inputbutton></TD>
		</TR>
	</TABLE>
</asp:Content>
