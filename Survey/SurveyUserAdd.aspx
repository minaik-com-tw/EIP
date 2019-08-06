<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Survey.SurveyUserAdd, App_Web_surveyuseradd.aspx.cdcab7d2" title="WebForm Add Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
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
 <script language="javascript">
	unum = 0;
</script>
<span id="step1" runat="server" Visible="true">
	<table Class="Normal">
			<tr>
				<td Class="NormalBold">
				    <asp:Label ID="LABEL_title1" runat="server" Text="第一步 : 選擇人員條件" meta:resourcekey="LABEL_title1Resource1"></asp:Label></td>
			</tr>
			<tr>
				<td Class="Normal"><SmoothEnterpriseWebControlEnterprise:SELECTCODE id="FIELD_sutype" runat="server"  ValueField="id" TextField="name"
						CodeType="sutype" cssClass="Normal" backcolor="#F0F0F0" ItemNoneDisplayed="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_sutypeResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="" OnSelectedIndexChanged="FIELD_sutype_SelectedIndexChanged"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControlEnterprise:SelectCode></td>
			</tr>
			<tr>
				<td><span id="usertype1" runat="server" Visible="false">
						<table Class="Normal">
							<tr>
								<td Class="NormalBold" bgColor="#eeeeff">&nbsp;
									<asp:Label id="LABEL_byusergroup" runat="server" Text="依使用者群組" meta:resourcekey="LABEL_byusergroupResource1"></asp:Label>
									<br>
									<SmoothEnterpriseWebControl:MULTISELECT id="MULTISELECT_group" runat="server" Font-Size="12px" Font-Names="Arial" Width="600px"
										CssClass="normalblod" Height="100px" SelectBgColor2="Silver" SelectBgColor1="204, 204, 204" Size="6" meta:resourcekey="MULTISELECT_groupResource1" Order="False" SelectedLabel="" SelectionLabel="" Value="">
                                        <LabelStyle BorderStyle="NotSet" CssClass="" />
                                    </SmoothEnterpriseWebControl:MULTISELECT></td>
							</tr>
							<tr>
								<td Class="NormalBold" bgColor="#eeeeff">&nbsp;
									<asp:Label id="LABEL_byuserrole" runat="server" Text="依使用者角色" meta:resourcekey="LABEL_byuserroleResource1"></asp:Label><br>
									<SmoothEnterpriseWebControl:multiselect id="MULTISELECT_role" runat="server" Font-Size="12px" Font-Names="Arial" Width="600px"
										CssClass="normalblod" Height="100px" SelectBgColor2="Silver" SelectBgColor1="204, 204, 204" Size="6" meta:resourcekey="MULTISELECT_roleResource1" Order="False" SelectedLabel="" SelectionLabel="" Value="">
                                        <LabelStyle BorderStyle="NotSet" CssClass="" />
                                    </SmoothEnterpriseWebControl:multiselect></td>
							</tr>
							<tr>
								<td Class="NormalBold" bgColor="#eeeeff">
									<font Class="Normal">
										<asp:Label id="LABEL_title2" runat="server" CssClass="NormalBold" Text="依名稱或帳號 (請使用 / 分隔名稱或帳號)" meta:resourcekey="LABEL_title2Resource1"></asp:Label></font><br>
									<SmoothEnterpriseWebControl:inputtext id="FIELD_username" runat="server" BackColor="#F0F0F0" CssClass="Normal" Gradient-GradientType="Top"
										Width="592px" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_usernameResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    </SmoothEnterpriseWebControl:inputtext></td>
							</tr>
						</table>
					</span>
				    <span id="usertype2" runat="server" Visible="false">
						<table Class="Normal">
							<tr>
								<td Class="NormalBold">
								    <asp:Label ID="LABEL_name" runat="server" Text="姓名" meta:resourcekey="LABEL_nameResource1"></asp:Label></td>
								<td></td>
								<td Class="NormalBold">
								    <asp:Label ID="LABEL_email" runat="server" Text="電子郵件" meta:resourcekey="LABEL_emailResource1"></asp:Label></td>
							</tr>
							<tr>
								<td><SmoothEnterpriseWebControl:inputtext id="FIELD_mailname" runat="server" BackColor="#F0F0F0" CssClass="Normal" Gradient-GradientType="Top" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_mailnameResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                </SmoothEnterpriseWebControl:inputtext></td>
								<td></td>
								<td>
									<SmoothEnterpriseWebControl:inputtext id="FIELD_mailmail" runat="server" Width="200px" BackColor="#F0F0F0" CssClass="Normal"
										Gradient-GradientType="Top" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_mailmailResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    </SmoothEnterpriseWebControl:inputtext></td>
							</tr>
						</table>
					</span>
				</td>
			</tr>
		</table>
	</span><span id="step2" runat="server" Visible="false">
		<table>
			<tr>
				<td Class="NormalBold">
					<asp:Label id="LABEL_title3" runat="server" Text="第二步 : 選擇人員" meta:resourcekey="LABEL_title3Resource1"></asp:Label>
					(<input id="checkalluser" onclick="check_all()" type="checkbox">
					<asp:Label id="LABEL_selectall" runat="server" Text="全選" meta:resourcekey="LABEL_selectallResource1"></asp:Label>)</td>
			</tr>
			<tr>
				<td Class="Normal"><asp:literal id="LITERAL_mainuser" runat="server" meta:resourcekey="LITERAL_mainuserResource1"></asp:literal></td>
			</tr>
		</table>
	</span><span id="step3" runat="server" Visible="true">
		<table>
			<tr>
				<td Class="NormalBold"><asp:literal id="LITERAL_msg" runat="server" meta:resourcekey="LITERAL_msgResource1"></asp:literal></td>
			</tr>
		</table>
	</span>
	<SmoothEnterpriseWebControl:inputbutton id="NextButton" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
		BorderColor="#606060" Font-Size="12px" Font-Names="Arial" cssClass="NormalBold" Text="下一步" Font-Bold="True" OnClick="NextButton_Click" meta:resourcekey="NextButtonResource1" RunAtCient="False">
		<Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
	</SmoothEnterpriseWebControl:inputbutton><FONT face="新細明體">&nbsp;</FONT><SmoothEnterpriseWebControl:inputbutton id="AddAllButton" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
		BorderColor="#606060" Font-Size="12px" Font-Names="Arial" Visible="False" cssClass="NormalBold" Text="直接新增" Font-Bold="True" OnClick="AddAllButton_Click" meta:resourcekey="AddAllButtonResource1" RunAtCient="False">
		<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
	</SmoothEnterpriseWebControl:inputbutton><FONT face="新細明體">&nbsp;</FONT><SmoothEnterpriseWebControl:inputbutton id="AddButton" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
		BorderColor="#606060" Font-Size="12px" Font-Names="Arial" Width="80px" Visible="False" cssClass="NormalBold" Text="新增" Font-Bold="True" OnClick="AddButton_Click" meta:resourcekey="AddButtonResource1" RunAtCient="False">
		<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
	</SmoothEnterpriseWebControl:inputbutton><FONT face="新細明體">&nbsp;</FONT><SmoothEnterpriseWebControl:inputbutton id="AgainButton" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
		BorderColor="#606060" Font-Size="12px" Font-Names="Arial" Width="80px" Visible="False" cssClass="NormalBold" Text="繼續操作" Font-Bold="True" OnClick="AgainButton_Click" meta:resourcekey="AgainButtonResource1" RunAtCient="False">
		<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
	</SmoothEnterpriseWebControl:inputbutton><FONT face="新細明體">&nbsp;</FONT><SmoothEnterpriseWebControl:inputbutton id="BackButton" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
		BorderColor="#606060" Font-Size="12px" Font-Names="Arial" Width="80px" cssClass="NormalBold" Text="回上頁" Font-Bold="True" OnClick="BackButton_Click" meta:resourcekey="BackButtonResource1" RunAtCient="False">
		<Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
	</SmoothEnterpriseWebControl:inputbutton>
	<script language="javascript">
function check_all()
{
	if (document.all('checkalluser').checked==false)
	{
		for (i=1;i<=unum;i++){document.all('user_'+i).checked=false;}
	}
	else
	{
		for (i=1;i<=unum;i++){document.all('user_'+i).checked=true;}
	}
}
</script>
</asp:Content>


