<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Security.Password, App_Web_password.aspx.cdcab7d2" title="Untitled Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

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
	<table Class="Normal" style="BORDER-RIGHT: #d3d9f0 1px solid; BORDER-TOP: #d3d9f0 1px solid; FILTER: progid: DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#00DBE2FF, endcolorstr=#ddffffff); BORDER-LEFT: #d3d9f0 1px solid; COLOR: #2d387b; BORDER-BOTTOM: #d3d9f0 1px solid"
		cellSpacing="0" cellPadding="5" width="70%" bgColor="lavender">
		<TR Class="NormalBold">
			<td width="1%" style="PADDING-LEFT: 10px"><IMG src="img/bullet-circle1.gif" border="0"></td>
			<TD><asp:Label ID="LABEL_logonid" runat="server" Text="�д��ѱz���U���b��:" meta:resourcekey="LABEL_logonidResource1"></asp:Label></TD>
			<td width="1%"></td>
		</TR>
		<TR>
			<td></td>
			<TD><SmoothEnterpriseWebControl:INPUTTEXT id="FIELD_logonid" runat="server" BackColor="Lavender" CssClass="Normal" ErrorMessage="Please Input �uLogon ID�v!!"
					Required="False" MaxLength="50" HiddenMode="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_logonidResource1" OnClickMore="" Personalize="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext><FONT face="�s�ө���"></FONT></TD>
		</TR>
		<TR Class="NormalBold">
			<td width="1%" style="PADDING-LEFT: 10px"><IMG src="img/bullet-circle2.gif" border="0"></td>
			<TD><asp:Label ID="LABEL_selection" runat="server" Text="�п�ܤU�C�覡�Ө��o�z�b�����K�X:" meta:resourcekey="LABEL_selectionResource1"></asp:Label></TD>
		</TR>
		<tr>
			<td></td>
			<td style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; PADDING-TOP: 10px; BACKGROUND-COLOR: #e0e0ff">
				<table Class="Normal" style="COLOR: #2d387b" cellSpacing="5" cellPadding="0">
					<tr>
						<td><INPUT id="select1" type="radio" CHECKED value="select1" name="select" runat="server"></td>
						<td noWrap><asp:Label ID="LABEL_byemail" runat="server" Text="�N�ڪ��K�X����Email�ܵ��U�b���ҳ]�w���q�l�l��a�}" meta:resourcekey="LABEL_byemailResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><FONT face="�s�ө���"><INPUT id="select2" type="radio" value="select2" name="select" runat="server"></FONT></td>
						<td nowrap><asp:Label ID="LABEL_bypwdhint" runat="server" Text="�̧کҳ]�w���K�X���ܰ��D�P���סA������e���W���" meta:resourcekey="LABEL_bypwdhintResource1"></asp:Label></td>
					</tr>
					<tr>
						<td height="30"></td>
						<td><table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<SmoothEnterpriseWebControlEnterprise:SelectCode id="FIELD_pwdhintid" runat="server" Width="180px" cssClass="Normal" backcolor="Lavender"
											ValueField="id" TextField="name" CodeType="pwdhint" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_pwdhintidResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="">
											<Items>
												<SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="- No item selected  -" Selected="False" IconUrl=""
													GroupText="" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItemResource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
											</Items>
										<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControlEnterprise:SelectCode></td>
									<td><img src="img/img-arrowblue.gif" border="0" hspace="3"></td>
									<td><SmoothEnterpriseWebControl:InputText id="FIELD_pwdanswer" runat="server" BackColor="Lavender" CssClass="Normal"
											Width="180px" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_pwdanswerResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    </SmoothEnterpriseWebControl:inputtext></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td><FONT face="�s�ө���"><INPUT id="select3" type="radio" value="select3" name="select" runat="server"></FONT></td>
						<td nowrap><asp:Label ID="LABEL_bymanager" runat="server" Text="�L�k���o�K�X�A���ѭӤH������ơA�Шt�κ޲z�̳B�z" meta:resourcekey="LABEL_bymanagerResource1"></asp:Label></td>
					</tr>
					<tr>
						<td></td>
						<td>
							<SmoothEnterpriseWebControl:InputText id="FIELD_managermsg" runat="server" BackColor="Lavender" Width="400px" CssClass="Normal"
								Gradient-GradientType="Top" TextMode="MultiLine" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_managermsgResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr height="40">
			<td></td>
			<td>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BUTTON_ok" runat="server" Text="�T�w" Gradient-GradientType="Bottom" CssClass="NormalBold"
					BackColor="Lavender" BorderColor="#BDBDDD" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial" Font-Size="12px"
					Font-Bold="True" ForeColor="#464688" Width="80px" OnClick="BUTTON_ok_Click" meta:resourcekey="BUTTON_okResource1" RunAtCient="False">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BUTTON_back" runat="server" Text="�^�W��" Gradient-GradientType="Bottom" CssClass="NormalBold"
					BackColor="Lavender" BorderColor="#BDBDDD" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial" Font-Size="12px"
					Font-Bold="True" ForeColor="#464688" Width="80px" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControl:inputbutton>
			</td>
		</tr>
		<tr>
			<td height="10"></td>
		</tr>
	</table>
</asp:Content>
