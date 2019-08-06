<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Security.LoginCustomize, App_Web_logincustomize.aspx.dd4e8b7f" title="Untitled Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
    </SmoothEnterpriseWebControlEnterprise:Descriptor><table border="0">
        <tr>
            <td Class="NormalBold">
                <asp:Label ID="LABEL_description" runat="server" meta:resourcekey="LABEL_descriptionResource1"
                    Text="請輸入登入說明"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="FIELD_description" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" FormatType="HTML" Height="117px" Width="404px">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
        </tr>
    </table>
	<table border="0">
		<tr>
			<td Class="NormalBold">
			    <asp:Label ID="LABEL_register" runat="server" Text="是否允許註冊功能" meta:resourcekey="LABEL_registerResource1"></asp:Label></td>
		</tr>
		<tr>
			<td>
                <smoothenterprisewebcontrol:checkboxlist ID="FIELD_register" runat="server" Width="120px" cssClass="Normal" CheckMode="SingleRadio" RadioUnCheck="True" meta:resourcekey="FIELD_registerResource1" Value="Y">
                <Items>
						<SmoothEnterpriseWebControl:CheckBoxListItem Selected="True" Text="Yes" Description="" Value="Y" GroupText="" meta:resourcekey="CheckBoxListItem1_registerResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
						<SmoothEnterpriseWebControl:CheckBoxListItem Selected="False" Text="No" Description="" Value="N" GroupText="" meta:resourcekey="CheckBoxListItem2_registerResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
					</Items>
                    <DescriptionStyle BorderStyle="NotSet" CssClass="" />
                    <GroupHeaderStyle BackColor="Gray" BorderColor="192, 192, 0" BorderStyle="NotSet"
                        CssClass="" Font-Bold="True" ForeColor="White" Gradient="Right" GradientEnd="192, 192, 0"
                        GradientLevel="100" />
                </smoothenterprisewebcontrol:checkboxlist>

				</td>
		</tr>
	</table><table border="0">
        <tr>
            <td Class="NormalBold">
                <asp:Label ID="LABEL_autologin" runat="server" meta:resourcekey="LABEL_autologinResource1"
                    Text="是否允許自動登入功能"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <smoothenterprisewebcontrol:checkboxlist ID="FIELD_autologin" runat="server" Width="120px" cssClass="Normal" CheckMode="SingleRadio" RadioUnCheck="True" meta:resourcekey="FIELD_autologinResource1" Value="Y">
                    <Items>
                        <SmoothEnterpriseWebControl:CheckBoxListItem Description="" GroupText="" meta:resourcekey="CheckBoxListItem1_registerResource1"
                            Selected="True" Text="Yes" Value="Y" />
                        <SmoothEnterpriseWebControl:CheckBoxListItem Description="" GroupText="" meta:resourcekey="CheckBoxListItem2_registerResource1"
                            Selected="False" Text="No" Value="N" />
                    </Items>
                    <DescriptionStyle BorderStyle="NotSet" CssClass="" />
                    <GroupHeaderStyle BackColor="Gray" BorderColor="192, 192, 0" BorderStyle="NotSet"
                        CssClass="" Font-Bold="True" ForeColor="White" Gradient="Right" GradientEnd="192, 192, 0"
                        GradientLevel="100" />
                </SmoothEnterpriseWebControl:CheckBoxList>
            </td>
        </tr>
    </table>
	<table>
		<tr>
			<td>
                <smoothenterprisewebcontrol:inputbutton id="BUTTON_save" Text="儲存" runat="server" backcolor="#C8C8C8"
                    bordercolor="#606060" borderstyle="Solid" borderwidth="1px" cssClass="NormalBold"
                    font-bold="True" font-names="Arial" font-size="12px" Width="80px" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_saveResource1" RunAtCient="False"><Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient></smoothenterprisewebcontrol:inputbutton>
                &nbsp;
                <smoothenterprisewebcontrol:inputbutton id="BUTTON_back" Text="回上頁" runat="server" backcolor="#C8C8C8"
                    bordercolor="#606060" borderstyle="Solid" borderwidth="1px" cssClass="NormalBold"
                    font-bold="True" font-names="Arial" font-size="12px" Width="80px" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False"><Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient></smoothenterprisewebcontrol:inputbutton>
				</td>
		</tr>
	</table>
</asp:Content>
