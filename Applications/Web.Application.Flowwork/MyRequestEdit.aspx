<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Flowwork.MyRequestEdit, App_Web_myrequestedit.aspx.cdcab7d2" title="Untitled Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

<%@ Register Assembly="SmoothEnterprise.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.Control" TagPrefix="cc1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlFlowwork" %>
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
						    <asp:Label ID="LABEL_subject" runat="server" Text="標題" meta:resourcekey="LABEL_subjectResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_subject" runat="server" BackColor="#F0F0F0" Width="296px" CssClass="Normal"
								Required="True" ErrorMessage="請輸入「標題」!!" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_subjectResource1" OnClickMore="" Personalize="False" ><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_content" runat="server" Text="內容" meta:resourcekey="LABEL_contentResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_content" runat="server" BackColor="#F0F0F0" Width="360px" CssClass="Normal"
								Height="68px"  TextMode="MultiLine" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_contentResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td Class="NormalBold">
									    <asp:Label ID="LABEL_flowname" runat="server" Text="審核流程" meta:resourcekey="LABEL_flownameResource1"></asp:Label></td>
									<td width="10"></td>
									<td Class="NormalBold">
									    <asp:Label ID="LABEL_priority" runat="server" Text="優先等級" meta:resourcekey="LABEL_priorityResource1"></asp:Label></td>
								</tr>
								<tr>
									<td height="1" colspan="3"></td>
								</tr>
								<tr>
									<td Class="Normal"><SmoothEnterpriseWebControl:inputselect id="FIELD_requesttype" runat="server"  cssClass="Normal" ItemNone-Text="- 請選擇類別 -"
											ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Gradient-GradientBegin=" " ItemNone-Gradient-GradientEnd=" " backcolor="#F0F0F0" OnSelectedIndexChanged="FIELD_requesttype_SelectedIndexChanged" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-Value="- 請選擇類別 -" ListPosition="Vertical" meta:resourcekey="FIELD_requesttypeResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="- 請選擇審核流程 -">
                                        <Items>
                                            <SmoothEnterpriseWebControl:SelectItem ID="SelectItem1" runat="server" Gradient-GradientBegin=""
                                                Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="True"
                                                Style="filter: ;" Text="- 請選擇審核流程 -" meta:resourcekey="SelectItem1Resource1" Value="- 請選擇審核流程 -" />
                                        </Items>
                                        <ErrorStyle BorderStyle="NotSet" />
                                        <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:InputSelect><SmoothEnterpriseWebControl:inputselect id="FIELD_fid" runat="server"  ErrorMessage="請選擇「審核流程」!!" cssClass="Normal"
											backcolor="#F0F0F0" EnableViewState="False" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_fidResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="">
