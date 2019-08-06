<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Forum.MemberEdit, App_Web_memberedit.aspx.cdcab7d2" title="編輯討論區會員" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
	<table border="0" Class="Normal">
		<tr>
			<td valign="top"><table>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_forumname" runat="server" Text="討論區名稱" meta:resourcekey="LABEL_forumnameResource1"></asp:Label></td>
					</tr>
					<tr>
						<td>
							<SmoothEnterpriseWebControl:InputSelect id="FIELD_forumid" runat="server"  cssClass="Normal" backcolor="#F0F0F0"
								ItemAll-Value="%" ErrorMessage="請輸入「討論區名稱」!!" Required="True" ReadOnly="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_forumidResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="">
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:InputSelect></td>
					</tr>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_membertype" runat="server" Text="會員類別" meta:resourcekey="LABEL_membertypeResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputselect id="FIELD_mtype" runat="server"  Required="True" ItemAll-Value="%"
								backcolor="#F0F0F0" cssClass="Normal" Width="114px" ErrorMessage="請輸入「會員類別」!!" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_mtypeResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="R">
								<Items>
									<SmoothEnterpriseWebControl:SelectItem  Selected="False" RowHeight="18"
										Value="R" IconUrl="" Text="一般會員" GroupText="" ID="SELECT_Regular" style="FILTER:;" runat="server" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SELECT_RegularResource1"></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem  Selected="False" RowHeight="18"
										Value="A" IconUrl="" Text="版主管理員" GroupText="" ID="SELECT_Administrator" style="FILTER:;" runat="server" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SELECT_AdministratorResource1"></SmoothEnterpriseWebControl:SelectItem>
								</Items>
                            <ErrorStyle BorderStyle="NotSet" />
							<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:InputSelect></td>
					</tr>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_membername" runat="server" Text="會員暱稱" meta:resourcekey="LABEL_membernameResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:InputText id="FIELD_name" runat="server"  BackColor="#F0F0F0" CssClass="Normal"
								ErrorMessage="請輸入「會員暱稱」!!" tabIndex="102" MaxLength="50" Required="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nameResource1" OnClickMore="" Personalize="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<table border="0" Class="Normal">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:InputButton id="BUTTON_save" runat="server" width="80px" Text="儲存" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_saveResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
				<SmoothEnterpriseWebControl:InputButton id="BUTTON_back" runat="server" width="80px" Text="回上頁" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
				<SmoothEnterpriseWebControl:InputButton id="BUTTON_delete" runat="server" Text="刪除" width="80px" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" OnClick="BUTTON_delete_Click" meta:resourcekey="BUTTON_deleteResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
			</td>
		</tr>
	</table>
</asp:Content>
