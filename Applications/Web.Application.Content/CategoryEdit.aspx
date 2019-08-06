<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Content.CategoryEdit, App_Web_categoryedit.aspx.cdcab7d2" title="編輯檔案內容分類" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
	<table Class="Normal" border="0">
		<tr>
			<td vAlign="top">
				<table>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_categoryname" runat="server" Text="內容分類名稱" meta:resourcekey="LABEL_categorynameResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_name" tabIndex="100" runat="server" BackColor="#F0F0F0" Width="420px"
								CssClass="Normal" Personalize="False"  ErrorMessage="請輸入「內容分類名稱」!!" MaxLength="50"
								Required="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nameResource1" OnClickMore=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_remark" runat="server" Text="備註說明" meta:resourcekey="LABEL_remarkResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputhtml id="FIELD_remark" runat="server" Width="412px"  Height="120px" Personalize="False"
								cssClass="Normal" backcolor="#F0F0F0" ErrorMessage="" Gradient="Left" imgSrc="" IsValid="True" meta:resourcekey="FIELD_remarkResource1" Mode="Advance" Value="">
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputhtml></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_iconurl" runat="server" Text="分類圖示位址" meta:resourcekey="LABEL_iconurlResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControlEnterprise:SELECTICONURL id="FIELD_iconurl" runat="server" Width="402px" Personalize="False" cssClass="Normal"
								backcolor="White" EditIconDisplayed="True" Editable="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_iconurlResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="" ItemNoneDisplayed="True">
                            <ErrorStyle BorderStyle="NotSet" />
                            <Gradient GradientBegin="" GradientEnd="" />
                        </SmoothEnterpriseWebControlEnterprise:SELECTICONURL></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_categoryhead" runat="server" Text="上階內容分類" meta:resourcekey="LABEL_categoryheadResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControlEnterprise:selectcategory id="FIELD_pid" runat="server" Width="402px" Personalize="False" cssClass="Normal"
								backcolor="White" ItemNoneDisplayed="True" ValueField="id" TextField="pids" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_pidResource1" Mode="Single" PareantId="00000000-0000-0000-0000-000000000000" TextBoxStyle="ThreeDStyle" Value="">
                            <Gradient GradientBegin="" GradientEnd="" />
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControlEnterprise:selectcategory></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_viewurl" runat="server" Text="客製內容顯示位址" meta:resourcekey="LABEL_viewurlResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_viewurl" tabIndex="102" runat="server" BackColor="#F0F0F0" Width="420px"
								CssClass="Normal" Personalize="False"  ErrorMessage="請輸入「客製內容顯示位址」!!" MaxLength="255" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_viewurlResource1" OnClickMore="" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_columns" runat="server" Text="顯示區塊" meta:resourcekey="LABEL_columnsResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputselect id="FIELD_columns" runat="server" Width="136px"  Personalize="False"
								cssClass="Normal" backcolor="#F0F0F0" ItemAll-Value="%" Value="2" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_columnsResource1" Mode="Single" TextBoxStyle="ThreeDStyle">
								<Items>
									<SmoothEnterpriseWebControl:SelectItem  Selected="False" RowHeight="18"
										Value="1" IconUrl="" Text="1" GroupText="" ID="SELECT_1" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SELECT_1Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem  Selected="False" RowHeight="18"
										Value="2" IconUrl="" Text="2" GroupText="" ID="SELECT_2" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SELECT_2Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem  Selected="False" RowHeight="18"
										Value="3" IconUrl="" Text="3" GroupText="" ID="SELECT_3" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SELECT_3Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem  Selected="False" RowHeight="18"
										Value="4" IconUrl="" Text="4" GroupText="" ID="SELECT_4" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SELECT_4Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
								</Items>
							<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:InputSelect></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_expanded" runat="server" Text="展開階層" meta:resourcekey="LABEL_expandedResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputselect id="FIELD_expanded" runat="server" Width="136px"  Personalize="False"
								cssClass="Normal" backcolor="#F0F0F0" ItemAll-Value="%" Value="2" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_expandedResource1" Mode="Single" TextBoxStyle="ThreeDStyle">
								<Items>
									<SmoothEnterpriseWebControl:SelectItem  Selected="False" RowHeight="18"
										Value="1" IconUrl="img/icon-level1.gif" Text="1 Level" GroupText="" ID="SELECT_1level" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SELECT_1levelResource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem  Selected="False" RowHeight="18"
										Value="2" IconUrl="img/icon-level2.gif" Text="2 Level" GroupText="" ID="SELECT_2level" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SELECT_2levelResource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem  Selected="False" RowHeight="18"
										Value="3" IconUrl="img/icon-level3.gif" Text="3 Level" GroupText="" ID="SELECT_3level" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SELECT_3levelResource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem  Selected="False" RowHeight="18"
										Value="0" IconUrl="img/icon-levelall.gif" Text="All Level" GroupText="" ID="SELECT_alllevel" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SELECT_alllevelResource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
								</Items>
							<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:InputSelect></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_mode" runat="server" Text="顯示模式" meta:resourcekey="LABEL_modeResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputselect id="FIELD_mode" runat="server" Width="136px"  Personalize="False" cssClass="Normal"
								backcolor="#F0F0F0" ItemAll-Value="%" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_modeResource1" Mode="Single" TextBoxStyle="ThreeDStyle">
								<Items>
									<SmoothEnterpriseWebControl:SelectItem  Selected="False" RowHeight="18"
										Value="0" IconUrl="" Text="Authorized Contents" GroupText="" ID="SELECT_authorized" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SELECT_authorizedResource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem  Selected="False" RowHeight="18"
										Value="1" IconUrl="" Text="All Categories" GroupText="" ID="SELECT_allcategories" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SELECT_allcategoriesResource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
								</Items>
							<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:InputSelect></td>
					</tr>
					<tr>
						<td Class="NormalBold"><asp:Label ID="LABEL_orderby" runat="server" Text="排序依據" meta:resourcekey="LABEL_orderbyResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputselect id="FIELD_orderby" runat="server" Width="136px"  Personalize="False"
								cssClass="Normal" backcolor="#F0F0F0" ItemAll-Value="%" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_orderbyResource1" Mode="Single" TextBoxStyle="ThreeDStyle">
								<Items>
									<SmoothEnterpriseWebControl:SelectItem  Selected="False" RowHeight="18"
										Value="0" IconUrl="" Text="Sequence" GroupText="" ID="SELECT_sequence" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SELECT_sequenceResource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem  Selected="False" RowHeight="18"
										Value="1" IconUrl="" Text="RecentFirst" GroupText="" ID="SELECT_recentfirst" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SELECT_recentfirstResource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem  Selected="False" RowHeight="18"
										Value="2" IconUrl="" Text="RecentLast" GroupText="" ID="SELECT_recentlast" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SELECT_recentlastResource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem  Selected="False" RowHeight="18"
										Value="3" IconUrl="" Text="ContentNo" GroupText="" ID="SELECT_contentno" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SELECT_contentnoResource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem  Selected="False" RowHeight="18"
										Value="4" IconUrl="" Text="ContentName" GroupText="" ID="SELECT_contentname" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SELECT_contentnameResource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
								</Items>
							<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:InputSelect></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<table Class="Normal" border="0">
		<tr>
			<td><SmoothEnterpriseWebControl:inputbutton id="BUTTON_save" runat="server" OnClick="BUTTON_save_Click" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom"
					width="80px" Text="儲存" Font-Bold="True" meta:resourcekey="BUTTON_saveResource1" RunAtCient="False">
                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
            </SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BUTTON_back" runat="server" OnClick="BUTTON_back_Click" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom"
					width="80px" Text="回上頁" Font-Bold="True" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BUTTON_delete" runat="server" OnClick="BUTTON_delete_Click" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom"
					width="80px" Text="刪除" Font-Bold="True" meta:resourcekey="BUTTON_deleteResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton></td>
		</tr>
	</table>
</asp:Content>
