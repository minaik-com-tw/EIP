<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Calendar.MyEventDelete, App_Web_myeventdelete.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
		<!--
		<tr Class="NormalBold">
			<td>Id</td>
		</tr>
		<tr>
			<td><span name="FIELD_id" id="FIELD_id" runat="server"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>Calid</td>
		</tr>
		
		<tr>
			<td><span name="FIELD_calid" id="FIELD_calid" runat="server"></span></td>
		</tr>
-->
		<tr Class="NormalBold">
			<td><asp:Label ID="LABEL_sdate" runat="server" Text="開始日期" meta:resourcekey="LABEL_sdateResource1"></asp:Label>
				<SmoothEnterpriseWebControl:inputtext id="Input_bookuser" runat="server" Width="56px" BackColor="#F0F0F0" CssClass="Normal"
					 HiddenMode="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="Input_bookuserResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:inputtext><SmoothEnterpriseWebControl:inputtext id="Input_usercalendar" runat="server" Width="56px" BackColor="#F0F0F0" CssClass="Normal"
					 HiddenMode="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="Input_usercalendarResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                         <ErrorStyle BorderStyle="NotSet" CssClass="" />
                     </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr>
			<td><span id="FIELD_sdate" runat="server" name="FIELD_sdate"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td><asp:Label ID="LABEL_edate" runat="server" Text="結束日期" meta:resourcekey="LABEL_edateResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_edate" runat="server" name="FIELD_edate"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td><asp:Label ID="LABEL_cdtype" runat="server" Text="事件類別" meta:resourcekey="LABEL_cdtypeResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_cdtype" runat="server" name="FIELD_cdtype"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td><asp:Label ID="LABEL_name" runat="server" Text="事件簡述" meta:resourcekey="LABEL_nameResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_name" runat="server" name="FIELD_name"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td><asp:Label ID="LABEL_details" runat="server" Text="事件詳細內容" meta:resourcekey="LABEL_detailsResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_details" runat="server" name="FIELD_details"></span></td>
		</tr>
		<!--	<tr Class="NormalBold">
			<td>連結網址 :</td>
		</tr>
		<tr>
			<td><span id="FIELD_linkurl" runat="server" name="FIELD_linkurl"></span></td>
		</tr>-->
		<tr Class="NormalBold">
			<td><asp:Label ID="LABEL_category" runat="server" Text="分類" meta:resourcekey="LABEL_categoryResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_category" runat="server" name="FIELD_category"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td><asp:Label ID="LABEL_displaystyle" runat="server" Text="顯示樣式設定" meta:resourcekey="LABEL_displaystyleResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_displaystyle" runat="server" name="FIELD_displaystyle"></span></td>
		</tr>
		<!--
		<tr Class="NormalBold">
			<td>Refid</td>
		</tr>
		<tr>
			<td><span name="FIELD_refid" id="FIELD_refid" runat="server"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td>非系統使用者邀請名單 :</td>
		</tr>-->
		<tr>
			<td><span id="FIELD_invitemails" runat="server" name="FIELD_invitemails"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td><asp:Label ID="LABEL_remindday" runat="server" Text="事先提醒天數" meta:resourcekey="LABEL_reminddayResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_remindday" runat="server" name="FIELD_remindday"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td><asp:Label ID="LABEL_private" runat="server" Text="私人事件" meta:resourcekey="LABEL_privateResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_private" runat="server" name="FIELD_private"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td><asp:Label ID="LABEL_inituid" runat="server" Text="建立人員" meta:resourcekey="LABEL_inituidResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_inituid" runat="server" name="FIELD_inituid"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td><asp:Label ID="LABEL_initdate" runat="server" Text="建立日期時間" meta:resourcekey="LABEL_initdateResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_initdate" runat="server" name="FIELD_initdate"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td><asp:Label ID="LABEL_modifyuid" runat="server" Text="最近修改人員" meta:resourcekey="LABEL_modifyuidResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_modifyuid" runat="server" name="FIELD_modifyuid"></span></td>
		</tr>
		<tr Class="NormalBold">
			<td><asp:Label ID="LABEL_modifydate" runat="server" Text="最近修改日期" meta:resourcekey="LABEL_modifydateResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><span id="FIELD_modifydate" runat="server" name="FIELD_modifydate"></span></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputbutton id="BUTTON_delete" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold" Text="刪除" Font-Bold="True"
					Label="確認" width="80px" OnClick="BUTTON_delete_Click" meta:resourcekey="BUTTON_deleteResource1" RunAtCient="False">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BUTTON_back" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold" Text="取消" Font-Bold="True"
					Label="取消" width="80px" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControl:inputbutton></td>
		</tr>
	</table>
	<SmoothEnterpriseWebControl:inputtext id="Input_sdate" runat="server" BackColor="#F0F0F0" CssClass="Normal" 
		HiddenMode="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="Input_sdateResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
        <ErrorStyle BorderStyle="NotSet" CssClass="" />
    </SmoothEnterpriseWebControl:inputtext></asp:Content>
