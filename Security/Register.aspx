<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Security.Register, App_Web_register.aspx.cdcab7d2" title="Untitled Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
					<TR Class="Normal">
						<td width="1%" style="PADDING-LEFT: 10px"><IMG src="img/bullet-circle1.gif" border="0" vspace="2"></td>
						<TD><asp:Label ID="LABEL_utype" runat="server"
                                Text="<b>�п�ܱz���{�Ҥ覡&nbsp;:</b> (�ثe�t�δ��ѤU�C���b���K�X�ˬd�覡)" meta:resourcekey="LABEL_utypeResource1"></asp:Label></TD>
						<td width="1%"></td>
					</TR>
					<tr>
						<td></td>
						<td style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; PADDING-TOP: 10px; BACKGROUND-COLOR: #e0e0ff">
							<table Class="Normal" style="COLOR: #2d387b" cellSpacing="5" cellPadding="0" width="520">
								<tr id="TR_smooth1" runat="server">
									<td>
										<asp:RadioButton id="FIELD_Smooth" runat="server" Checked="True" GroupName="select" meta:resourcekey="FIELD_SmoothResource1"></asp:RadioButton></td>
									<td><asp:Label ID="LABEL_smoothutype" runat="server" Text="SmoothEnterprise.NET ���ػ{�Ҥ覡�G" Font-Bold="True" meta:resourcekey="LABEL_smoothutypeResource1"></asp:Label></td>
								</tr>
								<tr id="TR_smooth2" runat="server">
									<td></td>
									<td style="LINE-HEIGHT: 18px"><asp:Label ID="LABEL_smoothutype_memo"
                                            runat="server" Text="�W�߫����Ψt�Ϊ��ϥΪ̱b���{�ҼҦ��A�A�Ω���~�����Υ~���ϥΪ̪��̨Φw���ʵn�J�޲z�A�P�ɤ]�W�ߩ���~�������ϥΪ̺޲z" meta:resourcekey="LABEL_smoothutype_memoResource1"></asp:Label></td>
								</tr>
								<tr id="TR_ad1" runat="server">
									<td>
										<asp:RadioButton id="FIELD_AD" runat="server" GroupName="select" meta:resourcekey="FIELD_ADResource1"></asp:RadioButton></td>
									<td><asp:Label ID="LABEL_adutype" runat="server" Text="Active Directory �{�Ҥ覡�G" Font-Bold="True" meta:resourcekey="LABEL_adutypeResource1"></asp:Label></td>
								</tr>
								<tr id="TR_ad2" runat="server">
									<td></td>
									<td style="LINE-HEIGHT: 18px"><asp:Label ID="LABEL_adutype_memo" runat="server" Text="�t�X���~ Active 
										Directory �[�c���ϥΪ̱b���n�J�{�Ҥ覡�A�n�J���b�������O�w�s�b�� Active Directory �����U�b���A�����b�����n�J���q�A�����q�L���쪺 
										Active Directory �{��" meta:resourcekey="LABEL_adutype_memoResource1"></asp:Label></td>
								</tr>
								<tr id="TR_ad3" runat="server">
									<td></td>
									<td><table Class="Normal" style="COLOR: #2d387b" cellpadding="0" cellspacing="0">
											<tr>
												<td nowrap><asp:Label ID="LABEL_userdomain" runat="server" Text="�n�J����" Font-Bold="True" meta:resourcekey="LABEL_userdomainResource1"></asp:Label></td>
												<td><SmoothEnterpriseWebControl:InputText id="FIELD_userdomain" runat="server" BackColor="Lavender" Width="208px" CssClass="Normal"
														Gradient-GradientType="Top" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_userdomainResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                                </SmoothEnterpriseWebControl:inputtext></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr id="TR_win1" runat="server">
									<td>
										<asp:RadioButton id="FIELD_Window" runat="server" GroupName="select" meta:resourcekey="FIELD_WindowResource1"></asp:RadioButton></td>
									<td><asp:Label ID="LABEL_windowutype" runat="server" Text="��XWindows �{�Ҥ覡�G" Font-Bold="True" meta:resourcekey="LABEL_windowutypeResource1"></asp:Label></td>
								</tr>
								<tr id="TR_win2" runat="server">
									<td></td>
									<td style="LINE-HEIGHT: 18px"><asp:Label
                                            ID="LABEL_windowutype_memo" runat="server" Text="�t�X�ϥΪ̺ݪ��n�J�{��(Windows 
										�� Active Directory)�A�t�η|�۰ʰ����ثe�n�J�b���A�ð���{�ҳB�z�A���ݦA��J�b���αK�X" meta:resourcekey="LABEL_windowutype_memoResource1"></asp:Label></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td></td>
						<td height="40">
							<SmoothEnterpriseWebControl:InputButton id="BUTTON_next" runat="server" BackColor="Lavender" Font-Size="12px" Font-Names="Arial"
								Width="80px" BorderColor="#BDBDDD" BorderStyle="Solid" BorderWidth="1px" Gradient-GradientType="Bottom" Font-Bold="True"
								cssClass="NormalBold" Text="�U�@�B" ForeColor="#464688" OnClick="BUTTON_next_Click" meta:resourcekey="BUTTON_nextResource1" RunAtCient="False">
								<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
							</SmoothEnterpriseWebControl:InputButton>&nbsp;
							<SmoothEnterpriseWebControl:InputButton id="BUTTON_cancel" runat="server" BackColor="Lavender" Font-Size="12px" Font-Names="Arial"
								Width="80px" BorderColor="#BDBDDD" BorderStyle="Solid" BorderWidth="1px" Gradient-GradientType="Bottom" Font-Bold="True"
								cssClass="NormalBold" Text="����" ForeColor="#464688" OnClick="BUTTON_cancel_Click" meta:resourcekey="BUTTON_cancelResource1" RunAtCient="False">
								<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
							</SmoothEnterpriseWebControl:InputButton>
						</td>
					</tr>
					<tr>
						<td height="5"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</asp:Content>
