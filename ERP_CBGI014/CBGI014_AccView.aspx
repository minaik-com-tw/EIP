<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="CBGI014_AccView.aspx.cs" Inherits="ERP_CBGI014.CBGI014View" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>
 
 
 <%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlFlowwork" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>














<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="CBGI014 View Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    
    
    <table style="width: 1224px">
        <tr>
            <td align="center" colspan="3" style="height: 47px">
                <asp:Image ID="Image1" runat="server" Height="38px" ImageUrl="~/ERP_AXMT610/minaik.gif"
                    Width="42px" />
                <asp:Label ID="FIELD_companyname" runat="server" Font-Bold="True" Font-Names="�s�ө���"
                    Text="�ʲ���ުѥ��������q"></asp:Label></td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="�s�ө���" Text="�T�w�겣�w��ӽг�"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="3">
                <table border="1" cellpadding="0" cellspacing="0" style="width: 1024px">
                    <tr>
                        <td align="left" colspan="3" style="height: 26px">
                            <table width="1224">
                                <tr>
                                    <td style="width: 128px; height: 35px">
                                        <asp:Label ID="Label2" runat="server" CssClass="NormalBold" Text="�渹"></asp:Label></td>
                                    <td style="width: 128px; height: 35px">
                                        <SmoothEnterpriseWebControl:InputText id="FIELD_sn" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�u�渹�v!!" MaxLength="15"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 128px; height: 35px">
                                        <asp:Label ID="Label4" runat="server" CssClass="NormalBold" Text="�����W��" Font-Bold="True" Width="78px"></asp:Label></td>
                                    <td style="width: 128px; height: 35px">
                                        <SmoothEnterpriseWebControl:InputText id="FIELD_gem02_0" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�u�����W�١v!!" MaxLength="20"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 128px; height: 35px">
                                        <asp:Label ID="Label5" runat="server" CssClass="NormalBold" Text="�w��N��" Width="79px"></asp:Label></td>
                                    <td style="width: 128px; height: 35px">
                                        <SmoothEnterpriseWebControl:InputText id="FIELD_tc_cba00" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�u�w��N���v!!" MaxLength="10"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 128px; height: 35px">
                                        <asp:Label ID="LABEL_ver" runat="server" CssClass="NormalBold" Text="����"></asp:Label></td>
                                    <td style="width: 128px; height: 35px">
                                        <SmoothEnterpriseWebControl:InputText id="FIELD_ver" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�u�����v!!" MaxLength="0"  FormatType="Number"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 1px">
                                        <asp:Label ID="LABEL_inidate" runat="server" CssClass="NormalBold" Text="�س���" Width="75px"></asp:Label></td>
                                    <td style="width: 3px">
                                        <SmoothEnterpriseWebControl:InputText id="FIELD_inidate" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�u�س����v!!" MaxLength="0"  FormatType="DateTime"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 3px">
                                        <asp:Label ID="LABEL_gen02_1" runat="server" CssClass="NormalBold" Text="�ݨD��" Width="53px"></asp:Label></td>
                                    <td style="width: 3px">
                                        <SmoothEnterpriseWebControl:InputText id="FIELD_tc_cbauser" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�u�ݨD�̡v!!" MaxLength="20"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 3px">
                                        <asp:Label ID="LABEL_tc_cba02" runat="server" CssClass="NormalBold" Text="�w�����" Width="81px"></asp:Label></td>
                                    <td style="width: 4px">
                                        <SmoothEnterpriseWebControl:InputText id="FIELD_tc_cba01" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uTc_cba01�v!!" MaxLength="10"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>
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
                                        <asp:Label ID="Label6" runat="server" CssClass="NormalBold" Text="���Ӹ��" Width="75px"></asp:Label></td>
                                    <td colspan="7" style="height: 24px">
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                                            CssClass="Normal" Height="40px" Width="100%" Font-Bold="True" OnDataBound="GridView1_DataBound" OnRowCreated="GridView1_RowCreated" ShowFooter="True" PageSize="50">
                                            <RowStyle Height="25px" />
                                            <Columns>
                                            <asp:BoundField DataField="tc_cbb03" HeaderText="����" />
                                            <asp:BoundField DataField="tc_cbb05" HeaderText="�|�p���" />
                                            <asp:BoundField DataField="aag02" HeaderText="�|��W��" >
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="tc_cbb22" HeaderText="�]�ƦW��" >
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            
                                            
                                            <asp:BoundField DataField="tc_cbb08" HeaderText="�겣�����O" >
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                             <asp:BoundField DataField="fac02" HeaderText="���O�W��" >
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                             <asp:BoundField DataField="tc_cbb18" HeaderText="�@�Τ��" >
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            <asp:BoundField DataField="tc_cbb091" HeaderText="�Ʊ���">
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="tc_cbb10" HeaderText="�ƶq">
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="tc_cbb13f" HeaderText="������">
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="tc_cbb11" HeaderText="���O">
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="tc_cbb12" HeaderText="�ײv">
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="tc_cbb14f" HeaderText="������B">
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="tc_cbb14" HeaderText="�������B">
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="tc_cbb16" HeaderText="�M�צW��" >
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="tc_cbb21" HeaderText="��ĳ�t��" >
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="azf03" HeaderText="�γ~" >
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            
                                            
                                            
                                            
                                            
                                            
                                             <asp:BoundField DataField="tc_cbb17" HeaderText="�O�¸겣(�겣�s��)" >
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            
                                            <asp:BoundField DataField="faj26" HeaderText="�J�b���" >
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="faj31" HeaderText="�w�ϥΦ~��" >
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            
                                            <asp:BoundField DataField="fajowner" HeaderText="�ϥΪ̩m�W" >
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
                                    </td>
                                    <td colspan="7" style="height: 24px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 1px; height: 24px">
                                        </td>
                                    <td colspan="7" style="height: 24px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="8" style="height: 20px; background-color: gainsboro">
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
                            Text="�P�N" Width="120px" />
                        <SmoothEnterpriseWebControlFlowwork:FlowResult ID="flowResult2" runat="server" ResultType="Back"
                            Text="�h�^(�h�ܤW�@��)" Width="200px" />
                        <SmoothEnterpriseWebControlFlowwork:FlowResult ID="FlowResult3" runat="server" ResultType="Return"
                            Text="�h�^(�h�ܴ��פH)" Width="200px" />
                    </Results>
                    <ReplyTemplate>
                        <asp:Label ID="Label3" runat="server" Text="�п�Jñ�ַN���G"></asp:Label>
                        &nbsp;<br />
                        <SmoothEnterpriseWebControl:InputText ID="Input_Comment" runat="server" BackColor="#F0F0F0"
                            CssClass="Normal" Height="26px" Width="1008px">
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText>
                        <br />
                        <asp:Button ID="BUTTON_FlowFeedback" runat="server" CssClass="NormalBold" Height="31px"
                            OnClick="BUTTON_FlowFeedback_Click" Text="�e�X" Width="91px" /><br />
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
	<table border="0" Class="Normal">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Text="�^�W��" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_back_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>
			</td>
		</tr>
	</table>
</asp:Content>