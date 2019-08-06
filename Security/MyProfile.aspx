<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Security.MyProfile, App_Web_myprofile.aspx.cdcab7d2" title="Untitled Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
		<CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table Class="Normal" id="TABLE1" border="0" runat="server">
		<tr Class="NormalBold">
			<td vAlign="top">
				<table Class="Normal" border="0" runat="server">
					<tr Class="NormalBold">
						<td>
							<asp:Label ID="LABEL_logonid" runat="server" Text="帳號" meta:resourcekey="LABEL_logonidResource1" Visible="False"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_logonid" runat="server" BackColor="#F0F0F0" CssClass="Normal" MaxLength="50"
								Gradient-GradientType="Top" Required="True" ErrorMessage="Please Input「Logon ID」!!" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_logonidResource1" OnClickMore="" Personalize="False" Visible="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" />
                        </SmoothEnterpriseWebControl:inputtext><asp:customvalidator id="V_FIELD_logonid" runat="server" ErrorMessage="此帳號已經存在!!" EnableClientScript="False"
								ControlToValidate="FIELD_logonid" Display="None" meta:resourcekey="V_FIELD_logonidResource1" Visible="False"></asp:customvalidator><SmoothEnterpriseWebControl:inputtext id="FIELD_ologonid" runat="server" BackColor="#F0F0F0" Width="0px" CssClass="Normal"
								MaxLength="50" ErrorMessage="Please Input「Logon Id」!!" HiddenMode="True" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_ologonidResource1" OnClickMore="" Personalize="False" Required="False" Visible="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                    <ErrorStyle BorderStyle="NotSet" />
                                </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr Class="NormalBold">
						<td>
							<asp:Label ID="LABEL_name" runat="server" Text="姓名" meta:resourcekey="LABEL_nameResource1" Visible="False"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_name" runat="server" BackColor="#F0F0F0" CssClass="Normal" MaxLength="50"
								Gradient-GradientType="Top" Required="True" ErrorMessage="Please Input「Name」!!" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nameResource1" OnClickMore="" Personalize="False" Visible="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr Class="NormalBold">
						<td>
							<asp:Label ID="LABEL_email" runat="server" Text="E-mail" meta:resourcekey="LABEL_emailResource1" Visible="False"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_email" runat="server" BackColor="#F0F0F0" Width="300px" CssClass="Normal"
								MaxLength="100" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_emailResource1" OnClickMore="" Personalize="False" Required="False" Visible="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
				</table>
			</td>
			<td height="1" id="TD_line" runat="server" style="width: 1px"><FONT face="新細明體"></FONT><span
					clear="all"></span></td>
			<td vAlign="top" id="TD_photo" runat="server">
				<table Class="Normal" border="0">
					<tr Class="NormalBold">
						<td>
                            可上傳自己最喜歡的照片喔!<br />
                            (請勿超過100K)</td>
					</tr>
					<tr Class="NormalBold">
						<td><SmoothEnterpriseWebControl:inputfile id="FIELD_photo" runat="server" Width="300px" backcolor="#F0F0F0" cssClass="Normal" meta:resourcekey="FIELD_photoResource1"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:InputFile></td>
					</tr>
					<tr>
						<td><IMG id="PREVIEW_photo" alt="" src="/lib/img/img-noimage.gif" runat="server"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<table Class="Normal" border="0">
		<tr>
			<td><SmoothEnterpriseWebControl:inputbutton id="BUTTON_save" runat="server" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
					Font-Names="Arial" Font-Size="12px" BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom"
					width="80px" Text="儲存" Font-Bold="True" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_saveResource1" RunAtCient="False">
                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
            </SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BUTTON_back" runat="server" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
					Font-Names="Arial" Font-Size="12px" BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom"
					width="80px" Text="回上頁" Font-Bold="True" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BUTTON_changepwd" runat="server" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
					Font-Names="Arial" Font-Size="12px" BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom"
					Text="變更密碼" Font-Bold="True" OnClick="BUTTON_changepwd_Click" meta:resourcekey="BUTTON_changepwdResource1" RunAtCient="False" CausesValidation="False" Enabled="False" EnableTheming="False" EnableViewState="False" UseSubmitBehavior="False" Visible="false">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControl:inputbutton></td>
		</tr>
	</table>
	<asp:label id="L_errmsg" runat="server" Visible="False" meta:resourcekey="L_errmsgResource1">You were not logon SmoothEnterprise.NET<br><br><a href="login.aspx">
			Please login with user account</a></asp:label>
</asp:Content>
