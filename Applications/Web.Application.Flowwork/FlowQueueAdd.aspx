<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Flowwork.FlowQueueAdd, App_Web_flowqueueadd.aspx.cdcab7d2" title="Untitled Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
		Caption="Add Flow Queue" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
		<CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table id="step1" runat="server" border="0" Class="Normal">
		<tr>
			<td Class="NormalBold">
			    <asp:Label ID="LABEL_flow" runat="server" Text="流程" meta:resourcekey="LABEL_flowResource1"></asp:Label></td>
		</tr>
		<tr>
			<td>
				<SmoothEnterpriseWebControl:InputSelect id="FIELD_fid" runat="server"  ItemAll-Value="%" backcolor="#F0F0F0"
					cssClass="Normal" OnSelectedIndexChanged="FIELD_fid_SelectedIndexChanged" EnableViewState="False" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_fidResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="novalue">
			<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <Items>
                        <SmoothEnterpriseWebControl:SelectItem ID="SelectItem1" runat="server" Gradient-GradientBegin=""
                            Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                            Style="filter: ;" Text="- 請選擇流程 -" Value="novalue" meta:resourcekey="SelectItem1Resource1" />
                    </Items>
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputSelect><FONT face="新細明體"></FONT></td>
		</tr>
		<tr>
			<td Class="NormalBold">
			    <asp:Label ID="LABEL_flowqueue" runat="server" Text="審核" meta:resourcekey="LABEL_flowqueueResource1"></asp:Label></td>
		</tr>
		<tr>
			<td>
				<SmoothEnterpriseWebControl:InputSelect id="FIELD_fqid" runat="server"  cssClass="Normal" backcolor="#F0F0F0"
					ItemAll-Value="%" OnSelectedIndexChanged="FIELD_fqid_SelectedIndexChanged" ErrorMessage="請輸入「流程」!!" Required="True" EnableViewState="False" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_fqidResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="novalue">
                    <ErrorStyle BorderStyle="NotSet" />
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <Items>
                        <SmoothEnterpriseWebControl:SelectItem ID="SelectItem2" runat="server" Gradient-GradientBegin=""
                            Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                            Style="filter: ;" Text="- 請選擇審核 -" Value="novalue" meta:resourcekey="SelectItem2Resource1" />
                    </Items>
                </SmoothEnterpriseWebControl:InputSelect>
			</td>
		</tr>
		<tr>
			<td Class="NormalBold">
			    <asp:Label ID="LABEL_node" runat="server" Text="節點" meta:resourcekey="LABEL_nodeResource1"></asp:Label></td>
		</tr>
		<tr>
			<td>
				<SmoothEnterpriseWebControl:InputSelect id="FIELD_fnid" runat="server"  cssClass="Normal" backcolor="#F0F0F0"
					ItemAll-Value="%" OnSelectedIndexChanged="FIELD_fnid_SelectedIndexChanged" ErrorMessage="請輸入「節點」!!" Required="True" EnableViewState="False" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_fnidResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="novalue">
			<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <Items>
                        <SmoothEnterpriseWebControl:SelectItem ID="SelectItem3" runat="server" Gradient-GradientBegin=""
                            Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                            Style="filter: ;" Text="- 請選擇節點 -" Value="novalue" meta:resourcekey="SelectItem3Resource1" />
                    </Items>
                    <ErrorStyle BorderStyle="NotSet" />
                </SmoothEnterpriseWebControl:InputSelect></td>
		</tr>
	</table>
	<table id="step2" runat="server" border="0" Class="Normal">
		<tr>
			<td Class="NormalBold">
			    <asp:Label ID="LABEL_flowinfo" runat="server" Text="審核節點描述" meta:resourcekey="LABEL_flowinfoResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:InputText id="FIELD_text" runat="server"  BackColor="#F0F0F0" CssClass="Normal"
					ErrorMessage="請輸入「審核節點描述」!!" tabIndex="100" MaxLength="200" Width="280px" Required="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_textResource1" OnClickMore="" Personalize="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr>
			<td Class="NormalBold">
			    <asp:Label ID="LABEL_reviewurl" runat="server" Text="審核程式連結" meta:resourcekey="LABEL_reviewurlResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:InputText id="FIELD_reviewerurl" runat="server"  BackColor="#F0F0F0"
					CssClass="Normal" ErrorMessage="請輸入「審核程式連結」!!" tabIndex="106" MaxLength="255" Width="280px" Required="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_reviewerurlResource1" OnClickMore="" Personalize="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
            </SmoothEnterpriseWebControl:inputtext></td>
		</tr>
		<tr>
			<td Class="NormalBold">
			    <asp:Label ID="LABEL_reviewname" runat="server" Text="審核人員" meta:resourcekey="LABEL_reviewnameResource1"></asp:Label></td>
		</tr>
		<tr>
			<td>
				<SmoothEnterpriseWebControlEnterprise:PopupUser id="FIELD_revieweruid" runat="server" BackColor="#F0F0F0" CssClass="Normal" 
					FormatType="InputCombo" DisplayField="name" FormatValueField="logonid" ValueField="id" ErrorMessage="請輸入「審核人員」!!" Required="True" AuthType="" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" DisplayFieldHidden="False" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_revieweruidResource1" OnClickMore="" Personalize="False">
                    <Gradient GradientBegin="" GradientEnd="" />
                    <ErrorStyle BorderStyle="NotSet" />
                </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
		</tr>
	</table>
	<table border="0" Class="Normal">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:InputButton id="SaveButton" runat="server" width="80px" Text="儲存" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" OnClick="SaveButton_Click" meta:resourcekey="SaveButtonResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
				<SmoothEnterpriseWebControl:InputButton id="SaveNextButton" runat="server" Text="儲存後繼續操作" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" meta:resourcekey="SaveNextButtonResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
				<SmoothEnterpriseWebControl:InputButton id="BackButton" runat="server" width="80px" Text="回上頁" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" OnClick="BackButton_Click" meta:resourcekey="BackButtonResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
			</td>
		</tr>
	</table>
</asp:Content>
