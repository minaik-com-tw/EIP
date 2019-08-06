<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Calendar.MyEventEdit, App_Web_myeventedit.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
	<table border="0" Class="Normal">
		<!--
		<tr Class="NormalBold">
			<td>Id :</td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:InputText id="FIELD_id" runat="server"   BackColor="#F0F0F0" CssClass="Normal"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr Class="NormalBold">
			<td>Calid :</td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:InputText id="FIELD_calid" runat="server"   BackColor="#F0F0F0" CssClass="Normal"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td>
		</tr>-->
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_sdate" runat="server" Text="開始日期時間" meta:resourcekey="LABEL_sdateResource1"></asp:Label></td>
		</tr>
		<tr>
			<td>
				<SmoothEnterpriseWebControl:InputText id="FIELD_sdate" runat="server" BackColor="#F0F0F0" CssClass="Normal" 
					FormatType="DateTime" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_sdateResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_edate" runat="server" Text="結束日期時間" meta:resourcekey="LABEL_edateResource1"></asp:Label></td>
		</tr>
		<tr>
			<td>
				<SmoothEnterpriseWebControl:InputText id="FIELD_edate" runat="server" BackColor="#F0F0F0" CssClass="Normal" 
					FormatType="DateTime" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_edateResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_cdtype" runat="server" Text="事件類別" meta:resourcekey="LABEL_cdtypeResource1"></asp:Label></td>
		</tr>
		<tr>
			<td>
				<SmoothEnterpriseWebControl:CheckBoxList id="FIELD_cdtype" runat="server" Width="192px" cssClass="Normal" Column="3" CheckMode="SingleRadio" meta:resourcekey="FIELD_cdtypeResource1" Value="">
					<GroupHeaderStyle Font-Bold="True" GradientEnd="192, 192, 0" ForeColor="White" GradientLevel="100"
						Gradient="Right" BorderColor="192, 192, 0" BackColor="Gray" BorderStyle="NotSet" CssClass=""></GroupHeaderStyle>
                    <DescriptionStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControl:CheckBoxList></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_name" runat="server" Text="事件簡述" meta:resourcekey="LABEL_nameResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:InputText id="FIELD_name" runat="server" BackColor="#F0F0F0" CssClass="Normal" Width="312px"
					Gradient-GradientEnd=" "  Gradient-GradientBegin=" " ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_nameResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr Class="NormalBold">
			<td> 
			    <asp:Label ID="LABEL_details" runat="server" Text="事件詳細內容" meta:resourcekey="LABEL_detailsResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:InputText id="FIELD_details" runat="server" Width="312px" TextMode="MultiLine" BackColor="#F0F0F0"
					CssClass="Normal" Height="56px" Gradient-GradientEnd=" "  Gradient-GradientBegin=" " ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_detailsResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_linkurl" runat="server" Text="連結網址" meta:resourcekey="LABEL_linkurlResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:InputText id="FIELD_linkurl" runat="server" BackColor="#F0F0F0" CssClass="Normal" Width="312px"
					Gradient-GradientEnd=" "  Gradient-GradientBegin=" " ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_linkurlResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_category" runat="server" Text="分類" meta:resourcekey="LABEL_categoryResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:InputText id="FIELD_category" runat="server" BackColor="#F0F0F0" CssClass="Normal" Gradient-GradientEnd=" "
					 Gradient-GradientBegin=" " ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_categoryResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_displaystyle" runat="server" Text="顯示樣式設定" meta:resourcekey="LABEL_displaystyleResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:InputText id="FIELD_displaystyle" runat="server" BackColor="#F0F0F0" CssClass="Normal" Width="312px"
					Gradient-GradientEnd=" "  Gradient-GradientBegin=" " ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_displaystyleResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<!--
		<tr Class="NormalBold">
			<td>Refid :</td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:InputText id="FIELD_refid" runat="server"   BackColor="#F0F0F0" CssClass="Normal"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:inputtext></td>
		</tr>-->
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_invitemails" runat="server" Text="非系統使用者邀請名單" meta:resourcekey="LABEL_invitemailsResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:InputText id="FIELD_invitemails" runat="server" Width="312px" TextMode="MultiLine" BackColor="#F0F0F0"
					CssClass="Normal" Height="52px" Gradient-GradientEnd=" "  Gradient-GradientBegin=" " ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_invitemailsResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_remindday" runat="server" Text="事先提醒天數設定" meta:resourcekey="LABEL_reminddayResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:InputText id="FIELD_remindday" runat="server" BackColor="#F0F0F0" CssClass="Normal" Width="30px"
					MaxLength="3" Gradient-GradientEnd=" "  Gradient-GradientBegin=" " ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_reminddayResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr>
			<td>
				<SmoothEnterpriseWebControl:CheckBoxList id="FIELD_private" runat="server" Font-Bold="True" cssClass="Normal" meta:resourcekey="FIELD_privateResource1" Value="" Width="300px">
					<GroupHeaderStyle Font-Bold="True" GradientEnd="192, 192, 0" ForeColor="White" GradientLevel="100"
						Gradient="Right" BorderColor="192, 192, 0" BackColor="Gray" BorderStyle="NotSet" CssClass=""></GroupHeaderStyle>
					<Items>
						<SmoothEnterpriseWebControl:CheckBoxListItem Text="私人事件設定" Selected="False" Value="Y" GroupText="" Description="" meta:resourcekey="CheckBoxListItem_privateResource1"></SmoothEnterpriseWebControl:CheckBoxListItem>
					</Items>
                    <DescriptionStyle BorderStyle="NotSet" CssClass="" />
				</SmoothEnterpriseWebControl:CheckBoxList></td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_initname" runat="server" Text="建立人員" meta:resourcekey="LABEL_initnameResource1"></asp:Label></td>
		</tr>
		<tr>
			<td>
				<span name="FIELD_initname" id="FIELD_initname" runat="server"></span>
			</td>
		</tr>
		<tr Class="NormalBold">
			<td>
			    <asp:Label ID="LABEL_initdate" runat="server" Text="建立日期時間" meta:resourcekey="LABEL_initdateResource1"></asp:Label></td>
		</tr>
		<tr>
			<td>
				<span name="FIELD_initdate" id="FIELD_initdate" runat="server"></span>
			</td>
		</tr>
		<tr>
			<td>
				<SmoothEnterpriseWebControl:InputButton id="BUTTON_save" runat="server" width="80px" Label="儲存" CssClass="NormalBold" BackColor="#C8C8C8"
					BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial" Font-Size="12px" Font-Bold="True"
					Text="儲存" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_saveResource1" RunAtCient="False">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControl:InputButton>&nbsp;
				<SmoothEnterpriseWebControl:InputButton id="BUTTON_back" runat="server" width="80px" Label="回上頁" CssClass="NormalBold" BackColor="#C8C8C8"
					BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial" Font-Size="12px" Font-Bold="True"
					Text="上一頁" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControl:InputButton>&nbsp;
				<SmoothEnterpriseWebControl:InputButton id="BUTTON_delete" runat="server" Label="刪除" width="80px" CssClass="NormalBold" BackColor="#C8C8C8"
					BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial" Font-Size="12px" Font-Bold="True"
					Text="刪除" OnClick="BUTTON_delete_Click" meta:resourcekey="BUTTON_deleteResource1" RunAtCient="False">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControl:InputButton>
			</td>
		</tr>
	</table>
</asp:Content>
