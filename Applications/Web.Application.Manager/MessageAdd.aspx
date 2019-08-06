<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Manager.MessageAdd, App_Web_messageadd.aspx.cdcab7d2" title="WebForm Add Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
			    <asp:Label ID="LABEL_messagename" runat="server" Text="�T���W��" meta:resourcekey="LABEL_messagenameResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext id="FIELD_name" runat="server" Width="440px" BackColor="#F0F0F0" 
					CssClass="Normal" Required="True" ErrorMessage="�п�J�T���W��" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nameResource1" OnClickMore="" Personalize="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_defaultsubject" runat="server" Text="�w�]�D�D" meta:resourcekey="LABEL_defaultsubjectResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext id="FIELD_subject" runat="server" Width="440px" BackColor="#F0F0F0" 
					CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_subjectResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_defaultsender" runat="server" Text="�w�]�H��H" meta:resourcekey="LABEL_defaultsenderResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext id="FIELD_sender" runat="server" Width="440px" BackColor="#F0F0F0" 
					CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_senderResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_defaultcopyto" runat="server" Text="�w�]�ƥ�����H" meta:resourcekey="LABEL_defaultcopytoResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputtext id="FIELD_copyto" runat="server" Width="440px" BackColor="#F0F0F0" 
					CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_copytoResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext>
			</td>
		</tr>
		<tr Class="NormalBold">
			<td>
                <asp:Label ID="LABEL_defaultmessagebody" runat="server" Text='�w�]�T�����e�榡 <font color="blue">(�T���ѼƨϥΤ覡�� <font color="red">:�ѼƦW��</font>)</font>' meta:resourcekey="LABEL_defaultmessagebodyResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputhtml id="FIELD_body" runat="server" Width="430px" Height="150px"  backcolor="#F0F0F0"
					cssClass="Normal" ErrorMessage="" Gradient="Left" imgSrc="" IsValid="True" meta:resourcekey="FIELD_bodyResource1" Mode="Advance" Value="">
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputhtml></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputbutton id="SaveButton" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" Gradient-GradientType="Bottom" CssClass="NormalBold"
					Font-Bold="True" Text="�x�s" width="80px" OnClick="SaveButton_Click" meta:resourcekey="SaveButtonResource1" RunAtCient="False">
                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
            </SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="SaveNextButton" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" Gradient-GradientType="Bottom" CssClass="NormalBold"
					Font-Bold="True" Text="�x�s���~��ާ@" OnClick="SaveButton_Click" meta:resourcekey="SaveNextButtonResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BackButton" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" Gradient-GradientType="Bottom" CssClass="NormalBold"
					Font-Bold="True" Text="�^�W��" width="80px" OnClick="BackButton_Click" meta:resourcekey="BackButtonResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton></td>
		</tr>
	</table>
</asp:Content>
