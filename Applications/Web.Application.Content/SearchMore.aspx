<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Content.SearchMore, App_Web_searchmore.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Src="uc/SearchResult.ascx" TagName="SearchResult" TagPrefix="uc1" %>    
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
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
		<CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<span id="SPAN_query" runat="server">
		<table Class="Normal" cellSpacing="0" cellPadding="0" border="0">
			<tr Class="NormalBold">
				<td colspan="2"><asp:Label ID="LABEL_modifydate" runat="server" Text="更新時間" meta:resourcekey="LABEL_modifydateResource1"></asp:Label></td>
			</tr>
			<tr>
				<td colspan="2">
					<SmoothEnterpriseWebControl:InputSelect id="QUERY_modifydate" runat="server"  backcolor="#F0F0F0" cssClass="Normal"
						ItemAllDisplayed="True" Width="116px" ItemAll-IsValid="True" 
						ItemAll-Selected="False" ItemAll-Text="%" ItemAll-RowHeight="18" Personalize="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-Value="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_modifydateResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="%">
						<Items>
							<SmoothEnterpriseWebControl:SelectItem  Selected="False" RowHeight="18"
								Value="week" IconUrl="" Text="過去一星期內" GroupText="" ID="SELECT_week" IsValid="True" CookieID="" ErrorMessage=""
								style="FILTER:;" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SELECT_weekResource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
							<SmoothEnterpriseWebControl:SelectItem  Selected="False" RowHeight="18"
								Value="month" IconUrl="" Text="過去一個月內" GroupText="" ID="SELECT_month" IsValid="True" CookieID="" ErrorMessage=""
								style="FILTER:;" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SELECT_monthResource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
							<SmoothEnterpriseWebControl:SelectItem  Selected="False" RowHeight="18"
								Value="half" IconUrl="" Text="過去半年內" GroupText="" ID="SELECT_half" IsValid="True" CookieID="" ErrorMessage=""
								style="FILTER:;" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SELECT_halfResource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
							<SmoothEnterpriseWebControl:SelectItem  Selected="False" RowHeight="18"
								Value="year" IconUrl="" Text="過去一年內" GroupText="" ID="SELECT_year" IsValid="True" CookieID="" ErrorMessage=""
								style="FILTER:;" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SELECT_yearResource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
						</Items>
					<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                    </SmoothEnterpriseWebControl:InputSelect></td>
			</tr>
			<tr Class="NormalBold">
				<td colspan="2" style="height: 19px"><asp:Label ID="LABEL_owner" runat="server" Text="負責人" meta:resourcekey="LABEL_ownerResource1"></asp:Label></td>
			</tr>
			<tr>
				<td colspan="2">
					<SmoothEnterpriseWebControlEnterprise:PopupUser id="QUERY_ruid" runat="server" BackColor="#F0F0F0" CssClass="Normal" 
						DisplayField="name" FormatValueField="logonid" ValueField="id" FormatType="InputCombo" Personalize="True" AuthType="" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" DisplayFieldHidden="False" ErrorMessage="" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_ruidResource1" OnClickMore="" Required="False">
                        <Gradient GradientBegin="" GradientEnd="" />
                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                    </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
			</tr>
			<tr Class="NormalBold">
				<td style="WIDTH: 228px"><asp:Label ID="LABEL_keywords" runat="server" Text="請輸入欲查尋之字或詞句" meta:resourcekey="LABEL_keywordsResource1"></asp:Label></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td><SmoothEnterpriseWebControl:inputtext id="QUERY_keywords" runat="server" BackColor="#F0F0F0" Width="200px" CssClass="Normal"
						Personalize="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="QUERY_keywordsResource1" OnClickMore="" Required="False" ><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:inputtext></td>
				<td style="WIDTH: 100%"><SmoothEnterpriseWebControl:inputselect id="QUERY_searchtype" runat="server"  cssClass="Normal" backcolor="#F0F0F0"
						Personalize="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="QUERY_searchtypeResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="all">
						<Items>
							<SmoothEnterpriseWebControl:SelectItem  Selected="False" RowHeight="18"
								Value="all" IconUrl="" Text="全部字符合" GroupText="" ID="SELECT_all" style="FILTER:;" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SELECT_allResource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
							<SmoothEnterpriseWebControl:SelectItem  Selected="False" RowHeight="18"
								Value="any" IconUrl="" Text="單一字符合" GroupText="" ID="SELECT_any" style="FILTER:;" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SELECT_anyResource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
							<SmoothEnterpriseWebControl:SelectItem  Selected="False" RowHeight="18"
								Value="exact" IconUrl="" Text="整句符合" GroupText="" ID="SELECT_exact" style="FILTER:;" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SELECT_exactResource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
						</Items>
					<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputSelect></td>
			</tr>
			<span id="SPAN_cattribute" runat="server">
				<tr Class="NormalBold">
					<td colspan="2"><asp:Label ID="LABEL_cattribute" runat="server" Text="內容屬性" meta:resourcekey="LABEL_cattributeResource1"></asp:Label></td>
				</tr>
				<tr>
					<td colspan="2">
						<SmoothEnterpriseWebControl:CheckBoxList id="QUERY_cattributeid" runat="server" cssClass="Normal" Column="3" ListDirection="Horizontal"
							Width="383px" meta:resourcekey="QUERY_cattributeidResource1" Value="">
							<GroupHeaderStyle Font-Bold="True" GradientEnd="192, 192, 0" ForeColor="White" GradientLevel="100"
								Gradient="Right" BorderColor="192, 192, 0" BackColor="Gray" BorderStyle="NotSet" CssClass=""></GroupHeaderStyle>
                            <DescriptionStyle BorderStyle="NotSet" CssClass="" />
						</SmoothEnterpriseWebControl:CheckBoxList></td>
				</tr>
			</span>
			<tr Class="NormalBold">
				<td colspan="2" style="HEIGHT: 23px"><asp:Label ID="LABEL_contenttypename" runat="server" Text="檔案格式" meta:resourcekey="LABEL_contenttypenameResource1"></asp:Label></td>
			</tr>
			<tr>
				<td colspan="2"><FONT face="新細明體">
						<SmoothEnterpriseWebControl:CheckBoxList id="QUERY_ctypeid" runat="server" Width="640px" cssClass="Normal" ListDirection="Horizontal"
							Column="5" meta:resourcekey="QUERY_ctypeidResource1" Value="">
							<GroupHeaderStyle Font-Bold="True" GradientEnd="192, 192, 0" ForeColor="White" GradientLevel="100"
								Gradient="Right" BorderColor="192, 192, 0" BackColor="Gray" BorderStyle="NotSet" CssClass=""></GroupHeaderStyle>
                            <DescriptionStyle BorderStyle="NotSet" CssClass="" />
						</SmoothEnterpriseWebControl:CheckBoxList></FONT></td>
			</tr>
			<tr Class="NormalBold">
				<td colspan="2"><asp:Label ID="LABEL_categoryname" runat="server" Text="內容分類" meta:resourcekey="LABEL_categorynameResource1"></asp:Label></td>
			</tr>
			<tr>
				<td colspan="2">
					<SmoothEnterpriseWebControl:MultiSelect id="QUERY_catid" runat="server" Font-Names="Arial" Font-Size="12px" CssClass="normalblod"
						SelectBgColor2="Silver" SelectBgColor1="204, 204, 204" Width="720px" SelectionLabel="所有內容分類欄位" SelectedLabel="已選取內容分類欄位" meta:resourcekey="QUERY_catidResource1" Order="False" Size="10" Value="">
						<LabelStyle Font-Size="12px" Font-Names="Arial" Font-Bold="True" BorderStyle="NotSet" CssClass=""></LabelStyle>
					</SmoothEnterpriseWebControl:MultiSelect></td>
			</tr>
			<tr>
				<td colspan="2">
					<table Class="Normal" border="0">
						<tr>
							<td><SmoothEnterpriseWebControl:InputButton id="BUTTON_query" runat="server" Text="查詢" width="80px" Gradient-GradientType="Bottom"
									CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
									Font-Size="12px" Font-Bold="True" OnClick="BUTTON_query_Click" meta:resourcekey="BUTTON_queryResource1" RunAtCient="False">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                            </SmoothEnterpriseWebControl:InputButton></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</span><span id="SPAN_datalist" runat="server">
		<table Class="Normal" cellSpacing="0" cellPadding="0" border="0">
			<tr>
				<td>
					<uc1:SearchResult id="SearchResult1" runat="server"></uc1:SearchResult>
				</td>
			</tr>
			<tr>
				<td>
					<table Class="Normal" border="0">
						<tr>
							<td><SmoothEnterpriseWebControl:InputButton id="BUTTON_back" runat="server" Width="80px" Font-Names="Arial" Font-Size="12px"
									BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" Font-Bold="True" Text="回上頁"
									cssClass="NormalBold" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
									<Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
								</SmoothEnterpriseWebControl:InputButton></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</span>
</asp:Content>