<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="CBGI014View.aspx.cs" Inherits="ERP_CBGI014.CBGI014View" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>
 
 
 <%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlFlowwork" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>



<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
 










<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
  <script>
  
  function showimage(x){
     
     var webname='imageover.aspx?id='+x;
     var winFeatures = 'dialogHeight:800px;dialogWidth:800px;resizable:yes;status:no';
     window.showModalDialog(webname,self,winFeatures);
    return false;
 }
  
  
  function OpenWin() { 
   id=document.getElementById("ctl00_ContentPlaceHolder1_Hid1").value;
     var strURL = "showLis.aspx?rowid="+id;
     //+x+'&Did='+document.getElementById("ctl00_ContentPlaceHolder1_DepList").value;
     var winFeatures = 'dialogHeight:600px;dialogWidth:1024px;resizable:yes;status:no';
     window.showModalDialog(strURL,self,winFeatures);
  
 

   }
  
  </script>
  
  
  
  
  
  
  
  
  
  
  
  
  
  
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="CBGI014 View Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    
    
    <table style="width: 1224px">
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
            <td colspan="3" >
                <table border="1" cellpadding="0" cellspacing="0" style="width: 1024px">
                    <tr>
                        <td align="left" colspan="3" style="height: 26px">
                            <table width="1424">
                                <tr>
                                    <td style="width: 128px; height: 35px">
                                        <asp:Label ID="Label2" runat="server" CssClass="NormalBold" Text="單號"></asp:Label></td>
                                    <td style="width: 128px; height: 35px">
                                        <SmoothEnterpriseWebControl:InputText id="FIELD_sn" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「單號」!!" MaxLength="15" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 128px; height: 35px">
                                        <asp:Label ID="Label4" runat="server" CssClass="NormalBold" Text="部門名稱" Font-Bold="True" Width="78px"></asp:Label></td>
                                    <td style="width: 128px; height: 35px">
                                        <SmoothEnterpriseWebControl:InputText id="FIELD_gem02_0" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「部門名稱」!!" MaxLength="20" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 128px; height: 35px">
                                        <asp:Label ID="Label5" runat="server" CssClass="NormalBold" Text="預算代號" Width="79px"></asp:Label></td>
                                    <td style="width: 128px; height: 35px">
                                        <SmoothEnterpriseWebControl:InputText id="FIELD_tc_cba00" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「預算代號」!!" MaxLength="10" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 128px; height: 35px">
                                        <asp:Label ID="LABEL_ver" runat="server" CssClass="NormalBold" Text="版本"></asp:Label></td>
                                    <td style="width: 128px; height: 35px">
                                        <SmoothEnterpriseWebControl:InputText id="FIELD_ver" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「版本」!!" MaxLength="0"  FormatType="Number" ReadOnly="True"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 1px">
                                        <asp:Label ID="LABEL_inidate" runat="server" CssClass="NormalBold" Text="建單日期" Width="75px"></asp:Label></td>
                                    <td style="width: 3px">
                                        <SmoothEnterpriseWebControl:InputText id="FIELD_inidate" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「建單日期」!!" MaxLength="0"  FormatType="DateTime" ReadOnly="True"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 3px">
                                        <asp:Label ID="LABEL_gen02_1" runat="server" CssClass="NormalBold" Text="需求者" Width="53px"></asp:Label></td>
                                    <td style="width: 3px">
                                        <SmoothEnterpriseWebControl:InputText id="FIELD_tc_cbauser" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「需求者」!!" MaxLength="20" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 3px">
                                        <asp:Label ID="LABEL_tc_cba02" runat="server" CssClass="NormalBold" Text="預算分類" Width="81px"></asp:Label></td>
                                    <td style="width: 4px">
                                        <SmoothEnterpriseWebControl:InputText id="FIELD_tc_cba01" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Tc_cba01」!!" MaxLength="10" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
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
                                    <td style="width: 1px; height: 23px">
                                        <asp:Label ID="Label6" runat="server" CssClass="NormalBold" Text="明細資料" Width="75px"></asp:Label></td>
                                    <td colspan="7" style="height: 23px">
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                                            CssClass="Normal" Height="40px" Width="100%" Font-Bold="True" OnDataBound="GridView1_DataBound" OnRowCreated="GridView1_RowCreated" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True" PageSize="25">
                                            <RowStyle Height="25px" />
                                            <Columns>
                                            <asp:BoundField DataField="tc_cbb06" HeaderText="大分類" >
                                                <FooterStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="tc_cbb07" HeaderText="中分類" >
                                                <FooterStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
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
                                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                                        </asp:ScriptManager>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="8" style="height: 20px; background-color: gainsboro">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 1px; height: 24px">
                                    </td>
                                    <td colspan="7" style="height: 24px">
                                        
                                       
                                        <asp:Panel ID="Panel1" runat="server" Visible="False" Width="800px">
                                            <table style="width: 800px">
                                                <tr>
                                                    <td style="width: 46px">
                                                        <asp:Label ID="Label8" runat="server" CssClass="NormalBold" Text="項次" Width="34px"></asp:Label></td>
                                                    <td style="width: 93px">
                                                        <asp:Label ID="Label10" runat="server" CssClass="NormalBold" Text="類別" Width="34px"></asp:Label></td>
                                                    <td style="width: 49px">
                                                        <asp:Label ID="Label9" runat="server" CssClass="NormalBold" Text="狀態" Width="34px"></asp:Label></td>
                                                    <td style="width: 101px">
                                                        <asp:Label ID="Label11" runat="server" CssClass="NormalBold" Text="說明" Width="34px"></asp:Label></td>
                                                    <td colspan="3">
                                                        <asp:TextBox ID="TextBox2" runat="server" Width="348px" Visible="False"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 46px">
                                                        <asp:Label ID="LabT01" runat="server" CssClass="NormalBold" Text="?" Width="51px"></asp:Label></td>
                                                    <td style="width: 93px">
                                                        <asp:Label ID="LabT02" runat="server" CssClass="NormalBold" Text="?" Width="134px"></asp:Label></td>
                                                    <td style="width: 49px">
                                                        <asp:DropDownList ID="Lisstatus" runat="server" CssClass="NormalBold">
                                                            <asp:ListItem Value="Y">Yes</asp:ListItem>
                                                            <asp:ListItem Value="N">No</asp:ListItem>
                                                        </asp:DropDownList></td>
                                                    <td colspan="4">
                                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="NormalBold" MaxLength="200" Width="608px"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 46px">
                                                    </td>
                                                    <td style="width: 93px">
                                                    </td>
                                                    <td style="width: 49px">
                                                    </td>
                                                    <td style="width: 101px">
                                                    </td>
                                                    <td style="width: 19px">
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="Button1" runat="server" Text="儲存" Width="63px" OnClick="Button1_Click" /></td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 1px; height: 24px">
                                    </td>
                                    <td align="center" colspan="7" style="height: 24px">
                                        <asp:HiddenField ID="Hid1" runat="server" />
                                        <asp:Button ID="Button2" runat="server" Text="歷史資料" Width="63px" OnClick="Button1_Click" Visible="False" />
                                        </td>
                                </tr>
                                <tr>
                                    <td style="width: 1px; height: 24px">
                                        <asp:Label ID="Label7" runat="server" CssClass="NormalBold" Text="明細資料" Width="75px"></asp:Label>
                                        <img id="Img2" onclick="OpenWin()" src="/ManagePDF/images/User.png" style="cursor: hand; width: 44px; height: 37px;" /></td>
                                    <td colspan="7" style="height: 24px"><asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"
                                            CssClass="Normal" Height="40px" Width="100%" Font-Bold="True" OnRowCommand="GridView2_RowCommand" PageSize="30">
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
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="azf03" HeaderText="理由">
                                                    <ItemStyle HorizontalAlign="Right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="tc_cbb16" HeaderText="專案名稱">
                                                    <ItemStyle HorizontalAlign="Right" />
                                                </asp:BoundField>
                                             <asp:BoundField DataField="tc_cbb04" HeaderText="型態" />
                                             <asp:BoundField DataField="tc_cbb05" HeaderText="會科" />
                                             <asp:BoundField DataField="aag02" HeaderText="科目名稱" />
                                             <asp:BoundField DataField="tc_cbb08" HeaderText="次類別" />
                                             <asp:BoundField DataField="fac02" HeaderText="類別名稱" />
                                             <asp:BoundField DataField="tc_cbb18" HeaderText="耐用月份" />
                                             <asp:BoundField DataField="itemstatus" HeaderText="核准否" />
                                             <asp:BoundField DataField="mismemo" HeaderText="MIS說明" />
                                                
                                            </Columns>
                                        <HeaderStyle BackColor="DimGray" ForeColor="Yellow" Height="30px" />
                                    </asp:GridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="8" style="height: 29px; background-color: gainsboro">
                                    </td>
                                </tr>
                                <tr>
                                    <td >
                                    </td>
                                    <td colspan="7">
                                    
                                        <asp:Panel ID="Panel2" runat="server">
                                        </asp:Panel>
                                    
                                    
                                    </td>
                                </tr>
                                 
                            </table>
                        </td>
                    </tr>
                </table>
                <SmoothEnterpriseWebControlFlowwork:FlowFeedback ID="FlowFeedback1" runat="server"
                    BackColor="#F0F0F0" BorderColor="#E0E0E0" BorderStyle="Solid" BorderWidth="1px"
                    CssClass="normal" Font-Size="12px" OnFeedbackComplete="FlowFeedback1_FeedbackComplete"
                    OnFlowNodeComplete="FlowFeedback1_FlowNodeComplete" OnFlowStop="FlowFeedback1_FlowStop"
                    RedirectAfterCommit="False" Width="1024px">
                    <Results>
                        <SmoothEnterpriseWebControlFlowwork:FlowResult ID="flowResult1" runat="server" ResultType="Next"
                            Text="同意" Width="120px" />
                        <SmoothEnterpriseWebControlFlowwork:FlowResult ID="flowResult2" runat="server" ResultType="Back"
                            Text="退回(退至上一關)" Width="200px" />
                        <SmoothEnterpriseWebControlFlowwork:FlowResult ID="FlowResult3" runat="server" ResultType="Return"
                            Text="退回(退至提案人)" Width="200px" />
                    </Results>
                    <ReplyTemplate>
                        <asp:Label ID="Label3" runat="server" Text="請輸入簽核意見："></asp:Label>
                        &nbsp;<br />
                        <SmoothEnterpriseWebControl:InputText ID="Input_Comment" runat="server" BackColor="#F0F0F0"
                            CssClass="Normal" Height="26px" Width="1008px">
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText>
                        <br />
                        <asp:Button ID="BUTTON_FlowFeedback" runat="server" CssClass="NormalBold" Height="31px"
                            OnClick="BUTTON_FlowFeedback_Click" Text="送出" Width="91px" />
                        <table style="width: 582px">
                            <tr>
                                <td style="height: 48px">
                                    <asp:Label ID="Label6" runat="server" Font-Size="Smaller" ForeColor="Blue" Text="選取下一關會簽主管"
                                        Visible="False"></asp:Label></td>
                                <td style="height: 48px">
    <SmoothEnterpriseWebControlEnterprise:PopupUser id="PopupUser1" runat="server" BackColor="#F0F0F0"
        CssClass="Normal" DisplayField="name" FormatType="InputCombo" FormatValueField="logonid"
        Gradient-GradientType="Top" ValueField="id" Visible="False">
        <gradient gradientbegin="" gradientend="" gradienttype="Top">
