<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Portal.MyReminderAdd, App_Web_myreminderadd.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Application.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
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
	<table Class="Normal" border="0">
		<tr>
			<td valign="top">
				<table Class="Normal" border="0">
					<tr Class="NormalBold">
						<td>
						    <asp:Label ID="LABEL_reminddate" runat="server" Text="啟用時間" meta:resourcekey="LABEL_reminddateResource1"></asp:Label></td>
					</tr>
					<tr>
						<td>
							<SmoothEnterpriseWebControl:InputText id="FIELD_reminddate" runat="server" BackColor="#F0F0F0" CssClass="Normal" Required="True"
								FormatType="DateTime" ErrorMessage="請輸入「啟用時間」!!" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_reminddateResource1" OnClickMore="" Personalize="False">
<ErrorStyle BorderStyle="NotSet"></ErrorStyle>
<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr Class="NormalBold">
						<td>
						    <asp:Label ID="LABEL_reminderto" runat="server" Text="收件人" meta:resourcekey="LABEL_remindertoResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_reminderto" runat="server" Width="200px" BackColor="#F0F0F0"
								CssClass="Normal" Required="True" ErrorMessage="請輸入「收件人」!!" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_remindertoResource1" OnClickMore="" Personalize="False">
<ErrorStyle BorderStyle="NotSet"></ErrorStyle>
<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr Class="NormalBold">
						<td>
						    <asp:Label ID="LABEL_subject" runat="server" Text="郵件主旨" meta:resourcekey="LABEL_subjectResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_subject" runat="server" Width="300px" BackColor="#F0F0F0" 
								CssClass="Normal" Required="True" ErrorMessage="請輸入「主旨」!!" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_subjectResource1" OnClickMore="" Personalize="False">
<ErrorStyle BorderStyle="NotSet"></ErrorStyle>
<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr Class="NormalBold">
						<td>
						    <asp:Label ID="LABEL_details" runat="server" Text="郵件內容" meta:resourcekey="LABEL_detailsResource1"></asp:Label></td>
					</tr>
					<tr>
						<td>
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_details" runat="server" BackColor="#F0F0F0"
                                CssClass="Normal" ErrorMessage="請輸入「內容」!!" FormatType="HTML" Height="100px" IsValid="True"
                                meta:resourcekey="FIELD_detailsResource1" Width="360px">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
					</tr>
					<tr Class="NormalBold">
						<td>
						    <asp:Label ID="LABEL_closedate" runat="server" Text="結束時間" meta:resourcekey="LABEL_closedateResource1"></asp:Label></td>
					</tr>
					<tr>
						<td>
							<SmoothEnterpriseWebControl:InputText id="FIELD_closedate" runat="server" BackColor="#F0F0F0" CssClass="Normal" Required="False"
								FormatType="DateTime" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_closedateResource1" OnClickMore="" Personalize="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
				</table>
			</td>
			<td style="BORDER-RIGHT: #c0c0c0 1px inset"><table>
					<tr>
						<td></td>
					</tr>
				</table>
			</td>
			<td valign="top">
				<table Class="Normal" border="0">
					<tr Class="NormalBold">
						<td>
						    <asp:Label ID="LABEL_jobtype" runat="server" Text="週期" meta:resourcekey="LABEL_jobtypeResource1"></asp:Label></td>
					</tr>
					<tr>
						<td>
                            <SmoothEnterpriseWebControlEnterprise:SelectCode id="FIELD_jobtype" runat="server" cssClass="Normal" backcolor="White" CodeType="jobtype"
								Required="True" TextField="name" ValueField="id" ErrorMessage="請輸入「週期」!!" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_jobtypeResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="">
                                <ErrorStyle BorderStyle="NotSet" />
                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControlEnterprise:SelectCode>
							</td>
					</tr>
					<tr Class="NormalBold">
						<td>
						    <asp:Label ID="LABEL_jobinterval" runat="server" Text="循環間隔" meta:resourcekey="LABEL_jobintervalResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_jobinterval" runat="server" Width="64px" BackColor="#F0F0F0"
								CssClass="Normal" ErrorMessage="請輸入「循環間隔」!!" Required="True" FormatType="Number" Text="1" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_jobintervalResource1" OnClickMore="" Personalize="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr Class="NormalBold">
						<td>
						    <asp:Label ID="LABEL_jobstatus" runat="server" Text="程序狀態" meta:resourcekey="LABEL_jobstatusResource1"></asp:Label></td>
					</tr>
					<tr>
						<td>
                            <SmoothEnterpriseWebControlEnterprise:SelectCode id="FIELD_jobstatus" runat="server" cssClass="Normal" backcolor="White" ValueField="id"
								TextField="name" CodeType="jobstatus" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_jobstatusResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControlEnterprise:SelectCode>
						</td>
					</tr>
					<tr Class="NormalBold">
						<td>
						    <asp:Label ID="LABEL_remark" runat="server" Text="描述" meta:resourcekey="LABEL_remarkResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_remark" runat="server" Width="250px" BackColor="#F0F0F0" 
								CssClass="Normal" TextMode="MultiLine" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_remarkResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="3"><SmoothEnterpriseWebControl:inputbutton id="BUTTON_save" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" Gradient-GradientType="Bottom" CssClass="NormalBold" Font-Bold="True"
					Text="儲存" width="80px" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_saveResource1" RunAtCient="False">
                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
            </SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BUTTON_savenext" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" Gradient-GradientType="Bottom" CssClass="NormalBold"
					Font-Bold="True" Text="儲存後繼續操作" OnClick="BUTTON_savenext_Click" meta:resourcekey="BUTTON_savenextResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BUTTON_back" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" Gradient-GradientType="Bottom" CssClass="NormalBold"
					Font-Bold="True" Text="回上頁" width="80px" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton></td>
		</tr>
	</table>
</asp:Content>
