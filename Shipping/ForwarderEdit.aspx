<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="ForwarderEdit.aspx.cs" Inherits="Shipping.ForwarderEdit" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>

<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.Control" TagPrefix="SmoothEnterpriseControlFlowwork" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlFlowwork" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Forwarder Edit Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    
    <script type="text/javascript">
    window.onload = function() {
    if (document.getElementById("ctl00_ContentPlaceHolder1_BUTTON_SendRequest").disabled == true)
        document.getElementById("ctl00_ContentPlaceHolder1_BUTTON_save").disabled = true;
    else
        document.getElementById("ctl00_ContentPlaceHolder1_BUTTON_save").disabled = false;
    }
    </script>
    
	<table border="0" Class="Normal" width="650px">
		<tr>
			<td valign="top">
				<table border="1" width="650px">
				  
				   <tr>
				     <td align="center"><asp:Label ID="LABEL3" runat="server" CssClass="NormalBold" Text="出通單號"></asp:Label></td>
				     <td >
                         <asp:Label ID="ERP_Key" runat="server" Font-Bold="True" Font-Size="X-Small" ForeColor="DarkGreen"
                             Text="Label"></asp:Label></td>
                             
				     <td align="center"><asp:Label ID="LABEL4" runat="server" CssClass="NormalBold" Text="出貨單號"></asp:Label></td>
				     <td><asp:Label ID="ERP_Key2" runat="server" Font-Bold="True" Font-Size="X-Small" ForeColor="DarkGreen"
                             Text="Label"></asp:Label></td>                               
                             
				   </tr>
				  
				    <tr>
				      <td align="center"><asp:Label ID="LABEL1" runat="server" CssClass="NormalBold" Text="發票編號"></asp:Label></td>
				      <td ><asp:Label ID="INV_num" runat="server" Text="Label" Font-Size="X-Small" ForeColor="Blue" Font-Bold="True"></asp:Label></td>
				      
				      <td align="center"><asp:Label ID="LABEL2" runat="server" CssClass="NormalBold" Text="廠區"></asp:Label></td>
				      <td ><SmoothEnterpriseWebControl:InputText id="FIELD_PlantID" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「SHIPPING_No」!!" MaxLength="6"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
				      
				    </tr>
				    
 	 	 	 	 	<tr>
 	 	 	 	 	    <td align="center"><asp:Label ID="LABEL_SHIP_To" runat="server" CssClass="NormalBold" Text="送貨地址"></asp:Label></td>
 	 	 	 	 	    <td><SmoothEnterpriseWebControl:InputText id="FIELD_SHIP_To" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「SHIP_To」!!" MaxLength="300"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
 	 	 	 	 	    <td align="center"><asp:Label ID="LABEL_SHIPPING_No" runat="server" CssClass="NormalBold" Text="價格條件"></asp:Label></td>
 	 	 	 	 	    <td><SmoothEnterpriseWebControl:InputText id="FIELD_SHIPPING_No" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「SHIPPING_No」!!" MaxLength="6"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
 	 	 	 	 	</tr>
 	 	 	 	 	
 	 	 	 	 	
 	 	 	 	 	<tr>
 	 	 	 	 	  <td align="center"><asp:Label ID="LABEL_SHIPPING_Dec" runat="server" CssClass="NormalBold" Text="描述"></asp:Label></td>
 	 	 	 	 	  <td><SmoothEnterpriseWebControl:InputText id="FIELD_SHIPPING_Dec" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「SHIPPING_Dec」!!" MaxLength="100"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
 	 	 	 	 	  <td align="center"><asp:Label ID="LABEL_SHIPPING_Mode" runat="server" CssClass="NormalBold" Text="交運方式"></asp:Label></td>
 	 	 	 	 	  <td><SmoothEnterpriseWebControl:InputText id="FIELD_SHIPPING_Mode" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「SHIPPING_Mode」!!" MaxLength="15"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
 	 	 	 	 	 </tr>
 	 	 	 	 	 
 	 	 	 	 	 <tr> 
 	 	 	 	 	  <td align="center"><asp:Label ID="LABEL_SHIPPING_ModeDec" runat="server" CssClass="NormalBold" Text="交運描述"></asp:Label></td>
 	 	 	 	 	  <td><SmoothEnterpriseWebControl:InputText id="FIELD_SHIPPING_ModeDec" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「SHIPPING_ModeDec」!!" MaxLength="100"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
 	 	 	 	 	  <td align="center"><asp:Label ID="LABEL_FORWARDER_Num" runat="server" CssClass="NormalBold" Text="廠商編號"></asp:Label></td>
 	 	 	 	 	  <td><SmoothEnterpriseWebControl:InputText id="FIELD_FORWARDER_Num" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「FORWARDER_Num」!!" MaxLength="10"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
 	 	 	 	 	</tr>
 	 	 	 	 	
 	 	 	 	 	
 	 	 	 	 	<tr>
 	 	 	 	 	  <td align="center"><asp:Label ID="LABEL_FORWARDER_Dec" runat="server" CssClass="NormalBold" Text="廠商描述"></asp:Label></td>
 	 	 	 	 	  <td><SmoothEnterpriseWebControl:InputText id="FIELD_FORWARDER_Dec" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「FORWARDER_Dec」!!" MaxLength="20"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
 	 	 	 	 	
 	 	 	 	 	  <td align="center"><asp:Label ID="LABEL_HawbNo" runat="server" CssClass="NormalBold" Text="提貨單"></asp:Label></td>
 	 	 	 	 	  <td style="height: 25px"><SmoothEnterpriseWebControl:InputText id="FIELD_HawbNo" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「HawbNo」!!" MaxLength="100"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
 	 	 	 	 	  
 	 	 	 	 	</tr>
                      
                      <tr>
 	 	 	 	 	   <td align="center"><asp:Label ID="LABEL_FitNo" runat="server" CssClass="NormalBold" Text="行班/航次"></asp:Label></td>
 	 	 	 	 	   <td><SmoothEnterpriseWebControl:InputText id="FIELD_FitNo" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「FitNo」!!" MaxLength="20"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
 	 	 	 	 	   <td align="center"><asp:Label ID="LABEL_ETD" runat="server" CssClass="NormalBold" Text="預計開船日(ETD)" ForeColor="Red"></asp:Label></td>
 	 	 	 	 	   <td><SmoothEnterpriseWebControl:InputText id="FIELD_ETD" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「ETD」!!" MaxLength="0"  FormatType="DateTime"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
 	 	 	 	 	   </tr>
 	 	 	 	 	
 	 	 	 	 	
 	 	 	 	 	<tr>
 	 	 	 	 	  <td align="center"><asp:Label ID="LABEL_ATD" runat="server" CssClass="NormalBold" Text="實際開船日(ATD)" ForeColor="Red"></asp:Label></td>
 	 	 	 	 	  <td><SmoothEnterpriseWebControl:InputText id="FIELD_ATD" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「ATD」!!" MaxLength="0"  FormatType="DateTime"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
 	 	 	 	 	  <td align="center"><asp:Label ID="LABEL_ETA" runat="server" CssClass="NormalBold" Text="預計到港日(ETA)" ForeColor="Red"></asp:Label></td>
 	 	 	 	 	  <td><SmoothEnterpriseWebControl:InputText id="FIELD_ETA" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「ETA」!!" MaxLength="0"  FormatType="DateTime"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
 	 	 	 	 	</tr>
 	 	 	 	 	
 	 	 	 	 	
 	 	 	 	 	<tr>
 	 	 	 	 	  <td align="center"><asp:Label ID="LABEL_ATAAS" runat="server" CssClass="NormalBold" Text="實際到港日(ATAA/S)" ForeColor="Red"></asp:Label></td>
 	 	 	 	 	  <td><SmoothEnterpriseWebControl:InputText id="FIELD_ATAAS" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「ATAAS」!!" MaxLength="0"  FormatType="DateTime"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
 	 	 	 	 	  
 	 	 	 	 	  <td align="center"><asp:Label ID="LABEL_ATAC" runat="server" CssClass="NormalBold" Text="實際到貨日(ATAC)" ForeColor="Red"></asp:Label></td>
 	 	 	 	 	  <td><SmoothEnterpriseWebControl:InputText id="FIELD_ATAC" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「ATAC」!!" MaxLength="0"  FormatType="DateTime"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
 	 	 	 	 	 </tr> 
 	 	 	 	 	  

				</table>
			</td>
		</tr>
	</table>
    <table style="width: 635px">
        <tr>
            <td align="center" style="width: 150px; height: 12px">
                <asp:Label ID="Label5" runat="server" CssClass="NormalBold" Text="審核者"></asp:Label></td>
            <td colspan="2" style="height: 12px">
                <SmoothEnterpriseWebControlEnterprise:PopupUser id="PopupUser1" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" DisplayField="name" FormatType="InputCombo" FormatValueField="logonid"
                    Gradient-GradientType="Top" ValueField="id" Width="151px">
                    <gradient gradientbegin="" gradientend="" gradienttype="Top"></gradient>
                    <errorstyle borderstyle="NotSet" cssclass="" />
                </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
        </tr>
        <tr>
            <td style="width: 150px">
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="width: 150px">
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
    <br />
    <table border="0" Class="Normal">
        <tr>
            <td style="height: 100px">
                <SmoothEnterpriseControlFlowwork:FlowClient ID="FlowClient1" runat="server" TypeName="ShppingFlow.Flowwork.Shpping_Flow1">
                </SmoothEnterpriseControlFlowwork:FlowClient>
                <SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer ID="FlowFeedbackViewer1" runat="server"
                    BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" CssClass="Normal"
                    Font-Size="11px">
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
	<table border="0" Class="Normal" style="width: 630px">
		<tr>
			<td style="height: 24px">
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_save" runat="server" Text="儲存" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_save_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>&nbsp;&nbsp;<SmoothEnterpriseWebControlFlowwork:SendRequestButton ID="BUTTON_SendRequest" runat="server"
                    BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px"
                    CssClass="NormalBold" Flow="<%# FlowClient1 %>" Font-Bold="True" Font-Names="Arial"
                    Font-Size="12px" gradient-gradienttype="Bottom" Width="60px" Height="22px" OnClick="BUTTON_SendRequest_Click">
                    <Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
                </SmoothEnterpriseWebControlFlowwork:SendRequestButton>&nbsp;<SmoothEnterpriseWebControlFlowwork:StopRequestButton ID="BUTTON_StopRequest" runat="server"
                    BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px"
                    CssClass="NormalBold" Flow="<%# FlowClient1 %>" Font-Bold="True" Font-Names="Arial"
                    Font-Size="12px" gradient-gradienttype="Bottom" Width="60px" Height="22px" OnClick="BUTTON_StopRequest_Click">
                    <Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
                </SmoothEnterpriseWebControlFlowwork:StopRequestButton>&nbsp;&nbsp;&nbsp;<SmoothEnterpriseWebControl:InputButton ID="InputButton1" runat="server" Text="摧審" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="InputButton1_Click">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
                &nbsp;&nbsp;
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Text="回上頁" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_back_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>&nbsp;<SmoothEnterpriseWebControl:InputButton ID="BUTTON_delete" runat="server" Text="刪除" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_delete_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>
			</td>
		</tr>
	</table>
</asp:Content>