<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Security.LogonState, App_Web_logonstate.aspx.cdcab7d2" title="Untitled Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
	<table border="0">
		<tr>
			<td Class="NormalBold"><asp:Label ID="LABEL_logondate" runat="server" Text="ら戳" meta:resourcekey="LABEL_logondateResource1"></asp:Label></td>
			<TD Class="NormalBold"><asp:Label ID="LABEL_forwarddays" runat="server" Text="ぇ玡戈(ぱ)" meta:resourcekey="LABEL_forwarddaysResource1"></asp:Label></TD>
		</tr>
		<tr>
			<td Class="Normal" id="TD1"><SmoothEnterpriseWebControl:inputtext id="QUERY_logondate" runat="server" Width="90px" BackColor="#F0F0F0" CssClass="Normal"
					Required="True" FormatType="Date" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_logondateResource1" OnClickMore="" Personalize="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
			<TD>
				<SmoothEnterpriseWebControl:inputselect id="QUERY_days" runat="server" cssClass="Normal" backcolor="#F0F0F0"
					Width="60px" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_daysResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="30">
					<Items>
						<SmoothEnterpriseWebControl:SelectItem ID="SelectItem1" Selected="True" RowHeight="18"
							Value="30" IconUrl="" Text="30" GroupText="" style="FILTER:;" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItem1Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
						<SmoothEnterpriseWebControl:SelectItem ID="SelectItem2"  Selected="False" RowHeight="18"
							Value="20" IconUrl="" Text="20" GroupText="" style="FILTER:;" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItem2Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
						<SmoothEnterpriseWebControl:SelectItem ID="SelectItem3" Selected="False" RowHeight="18"
							Value="10" IconUrl="" Text="10" GroupText="" style="FILTER:;" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SelectItem3Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
					</Items>
				<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputSelect></TD>
			<td><SmoothEnterpriseWebControl:inputbutton id="BUTTON_query" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom"
					Font-Bold="True" width="80px" Text="琩高" OnClick="BUTTON_query_Click" meta:resourcekey="BUTTON_queryResource1" RunAtCient="False">
                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
            </SmoothEnterpriseWebControl:inputbutton></td>
		</tr>
	</table>
	<table width="100%" border="0">
		<tr>
			<td>
				<asp:image id="Image1" runat="server" meta:resourcekey="Image1Resource1"></asp:image><BR>
				<BR>
			</td>
		</tr>
		<TR>
			<TD Class="NormalBold"><asp:Label ID="LABEL_description" runat="server" Text="程ず–る祅计参璸" meta:resourcekey="LABEL_descriptionResource1"></asp:Label></TD>
		</TR>
		<TR>
			<TD>
				<asp:image id="Image2" runat="server" meta:resourcekey="Image2Resource1"></asp:image></TD>
		</TR>
	</table>
	<table border="0">
	</table>
</asp:Content>
