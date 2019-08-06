<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="CBGI014Edit.aspx.cs"  Debug="true"  Inherits="ERP_CBGI014.CBGI014Edit" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>


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
   
   <script>
   
       function RunApp()
       {
           if(confirm("確定要啟動催審"))
           {
                return true;          
           }
           else
           {
               return false;
           }

       
          
       }
   
   
   
        var allowed_attachments = 20 - 1;
        var count_attachments1 = 0 + 1;
   function daddfile()
        {
            if (allowed_attachments <= 0)
		    {
		        return false;
		    }
		    else
		    {		    
		        count_attachments1++;
		        var attid = "dattach" + count_attachments1;
		  
　　　　        str = '<br><SmoothEnterpriseWebControl:InputFile ID="InputFile3" runat="server" onchange="daddfile()" BackColor="#F0F0F0" CssClass="Normal" Width="303px"> <Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputFile>';
　　　　        document.getElementById('P3').insertAdjacentHTML("beforeEnd",str)
                allowed_attachments--;
            
                return false;
            }    
         }
   
   </script>
   
   
   
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="CBGI014 Edit Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
   
   
    <table style="width: 1024px">
        <tr>
            <td align="center" colspan="3">
                <asp:Image ID="Image1" runat="server" Height="37px" ImageUrl="~/ERP_AXMT610/minaik.gif"
                    Width="39px" />
                <asp:Label ID="FIELD_companyname" runat="server" Font-Bold="True" Font-Names="新細明體"
                    Text="銘異科技股份有限公司"></asp:Label></td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="新細明體" Text="固定資產預算申請單"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="3">
                <table border="1" cellpadding="0" cellspacing="0" style="width: 1024px">
                    <tr>
                        <td align="left" colspan="3" style="height: 26px">
                            <table width="1024">
                                <tr>
                                    <td style="width: 128px; height: 35px">
                                        <asp:Label ID="Label2" runat="server" CssClass="NormalBold" Text="單號"></asp:Label></td>
                                    <td style="width: 128px; height: 35px">
                                        <SmoothEnterpriseWebControl:InputText id="FIELD_sn" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「單號」!!" MaxLength="15"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 128px; height: 35px">
                                        <asp:Label ID="Label4" runat="server" CssClass="NormalBold" Text="部門名稱" Font-Bold="True" Width="78px"></asp:Label></td>
                                    <td style="width: 128px; height: 35px">
                                        <SmoothEnterpriseWebControl:InputText id="FIELD_gem02_0" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「部門名稱」!!" MaxLength="20"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 128px; height: 35px">
                                        <asp:Label ID="Label5" runat="server" CssClass="NormalBold" Text="預算代號" Width="79px"></asp:Label></td>
                                    <td style="width: 128px; height: 35px">
                                        <SmoothEnterpriseWebControl:InputText id="FIELD_tc_cba00" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「預算代號」!!" MaxLength="10"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 128px; height: 35px">
                                        <asp:Label ID="LABEL_ver" runat="server" CssClass="NormalBold" Text="版本"></asp:Label></td>
                                    <td style="width: 128px; height: 35px">
                                        <SmoothEnterpriseWebControl:InputText id="FIELD_ver" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「版本」!!" MaxLength="0"  FormatType="Number"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 1px">
                                        <asp:Label ID="LABEL_inidate" runat="server" CssClass="NormalBold" Text="建單日期" Width="75px"></asp:Label></td>
                                    <td style="width: 3px">
                                        <SmoothEnterpriseWebControl:InputText id="FIELD_inidate" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「建單日期」!!" MaxLength="0"  FormatType="DateTime"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 3px">
                                        <asp:Label ID="LABEL_gen02_1" runat="server" CssClass="NormalBold" Text="需求者" Width="53px"></asp:Label></td>
                                    <td style="width: 3px">
                                        <SmoothEnterpriseWebControl:InputText id="FIELD_tc_cbauser" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「需求者」!!" MaxLength="20"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 3px">
                                        <asp:Label ID="LABEL_tc_cba02" runat="server" CssClass="NormalBold" Text="預算分類" Width="81px"></asp:Label></td>
                                    <td style="width: 4px">
                                        <SmoothEnterpriseWebControl:InputText id="FIELD_tc_cba01" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Tc_cba01」!!" MaxLength="10"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 4px">
                                    </td>
                                    <td style="width: 4px">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="8" style="height: 20px; background-color: gainsboro">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 1px; height: 24px">
                                        <asp:Label ID="Label6" runat="server" CssClass="NormalBold" Text="明細資料" Width="75px"></asp:Label></td>
                                    <td colspan="7" style="height: 24px">
                                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                            CssClass="Normal" Height="40px" Width="100%" Font-Bold="True" OnDataBound="GridView1_DataBound" OnRowCreated="GridView1_RowCreated" ShowFooter="True">
                                            <RowStyle Height="25px" />
                                            <Columns>
                                            <asp:BoundField DataField="tc_cbb06" HeaderText="大分類" />
                                            <asp:BoundField DataField="tc_cbb07" HeaderText="中分類" />
                                            <asp:BoundField DataField="M1" HeaderText="1月" >
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="M2" HeaderText="2月" >
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="M3" HeaderText="3月">
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="M4" HeaderText="4月">
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="M5" HeaderText="5月">
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="M6" HeaderText="6月">
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="M7" HeaderText="7月">
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="M8" HeaderText="8月">
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="M9" HeaderText="9月">
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="M10" HeaderText="10月" >
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="M11" HeaderText="11月" >
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="M12" HeaderText="12月" >
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Sum" HeaderText="總計" >
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="unp" HeaderText="單價" >
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="totalm" HeaderText="總金額" >
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                        </Columns>
                                            <HeaderStyle BackColor="DimGray" ForeColor="Yellow" Height="30px" />
                                            <FooterStyle Height="25px" HorizontalAlign="Right" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="8" style="height: 20px; background-color: gainsboro">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 1px; height: 24px">
                                        <asp:Label ID="Label7" runat="server" CssClass="NormalBold" Text="明細資料" Width="75px"></asp:Label></td>
                                    <td colspan="7" style="height: 24px"><asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"
                                            CssClass="Normal" Height="40px" Width="100%" Font-Bold="True" PageSize="50">
                                        <RowStyle Height="25px" />
                                       
                                        
                                         <Columns>
                                                <asp:BoundField DataField="tc_cbb03" HeaderText="項次" />
                                                <asp:BoundField DataField="tc_cbb22" HeaderText="類別" />
                                                <asp:BoundField DataField="tc_cbb10" HeaderText="數量" ><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                <asp:BoundField DataField="tc_cbb17" HeaderText="財產編號" ><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                                <asp:BoundField DataField="fajowner" HeaderText="目前使用者">
                                                    <ItemStyle HorizontalAlign="Right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="faj26" HeaderText="購買日期">
                                                    <ItemStyle HorizontalAlign="Right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="faj31" HeaderText="已使用年限">
                                                    <ItemStyle HorizontalAlign="Right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="tc_cbb09" HeaderText="預計新購月份">
                                                    <ItemStyle HorizontalAlign="Right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="azf03" HeaderText="理由">
                                                    <ItemStyle HorizontalAlign="Right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="tc_cbb16" HeaderText="專案名稱">
                                                    <ItemStyle HorizontalAlign="Right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="itemstatus" HeaderText="核准否" />
                                             <asp:BoundField DataField="mismemo" HeaderText="MIS說明" />
                                            
                                            </Columns>
                                        <HeaderStyle BackColor="DimGray" ForeColor="Yellow" Height="30px" />
                                    </asp:GridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="8" style="height: 20px; background-color: gainsboro">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 1px; height: 24px">
                                        <asp:Label ID="Label45" runat="server" CssClass="NormalBold" Text="上傳檔案" Width="80px"></asp:Label></td>
                                    <td style="height: 24px" colspan="3">
                                        <table style="width: 404px">
                                            <tr>
                                                <td>
                                                   <p id="P3">
                                    <SmoothEnterpriseWebControl:InputFile ID="dattach1" onchange="daddfile()" runat="server" BackColor="#F0F0F0" CssClass="Normal" Width="303px">
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputFile>&nbsp;
                                    </p>  <td>
                                                </td>
                                                <td style="width: 75px">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" rowspan="2">
                                                    </td>
                                            </tr>
                                            <tr>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="height: 24px" colspan="4" valign="top">
                                        <asp:Panel ID="Panel2" runat="server">
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="8" style="height: 20px; background-color: darkgray">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 1px; height: 24px">
                                        <asp:Label ID="Label3" runat="server" CssClass="NormalBold" Text="直屬主管" Width="68px"></asp:Label></td>
                                    <td colspan="3" style="height: 24px">
                                        <SmoothEnterpriseWebControlEnterprise:PopupUser ID="PopupUser1" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal" DisplayField="name" FormatType="InputCombo" FormatValueField="logonid"
                                            Gradient-GradientType="Top" ValueField="id">
                                        </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
                                    <td colspan="4" style="height: 24px" valign="top">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br />
    <table border="0" class="Normal">
        <tr>
            <td>
                <SmoothEnterpriseControlFlowwork:FlowClient ID="FlowClient1" runat="server">
                </SmoothEnterpriseControlFlowwork:FlowClient>
                &nbsp;<SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer ID="FlowFeedbackViewer1"
                    runat="server" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" CssClass="Normal"
                    Font-Size="11px" OnOnLoadHistory="FlowFeedbackViewer1_OnLoadHistory">
                    <Columns>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="No" Label="" />
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Node" Label="" />
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="ReviewerPhoto"
                            Label="" />
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Reviewer" Label="" />
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Initdate" Label="" />
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Receivedate" Label="" />
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Reviewdate" Label="" />
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Result" Label="" />
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="ResultIcon" Label="" />
                    </Columns>
                    <HistoryTemplate>
                        &nbsp;
                        <SmoothEnterpriseWebControl:InputText ID="S_Comment" runat="server" CssClass="Normal"
                            ForeColor="Red" Height="30px" Width="586px">
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText>
                        <asp:Image ID="Image1" runat="server" />&nbsp;
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/gif/AppDeputy.png" />
                    </HistoryTemplate>
                </SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer>
            </td>
        </tr>
    </table>
	<table border="0" Class="Normal" style="width: 980px">
		<tr>
			<td style="height: 24px">
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_save" runat="server" Text="儲存" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_save_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>&nbsp;&nbsp;&nbsp;<SmoothEnterpriseWebControlFlowwork:SendRequestButton
                    ID="BUTTON_SendRequest" runat="server" BackColor="#C8C8C8" BorderColor="#606060"
                    BorderStyle="Solid" BorderWidth="1px" CssClass="normalbold" Flow="<%# FlowClient1 %>"
                    Font-Bold="True" Font-Names="Arial" Font-Size="12px" Gradient-GradientType="Bottom"
                    Height="22px" OnClick="BUTTON_SendRequest_Click"
                    Text="送審" Width="80px">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControlFlowwork:SendRequestButton>&nbsp;<SmoothEnterpriseWebControl:InputButton
                    ID="ButStop" runat="server" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid"
                    BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px"
                    Height="22px" OnClick="ButStop_Click" Text="中止" Width="80px">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;&nbsp;&nbsp;
                <SmoothEnterpriseWebControl:InputButton ID="InputButton1" runat="server" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold"
                    Font-Bold="True" Font-Names="Arial" Font-Size="12px" Height="22px" OnClick="InputButton1_Click"
                    Text="退回ERP" Width="80px">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
                &nbsp;&nbsp;<SmoothEnterpriseWebControl:InputButton ID="InputButton3" runat="server" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold"
                    Font-Bold="True" Font-Names="Arial" Font-Size="12px" Height="22px" OnClick="InputButton3_Click"
                    Text="催審" Width="80px" OnClientClick="return RunApp()">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Text="回主頁" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_back_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>&nbsp;
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_delete" runat="server" Text="刪除" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_delete_Click" Visible="False"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>
                <SmoothEnterpriseWebControl:InputButton ID="InputButton2" runat="server" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold"
                    Font-Bold="True" Font-Names="Arial" Font-Size="12px" Height="22px" OnClick="InputButton2_Click"
                    Text="退回ERP" Width="80px" Visible="False">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
		</tr>
	</table>
</asp:Content>