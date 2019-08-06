<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ control language="c#" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Portal.uc.SearchBox, App_Web_searchbox.ascx.50d77b3" targetschema="http://schemas.microsoft.com/intellisense/ie5" %>
<table style="BORDER-RIGHT: #3c9571 1px solid; BORDER-TOP: #3c9571 1px solid; FONT-SIZE: 12px; MARGIN-BOTTOM: 0px; BORDER-LEFT: #3c9571 1px solid; BORDER-BOTTOM: #3c9571 1px solid; BACKGROUND-COLOR: #ceebc7"
	cellSpacing="0" cellPadding="5" border="0">
	<tr>
		<td>
			<table style="FONT-SIZE: 11px; FONT-FAMILY: Tahoma, Arial" cellSpacing="2" width="170"
				border="0">
				<tr>
					<td style="FONT-WEIGHT: bold; COLOR: #336666">
					    <asp:Label ID="LABEL_searchtitle" runat="server" Text="內容搜尋：" meta:resourcekey="LABEL_searchtitleResource1"></asp:Label></td>
				</tr>
				<!--				<tr>
					<td bgColor="darkseagreen" height="1"></td>
				</tr>
				<tr>
					<td style="FONT-WEIGHT: normal; FONT-SIZE: 11px; COLOR: #669966" id="searchinfo" runat="server">請輸入您要搜尋的檔案、程式或文件相關的關鍵字來查詢</td>
				</tr>-->
				<tr>
					<td><SmoothEnterpriseWebControl:inputtext id="InputSearch" runat="server" BorderWidth="1px" BorderStyle="Solid" BorderColor="ForestGreen"
							cssClass="Normal" Width="128px" Gradient-GradientEnd=" " Gradient-GradientBegin="DarkSeaGreen" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="InputSearchResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                    </SmoothEnterpriseWebControl:inputtext>&nbsp;<SmoothEnterpriseWebControl:inputbutton id="BUTTON_search" runat="server" ForeColor="#404040" Font-Names="Arial" Font-Size="11px"
							BorderWidth="1px" BorderStyle="Solid" BorderColor="Green" BackColor="#E0E0E0" Gradient-GradientType="Bottom" cssClass="NormalBold" Width="32px" Text="Go" Font-Bold="True" OnClick="BUTTON_search_Click" meta:resourcekey="BUTTON_searchResource1" RunAtCient="False">
							<Gradient GradientEnd="ForestGreen" GradientType="Top" GradientBegin="PaleGreen"></Gradient>
						</SmoothEnterpriseWebControl:inputbutton></td>
				</tr>
				<tr>
					<td>
					    <asp:HyperLink ID="HyperLink_searchmore" Text="進階查詢" runat="server" Font-Size="11px" ForeColor="#006666" meta:resourcekey="HyperLink_searchmoreResource1"></asp:HyperLink></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
