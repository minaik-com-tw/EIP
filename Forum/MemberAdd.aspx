<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Forum.MemberAdd, App_Web_memberadd.aspx.cdcab7d2" title="新增討論區會員" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_forumname" runat="server" Text="討論區名稱" meta:resourcekey="LABEL_forumnameResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputselect id="FIELD_forumid" runat="server"  Required="True" ItemAll-Value="%"
								backcolor="#F0F0F0" cssClass="Normal" ErrorMessage="請輸入「討論區名稱」!!" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_forumidResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="">
                            <ErrorStyle BorderStyle="NotSet" />
                        <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:InputSelect></td>
					</tr>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_membertype" runat="server" Text="會員類別" meta:resourcekey="LABEL_membertypeResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputselect id="FIELD_mtype" runat="server"  Required="True" ItemAll-Value="%"
								backcolor="#F0F0F0" cssClass="Normal" ErrorMessage="請輸入「會員類別」!!" Width="114px" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_mtypeResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="R">
								<Items>
									<SmoothEnterpriseWebControl:SelectItem  IconUrl="" GroupText="" Selected="True"
										Value="R" ID="SELECT_Regular" Text="一般會員" RowHeight="18" style="FILTER:;" runat="server" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SELECT_RegularResource1"></SmoothEnterpriseWebControl:SelectItem>
									<SmoothEnterpriseWebControl:SelectItem  IconUrl="" GroupText="" Selected="False"
										Value="A" ID="SELECT_Administrator" Text="版主管理員" RowHeight="18" style="FILTER:;" runat="server" Gradient-GradientBegin="" Gradient-GradientEnd="" meta:resourcekey="SELECT_AdministratorResource1"></SmoothEnterpriseWebControl:SelectItem>
								</Items>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
							<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:InputSelect></td>
					</tr>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_user" runat="server" Text="使用者" meta:resourcekey="LABEL_userResource1"></asp:Label></td>
					</tr>
					<tr>
						<td>
							<SmoothEnterpriseWebControlEnterprise:PopupUser id="FIELD_user" runat="server" BackColor="#F0F0F0" CssClass="Normal" 
								FormatType="InputCombo" Required="True" DisplayField="name" FormatValueField="logonid" ValueField="id" DisplayFieldHidden="True" ErrorMessage="請輸入「使用者」!!" AuthType="" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_userResource1" OnClickMore="" Personalize="False">
<ErrorStyle BorderStyle="NotSet"></ErrorStyle>
                                <Gradient GradientBegin="" GradientEnd="" />
</SmoothEnterpriseWebControlEnterprise:PopupUser></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<table Class="Normal" border="0">
		<tr>
			<td><SmoothEnterpriseWebControl:inputbutton id="BUTTON_save" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom"
					Font-Bold="True" Text="儲存" width="80px" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_saveResource1" RunAtCient="False">
                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
            </SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BUTTON_savenext" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom"
					Font-Bold="True" Text="儲存後繼續操作" meta:resourcekey="BUTTON_savenextResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BUTTON_back" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom"
					Font-Bold="True" Text="回上頁" width="80px" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton></td>
		</tr>
	</table>
</asp:Content>
