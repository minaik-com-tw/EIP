<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Flowwork.MonthAnalyzeReport, App_Web_monthanalyzereport.aspx.cdcab7d2" title="Untitled Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Application.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>    
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="月份審核提案統計" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
		<CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table border="0">
		<tr Class="NormalBold">
		    <td>
		        <asp:Label ID="LABEL_flow" runat="server" Text="流程" meta:resourcekey="LABEL_flowResource1"></asp:Label></td>
			<td colspan="2">
                <asp:Label ID="LABEL_sdate" runat="server" Text="起始年月" meta:resourcekey="LABEL_sdateResource1"></asp:Label></td>
			<td  colspan="2" runat="server">
                <asp:Label ID="LABEL_edate" runat="server" Text="結束年月" meta:resourcekey="LABEL_edateResource1"></asp:Label></td>
			<td id="Td3" runat="server">
			    <asp:Label ID="LABEL_examine" runat="server" Text="審核人" meta:resourcekey="LABEL_examineResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:inputselect id="QUERY_flow" runat="server"  Personalize="True" cssClass="Normal"
					backcolor="#F0F0F0" ItemAllDisplayed="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_flowResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" />
            </SmoothEnterpriseWebControl:InputSelect></td>
			<td>
                <SmoothEnterpriseWebControl:InputSelect ID="QUERY_syear" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" ItemAll-Value="%" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_syearResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputSelect>
            </td>
            <td>
            <SmoothEnterpriseWebControl:InputSelect ID="QUERY_smonth" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" ItemAll-Value="%" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_smonthResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputSelect>
            </td>
			<td>
                <SmoothEnterpriseWebControl:InputSelect ID="QUERY_eyear" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" ItemAll-Value="%" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_eyearResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputSelect>
            </td>
            <td>
            <SmoothEnterpriseWebControl:InputSelect ID="QUERY_emonth" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" ItemAll-Value="%" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_emonthResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputSelect>
            </td>
            <td>
                <SmoothEnterpriseWebControlEnterprise:PopupUser ID="QUERY_requestuid" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" DisplayField="name" DisplayFieldHidden="True" FormatType="InputCombo"
                    FormatValueField="logonid" Gradient-GradientType="Top" HiddenMode="False" ValueField="id" AuthType="" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_requestuidResource1" OnClickMore="" Personalize="False" Required="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" />
                </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
			<td><SmoothEnterpriseWebControl:inputbutton id="QueryButton" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" cssClass="NormalBold" Text="查詢" Font-Bold="True" OnClick="QueryButton_Click" meta:resourcekey="QueryButtonResource1" RunAtCient="False">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControl:inputbutton></td>
		</tr>
	</table>
	<table width="100%" border="0">
		<tr>
			<td>
                <asp:Literal ID="REPORT_body" runat="server" meta:resourcekey="REPORT_bodyResource1"></asp:Literal></td>
		</tr>
	</table>
</asp:Content>
