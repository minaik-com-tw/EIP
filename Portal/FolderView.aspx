<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Portal.FolderView, App_Web_folderview.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Src="uc/ReminderBox.ascx" TagName="ReminderBox" TagPrefix="uc1" %>
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
	<table cellSpacing="3" cellPadding="0" width="100%" border="0">
		<tr vAlign="top">
			<td>
				<table cellSpacing="0" cellPadding="0" width="100%">
					<tr id="QueryBlock" runat="server">
						<td style="BORDER-RIGHT: black 1px solid; PADDING-RIGHT: 3px; BORDER-TOP: black 1px solid; PADDING-LEFT: 3px; PADDING-BOTTOM: 3px; BORDER-LEFT: black 1px solid; COLOR: white; PADDING-TOP: 3px; BORDER-BOTTOM: black 1px solid; BACKGROUND-COLOR: #525252">
							<table cellpadding="0" style="FONT-WEIGHT: bold; FONT-SIZE: 11px; COLOR: white; FONT-FAMILY: Arial">
								<tr>
									<td><asp:Label ID="LABEL_view" runat="server" Text="檢視模式" meta:resourcekey="LABEL_viewResource1"></asp:Label>
									</td>
									<td><SmoothEnterpriseWebControl:INPUTSELECT id="ViewType" runat="server" Font-Size="11px" Font-Names="Arial" cssClass="Normal"
											 Value="1" BackColor="White" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="ViewTypeResource1" Mode="Single" TextBoxStyle="ThreeDStyle">
											<Items>
												<SmoothEnterpriseWebControl:SelectItem Text="Icon" Selected="False" Value="1" GroupText="" Gradient-GradientBegin="" Gradient-GradientEnd="" IconUrl="" meta:resourcekey="SelectItemResource1" RowHeight="18" runat="server"></SmoothEnterpriseWebControl:SelectItem>
												<SmoothEnterpriseWebControl:SelectItem Text="List" Selected="False" Value="2" GroupText="" Gradient-GradientBegin="" Gradient-GradientEnd="" IconUrl="" meta:resourcekey="SelectItemResource2" RowHeight="18" runat="server"></SmoothEnterpriseWebControl:SelectItem>
												<SmoothEnterpriseWebControl:SelectItem Text="Detail" Selected="False" Value="3" GroupText="" Gradient-GradientBegin="" Gradient-GradientEnd="" IconUrl="" meta:resourcekey="SelectItemResource3" RowHeight="18" runat="server"></SmoothEnterpriseWebControl:SelectItem>
											</Items>
										<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    </SmoothEnterpriseWebControl:InputSelect></td>
									<td><asp:Label ID="LABEL_display" runat="server" Text="顯示模式" meta:resourcekey="LABEL_displayResource1"></asp:Label>
									</td>
									<td><SmoothEnterpriseWebControl:inputselect id="ShowCategory" runat="server" Font-Size="11px" Font-Names="Arial" cssClass="Normal"
											 Value="2" BackColor="White" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="ShowCategoryResource1" Mode="Single" TextBoxStyle="ThreeDStyle">
											<Items>
												<SmoothEnterpriseWebControl:SelectItem Text="All Categories" Selected="False" Value="1" GroupText="" Gradient-GradientBegin="" Gradient-GradientEnd="" IconUrl="" meta:resourcekey="SelectItemResource4" RowHeight="18" runat="server"></SmoothEnterpriseWebControl:SelectItem>
												<SmoothEnterpriseWebControl:SelectItem Text="Authorized Contents" Selected="False" Value="2" GroupText="" Gradient-GradientBegin="" Gradient-GradientEnd="" IconUrl="" meta:resourcekey="SelectItemResource5" RowHeight="18" runat="server"></SmoothEnterpriseWebControl:SelectItem>
											</Items>
										<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    </SmoothEnterpriseWebControl:InputSelect></td>
									<td style="width: 38px"><SmoothEnterpriseWebControl:inputbutton id="BUTTON_refresh" runat="server" BackColor="DimGray" BorderColor="DarkGray" BorderStyle="Solid"
											BorderWidth="1px" Font-Size="12px" Font-Names="Arial" ForeColor="White" cssClass="NormalBold" Gradient-GradientType="Bottom"
											Font-Bold="True" Text="更新" meta:resourcekey="BUTTON_refreshResource1" RunAtCient="False">
                                        <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                                    </SmoothEnterpriseWebControl:inputbutton></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr id="QueryBlock1" runat="server">
						<td bgColor="darkgray" height="2"></td>
					</tr>
					<tr vAlign="top">
						<td style="BORDER-RIGHT: black 1px solid; BORDER-TOP: black 1px solid; BORDER-LEFT: black 1px solid; BORDER-BOTTOM: black 1px solid; BACKGROUND-COLOR: #f6f6f6">
                            <SmoothEnterpriseWebControlEnterprise:CategoryFolder ID="CategoryFolder1" runat="server" BackColor="#F4F4F4" Font-Size="12px" Font-Names="Arial"
									RequestQueryID="cid" ForeColor="Black" Width="100%" Height="312px" ShowCategory="All" ListColumns="4" LinkQueryID="cid" Personalize="True" OnOnClickLink="CategoryFolder1_OnClickLink" meta:resourcekey="CategoryFolder1Resource1" Spacing="" />

									</td>
					</tr>
				</table>
			</td>
			<td width="1%">
                <uc1:ReminderBox ID="ReminderBox1" runat="server" />

			</td>
		</tr>
	</table>
</asp:Content>
