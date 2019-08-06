<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="ERP_APMI255View.aspx.cs" Inherits="ERP_APMI255.ERP_APMI255View" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>

<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlFlowwork" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <script language="javascript"  type="text/javascript" src="<%=ResolveClientUrl("~/sub.js")%>"></script>
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="ERP_APMI255 View Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor><center>
                    <asp:Image ID="Image1" runat="server" Height="29px" ImageUrl="~/ERP_AXMT610/minaik.gif"
                        Width="32px" /><asp:Label ID="FIELD_CompanyName" runat="server" Font-Bold="True" Font-Names="新細明體"
                        Text="Label"></asp:Label>
    <br />
                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="新細明體" meta:resourcekey="Label6Resource1"
                        Text="採購核價申請單"></asp:Label></center>
    <center>
        &nbsp;</center>
    <table>
        <tr style="font-family: Arial">
            <td style="width: 1000px">
                <table border="1" bordercolor="gainsboro" cellpadding="0" cellspacing="0" style="width: 1000px;
                    border-collapse: collapse">
                    <tr>
                        <td style="height: 20px; background-color: whitesmoke">
                            <img height="15" src="img/award_star_gold_2.png" width="15" />
                            <asp:Label ID="Label10" runat="server" CssClass="NormalBold" meta:resourcekey="Label10Resource1"
                                Text="採 購 核 價 資 訊"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="height: 76px">
                            <table style="width: 996px; height: 113px">
                                <tr>
                                    <td style="width: 14px; height: 10px">
                                    </td>
                                    <td style="width: 110px; height: 10px">
                                        <asp:Label ID="Label2" runat="server" CssClass="NormalBold" Font-Bold="True" meta:resourcekey="Label1Resource1"
                                            Text="單號編號"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_no" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 110px; height: 10px">
                                        <asp:Label ID="LABEL_pmk04" runat="server" CssClass="NormalBold" Font-Bold="True"
                                            meta:resourcekey="LABEL_pmk04Resource1" Text="核價單日期"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmi02" runat="server" CssClass="Normal"
                                            ErrorMessage="Please Input「Pmi02」!!" FormatType="DateTime" MaxLength="0">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 109px; height: 10px">
                                        <asp:Label ID="LABEL_pmc03" runat="server" CssClass="NormalBold" Font-Bold="True"
                                            meta:resourcekey="LABEL_pmc03Resource1" Text="廠商"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmi03" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True" Width="71px">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText ID="FIELD_pmc03_0"
                                            runat="server" CssClass="PanelWhite" ForeColor="Black" ReadOnly="True" Width="71px">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 14px; height: 10px">
                                    </td>
                                    <td style="width: 110px; height: 10px">
                                        <asp:Label ID="LABEL_pmk01" runat="server" CssClass="NormalBold" Font-Bold="True"
                                            meta:resourcekey="LABEL_pmk01Resource1" Text="ERP核價單號"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmi01" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 110px; height: 10px">
                                        <asp:Label ID="LABEL_pme031_1" runat="server" CssClass="NormalBold" Font-Bold="True"
                                            meta:resourcekey="LABEL_pme031_1Resource1" Text="分量計價"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmi05" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 109px; height: 10px">
                                        <asp:Label ID="LABEL_l_amt2" runat="server" CssClass="NormalBold" Font-Bold="True"
                                            ForeColor="Black" meta:resourcekey="LABEL_l_amt2Resource1" Text="簽核流程"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_flowstatus" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 14px; height: 10px">
                                    </td>
                                    <td style="width: 110px; height: 10px">
                                        <asp:Label ID="Label12" runat="server" CssClass="NormalBold" Font-Bold="True" meta:resourcekey="Label12Resource1"
                                            Text="廠區"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_plantid" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 110px; height: 10px">
                                        <asp:Label ID="LABEL_pmk21" runat="server" CssClass="NormalBold" Font-Bold="True"
                                            Text="稅別/稅率"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmi08" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True" Width="71px">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText ID="FIELD_pmi081"
                                            runat="server" CssClass="PanelWhite" ForeColor="Black" ReadOnly="True" Width="71px">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 109px; height: 10px">
                                        <asp:Label ID="LABEL_gen02_3" runat="server" CssClass="NormalBold" Font-Bold="True"
                                            meta:resourcekey="LABEL_gen02_3Resource1" Text="資料所有者"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmiuser" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True" Width="71px">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText ID="FIELD_gen02_1"
                                            runat="server" CssClass="PanelWhite" ForeColor="Black" ReadOnly="True" Width="71px">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 14px; height: 10px">
                                    </td>
                                    <td style="width: 110px; height: 10px">
                                        <asp:Label ID="LABEL_gem02_4" runat="server" CssClass="NormalBold" Font-Bold="True"
                                            meta:resourcekey="LABEL_gem02_4Resource1" Text="資料所有者部門"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmigrup" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" ReadOnly="True" Width="71px">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText><SmoothEnterpriseWebControl:InputText ID="FIELD_gem02_2"
                                            runat="server" CssClass="PanelWhite" ForeColor="Black" ReadOnly="True" Width="71px">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 110px; height: 10px">
                                        <asp:Label ID="Label1" runat="server" CssClass="NormalBold" Font-Bold="True" meta:resourcekey="Label2Resource1"
                                            Text="ERP備註"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmi04" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" Height="17px" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 109px; height: 10px">
                                        <asp:Label ID="Label3" runat="server" CssClass="NormalBold" Font-Bold="True" meta:resourcekey="Label2Resource1"
                                            Text="單據狀態"></asp:Label></td>
                                    <td style="width: 145px; height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="InputText1" runat="server" CssClass="PanelWhite"
                                            ForeColor="Black" Height="17px" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 14px; height: 10px">
                                    </td>
                                    <td style="width: 110px; height: 10px">
                                        <asp:Label ID="Label22" runat="server" CssClass="NormalBold" Font-Bold="True" meta:resourcekey="Label22Resource1"
                                            Text="備註"></asp:Label></td>
                                    <td colspan="5" style="height: 10px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_rember" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal" ErrorMessage="Please Input「Rember」!!" MaxLength="200" Width="501px">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 14px; height: 10px">
                                    </td>
                                    <td style="width: 110px; height: 10px">
                                        <asp:Label ID="Label23" runat="server" CssClass="NormalBold" Font-Bold="True" meta:resourcekey="Label23Resource1"
                                            Text="夾帶檔案"></asp:Label></td>
                                    <td colspan="5" style="height: 10px">
                                        <asp:CheckBoxList ID="CheckBoxFile" runat="server" Font-Size="X-Small">
                                        </asp:CheckBoxList>
                                        <SmoothEnterpriseWebControl:InputFile ID="attach1" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal" onchange="addfile()" Visible="False">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputFile></td>
                                </tr>
                            </table>
                            <br />
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                                BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1"
                                Font-Size="Small" ForeColor="Black" GridLines="Vertical" Height="53px" OnRowCreated="GridView1_RowCreated"
                                PageSize="5" Width="1200px">
                                <RowStyle BorderColor="Black" Font-Size="Smaller" Height="5px" Wrap="False" />
                                <EmptyDataRowStyle Wrap="False" />
                                <Columns>
                                    <asp:BoundField DataField="pmj02" HeaderText="項次" SortExpression="pmj02" />
                                    <asp:TemplateField > 

                                         <ItemTemplate> 
                                        <a href="javascript:void(window.open('http://eip.minaik.com.tw/ERP_APMI255/APMI255_Report.aspx?id=<%#Eval("id")%>&item=<%#Eval("pmj02")%>','_blank','height=400, width=700,toolbar=no,menubar=no'))"> <asp:Image ID="Image1" runat="server" ImageUrl='chart_bar.png'/> </a>
                                         </ItemTemplate>

                                    </asp:TemplateField> 

                                    <asp:TemplateField>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" runat="server"  ImageUrl='<%# Eval("img1")%>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:BoundField DataField="pmj03" HeaderText="料號" SortExpression="pmj03" meta:resourcekey="pmj03" />
                                    <asp:BoundField DataField="pmj031" HeaderText="品名" SortExpression="pmj031" meta:resourcekey="pmj031" />
                                    <asp:BoundField DataField="pmj032" HeaderText="規格" SortExpression="pmj032" meta:resourcekey="pmj032" />
                                    <asp:BoundField DataField="pmj05" HeaderText="幣別" SortExpression="pmj05" meta:resourcekey="pmj05" />
                                    <asp:BoundField DataField="pmj06" HeaderText="原單價" SortExpression="pmj06" meta:resourcekey="pmj06" />
                                    <asp:BoundField DataField="pmj06t" HeaderText="原含稅單價" SortExpression="pmj06t" meta:resourcekey="pmj06t" />
                                    <asp:BoundField DataField="pmj07" HeaderText="新單價" SortExpression="pmj07" meta:resourcekey="pmj07">
                                        <HeaderStyle ForeColor="OrangeRed" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="pmj07t" HeaderText="新含稅單價" SortExpression="pmj07t" meta:resourcekey="pmj07t">
                                        <HeaderStyle ForeColor="OrangeRed" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="pmj08" HeaderText="原核准日" SortExpression="pmj08" meta:resourcekey="pmj08" />
                                    <asp:BoundField DataField="pmj09" HeaderText="新生效日起" ReadOnly="True" SortExpression="pmj09" meta:resourcekey="pmj09" />
                                    <asp:BoundField DataField="ta_pmj01" HeaderText="新生效日迄" ReadOnly="True" SortExpression="ta_pmj01" meta:resourcekey="ta_pmj01" />
                                    <asp:BoundField DataField="ima491" HeaderText="LT" SortExpression="ima491" meta:resourcekey="ima491" />
                                    <asp:BoundField DataField="ima46" HeaderText="最少採購數量" SortExpression="ima46" meta:resourcekey="ima46" />
                                    <asp:BoundField DataField="pmr03" HeaderText="數量起" SortExpression="pmr03" meta:resourcekey="pmr03" />
                                    <asp:BoundField DataField="pmr04" HeaderText="數量迄" SortExpression="pmr04" meta:resourcekey="pmr04" />
                                    <asp:BoundField DataField="pmr05" HeaderText="單價" SortExpression="pmr05" meta:resourcekey="pmr05">
                                        <HeaderStyle ForeColor="OrangeRed" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="pmr05t" HeaderText="含稅單價" SortExpression="pmr05t" meta:resourcekey="pmr05t">
                                        <HeaderStyle ForeColor="OrangeRed" />
                                    </asp:BoundField>
                                </Columns>
                                <FooterStyle BackColor="#CCCCCC" Wrap="False" />
                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" Wrap="False" />
                                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" Wrap="False" />
                                <HeaderStyle BackColor="Black" Font-Bold="True" Font-Size="X-Small" ForeColor="White"
                                    Height="5px" Wrap="True" />
                                <EditRowStyle Wrap="False" />
                                <AlternatingRowStyle BackColor="#CCCCCC" Wrap="False" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EIPAConnectionString %>"
                                SelectCommand="select apmi255_in_head.ID id,img1 ,bno,pmj02,pmj03,pmj031,pmj032,pmj04,pmj05,pmj06,pmj06t,pmj07,pmj07t,pmj08,  pmj09,pmj10,ta_pmj01, ima491,ima46,pmr03,pmr04,pmr05,pmr05t from(select case when pmj06>pmj07 then 'aaa.png' else 'aaa.png' end img1,bno,pmj02,pmj03,pmj031,pmj032,pmj04,pmj05,pmj06,pmj06t,pmj07,pmj07t,pmj08, CONVERT(varchar(12) , pmj09, 111 ) pmj09,pmj10,CONVERT(varchar(12) , ta_pmj01, 111 ) ta_pmj01, ima491,ima46,pmr03,pmr04,pmr05,pmr05t from apmi255_in_body left join apmi255_in_pmr on bno=cno and pmj02=pmr02   left join [EIPB].[dbo].apmi255_in_head on no=bno where bno='P102-12030002'  ) a left join  (select * from csc_attachment) b on a.img1=upname  order by pmr03,pmj02">
                            </asp:SqlDataSource>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 20px; background-color: white">
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 20px">
    <table border="0" Class="Normal">
        <tr>
            <td>
                <SmoothEnterpriseWebControlFlowwork:FlowFeedback ID="FlowFeedback1" runat="server"
                    BackColor="#F0F0F0" BorderColor="#E0E0E0" BorderStyle="Solid" BorderWidth="1px"
                    CssClass="Normal" Font-Size="12px" OnFeedbackComplete="FlowFeedback1_FeedbackComplete" OnFlowNodeComplete="FlowFeedback1_FlowNodeComplete" OnFlowStop="FlowFeedback1_FlowStop" RedirectAfterCommit="False">
                    <Results>
