<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Content.ContentNotice, App_Web_contentnotice.aspx.cdcab7d2" title="內容更新通知" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Application.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>    
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
		</tr>
	</table>
	<table Class="Normal" border="0">
		<tr>
			<td vAlign="top">
				<table>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_to" runat="server" Text="收件者" meta:resourcekey="LABEL_toResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:checkboxlist id="FIELD_to" runat="server" Width="88px" cssClass="Normal" ListDirection="Horizontal" meta:resourcekey="FIELD_toResource1" Value="Y">
								<GroupHeaderStyle Font-Bold="True" GradientEnd="192, 192, 0" ForeColor="White" GradientLevel="100"
									Gradient="Right" BorderColor="192, 192, 0" BackColor="Gray" BorderStyle="NotSet" CssClass=""></GroupHeaderStyle>
								<Items>
									<SmoothEnterpriseWebControl:CheckBoxListItem Selected="True" Text="Site User" Description="" Value="Y" GroupText=""></SmoothEnterpriseWebControl:CheckBoxListItem>
								</Items>
                            <DescriptionStyle BorderStyle="NotSet" CssClass="" />
							</SmoothEnterpriseWebControl:checkboxlist></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_cc" runat="server" Text="副本收件者" meta:resourcekey="LABEL_ccResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_cc" runat="server" BackColor="#F0F0F0" Width="420px" CssClass="Normal"
								ErrorMessage="請輸入「副本收件者」!!" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_ccResource1" OnClickMore="" Personalize="False" Required="False" ><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_attach" runat="server" Text="夾檔" meta:resourcekey="LABEL_attachResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:checkboxlist id="FIELD_attach" runat="server" cssClass="Normal" ListDirection="Horizontal" meta:resourcekey="FIELD_attachResource1" Value="Y" Width="300px">
								<GroupHeaderStyle Font-Bold="True" GradientEnd="192, 192, 0" ForeColor="White" GradientLevel="100"
									Gradient="Right" BorderColor="192, 192, 0" BackColor="Gray" BorderStyle="NotSet" CssClass=""></GroupHeaderStyle>
								<Items>
									<SmoothEnterpriseWebControl:CheckBoxListItem Selected="True" Text="Master File" Description="" Value="Y" GroupText=""></SmoothEnterpriseWebControl:CheckBoxListItem>
								</Items>
                            <DescriptionStyle BorderStyle="NotSet" CssClass="" />
							</SmoothEnterpriseWebControl:checkboxlist></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_subject" runat="server" Text="主旨" meta:resourcekey="LABEL_subjectResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_subject" tabIndex="108" runat="server" BackColor="#F0F0F0" Width="420px"
								CssClass="Normal" Required="True" MaxLength="255" ErrorMessage="請輸入「主旨」!!"  Personalize="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_subjectResource1" OnClickMore=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_mailmessage" runat="server" Text="內容備註" meta:resourcekey="LABEL_mailmessageResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputhtml id="FIELD_mailmessage" runat="server" Width="412px"  Height="120px"
								cssClass="Normal" backcolor="#F0F0F0" ErrorMessage="" Gradient="Left" imgSrc="" IsValid="True" meta:resourcekey="FIELD_mailmessageResource1" Mode="Advance" Value="">
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputhtml></td>
					</tr>
				</table>
			</td>
			<td vAlign="top" width="10" background="/lib/img/vline.gif">&nbsp;</td>
			<td vAlign="top">
				<table>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_attachfunctionset" runat="server" Text="夾檔附件 (功能集合)" meta:resourcekey="LABEL_attachfunctionsetResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:multiselect id="FIELD_attachfunctionset" runat="server" Font-Size="12px" Font-Names="Arial"
								Width="402px" CssClass="normalblod" Size="5" SelectionLabel="所有附件" SelectedLabel="已選取附件" SelectBgColor1="204, 204, 204"
								SelectBgColor2="Silver" meta:resourcekey="FIELD_attachfunctionsetResource1" Order="False" Value="">
								<LabelStyle Font-Size="12px" Font-Names="Arial" Font-Bold="True" BorderStyle="NotSet" CssClass=""></LabelStyle>
							</SmoothEnterpriseWebControl:multiselect></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_attachfile" runat="server" Text="夾檔方式" meta:resourcekey="LABEL_attachfileResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:checkboxlist id="FIELD_attachfile" runat="server" cssClass="Normal" ListDirection="Horizontal" meta:resourcekey="FIELD_attachfileResource1" Value="Y" Width="300px">
								<GroupHeaderStyle Font-Bold="True" GradientEnd="192, 192, 0" ForeColor="White" GradientLevel="100"
									Gradient="Right" BorderColor="192, 192, 0" BackColor="Gray" BorderStyle="NotSet" CssClass=""></GroupHeaderStyle>
								<Items>
									<SmoothEnterpriseWebControl:CheckBoxListItem Selected="True" Text="實體檔案" Description="" Value="Y" GroupText="" meta:resourcekey="CheckBoxListItem_attachfileResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
								</Items>
                            <DescriptionStyle BorderStyle="NotSet" CssClass="" />
							</SmoothEnterpriseWebControl:checkboxlist></td>
					</tr>
					<tr>
						<td><asp:regularexpressionvalidator id="ToRegularExpressionValidator2" runat="server" ErrorMessage="Invaild Cc Email Address!!!"
								ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="FIELD_cc" meta:resourcekey="ToRegularExpressionValidator2Resource1"></asp:regularexpressionvalidator></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<table border="0">
		<tr>
			<td><SmoothEnterpriseWebControl:inputbutton id="BUTTON_send" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" Width="80px" cssClass="NormalBold" Font-Bold="True"
					Text="送出" OnClick="BUTTON_send_Click" meta:resourcekey="BUTTON_sendResource1" RunAtCient="False">
					<Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
				</SmoothEnterpriseWebControl:inputbutton></td>
		</tr>
	</table>
</asp:Content>
