<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Manager.SchedulerEdit, App_Web_scheduleredit.aspx.cdcab7d2" title="WebForm Edit Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
	<table Class="Normal" border="0">
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_name" runat="server" Text="名稱" meta:resourcekey="LABEL_nameResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext id="FIELD_name" runat="server" BackColor="#F0F0F0"  CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nameResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_assembly" runat="server" Text="程式檔" meta:resourcekey="LABEL_assemblyResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext id="FIELD_assembly" runat="server" BackColor="#F0F0F0" 
					CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_assemblyResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_typename" runat="server" Text="程式名稱" meta:resourcekey="LABEL_typenameResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext id="FIELD_typename" runat="server" BackColor="#F0F0F0" 
					CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_typenameResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_parameter" runat="server" Text="參數" meta:resourcekey="LABEL_parameterResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext id="FIELD_parameters" runat="server" BackColor="#F0F0F0" 
					CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_parametersResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr Class="NormalBold">
			<td style="HEIGHT: 23px">
				<asp:Label ID="LABEL_jobtype" runat="server" Text="工作類別" meta:resourcekey="LABEL_jobtypeResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext id="FIELD_jobtype" runat="server" BackColor="#F0F0F0" 
					CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_jobtypeResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_lastrun" runat="server" Text="最近執行時間" meta:resourcekey="LABEL_lastrunResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputdatetime id="FIELD_loadtime" runat="server" BackColor="#F0F0F0"  CssClass="Normal" DateFormat="YYYYMMDD" ErrorMessage="" FocusColor="" FocusOutColor="" Gradient="Left" IsValid="True" meta:resourcekey="FIELD_loadtimeResource1" Value="">
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputdatetime></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_initrun" runat="server" Text="啟用時間" meta:resourcekey="LABEL_initrunResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputdatetime id="FIELD_initrun" runat="server" BackColor="#F0F0F0"  CssClass="Normal" DateFormat="YYYYMMDD" ErrorMessage="" FocusColor="" FocusOutColor="" Gradient="Left" IsValid="True" meta:resourcekey="FIELD_initrunResource1" Value="">
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputdatetime></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_nextrun" runat="server" Text="下次執行時間" meta:resourcekey="LABEL_nextrunResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputdatetime id="FIELD_lastrun" runat="server" BackColor="#F0F0F0"  CssClass="Normal" DateFormat="YYYYMMDD" ErrorMessage="" FocusColor="" FocusOutColor="" Gradient="Left" IsValid="True" meta:resourcekey="FIELD_lastrunResource1" Value="">
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputdatetime></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_endrun" runat="server" Text="結束時間" meta:resourcekey="LABEL_endrunResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputdatetime id="FIELD_endrun" runat="server" BackColor="#F0F0F0"  CssClass="Normal" DateFormat="YYYYMMDD" ErrorMessage="" FocusColor="" FocusOutColor="" Gradient="Left" IsValid="True" meta:resourcekey="FIELD_endrunResource1" Value="">
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputdatetime></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_jobinterval" runat="server" Text="循環間隔" meta:resourcekey="LABEL_jobintervalResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext id="FIELD_jobinterval" runat="server" BackColor="#F0F0F0" 
					CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_jobintervalResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_jobstatus" runat="server" Text="工作狀態" meta:resourcekey="LABEL_jobstatusResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext id="FIELD_jobstatus" runat="server" BackColor="#F0F0F0" 
					CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_jobstatusResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_description" runat="server" Text="描述" meta:resourcekey="LABEL_descriptionResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext id="FIELD_remark" runat="server" Width="240px" BackColor="#F0F0F0" 
					CssClass="Normal" TextMode="MultiLine" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_remarkResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_modifyname" runat="server" Text="更新人員" meta:resourcekey="LABEL_modifynameResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext id="FIELD_modifyuid" runat="server" BackColor="#F0F0F0" 
					CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_modifyuidResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_modifydate" runat="server" Text="更新時間" meta:resourcekey="LABEL_modifydateResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputdatetime id="FIELD_modifydate" runat="server" BackColor="#F0F0F0"  CssClass="Normal" DateFormat="YYYYMMDD" ErrorMessage="" FocusColor="" FocusOutColor="" Gradient="Left" IsValid="True" meta:resourcekey="FIELD_modifydateResource1" Value="">
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputdatetime></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputbutton id="SaveButton" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" Gradient-GradientType="Bottom" CssClass="NormalBold"
					Font-Bold="True" Text="儲存" width="80px" OnClick="SaveButton_Click" meta:resourcekey="SaveButtonResource1" RunAtCient="False">
                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
            </SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BackButton" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" Gradient-GradientType="Bottom" CssClass="NormalBold"
					Font-Bold="True" Text="回上頁" width="80px" OnClick="BackButton_Click" meta:resourcekey="BackButtonResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="DeleteButton" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" Gradient-GradientType="Bottom" CssClass="NormalBold"
					Font-Bold="True" Text="刪除" width="80px" OnClick="DeleteButton_Click" meta:resourcekey="DeleteButtonResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton></td>
		</tr>
	</table>
</asp:Content>
