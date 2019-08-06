<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Manager.MessageEdit, App_Web_messageedit.aspx.cdcab7d2" title="WebForm Edit Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
	<SCRIPT language="javascript" id="clientEventHandlersJS">
		<!--
			function preview()
			{	
				var left=screen.width/2-200
				var top=screen.height/2-150	
				//vWinCal = window.open("MessagePreview.aspx?id=<%=Request.QueryString["id"]%>","addfunction","width=800,height=600,status=yes,resizable=yes,scrollbars=yes,top="+top+",left="+left+"");	
				//vWinCal.opener=self;
				window.open("MessagePreview.aspx?id=<%=Request.QueryString["id"]%>");
			}
		//-->
	</SCRIPT>
	<table Class="Normal" border="0">
		<tr Class="NormalBold">
			<td colSpan="4">
			    <asp:Label ID="LABEL_messagename" runat="server" Text="訊息名稱" meta:resourcekey="LABEL_messagenameResource1"></asp:Label></td>
		</tr>
		<tr>
			<td colSpan="4"><SmoothEnterpriseWebControl:inputtext id="FIELD_name" runat="server" BackColor="#F0F0F0" Width="440px" CssClass="Normal"
					 ErrorMessage="請輸入訊息名稱" Required="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nameResource1" OnClickMore="" Personalize="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr Class="NormalBold">
			<td colSpan="4">
			    <asp:Label ID="LABEL_defaultsubject" runat="server" Text="預設主題" meta:resourcekey="LABEL_defaultsubjectResource1"></asp:Label></td>
		</tr>
		<tr>
			<td colSpan="4"><SmoothEnterpriseWebControl:inputtext id="FIELD_subject" runat="server" BackColor="#F0F0F0" Width="440px" CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_subjectResource1" OnClickMore="" Personalize="False" Required="False"
					><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr Class="NormalBold">
			<td colSpan="4">
			    <asp:Label ID="LABEL_defaultsender" runat="server" Text="預設寄件人" meta:resourcekey="LABEL_defaultsenderResource1"></asp:Label></td>
		</tr>
		<tr>
			<td colSpan="4"><SmoothEnterpriseWebControl:inputtext id="FIELD_sender" runat="server" BackColor="#F0F0F0" Width="440px" CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_senderResource1" OnClickMore="" Personalize="False" Required="False"
					><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr Class="NormalBold">
			<td colSpan="4">
			    <asp:Label ID="LABEL_defaultcopyto" runat="server" Text="預設副本收件人" meta:resourcekey="LABEL_defaultcopytoResource1"></asp:Label></td>
		</tr>
		<tr>
			<td colSpan="4"><SmoothEnterpriseWebControl:inputtext id="FIELD_copyto" runat="server" BackColor="#F0F0F0" Width="440px" CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_copytoResource1" OnClickMore="" Personalize="False" Required="False"
					><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr Class="NormalBold">
			<td colSpan="2">
                <asp:Label ID="LABEL_defaultmessagebody" runat="server" Text='預設訊息內容格式 : <font color="blue">(訊息參數使用方式為 <font color="red">:參數名稱</font>)</font>' meta:resourcekey="LABEL_defaultmessagebodyResource1"></asp:Label></td>
			<td>&nbsp;&nbsp;&nbsp;</td>
			<td>
				<asp:Label ID="LABEL_defaultvalue" runat="server" Text="預設值" meta:resourcekey="LABEL_defaultvalueResource1"></asp:Label></td>
		</tr>
		<tr>
			<td colSpan="2"><SmoothEnterpriseWebControl:inputhtml id="FIELD_body" runat="server" Width="430px"  Height="150px" cssClass="Normal"
					backcolor="#F0F0F0" Enabled="False" ErrorMessage="" Gradient="Left" imgSrc="" IsValid="True" meta:resourcekey="FIELD_bodyResource1" Mode="Advance" Value="">
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputhtml></td>
			<td valign="top">&nbsp;&nbsp;&nbsp;</td>
			<td valign="top">
				<table Class="Normal" border="0" bgcolor="#e9e9e9">
					<div id="showdefval" name="showdefval" runat="server"><FONT face="新細明體"></FONT></div>
				</table>
			</td>
		<tr>
			<td colSpan="4"><SmoothEnterpriseWebControl:inputbutton id="SaveButton" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom" width="80px"
					Text="儲存" Font-Bold="True" OnClick="SaveButton_Click" meta:resourcekey="SaveButtonResource1" RunAtCient="False">
                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
            </SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BackButton" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom"
					width="80px" Text="回上頁" Font-Bold="True" OnClick="BackButton_Click" meta:resourcekey="BackButtonResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="DeleteButton" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom"
					width="80px" Text="刪除" Font-Bold="True" OnClick="DeleteButton_Click" meta:resourcekey="DeleteButtonResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="PreviewButton" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom"
					width="80px" Text="預覽" Font-Bold="True" RunatClient="True" meta:resourcekey="PreviewButtonResource1" RunAtCient="False">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControl:inputbutton></td>
		</tr>
	</table>
</asp:Content>
