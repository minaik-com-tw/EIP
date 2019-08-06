<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Manager.Performance, App_Web_performance.aspx.cdcab7d2" title="WebForm List Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
	<table border="0">
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_server" runat="server" Text="伺服器" meta:resourcekey="LABEL_serverResource1"></asp:Label></td>
			<td>
			    <asp:Label ID="LABEL_dateinterval" runat="server" Text="時間區間" meta:resourcekey="LABEL_dateintervalResource1"></asp:Label></td>
		</tr>
		<tr Class="NormalBold">
			<td><SmoothEnterpriseWebControl:inputselect id="QUERY_machinename" runat="server" Width="128px"  cssClass="Normal"
					backcolor="#F0F0F0" ItemNoneDisplayed="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_machinenameResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:InputSelect></td>
			<td>
				<SmoothEnterpriseWebControl:DateRange id="QUERY_pdatetime" runat="server" cssClass="Normal" DateType="DateTime" RangeType="None" ButtonIconUrl="" DateFormat="YYYYMMDD" DateWidth="120px" meta:resourcekey="QUERY_pdatetimeResource1" Personalize="False" Width="200px">
                    <EndDate Text="" />
                    <StartDate Text="" />
					
				</SmoothEnterpriseWebControl:DateRange></td>
			<td><SmoothEnterpriseWebControl:inputbutton id="QueryButton" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom"
					width="80px" Text="更新" Font-Bold="True" OnClick="QueryButton_Click" meta:resourcekey="QueryButtonResource1" RunAtCient="False">
                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
            </SmoothEnterpriseWebControl:inputbutton>
				<SmoothEnterpriseWebControl:InputButton id="RedirectButton" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" Gradient-GradientType="Bottom" cssClass="NormalBold"
					Font-Bold="True" Text="使用狀況記錄" OnClick="RedirectButton_Click" meta:resourcekey="RedirectButtonResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
		</tr>
	</table>
	<table border="0">
		<tr Class="NormalBold">
			<td>
				<asp:image id="Image1" runat="server" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black"
					Width="200px" Height="180px" meta:resourcekey="Image1Resource1"></asp:image>
				<asp:image id="Image2" runat="server" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black"
					Width="200px" Height="180px" meta:resourcekey="Image2Resource1"></asp:image>
				<asp:image id="Image3" runat="server" Width="200px" BorderColor="Black" BorderWidth="1px" BorderStyle="Solid"
					Height="180px" meta:resourcekey="Image3Resource1"></asp:image>
			</td>
		</tr>
	</table>
</asp:Content>
