<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Mail.SubscribeDelete, App_Web_subscribedelete.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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

	<TABLE width="100%" border="0">
		<TR>
			<TD width="1%" height="30" noWrap><asp:Label ID="LABEL_email" runat="server" Text="E-mail" CssClass="NormalBold" meta:resourcekey="LABEL_emailResource1"></asp:Label></TD>
			<TD height="30"><SmoothEnterpriseWebControl:inputtext id="QUERY_email" runat="server" Width="300px" CssClass="PanelWhite" HiddenMode="False"
					ReadOnly="True" ButtonClick="True" Gradient-GradientEnd=" " Gradient-GradientBegin=" " Gradient-GradientLevel="0" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_emailResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext><SmoothEnterpriseWebControl:inputtext id="QUERY_uid" runat="server" BackColor="#F0F0F0" CssClass="Normal" 
					HiddenMode="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_uidResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                    </SmoothEnterpriseWebControl:inputtext></TD>
		</TR>
		<TR>
			<TD colSpan="2">
				<SmoothEnterpriseWebControl:CheckBoxList id="FIELD_mailgid" runat="server" Width="100%" cssClass="Normal" Column="5" GroupCheck="False" meta:resourcekey="FIELD_mailgidResource1" Value="">
					<GroupHeaderStyle Font-Bold="True" GradientEnd="Navy" GradientLevel="120" GradientBegin="128, 128, 255" BorderStyle="NotSet" CssClass=""></GroupHeaderStyle>
                    <DescriptionStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControl:CheckBoxList></TD>
		</TR>
	</TABLE>
	<TABLE Class="Normal" id="Table1" border="0">
		<TR>
			<TD><SmoothEnterpriseWebControl:inputbutton id="BUTTON_delete" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold" Font-Bold="True" Text="取消訂閱"
					width="80px" Gradient-GradientType="Bottom" OnClick="BUTTON_delete_Click" meta:resourcekey="BUTTON_deleteResource1" RunAtCient="False">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BUTTON_back" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold" Font-Bold="True" Text="回上頁"
					width="80px" Gradient-GradientType="Bottom" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton></TD>
		</TR>
	</TABLE>
</asp:Content>
