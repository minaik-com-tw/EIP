<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Calendar.CalendarEdit, App_Web_calendaredit.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_calendarname" runat="server" Text="行事曆名稱" meta:resourcekey="LABEL_calendarnameResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext id="FIELD_name" runat="server" BackColor="#F0F0F0" Width="312px" CssClass="Normal"
					Required="True" ErrorMessage="請輸入行事曆名稱" Gradient-GradientEnd=" "  Gradient-GradientBegin=" " ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nameResource1" OnClickMore="" Personalize="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_remark" runat="server" Text="備註" meta:resourcekey="LABEL_remarkResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext id="FIELD_remark" runat="server" BackColor="#F0F0F0" Width="312px" CssClass="Normal"
					Height="64px" TextMode="MultiLine" Gradient-GradientEnd=" "  Gradient-GradientBegin=" " ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_remarkResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr Class="NormalBold">
			<td> 
			    <asp:Label ID="LABEL_category" runat="server" Text="行事曆類別" meta:resourcekey="LABEL_categoryResource1"></asp:Label><font color="#0000a0">(Recommended)</font></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext id="FIELD_category" runat="server" BackColor="#F0F0F0" Width="312px" CssClass="Normal"
					Gradient-GradientEnd=" "  Gradient-GradientBegin=" " ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_categoryResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_privcy" runat="server" Text="預設授權方式" meta:resourcekey="LABEL_privcyResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><FONT face="新細明體"><SmoothEnterpriseWebControl:CHECKBOXLIST id="FIELD_privcy" runat="server" cssClass="Normal" CheckMode="SingleRadio" Column="2" meta:resourcekey="FIELD_privcyResource1" Value="0" Width="300px">
						<GroupHeaderStyle Font-Bold="True" GradientEnd="192, 192, 0" ForeColor="White" GradientLevel="100"
							Gradient="Right" BorderColor="192, 192, 0" BackColor="Gray" BorderStyle="NotSet" CssClass=""></GroupHeaderStyle>
						<Items>
							<SmoothEnterpriseWebControl:CheckBoxListItem Text="授權全部使用者" Selected="True" Value="0" GroupText="" Description="" meta:resourcekey="CheckBoxListItem1_privcyResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
							<SmoothEnterpriseWebControl:CheckBoxListItem Text="不授權任何使用者" Selected="False" Value="1" GroupText="" Description="" meta:resourcekey="CheckBoxListItem2_privcyResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
						</Items>
                <DescriptionStyle BorderStyle="NotSet" CssClass="" />
					</SmoothEnterpriseWebControl:CHECKBOXLIST></FONT><GROUPHEADERSTYLE BackColor="Gray" BorderColor="192, 192, 0" ForeColor="White" Gradient="Right" GradientEnd="192, 192, 0"
					GradientLevel="100" Font-Bold="True"></GROUPHEADERSTYLE><ITEMS></ITEMS></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<table cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<SmoothEnterpriseWebControl:checkboxlist id="FIELD_noinvite" runat="server" cssClass="Normal" Font-Bold="True" Width="24px" meta:resourcekey="FIELD_noinviteResource1" Value="">
								<GroupHeaderStyle Font-Bold="True" GradientEnd="192, 192, 0" ForeColor="White" GradientLevel="100"
									Gradient="Right" BorderColor="192, 192, 0" BackColor="Gray" BorderStyle="NotSet" CssClass=""></GroupHeaderStyle>
								<Items>
									<SmoothEnterpriseWebControl:CheckBoxListItem Text=" " Selected="False" Value="Y" GroupText="" Description=""></SmoothEnterpriseWebControl:CheckBoxListItem>
								</Items>
                                <DescriptionStyle BorderStyle="NotSet" CssClass="" />
							</SmoothEnterpriseWebControl:checkboxlist>
						</td>
						<td Class="NormalBold">
							<asp:Label ID="LABEL_noinvite" runat="server" Text="此行事曆不允許被邀請" meta:resourcekey="LABEL_noinviteResource1"></asp:Label></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<table cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<SmoothEnterpriseWebControl:checkboxlist id="FIELD_enabled" runat="server" cssClass="Normal" Font-Bold="True" Width="24px" meta:resourcekey="FIELD_enabledResource1" Value="">
								<GroupHeaderStyle Font-Bold="True" GradientEnd="192, 192, 0" ForeColor="White" GradientLevel="100"
									Gradient="Right" BorderColor="192, 192, 0" BackColor="Gray" BorderStyle="NotSet" CssClass=""></GroupHeaderStyle>
								<Items>
									<SmoothEnterpriseWebControl:CheckBoxListItem Selected="False" Text=" " Description="" Value="Y" GroupText=""></SmoothEnterpriseWebControl:CheckBoxListItem>
								</Items>
                                <DescriptionStyle BorderStyle="NotSet" CssClass="" />
							</SmoothEnterpriseWebControl:checkboxlist></td>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_enablecalendar" runat="server" Text="啟用此行事曆" meta:resourcekey="LABEL_enablecalendarResource1"></asp:Label></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_modifyuid" runat="server" Text="最近修改人員" meta:resourcekey="LABEL_modifyuidResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><asp:label id="label_modifyname" runat="server" DESIGNTIMEDRAGDROP="158" meta:resourcekey="label_modifynameResource1">modifyname</asp:label>
				<!--	<SmoothEnterpriseWebControl:InputText id="FIELD_modifyuid" runat="server"   BackColor="#F0F0F0" CssClass="Normal"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext>--></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_modifydate1" runat="server" Text="最近修改時間" meta:resourcekey="LABEL_modifydate1Resource1"></asp:Label></td>
		</tr>
		<tr>
			<td><asp:label id="label_modifydate" runat="server" DESIGNTIMEDRAGDROP="158" meta:resourcekey="label_modifydateResource1">modifydate</asp:label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputbutton id="BUTTON_save" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" Font-Bold="True" Text="儲存"
					width="80px" Label="儲存" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_saveResource1" RunAtCient="False">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BUTTON_back" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" Font-Bold="True" Text="取消"
					width="80px" Label="回上頁" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BUTTON_delete" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" Font-Bold="True" Text="刪除"
					width="80px" Label="刪除" OnClick="BUTTON_delete_Click" meta:resourcekey="BUTTON_deleteResource1" RunAtCient="False">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControl:inputbutton></td>
		</tr>
	</table>
</asp:Content>