<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" />
                                        </SmoothEnterpriseWebControl:InputSelect>
										<SmoothEnterpriseWebControl:inputtext id="FIELD_flowrequest" runat="server" Width="280px" CssClass="PanelWhite" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_flowrequestResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:inputtext><FONT face="新細明體">&nbsp;</FONT><asp:literal id="FIELD_approvestatus" runat="server" meta:resourcekey="FIELD_approvestatusResource1"></asp:literal></td>
									<td></td>
									<td>
											<SmoothEnterpriseWebControl:InputSelect id="FIELD_priority" runat="server"  backcolor="#F0F0F0" cssClass="Normal"
												ItemAll-Value="%" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="FIELD_priorityResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="normal">
                                                <Items>
                                                    <SmoothEnterpriseWebControl:SelectItem ID="SelectItem2" runat="server" Gradient-GradientBegin=""
                                                        Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                                                        Style="filter: ;" Text="High" Value="high" meta:resourcekey="SelectItem2Resource1" />
                                                    <SmoothEnterpriseWebControl:SelectItem ID="SelectItem3" runat="server" Gradient-GradientBegin=""
                                                        Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="True"
                                                        Style="filter: ;" Text="Normal" Value="normal" meta:resourcekey="SelectItem3Resource1" />
                                                    <SmoothEnterpriseWebControl:SelectItem ID="SelectItem4" runat="server" Gradient-GradientBegin=""
                                                        Gradient-GradientEnd="" GroupText="" IconUrl="" RowHeight="18" Selected="False"
                                                        Style="filter: ;" Text="Low" Value="low" meta:resourcekey="SelectItem4Resource1" />
                                                </Items>
                                                <ErrorStyle BorderStyle="NotSet" />
                                                <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:InputSelect>
											<SmoothEnterpriseWebControl:inputtext id="FIELD_priority2" runat="server" Width="101px" CssClass="PanelWhite" ReadOnly="True"
												Visible="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_priority2Resource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            </SmoothEnterpriseWebControl:inputtext></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td Class="NormalBold" style="height: 21px">
						    <asp:Label ID="LABEL_remark" runat="server" Text="個人備註" meta:resourcekey="LABEL_remarkResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:inputtext id="FIELD_remark" tabIndex="105" runat="server" BackColor="#F0F0F0" Width="360px"
								CssClass="Normal" ErrorMessage="請輸入「個人備註」!!"  TextMode="MultiLine" MaxLength="1073741823"
								Height="36px" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_remarkResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold" id="LABEL_attachments" runat="server"><asp:label id="LABEL_attachment" runat="server" Text="附件" meta:resourcekey="LABEL_attachmentResource1"></asp:label><FONT face="新細明體">&nbsp;</FONT><SmoothEnterpriseWebControl:inputbutton id="UploadAttButton" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
								BorderColor="#606060" Font-Size="12px" Font-Names="Arial" Width="80px" RunAtCient="True" Font-Bold="True" Text="上傳附件" cssClass="NormalBold" meta:resourcekey="UploadAttButtonResource1">
								<Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
							</SmoothEnterpriseWebControl:inputbutton><SmoothEnterpriseWebControl:inputtext id="HIDDEN_id" runat="server" BackColor="#F0F0F0" CssClass="Normal" 
								HiddenMode="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HTMLMode="Advance" IsValid="True" meta:resourcekey="HIDDEN_idResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="Normal" id="TD1" runat="server"><asp:datagrid id="DataGrid1" runat="server" CellPadding="1" AutoGenerateColumns="False" OnItemDataBound="DataGrid1_ItemDataBound" meta:resourcekey="DataGrid1Resource1">
									<ItemStyle CssClass="Normal"></ItemStyle>
									<HeaderStyle Height="20px" ForeColor="White" CssClass="NormalBold" BackColor="Black"></HeaderStyle>
									<Columns>
										<asp:HyperLinkColumn Target="_blank" DataNavigateUrlField="filenamelink" DataTextField="filename" HeaderText="名稱" meta:resourcekey="HyperLinkColumnResource1"></asp:HyperLinkColumn>
										<asp:TemplateColumn>
											<ItemTemplate>
												<SmoothEnterpriseWebControl:InputButton id="FileDeleteButton" onclick="FileRemove" runat="server" Font-Names="Arial" Font-Size="12px"
													BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" cssClass="NormalBold" Text="刪除"
													Font-Bold="True" meta:resourcekey="FileDeleteButtonResource1" RunAtCient="False">
													<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
												</SmoothEnterpriseWebControl:InputButton>
											</ItemTemplate>
										</asp:TemplateColumn>
										<asp:BoundColumn Visible="False" DataField="id"></asp:BoundColumn>
										<asp:BoundColumn Visible="False" DataField="approvestatus"></asp:BoundColumn>
									</Columns>
								</asp:datagrid><asp:literal id="FIELD_filename" runat="server" meta:resourcekey="FIELD_filenameResource1"></asp:literal></td>
					</tr>
				</table>
<SmoothEnterpriseWebControlFlowwork:flowfeedbackviewer id="FlowFeedbackViewer1" runat="server" BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver"
	Font-Size="11px" CssClass="Normal" DESIGNTIMEDRAGDROP="123" meta:resourcekey="FlowFeedbackViewer1Resource1" RequestURL="" OnOnLoadHistory="FlowFeedbackViewer1_OnLoadHistory" OnPreRender="FlowFeedbackViewer1_PreRender">
	<Columns>
		<SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="No"></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
		<SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Node"></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
		<SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn Label="" FieldName="ReviewerPhoto"></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
		<SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Reviewer"></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
		<SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Initdate"></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
		<SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Receivedate"></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
		<SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Reviewdate"></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
		<SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Result"></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
		<SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn Label="" FieldName="ResultIcon"></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
	</Columns>
	<HistoryTemplate>
        <SmoothEnterpriseWebControl:InputText ID="FIELD_note" runat="server" BackColor="#F0F0F0"
            Columns="50" CssClass="Normal" TextMode="MultiLine" ReadOnly="True">
            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            <ErrorStyle BorderStyle="NotSet" />
        </SmoothEnterpriseWebControl:InputText>		
	</HistoryTemplate>
