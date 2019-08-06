<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Security.RegisterWindowUser, App_Web_registerwindowuser.aspx.cdcab7d2" title="Untitled Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
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
	<table cellpadding="0" cellspacing="0" width="70%">
		<tr>
			<td>
				<table Class="Normal" bgColor="lavender" style="BORDER-RIGHT: #d3d9f0 1px solid; BORDER-TOP: #d3d9f0 1px solid; FILTER: progid: DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#00DBE2FF, endcolorstr=#ddffffff); BORDER-LEFT: #d3d9f0 1px solid; COLOR: #2d387b; BORDER-BOTTOM: #d3d9f0 1px solid"
					cellSpacing="0" cellPadding="5" width="100%">
					<TR>
						<TD style="PADDING-LEFT: 10px" vAlign="top" align="center" height="20" width="1%"><IMG src="img/bullet-circle2.gif" border="0"></TD>
						<TD height="20"><asp:Label ID="LABEL_register_memo" runat="server" Text="請輸入註冊帳號資訊：" Font-Bold="True" meta:resourcekey="LABEL_register_memoResource1"></asp:Label></TD>
						<TD height="20"></TD>
					</TR>
					<tr>
						<td style="PADDING-LEFT: 10px" vAlign="top" align="center"></td>
						<td style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; PADDING-TOP: 10px; BACKGROUND-COLOR: #e0e0ff">
							<table Class="Normal" border="0" style="COLOR: #2d387b" cellSpacing="5" cellPadding="0"
								width="520">
								<tr Class="NormalBold">
									<td><asp:Label ID="LABEL_logonid" runat="server" Text="帳號 :" meta:resourcekey="LABEL_logonidResource1"></asp:Label></td>
								</tr>
								<tr>
									<td><SmoothEnterpriseWebControl:inputtext id="FIELD_logonid" runat="server" Required="True" ErrorMessage="Please Input「Logon Id」!!"
											MaxLength="50" CssClass="Normal" BackColor="Lavender" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_logonidResource1" OnClickMore="" Personalize="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    </SmoothEnterpriseWebControl:inputtext><asp:customvalidator id="V_FIELD_logonid" runat="server" ErrorMessage="此帳號已經存在!!" EnableClientScript="False"
											ControlToValidate="FIELD_logonid" Display="None" meta:resourcekey="V_FIELD_logonidResource1"></asp:customvalidator></td>
								</tr>
								<tr Class="NormalBold">
									<td><asp:Label ID="LABEL_name" runat="server" Text="姓名 :" meta:resourcekey="LABEL_nameResource1"></asp:Label></td>
								</tr>
								<tr>
									<td><SmoothEnterpriseWebControl:inputtext id="FIELD_name" runat="server" Required="True" ErrorMessage="Please Input「Name」!!"
											MaxLength="50" CssClass="Normal" BackColor="Lavender" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nameResource1" OnClickMore="" Personalize="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    </SmoothEnterpriseWebControl:inputtext></td>
								</tr>
								<tr Class="NormalBold">
									<td><asp:Label ID="LABEL_email" runat="server" Text="E-mail :" meta:resourcekey="LABEL_emailResource1"></asp:Label></td>
								</tr>
								<tr>
									<td><SmoothEnterpriseWebControl:inputtext id="FIELD_email" runat="server" MaxLength="100" CssClass="Normal"
											Width="300px" BackColor="Lavender" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_emailResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    </SmoothEnterpriseWebControl:inputtext></td>
								</tr>
							</table>
						</td>
						<TD><FONT face="新細明體"></FONT></TD>
					</tr>
					<tr>
						<td></td>
						<td height="40">
							<SmoothEnterpriseWebControl:inputbutton id="BUTTON_save" Text="儲存" runat="server" BackColor="Lavender" Font-Size="12px" Font-Names="Arial"
								Width="80px" BorderColor="#BDBDDD" BorderStyle="Solid" BorderWidth="1px" Gradient-GradientType="Bottom" Font-Bold="True"
								cssClass="NormalBold" ForeColor="#464688" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_saveResource1" RunAtCient="False">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                            </SmoothEnterpriseWebControl:inputbutton>&nbsp;
							<SmoothEnterpriseWebControl:inputbutton id="BUTTON_back" Text="回上頁" runat="server" BackColor="Lavender" Font-Size="12px"
								Font-Names="Arial" Width="80px" BorderColor="#BDBDDD" BorderStyle="Solid" BorderWidth="1px" Gradient-GradientType="Bottom"
								Font-Bold="True" cssClass="NormalBold" ForeColor="#464688" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                            </SmoothEnterpriseWebControl:inputbutton>
						</td>
						<TD height="40"></TD>
					</tr>
					<tr>
						<td height="5"></td>
						<TD height="5"></TD>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</asp:Content>
