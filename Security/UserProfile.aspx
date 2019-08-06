<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Security.UserProfile, App_Web_userprofile.aspx.cdcab7d2" title="Untitled Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

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
	<table Class="Normal" border="0">
		<tr>
			<td vAlign="top">
				<table Class="Normal" border="0">
					<TBODY>
						<!--tr Class="NormalBold">
							<td id="LABEL_utype" runat="server">使用者類別</td>
						</tr>
						<tr>
							<td><SmoothEnterpriseWebControl:inputtext id="FIELD_utype" runat="server" CssClass="PanelWhite" name="FIELD_utype" readonly="true"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td>
						</tr>
						<tr Class="NormalBold">
							<td id="LABEL_logonid" runat="server">帳號</td>
						</tr>
						<tr>
							<td><SmoothEnterpriseWebControl:inputtext id="FIELD_logonid" runat="server" CssClass="PanelWhite" name="FIELD_logonid" readonly="true"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td>
						</tr-->
						<tr Class="NormalBold">
							<td><asp:Label ID="LABEL_name" runat="server" Text="名稱" meta:resourcekey="LABEL_nameResource1"></asp:Label></td>
						</tr>
						<tr>
							<td><SmoothEnterpriseWebControl:inputtext id="FIELD_name" runat="server" Width="250px" CssClass="PanelWhite" readonly="True"
									name="FIELD_name" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nameResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:inputtext></td>
						</tr>
						<tr Class="NormalBold">
							<td><asp:Label ID="LABEL_name1" runat="server" Text="暱稱" meta:resourcekey="LABEL_name1Resource1"></asp:Label></td>
						</tr>
						<tr>
							<td><SmoothEnterpriseWebControl:inputtext id="FIELD_name1" runat="server" Width="250px" CssClass="PanelWhite" readonly="True"
									name="FIELD_name1" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_name1Resource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:inputtext></td>
						</tr>
						<tr Class="NormalBold">
							<td><asp:Label ID="LABEL_gid" runat="server" Text="群組" meta:resourcekey="LABEL_gidResource1"></asp:Label></td>
						</tr>
						<tr>
							<td>
								<SmoothEnterpriseWebControl:inputtext id="FIELD_gid" runat="server" Width="250px" CssClass="PanelWhite" readonly="True"
									name="FIELD_gid" DESIGNTIMEDRAGDROP="665" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_gidResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                </SmoothEnterpriseWebControl:inputtext></td>
						</tr>
						<tr Class="NormalBold">
							<td><asp:Label ID="LABEL_email" runat="server" Text="E-mail" meta:resourcekey="LABEL_emailResource1"></asp:Label></td>
						</tr>
						<tr>
							<td vAlign="bottom">
								<asp:HyperLink id="FIELD_email" runat="server" Width="250px" CssClass="PanelWhite" Height="21px" meta:resourcekey="FIELD_emailResource1">HyperLink</asp:HyperLink></td>
						</tr>
						<tr Class="NormalBold">
							<td><asp:Label ID="LABEL_gender" runat="server" Text="性別" meta:resourcekey="LABEL_genderResource1"></asp:Label></td>
						</tr>
						<tr>
							<td>
								<asp:Image id="IMAGE_gender" runat="server" Visible="False" meta:resourcekey="IMAGE_genderResource1"></asp:Image>
								<SmoothEnterpriseWebControl:inputtext id="FIELD_gender" runat="server" Width="20px" CssClass="PanelWhite" readonly="True"
									name="FIELD_gid" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_genderResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                </SmoothEnterpriseWebControl:inputtext></td>
						</tr>
						<tr Class="NormalBold">
							<td><asp:Label ID="LABEL_remark" runat="server" Text="備註" meta:resourcekey="LABEL_remarkResource1"></asp:Label></td>
						</tr>
						<tr>
							<td><SmoothEnterpriseWebControl:inputtext id="FIELD_remark" runat="server" Width="250px" CssClass="PanelWhite" Height="65px"
									readonly="True" name="FIELD_remark" TextMode="MultiLine" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_remarkResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:inputtext></td>
						</tr>
					</TBODY>
				</table>
			</td>
			<td vAlign="top">
				<table Class="Normal" border="0">
					<TBODY>
						<tr Class="NormalBold">
							<td><asp:Label ID="LABEL_photo" runat="server" Text="照片" meta:resourcekey="LABEL_photoResource1"></asp:Label></td>
						</tr>
						<tr>
							<td><IMG id="PREVIEW_photo" alt="" src="/lib/img/img-noimage.gif" runat="server"></td>
						</tr>
					</TBODY>
				</table>
			</td>
		</tr>
	</table>
	<table id="Table1" cellSpacing="0" cellPadding="0" border="0">
		<tr>
			<td colSpan="1"></td>
			<td><SmoothEnterpriseWebControl:inputbutton id="BUTTON_back" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold" Font-Bold="True" Text="回上頁"
					width="80px" Gradient-GradientType="Bottom" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControl:inputbutton>&nbsp;</td>
		</tr>
	</table>
</asp:Content>
