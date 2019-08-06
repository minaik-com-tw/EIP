<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Security.ChangePassword, App_Web_changepassword.aspx.cdcab7d2" title="Untitled Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Application.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
		<CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<SmoothEnterpriseWebControl:InputText id="FIELD_id" runat="server" BackColor="#F0F0F0" CssClass="Normal" HiddenMode="True"
		ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_idResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
        <ErrorStyle BorderStyle="NotSet" CssClass="" />
    </SmoothEnterpriseWebControl:inputtext>
	<SmoothEnterpriseWebControl:InputText id="FIELD_ustatus" runat="server" BackColor="#F0F0F0" CssClass="Normal"
		ReadOnly="True" HiddenMode="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_ustatusResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
        <ErrorStyle BorderStyle="NotSet" CssClass="" />
    </SmoothEnterpriseWebControl:inputtext>
	<table Class="Normal" border="0" id="TABLE1" runat="server">
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_pwd" runat="server" Text="密碼" meta:resourcekey="LABEL_pwdResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext id="FIELD_pwd" runat="server" CssClass="Normal" BackColor="#F0F0F0"
					TextMode="Password" MaxLength="50" Required="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="Please Input「Password」!!" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_pwdResource1" OnClickMore="" Personalize="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" />
            </SmoothEnterpriseWebControl:inputtext>
				<SmoothEnterpriseWebControl:InputText id="FIELD_opwd" runat="server" BackColor="#F0F0F0" CssClass="Normal"
					ReadOnly="True" HiddenMode="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_opwdResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:inputtext>
				<asp:comparevalidator id="V_FIELD_opwd" runat="server" ControlToCompare="FIELD_opwd" EnableClientScript="False"
					ControlToValidate="FIELD_pwd" Display="None" ErrorMessage="請輸入與原本不同的新密碼!!" Operator="NotEqual" meta:resourcekey="V_FIELD_opwdResource1"></asp:comparevalidator></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_pwd_confirm" runat="server" Text="密碼確認" meta:resourcekey="LABEL_pwd_confirmResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext id="FIELD_pwd_confirm" runat="server" CssClass="Normal"
					BackColor="#F0F0F0" TextMode="Password" MaxLength="50" Required="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_pwd_confirmResource1" OnClickMore="" Personalize="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext><asp:comparevalidator id="V_FIELD_pwd_confirm" runat="server" ErrorMessage="密碼確認有誤!!" Display="None" ControlToValidate="FIELD_pwd"
					EnableClientScript="False" ControlToCompare="FIELD_pwd_confirm" meta:resourcekey="V_FIELD_pwd_confirmResource1"></asp:comparevalidator></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_pwdhint" runat="server" Text="密碼提示" meta:resourcekey="LABEL_pwdhintResource1"></asp:Label></td>
		</tr>
		<tr>
			<td>
				<SmoothEnterpriseWebControlEnterprise:SelectCode id="FIELD_pwdhintid" runat="server" Width="300px" ValueField="id" TextField="name"
					CodeType="pwdhint" backcolor="White" cssClass="Normal" ItemNoneDisplayed="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_pwdhintidResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="">
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
				<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControlEnterprise:SelectCode></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_pwdanswer" runat="server" Text="密碼提示答案" meta:resourcekey="LABEL_pwdanswerResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext id="FIELD_pwdanswer" runat="server" CssClass="Normal"
					BackColor="#F0F0F0" Width="300px" MaxLength="50" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_pwdanswerResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputbutton id="BUTTON_save" runat="server" Gradient-GradientType="Bottom" CssClass="NormalBold"
					BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial" Font-Size="12px"
					Font-Bold="True" Text="儲存" width="80px" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_saveResource1" RunAtCient="False">
                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
            </SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BUTTON_cancel" runat="server" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
					Font-Names="Arial" Font-Size="12px" BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom"
					width="80px" Text="取消" Font-Bold="True" OnClick="BUTTON_cancel_Click" meta:resourcekey="BUTTON_cancelResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton></td>
		</tr>
	</table>
</asp:Content>
