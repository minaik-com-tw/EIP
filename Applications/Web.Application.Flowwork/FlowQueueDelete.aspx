<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Flowwork.FlowQueueDelete, App_Web_flowqueuedelete.aspx.cdcab7d2" title="Untitled Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
	<SmoothEnterpriseWebControl:PageJumper id="PageJumper1" runat="server" ShowPageNumber="True" ButtonNextLabel="&gt;" ButtonPrevLabel="&lt;" ButtonType="Button" meta:resourcekey="PageJumper1Resource1">
		<ButtonStyle PaddingSize="2px" Width="20px" GradientEnd="64, 64, 64" BorderWidth="1px" BorderStyle="Solid"
			BorderColor="96, 96, 96" GradientBegin="224, 224, 224" BackColor="200, 200, 200" CssClass="" ></ButtonStyle>
		<PageSelectedStyle BorderWidth="3px" BorderStyle="Solid" BorderColor="Black" BackColor="WhiteSmoke" CssClass=""></PageSelectedStyle>
		<PageNumberStyle Font-Size="10px" Font-Names="Arial" PaddingSize="2px" Width="10px" BorderWidth="1px"
			ForeColor="Black" BorderStyle="Solid" BorderColor="Gray" BackColor="White" CssClass=""></PageNumberStyle>
	</SmoothEnterpriseWebControl:PageJumper>
	<TABLE Class="Normal" id="Table1" border="0">
		<TR>
			<TD vAlign="top">
				<TABLE id="Table2">
					<TR>
						<TD Class="NormalBold">
                            <asp:Label ID="LABEL_flowinfo" runat="server" Text="審核節點描述" meta:resourcekey="LABEL_flowinfoResource1"></asp:Label></TD>
					</TR>
					<TR>
						<TD Class="Normal">
							<SmoothEnterpriseWebControl:InputText id="FIELD_text" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="279px" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_textResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" />
                            </SmoothEnterpriseWebControl:inputtext></TD>
					</TR>
					<TR>
						<TD Class="NormalBold">
						    <asp:Label ID="LABEL_requestname" runat="server" Text="提案人員" meta:resourcekey="LABEL_requestnameResource1"></asp:Label></TD>
					</TR>
					<TR>
						<TD Class="Normal">
							<SmoothEnterpriseWebControl:InputText id="FIELD_requestuid_name" runat="server" CssClass="PanelWhite" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_requestuid_nameResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:inputtext></TD>
					</TR>
					<TR>
						<TD Class="NormalBold">
						    <asp:Label ID="LABEL_requesturl" runat="server" Text="提案內容連結" meta:resourcekey="LABEL_requesturlResource1"></asp:Label></TD>
					</TR>
					<TR>
						<TD Class="Normal">
							<SmoothEnterpriseWebControl:InputText id="FIELD_requesturl" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="280px" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_requesturlResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" />
                            </SmoothEnterpriseWebControl:inputtext></TD>
					</TR>
					<TR>
						<TD Class="NormalBold">
						    <asp:Label ID="LABEL_priority" runat="server" Text="優先順序" meta:resourcekey="LABEL_priorityResource1"></asp:Label></TD>
					</TR>
					<TR>
						<TD Class="Normal">
							<SmoothEnterpriseWebControl:InputText id="FIELD_priority" runat="server" CssClass="PanelWhite" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_priorityResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:inputtext></TD>
					</TR>
					<TR>
						<TD Class="NormalBold">
						    <asp:Label ID="LABEL_processseq" runat="server" Text="處理序號" meta:resourcekey="LABEL_processseqResource1"></asp:Label></TD>
					</TR>
					<TR>
						<TD Class="Normal">
							<SmoothEnterpriseWebControl:InputText id="FIELD_qseq" runat="server" CssClass="PanelWhite" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_qseqResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:inputtext></TD>
					</TR>
					<TR>
						<TD Class="NormalBold">
						    <asp:Label ID="LABEL_modifyname" runat="server" Text="更新人員" meta:resourcekey="LABEL_modifynameResource1"></asp:Label></TD>
					</TR>
					<TR>
						<TD Class="Normal">
							<SmoothEnterpriseWebControl:InputText id="FIELD_modifyuid_name" runat="server" CssClass="PanelWhite" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_modifyuid_nameResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:inputtext></TD>
					</TR>
					<TR>
						<TD Class="NormalBold">
						    <asp:Label ID="LABEL_modifydate" runat="server" Text="更新時間" meta:resourcekey="LABEL_modifydateResource1"></asp:Label></TD>
					</TR>
					<TR>
						<TD Class="Normal">
							<SmoothEnterpriseWebControl:InputText id="FIELD_modifydate" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="223px" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_modifydateResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" />
                            </SmoothEnterpriseWebControl:inputtext></TD>
					</TR>
				</TABLE>
			</TD>
			<TD vAlign="top">
				<TABLE id="Table3">
					<TR>
						<TD Class="NormalBold">
						    <asp:Label ID="LABEL_initdate" runat="server" Text="通知時間" meta:resourcekey="LABEL_initdateResource1"></asp:Label></TD>
					</TR>
					<TR>
						<TD Class="Normal">
							<SmoothEnterpriseWebControl:InputText id="FIELD_initdate" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="198px" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_initdateResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" />
                            </SmoothEnterpriseWebControl:inputtext></TD>
					</TR>
					<TR>
						<TD Class="NormalBold">
						    <asp:Label ID="LABEL_reviewname" runat="server" Text="審核人員" meta:resourcekey="LABEL_reviewnameResource1"></asp:Label></TD>
					</TR>
					<TR>
						<TD Class="Normal">
							<SmoothEnterpriseWebControl:InputText id="FIELD_revieweruid_name" runat="server" CssClass="PanelWhite" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_revieweruid_nameResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:inputtext></TD>
					</TR>
					<TR>
						<TD Class="NormalBold">
						    <asp:Label ID="LABEL_reviewurl" runat="server" Text="審核程式連結" meta:resourcekey="LABEL_reviewurlResource1"></asp:Label></TD>
					</TR>
					<TR>
						<TD Class="Normal">
							<SmoothEnterpriseWebControl:InputText id="FIELD_reviewerurl" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="280px" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_reviewerurlResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:inputtext></TD>
					</TR>
					<TR>
						<TD Class="NormalBold">
						    <asp:Label ID="LABEL_flowreceivedate" runat="server" Text="閱覽時間" meta:resourcekey="LABEL_flowreceivedateResource1"></asp:Label></TD>
					</TR>
					<TR>
						<TD Class="Normal">
							<SmoothEnterpriseWebControl:InputText id="FIELD_receivedate" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="197px" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_receivedateResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" />
                            </SmoothEnterpriseWebControl:inputtext></TD>
					</TR>
					<TR>
						<TD Class="NormalBold" style="HEIGHT: 20px">
						    <asp:Label ID="LABEL_reviewdate" runat="server" Text="回覆時間" meta:resourcekey="LABEL_reviewdateResource1"></asp:Label></TD>
					</TR>
					<TR>
						<TD Class="Normal">
							<SmoothEnterpriseWebControl:InputText id="FIELD_reviewdate" runat="server" CssClass="PanelWhite" ReadOnly="True" Width="195px" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_reviewdateResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" />
                            </SmoothEnterpriseWebControl:inputtext></TD>
					</TR>
					<TR>
						<TD Class="NormalBold">
						    <asp:Label ID="LABEL_resulttype" runat="server" Text="回覆類別" meta:resourcekey="LABEL_resulttypeResource1"></asp:Label></TD>
					</TR>
					<TR>
						<TD Class="Normal">
							<SmoothEnterpriseWebControl:InputText id="FIELD_resulttype" runat="server" CssClass="PanelWhite" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_resulttypeResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:inputtext></TD>
					</TR>
					<TR>
						<TD Class="NormalBold">
						    <asp:Label ID="LABEL_reviewresult" runat="server" Text="回覆結果" meta:resourcekey="LABEL_reviewresultResource1"></asp:Label></TD>
					</TR>
					<TR>
						<TD Class="Normal">
							<SmoothEnterpriseWebControl:InputText id="FIELD_reviewresult" runat="server" CssClass="PanelWhite" ReadOnly="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_reviewresultResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:inputtext></TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
	</TABLE>
	<TABLE cellSpacing="0" cellPadding="0" border="0">
		<TR>
			<TD><SmoothEnterpriseWebControl:inputbutton id="DeleteButton" runat="server" Gradient-GradientType="Bottom" CssClass="NormalBold"
					BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial" Font-Size="12px"
					Font-Bold="True" Text="刪除" width="80px" OnClick="DeleteButton_Click" meta:resourcekey="DeleteButtonResource1" RunAtCient="False">
                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
            </SmoothEnterpriseWebControl:inputbutton>&nbsp;</TD>
			<TD>
				&nbsp;<SmoothEnterpriseWebControl:inputbutton id="BackButton" runat="server" BackColor="#C8C8C8" BorderStyle="Solid" BorderWidth="1px"
					BorderColor="#606060" Font-Size="12px" Font-Names="Arial" Gradient-GradientType="Bottom" CssClass="NormalBold" width="80px"
					Text="取消" Font-Bold="True" OnClick="BackButton_Click" meta:resourcekey="BackButtonResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton>&nbsp;</TD>
		</TR>
	</TABLE>
</asp:Content>