<SmoothEnterpriseWebControlFlowwork:FlowResult runat="server" Text="同意" ResultType="Next" ID="flowResult1" meta:resourcekey="flowResult1Resource1"></SmoothEnterpriseWebControlFlowwork:FlowResult>
<SmoothEnterpriseWebControlFlowwork:FlowResult runat="server" Text="退回(退至上一關) " ResultType="Back" ID="flowResult2" meta:resourcekey="flowResult2Resource1"></SmoothEnterpriseWebControlFlowwork:FlowResult>
<SmoothEnterpriseWebControlFlowwork:FlowResult ID="FlowResult3" runat="server" Text="退回(退至提案人)  " ResultType="Return" meta:resourcekey="FlowResultResource1"></SmoothEnterpriseWebControlFlowwork:FlowResult>

                    </Results>
                    <ReplyTemplate>
                        請輸入簽核意見：<br />
                        <SmoothEnterpriseWebControl:InputText ID="Input_Comment" runat="server" BackColor="#F0F0F0"
                            ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                            ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance"
                            IsValid="True" meta:resourcekey="Input_CommentResource1" OnClickMore="" Personalize="False"
                            Required="False" Width="500px">
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText>
                        <SmoothEnterpriseWebControl:InputText ID="InputText3" runat="server" BackColor="#F0F0F0"
                            ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                            ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance"
                            IsValid="True" meta:resourcekey="InputText3Resource1" OnClickMore="" Personalize="False"
                            Required="False" Visible="False">
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText>
                        <asp:Button ID="BUTTON_FlowFeedback" runat="server" CssClass="NormalBold" meta:resourcekey="BUTTON_FlowFeedbackResource1"
                            OnClick="BUTTON_FlowFeedback_Click" Text="送出" Width="80px" />
                    </ReplyTemplate>
                </SmoothEnterpriseWebControlFlowwork:FlowFeedback>
                <SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer ID="FlowFeedbackViewer1" runat="server"
                    BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" CssClass="Normal"
                    Font-Size="11px" OnOnLoadHistory="FlowFeedbackViewer1_OnLoadHistory">
                    <Columns>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="No" CustomKey="" Label=""></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Node" CustomKey="" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="ReviewerPhoto" CustomKey="" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Reviewer" CustomKey="" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Initdate" CustomKey="" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Receivedate" CustomKey="" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Reviewdate" CustomKey="" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Result" CustomKey="" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="ResultIcon" CustomKey="" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                    </Columns>
                    <HistoryTemplate>
                        &nbsp;<SmoothEnterpriseWebControl:InputText ID="Show_Comment" runat="server" BackColor="#F0F0F0"
                            CssClass="Normal" Width="400px">
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText><asp:Image ID="Image1" runat="server" meta:resourcekey="Image1Resource1" />
                    </HistoryTemplate>
                </SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer>
            </td>
        </tr>
    </table>
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Text="回上頁" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_back_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>
                            <SmoothEnterpriseWebControl:InputButton ID="PRINT" runat="server" BackColor="#C8C8C8"
                                BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold"
                                Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="PRINT_Click" Text="直接列印"
                                Width="80px">
                                <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                            </SmoothEnterpriseWebControl:InputButton></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="height: 25px">
            </td>
        </tr>
    </table>
</asp:Content>