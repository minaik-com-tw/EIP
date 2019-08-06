<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Forum.TopicAdd, App_Web_topicadd.aspx.cdcab7d2" title="發表主題" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
						    <asp:Label ID="LABEL_description" runat="server" Text="主題" meta:resourcekey="LABEL_descriptionResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_description" tabIndex="100" runat="server" Width="229px" BackColor="#F0F0F0"
								CssClass="Normal" Required="True" MaxLength="100" ErrorMessage="請輸入「主題」!!" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_descriptionResource1" OnClickMore="" Personalize="False" ><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_topiccategory" runat="server" Text="主題分類" meta:resourcekey="LABEL_topiccategoryResource1"></asp:Label></td>
					</tr>
					<tr>
						<td style="HEIGHT: 26px"><SmoothEnterpriseWebControl:inputselect id="FIELD_topiccategory" runat="server" Width="212px"  Required="True"
								ErrorMessage="請輸入「主題分類」!!" ItemAll-Value="%" Editable="True" backcolor="#F0F0F0" cssClass="Normal" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_topiccategoryResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:InputSelect></td>
					</tr>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_topiciconurl" runat="server" Text="主題圖示" meta:resourcekey="LABEL_topiciconurlResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControlEnterprise:selecticonurl id="FIELD_topiciconurl" runat="server" Editable="True" backcolor="White" cssClass="Normal" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_topiciconurlResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="">
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            <Gradient GradientBegin="" GradientEnd="" />
                        </SmoothEnterpriseWebControlEnterprise:selecticonurl></td>
					</tr>
					<span id="SPAN_seq" runat="server">
						<tr>
							<td Class="NormalBold">
							    <asp:Label ID="LABEL_seq" runat="server" Text="排序" meta:resourcekey="LABEL_seqResource1"></asp:Label></td>
						</tr>
						<tr>
							<td><SmoothEnterpriseWebControl:inputtext id="FIELD_seq" tabIndex="104" runat="server" BackColor="#F0F0F0" CssClass="Normal"
									MaxLength="2" ErrorMessage="請輸入「排序」!!" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_seqResource1" OnClickMore="" Personalize="False" Required="False" ><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:inputtext></td>
						</tr>
					</span>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_content" runat="server" Text="文章內容" meta:resourcekey="LABEL_contentResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputhtml id="FIELD_content" runat="server" Width="480px" Height="200px"  Required="True"
								backcolor="#F0F0F0" cssClass="Normal" ErrorMessage="" Gradient="Left" imgSrc="" IsValid="True" meta:resourcekey="FIELD_contentResource1" Mode="Advance" Value="">
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputhtml></td>
					</tr>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_choose" runat="server" Text="選項" meta:resourcekey="LABEL_chooseResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:CHECKBOXLIST id="FIELD_notify" runat="server" cssClass="Normal" ListDirection="Horizontal" meta:resourcekey="FIELD_notifyResource1" Value="" Width="300px">
								<GroupHeaderStyle Font-Bold="True" GradientEnd="192, 192, 0" ForeColor="White" GradientLevel="100"
									Gradient="Right" BorderColor="192, 192, 0" BackColor="Gray" BorderStyle="NotSet" CssClass=""></GroupHeaderStyle>
								<Items>
									<SmoothEnterpriseWebControl:CheckBoxListItem Selected="False" Text="Email通知：如果有回覆就通知您" Description="" Value="Y" GroupText="" meta:resourcekey="CheckBoxListItem_Resource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
								</Items>
                            <DescriptionStyle BorderStyle="NotSet" CssClass="" />
							</SmoothEnterpriseWebControl:CHECKBOXLIST></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<table border="0" Class="Normal">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:InputButton id="BUTTON_post" runat="server" width="80px" Text="發表" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" OnClick="BUTTON_post_Click" meta:resourcekey="BUTTON_postResource1" RunAtCient="False">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControl:InputButton>
			</td>
		</tr>
	</table>
</asp:Content>