</SmoothEnterpriseWebControlFlowwork:flowfeedbackviewer>
                <cc1:FlowClient ID="flowClient1" runat="server" Notes="" RequestPriority="Normal" RequestUID="00000000-0000-0000-0000-000000000000" RequestURL="" TypeName="">
                </cc1:FlowClient>
			</td>
		</tr>
	</table>
	<table Class="Normal" border="0">
		<tr>
			<td><SmoothEnterpriseWebControl:inputbutton id="SaveButton" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom"
					Font-Bold="True" Text="儲存" width="80px" OnClick="SaveButton_Click" meta:resourcekey="SaveButtonResource1" RunAtCient="False">
                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
            </SmoothEnterpriseWebControl:inputbutton>
				<SmoothEnterpriseWebControlFlowwork:SendRequestButton id=SendRequestButton runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" Gradient-GradientType="Bottom" cssClass="NormalBold" Font-Bold="True" Flow="<%# flowClient1 %>" OnClick="SendRequestButton_Click" Width="80px" meta:resourcekey="SendRequestButtonResource1" RunAtCient="False" >
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControlFlowwork:SendRequestButton><FONT face="新細明體"></FONT>
				<SmoothEnterpriseWebControl:inputbutton id="BackButton" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom"
					Font-Bold="True" Text="回上頁" width="80px" OnClick="BackButton_Click" meta:resourcekey="BackButtonResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton>
				<SmoothEnterpriseWebControl:inputbutton id="CancelApproveButton" runat="server" BackColor="#C8C8C8" BorderStyle="Solid"
					BorderWidth="1px" BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom"
					Font-Bold="True" OnClick="CancelApproveButton_Click" meta:resourcekey="CancelApproveButtonResource1" RunAtCient="False">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControl:inputbutton>
				<SmoothEnterpriseWebControlFlowwork:remindreviewerbutton id=RemindReviewerButton runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" Font-Size="12px" Font-Names="Arial" Gradient-GradientType="Bottom" Font-Bold="True" cssClass="NormalBold" Flow="<%# flowClient1 %>" PendingDays="0" Width="80px" meta:resourcekey="RemindReviewerButtonResource1" RunAtCient="False">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControlFlowwork:remindreviewerbutton>
				<SmoothEnterpriseWebControl:inputbutton id="DeleteButton" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" CssClass="NormalBold" Gradient-GradientType="Bottom"
					Font-Bold="True" Text="刪除" OnClick="DeleteButton_Click" Width="80px" meta:resourcekey="DeleteButtonResource2" RunAtCient="False">
					<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
				</SmoothEnterpriseWebControl:inputbutton></td>
		</tr>
	</table>
<asp:literal id="Hiddenjsp" runat="server" meta:resourcekey="HiddenjspResource1"></asp:literal>
<SCRIPT language="javascript">
	function openwindow()
	{
		id = 
		vWinCal = window.open('UploadRequestFile.aspx?id='+getQueryString("id"),"attupload",'resizable=no,,location=no,help=no,width=520px,height=150px');
		vWinCal.opener = self;
	}

	function getQueryString(key)
	{
		var value = ""; 
		var sURL = window.document.URL;
		if (sURL.indexOf("?") > 0)
		{
			var arrayParams = sURL.split("?");
			var arrayURLParams = arrayParams[1].split("&");
			for (var i = 0; i < arrayURLParams.length; i++)
			{
				var sParam =  arrayURLParams[i].split("=");
				if ((sParam[0] == key) && (sParam[1] != ""))
				{
					value = sParam[1];
					break;
				}
			}        
		}
		return value;
	}
</SCRIPT>
</asp:Content>