</gradient>
        <errorstyle borderstyle="NotSet" />
    </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
                                <td style="height: 48px">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <SmoothEnterpriseWebControl:InputText ID="InputText3" runat="server" BackColor="#F0F0F0"
                            CssClass="Normal" Visible="False" Width="209px">
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText>&nbsp;
                        <SmoothEnterpriseWebControl:InputText ID="IniReviewer" runat="server" BackColor="#F0F0F0"
                            ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                            ErrorMessage="" FocusColor="" FormatType="None" Height="25px" HiddenMode="False"
                            HTMLMode="Advance" IsValid="True" OnClickMore="" Personalize="False" Required="False"
                            Rows="1" Visible="False" Width="45px">
                            <ErrorStyle BorderStyle="NotSet" />
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText>
                        <br />
                    </ReplyTemplate>
                </SmoothEnterpriseWebControlFlowwork:FlowFeedback>
                <br />
                <SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer ID="FlowFeedbackViewer1" runat="server"
                    BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" CssClass="Normal"
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
	<table border="0" Class="Normal" style="width: 426px">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Text="回主頁" width="77px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_back_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>
                <SmoothEnterpriseWebControl:InputButton ID="InputButton1" runat="server" Text="傳Txt" width="77px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="InputButton1_Click" Visible="False">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton></td>
		</tr>
	</table>
</asp:Content>