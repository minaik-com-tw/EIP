<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Security.UserPopulation, App_Web_userpopulation.aspx.cdcab7d2" title="Untitled Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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

	<TABLE id="Table2" border="0">
		<TR Class="NormalBold">
			<TD style="HEIGHT: 23px"><asp:Label ID="LABEL_time" runat="server" Text="時間" meta:resourcekey="LABEL_timeResource1"></asp:Label></TD>
			<TD style="HEIGHT: 23px"><asp:Label ID="LABEL_type" runat="server" Text="列出之前資料" meta:resourcekey="LABEL_typeResource1"></asp:Label></TD>
		</TR>
		<TR>
			<TD Class="Normal"><SmoothEnterpriseWebControl:inputtext id="QUERY_time" runat="server" Width="120px" BackColor="#F0F0F0" CssClass="Normal"
					Required="True" FormatType="DateTime" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_timeResource1" OnClickMore="" Personalize="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></TD>
			<TD Class="Normal"><SmoothEnterpriseWebControl:inputselect id="QUERY_type" runat="server" Required="True" backcolor="#F0F0F0"
					ItemAll-Value="%" cssClass="Normal" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_typeResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="12hr">
					<Items>
						<SmoothEnterpriseWebControl:SelectItem Selected="False" RowHeight="18"
							Value="12hr" IconUrl="" Text="前12個小時" GroupText="" ID="selectItem1" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="selectItem1Resource1" runat="server" ></SmoothEnterpriseWebControl:SelectItem>
						<SmoothEnterpriseWebControl:SelectItem Selected="False" RowHeight="18"
							Value="3day" IconUrl="" Text="前3天" GroupText="" ID="selectItem2" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="selectItem2Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
						<SmoothEnterpriseWebControl:SelectItem Selected="False" RowHeight="18"
							Value="1week" IconUrl="" Text="前1週" GroupText="" ID="selectItem3" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="selectItem3Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
						<SmoothEnterpriseWebControl:SelectItem Selected="False" RowHeight="18"
							Value="1month" IconUrl="" Text="前1個月" GroupText="" ID="selectItem4" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="selectItem4Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
						<SmoothEnterpriseWebControl:SelectItem Selected="False" RowHeight="18"
							Value="3month" IconUrl="" Text="前3個月" GroupText="" ID="selectItem5" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="selectItem5Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
					</Items>
				<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:InputSelect></TD>
			<TD><SmoothEnterpriseWebControl:inputbutton id="BUTTON_query" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold"
					width="80px" Text="查詢" Font-Bold="True" OnClick="BUTTON_query_Click" meta:resourcekey="BUTTON_queryResource1" RunAtCient="False">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControl:inputbutton></TD>
		</TR>
	</TABLE>
	<TABLE id="Table1" width="100%" border="0">
		<TR>
			<TD><asp:image id="Image1" runat="server" meta:resourcekey="Image1Resource1"></asp:image></TD>
		</TR>
	</TABLE>
</asp:Content>
