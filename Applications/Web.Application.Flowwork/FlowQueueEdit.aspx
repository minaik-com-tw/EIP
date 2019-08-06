<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Flowwork.FlowQueueEdit, App_Web_flowqueueedit.aspx.cdcab7d2" title="Untitled Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
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
	<TABLE Class="Normal" id="Table1" border="0">
		<TR>
			<TD vAlign="top">
				<TABLE id="Table2">
					<TR>
						<TD Class="NormalBold">
                            <asp:Label ID="LABEL_flowinfo" runat="server" Text="審核節點描述" meta:resourcekey="LABEL_flowinfoResource1"></asp:Label></TD>
					</TR>
					<TR>
						<TD height="27"><SmoothEnterpriseWebControl:inputtext id="FIELD_text" tabIndex="100" runat="server" Width="300px" BackColor="#F0F0F0"
								CssClass="Normal" MaxLength="200" ErrorMessage="請輸入「待審項目名稱」!!" Required="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_textResource1" OnClickMore="" Personalize="False" ><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" />
                        </SmoothEnterpriseWebControl:inputtext></TD>
					</TR>
					<TR>
						<TD Class="NormalBold">
						    <asp:Label ID="LABEL_requestname" runat="server" Text="提案人員" meta:resourcekey="LABEL_requestnameResource1"></asp:Label></TD>
					</TR>
					<TR>
						<TD>
                            <SmoothEnterpriseWebControl:inputtext id="FIELD_requestname" tabIndex="117" runat="server" CssClass="PanelWhite"
								FormatType="None" ReadOnly="True" Gradient-GradientEnd=" " Gradient-GradientBegin=" " ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_requestnameResource1" OnClickMore="" Personalize="False" Required="False">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                <ErrorStyle BorderStyle="NotSet" />
                            </SmoothEnterpriseWebControl:InputText></TD>
					</TR>
					<TR>
						<TD Class="NormalBold">
						    <asp:Label ID="LABEL_reviewname" runat="server" Text="審核人員" meta:resourcekey="LABEL_reviewnameResource1"></asp:Label></TD>
					</TR>
					<TR>
						<TD height="27">
							<SmoothEnterpriseWebControlEnterprise:PopupUser id="FIELD_revieweruid" runat="server" BackColor="#F0F0F0" CssClass="Normal" 
								DisplayField="name" FormatValueField="logonid" ValueField="id" FormatType="InputCombo" Required="True" AuthType="" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" DisplayFieldHidden="False" ErrorMessage="請輸入「審核人員」!!" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_revieweruidResource1" OnClickMore="" Personalize="False">
                                <Gradient GradientBegin="" GradientEnd="" />
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControlEnterprise:PopupUser></TD>
					</TR>
					<TR>
						<TD Class="NormalBold">
						    <asp:Label ID="LABEL_reviewurl" runat="server" Text="審核程式連結" meta:resourcekey="LABEL_reviewurlResource1"></asp:Label></TD>
					</TR>
					<TR>
						<TD height="27"><SmoothEnterpriseWebControl:inputtext id="FIELD_reviewerurl" tabIndex="105" runat="server" Width="300px" BackColor="#F0F0F0"
								CssClass="Normal" ErrorMessage="請輸入「審核程式連結」!!" Required="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_reviewerurlResource1" OnClickMore="" Personalize="False" ><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></TD>
					</TR>
				</TABLE>
			</TD>
			<TD vAlign="top">
				<TABLE id="Table3">
					<TR>
						<TD Class="NormalBold" style="width: 193px">
						    <asp:Label ID="LABEL_initdate" runat="server" Text="通知時間" meta:resourcekey="LABEL_initdateResource1"></asp:Label></TD>
					</TR>
					<TR>
						<TD height="27" style="width: 193px"><SmoothEnterpriseWebControl:inputtext id="FIELD_initdate" tabIndex="117" runat="server" CssClass="PanelWhite"
								FormatType="None" ReadOnly="True" Gradient-GradientEnd=" " Gradient-GradientBegin=" " Width="191px" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_initdateResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></TD>
					</TR>
					<TR>
						<TD Class="NormalBold" style="width: 193px">
						    <asp:Label ID="LABEL_reviewdate" runat="server" Text="回覆時間" meta:resourcekey="LABEL_reviewdateResource1"></asp:Label></TD>
					</TR>
					<TR>
						<TD height="27" style="width: 193px"><SmoothEnterpriseWebControl:inputtext id="FIELD_reviewdate" tabIndex="110" runat="server" CssClass="PanelWhite"
								FormatType="None" ReadOnly="True" Gradient-GradientEnd=" " Gradient-GradientBegin=" " Width="194px" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_reviewdateResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></TD>
					</TR>
					<TR>
						<TD Class="NormalBold" style="width: 193px">
						    <asp:Label ID="LABEL_reviewresult" runat="server" Text="回覆結果" meta:resourcekey="LABEL_reviewresultResource1"></asp:Label></TD>
					</TR>
					<TR>
						<TD height="27" style="width: 193px"><SmoothEnterpriseWebControl:inputtext id="FIELD_reviewresult" tabIndex="111" runat="server" CssClass="PanelWhite" MaxLength="50" ReadOnly="True" Gradient-GradientEnd=" " Gradient-GradientBegin=" " ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_reviewresultResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" />
                        </SmoothEnterpriseWebControl:inputtext></TD>
					</TR>
					<TR>
						<TD Class="NormalBold" style="width: 193px">
						    <asp:Label ID="LABEL_resulttype" runat="server" Text="回覆類別" meta:resourcekey="LABEL_resulttypeResource1"></asp:Label></TD>
					</TR>
					<TR>
						<TD height="27" style="width: 193px"><SmoothEnterpriseWebControl:inputtext id="FIELD_resulttype" tabIndex="113" runat="server" CssClass="PanelWhite" MaxLength="20" ReadOnly="True" Gradient-GradientEnd=" " Gradient-GradientBegin=" " ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_resulttypeResource1" OnClickMore="" Personalize="False" Required="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" />
                        </SmoothEnterpriseWebControl:inputtext></TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
	</TABLE>
	<TABLE Class="Normal" border="0">
		<tr>
			<td><SmoothEnterpriseWebControl:inputbutton id="SaveButton" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom"
					Font-Bold="True" Text="儲存" width="80px" OnClick="SaveButton_Click" meta:resourcekey="SaveButtonResource1" RunAtCient="False">
                <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
            </SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="BackButton" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom"
					Font-Bold="True" Text="回上頁" width="80px" OnClick="BackButton_Click" meta:resourcekey="BackButtonResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton>&nbsp;
				<SmoothEnterpriseWebControl:inputbutton id="DeleteButton" runat="server" Font-Names="Arial" Font-Size="12px" BorderColor="#606060"
					BorderWidth="1px" BorderStyle="Solid" BackColor="#C8C8C8" CssClass="NormalBold" Gradient-GradientType="Bottom"
					Font-Bold="True" Text="刪除" width="80px" OnClick="DeleteButton_Click" meta:resourcekey="DeleteButtonResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:inputbutton></td>
		</tr>
	</TABLE>
</asp:Content>
