<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="ForwarderView.aspx.cs" Inherits="Shipping.ForwarderView" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlFlowwork" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Forwarder View Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table border="0" Class="Normal">
		<tr>
			<td valign="top">
			<table border="1" width="650">
				   <tr>
				     <td align="center"><asp:Label ID="LABEL3" runat="server" CssClass="NormalBold" Text="出通單號"></asp:Label></td>
				     <td><asp:Label ID="ERP_Key" runat="server" Font-Bold="True" Font-Size="X-Small" ForeColor="DarkGreen"
                             Text="Label"></asp:Label></td>
                             
				     <td align="center"><asp:Label ID="LABEL4" runat="server" CssClass="NormalBold" Text="出貨單號"></asp:Label></td>
				     <td><asp:Label ID="ERP_Key2" runat="server" Font-Bold="True" Font-Size="X-Small" ForeColor="DarkGreen"
                             Text="Label"></asp:Label></td>                             
				   </tr>				
				
				    <tr>
				      <td align="center" style="height: 36px"><asp:Label ID="LABEL1" runat="server" CssClass="NormalBold" Text="發票號碼"></asp:Label><br />
                          <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="XX-Small" Text="(發票開立日期)"></asp:Label></td>
				      <td style="height: 36px" ><asp:Label ID="FIELD_INV_Num" runat="server" Text="Label" Font-Size="X-Small" ForeColor="Blue" Font-Bold="True"></asp:Label><br />
                          <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="X-Small" ForeColor="Red"
                              Text="Label"></asp:Label></td>
				      
				      <td align="center" style="height: 36px"><asp:Label ID="LABEL2" runat="server" CssClass="NormalBold" Text="廠區"></asp:Label></td>
				      <td style="height: 36px" ><SmoothEnterpriseWebControl:InputText id="FIELD_PlantID" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「SHIPPING_No」!!" MaxLength="6" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                          <ErrorStyle BorderStyle="NotSet" CssClass="" />
                      </SmoothEnterpriseWebControl:InputText></td>
				      
				    </tr>
				    
 	 	 	 	 	<tr>
 	 	 	 	 	    <td align="center" style="height: 27px"><asp:Label ID="LABEL_SHIP_To" runat="server" CssClass="NormalBold" Text="送貨地址"></asp:Label></td>
 	 	 	 	 	    <td style="height: 27px"><SmoothEnterpriseWebControl:InputText id="FIELD_SHIP_To" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「SHIP_To」!!" MaxLength="300" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                 <ErrorStyle BorderStyle="NotSet" CssClass="" />
                             </SmoothEnterpriseWebControl:InputText></td>
 	 	 	 	 	    <td align="center" style="height: 27px"><asp:Label ID="LABEL_SHIPPING_No" runat="server" CssClass="NormalBold" Text="價格條件"></asp:Label></td>
 	 	 	 	 	    <td style="height: 27px"><SmoothEnterpriseWebControl:InputText id="FIELD_SHIPPING_No" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「SHIPPING_No」!!" MaxLength="6" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                 <ErrorStyle BorderStyle="NotSet" CssClass="" />
                             </SmoothEnterpriseWebControl:InputText></td>
 	 	 	 	 	</tr>
 	 	 	 	 	
 	 	 	 	 	
 	 	 	 	 	<tr>
 	 	 	 	 	  <td align="center"><asp:Label ID="LABEL_SHIPPING_Dec" runat="server" CssClass="NormalBold" Text="描述"></asp:Label></td>
 	 	 	 	 	  <td><SmoothEnterpriseWebControl:InputText id="FIELD_SHIPPING_Dec" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「SHIPPING_Dec」!!" MaxLength="100" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                               <ErrorStyle BorderStyle="NotSet" CssClass="" />
                           </SmoothEnterpriseWebControl:InputText></td>
 	 	 	 	 	  <td align="center"><asp:Label ID="LABEL_SHIPPING_Mode" runat="server" CssClass="NormalBold" Text="交運方式"></asp:Label></td>
 	 	 	 	 	  <td><SmoothEnterpriseWebControl:InputText id="FIELD_SHIPPING_Mode" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「SHIPPING_Mode」!!" MaxLength="15"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
 	 	 	 	 	 </tr>
 	 	 	 	 	 
 	 	 	 	 	 <tr> 
 	 	 	 	 	  <td align="center"><asp:Label ID="LABEL_SHIPPING_ModeDec" runat="server" CssClass="NormalBold" Text="交運描述"></asp:Label></td>
 	 	 	 	 	  <td><SmoothEnterpriseWebControl:InputText id="FIELD_SHIPPING_ModeDec" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「SHIPPING_ModeDec」!!" MaxLength="100" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                               <ErrorStyle BorderStyle="NotSet" CssClass="" />
                           </SmoothEnterpriseWebControl:InputText></td>
 	 	 	 	 	  <td align="center"><asp:Label ID="LABEL_FORWARDER_Num" runat="server" CssClass="NormalBold" Text="廠商編號"></asp:Label></td>
 	 	 	 	 	  <td><SmoothEnterpriseWebControl:InputText id="FIELD_FORWARDER_Num" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「FORWARDER_Num」!!" MaxLength="10"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
 	 	 	 	 	</tr>
 	 	 	 	 	
 	 	 	 	 	
 	 	 	 	 	<tr>
 	 	 	 	 	  <td align="center"><asp:Label ID="LABEL_FORWARDER_Dec" runat="server" CssClass="NormalBold" Text="廠商描述"></asp:Label></td>
 	 	 	 	 	  <td><SmoothEnterpriseWebControl:InputText id="FIELD_FORWARDER_Dec" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「FORWARDER_Dec」!!" MaxLength="20" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                               <ErrorStyle BorderStyle="NotSet" CssClass="" />
                           </SmoothEnterpriseWebControl:InputText></td>
 	 	 	 	 	
 	 	 	 	 	  <td align="center"><asp:Label ID="LABEL_HawbNo" runat="server" CssClass="NormalBold" Text="提貨單"></asp:Label></td>
 	 	 	 	 	  <td style="height: 25px"><SmoothEnterpriseWebControl:InputText id="FIELD_HawbNo" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「HawbNo」!!" MaxLength="100"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
 	 	 	 	 	  
 	 	 	 	 	</tr>
                      
                      <tr>
 	 	 	 	 	   <td align="center" style="height: 27px"><asp:Label ID="LABEL_FitNo" runat="server" CssClass="NormalBold" Text="行班/航次"></asp:Label></td>
 	 	 	 	 	   <td style="height: 27px"><SmoothEnterpriseWebControl:InputText id="FIELD_FitNo" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「FitNo」!!" MaxLength="20" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
 	 	 	 	 	   <td align="center" style="height: 27px"><asp:Label ID="LABEL_ETD" runat="server" CssClass="NormalBold" Text="預計開船日(ETD)" ForeColor="Red"></asp:Label></td>
 	 	 	 	 	   <td style="height: 27px"><SmoothEnterpriseWebControl:InputText id="FIELD_ETD" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「ETD」!!" MaxLength="0"  FormatType="DateTime" ReadOnly="True"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
 	 	 	 	 	   </tr>
 	 	 	 	 	
 	 	 	 	 	
 	 	 	 	 	<tr>
 	 	 	 	 	  <td align="center"><asp:Label ID="LABEL_ATD" runat="server" CssClass="NormalBold" Text="實際開船日(ATD)" ForeColor="Red"></asp:Label></td>
 	 	 	 	 	  <td><SmoothEnterpriseWebControl:InputText id="FIELD_ATD" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「ATD」!!" MaxLength="0"  FormatType="DateTime" ReadOnly="True"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                               <ErrorStyle BorderStyle="NotSet" CssClass="" />
                           </SmoothEnterpriseWebControl:InputText></td>
 	 	 	 	 	  <td align="center"><asp:Label ID="LABEL_ETA" runat="server" CssClass="NormalBold" Text="預計到港日(ETA)" ForeColor="Red"></asp:Label></td>
 	 	 	 	 	  <td><SmoothEnterpriseWebControl:InputText id="FIELD_ETA" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「ETA」!!" MaxLength="0"  FormatType="DateTime" ReadOnly="True"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                               <ErrorStyle BorderStyle="NotSet" CssClass="" />
                           </SmoothEnterpriseWebControl:InputText></td>
 	 	 	 	 	</tr>
 	 	 	 	 	
 	 	 	 	 	
 	 	 	 	 	<tr>
 	 	 	 	 	  <td align="center"><asp:Label ID="LABEL_ATAAS" runat="server" CssClass="NormalBold" Text="實際到港日(ATAA/S)" ForeColor="Red"></asp:Label></td>
 	 	 	 	 	  <td><SmoothEnterpriseWebControl:InputText id="FIELD_ATAAS" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「ATAAS」!!" MaxLength="0"  FormatType="DateTime" ReadOnly="True"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                               <ErrorStyle BorderStyle="NotSet" CssClass="" />
                           </SmoothEnterpriseWebControl:InputText></td>
 	 	 	 	 	  
 	 	 	 	 	  <td align="center"><asp:Label ID="LABEL_ATAC" runat="server" CssClass="NormalBold" Text="實際到貨日(ATAC)" ForeColor="Red"></asp:Label></td>
 	 	 	 	 	  <td><SmoothEnterpriseWebControl:InputText id="FIELD_ATAC" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「ATAC」!!" MaxLength="0"  FormatType="DateTime" ReadOnly="True"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                               <ErrorStyle BorderStyle="NotSet" CssClass="" />
                           </SmoothEnterpriseWebControl:InputText></td>
 	 	 	 	 	 </tr> 
 	 	 	 	 	  

				</table>
			</td>
		</tr>
	</table>
    <table border="0" Class="Normal">
        <tr>
            <td>
                <SmoothEnterpriseWebControlFlowwork:FlowFeedback ID="FlowFeedback1" runat="server"
                    BackColor="#F0F0F0" BorderColor="#E0E0E0" BorderStyle="Solid" BorderWidth="1px"
                    CssClass="Normal" Font-Size="12px" OnFlowStop="FlowFeedback1_FlowStop" OnFeedbackComplete="FlowFeedback1_FeedbackComplete" OnOnLoadHistory="FlowFeedback1_OnLoadHistory">
                    <Results>
                        <SmoothEnterpriseWebControlFlowwork:FlowResult ID="flowResult1" Text="允許" ResultType="Next"
                            runat="server"></SmoothEnterpriseWebControlFlowwork:FlowResult>
                        <SmoothEnterpriseWebControlFlowwork:FlowResult ID="flowResult2" Text="退回" ResultType="Back"
                            runat="server"></SmoothEnterpriseWebControlFlowwork:FlowResult>
                    </Results>
                    <ReplyTemplate>
                        <asp:Button ID="BUTTON_FlowFeedback" runat="server" CssClass="NormalBold" Text="送出"
                            OnClick="BUTTON_FlowFeedback_Click" Width="80px"></asp:Button></ReplyTemplate>
                </SmoothEnterpriseWebControlFlowwork:FlowFeedback>
                <SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer ID="FlowFeedbackViewer1" runat="server"
                    BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" CssClass="Normal"
                    Font-Size="11px" OnOnLoadHistory="FlowFeedbackViewer1_OnLoadHistory">
                    <Columns>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="No"></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Node">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="ReviewerPhoto">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Reviewer">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Initdate">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Receivedate">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Reviewdate">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Result">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="ResultIcon">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                    </Columns>
                </SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer>
            </td>
        </tr>
    </table>
	<table border="0" Class="Normal">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Text="回上頁" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_back_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>
			</td>
		</tr>
	</table>
</asp:Content>