<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Manager.FeedbackAdd, App_Web_feedbackadd.aspx.cdcab7d2" title="WebForm Add Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
	<table border="0" Class="Normal">
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_fbtype" runat="server" Text="���D���O" meta:resourcekey="LABEL_fbtypeResource1"></asp:Label></td>
		</tr>
		<tr>
			<td>
				<SmoothEnterpriseWebControlEnterprise:SelectCode id="FIELD_fbtype" runat="server" Required="True" backcolor="White" cssClass="Normal"
					ErrorMessage="���D���O�������w" CodeType="fbtype" TextField="name" ValueField="id" ItemNoneDisplayed="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_fbtypeResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControlEnterprise:SelectCode></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_fburl" runat="server" Text="���D�������}" meta:resourcekey="LABEL_fburlResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:InputText id="FIELD_fburl" runat="server"  BackColor="#F0F0F0"
					CssClass="Normal" Width="240px" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_fburlResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_fbdescription" runat="server" Text="���D�y�z" meta:resourcekey="LABEL_fbdescriptionResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:InputText id="FIELD_description" runat="server" Width="240px" TextMode="MultiLine" 
					BackColor="#F0F0F0" CssClass="Normal" Required="True" ErrorMessage="���D�y�z���i�H�ť�" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_descriptionResource1" OnClickMore="" Personalize="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_fbresult" runat="server" Text="�B�z���G" meta:resourcekey="LABEL_fbresultResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:InputText id="FIELD_result" runat="server" Width="240px" TextMode="MultiLine" 
					BackColor="#F0F0F0" CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_resultResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_fbstatus" runat="server" Text="�B�z���A" meta:resourcekey="LABEL_fbstatusResource1"></asp:Label></td>
		</tr>
		<tr>
			<td>
				<SmoothEnterpriseWebControlEnterprise:SelectCode id="FIELD_fbstatus" runat="server" backcolor="White" cssClass="Normal" CodeType="fbstatus"
					TextField="name" ValueField="id" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_fbstatusResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControlEnterprise:SelectCode></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_fbemail" runat="server" Text="�Ʊ�^�Ъ��q�l�l��" meta:resourcekey="LABEL_fbemailResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:InputText id="FIELD_fbemail" runat="server"  BackColor="#F0F0F0"
					CssClass="Normal" Width="240px" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_fbemailResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_fbdate" runat="server" Text="���D�������" meta:resourcekey="LABEL_fbdateResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:InputDateTime id="FIELD_fbdate" runat="server"  BackColor="#F0F0F0" CssClass="Normal"
					Required="True" ErrorMessage="���D����������i�H���ŭ�" DateFormat="YYYYMMDD" FocusColor="" FocusOutColor="" Gradient="Left" IsValid="True" meta:resourcekey="FIELD_fbdateResource1" Value="">
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:InputDateTime></td>
		</tr>
		<tr Class="NormalBold">
			<td>
				<asp:Label ID="LABEL_remark" runat="server" Text="�Ƶ�" meta:resourcekey="LABEL_remarkResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:InputText id="FIELD_remark" runat="server" Width="240px" TextMode="MultiLine" 
					BackColor="#F0F0F0" CssClass="Normal" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_remarkResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr>
			<td>
				<SmoothEnterpriseWebControl:InputButton id="SaveButton" runat="server" width="80px" Text="�x�s" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" OnClick="SaveButton_Click" meta:resourcekey="SaveButtonResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
				<SmoothEnterpriseWebControl:InputButton id="BackButton" runat="server" width="80px" Text="�W�@��" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" OnClick="BackButton_Click" meta:resourcekey="BackButtonResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
			</td>
		</tr>
	</table>
</asp:Content>
