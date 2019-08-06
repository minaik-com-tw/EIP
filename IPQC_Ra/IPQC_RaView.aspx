<%@ Page Title="" Language="C#" MasterPageFile="~/_site/layout/ie7.master" AutoEventWireup="true" CodeFile="IPQC_RaView.aspx.cs" Inherits="IPQC_Ra.IPQC_RaView" StylesheetTheme="Default" Culture="Auto"
    UICulture="Auto" Debug="true" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.Control" TagPrefix="SmoothEnterpriseControlFlowwork" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlFlowwork" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <header>
        <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server"
            Details="Input IPQC Ra data" Caption="IPQC Ra Add Page" Width="100%"
            CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
            <CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
            <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
        </SmoothEnterpriseWebControlEnterprise:Descriptor>
         
        <link href="css/IPQC_Ra.css" rel="stylesheet" />
        <script>
            function backup_page()
            {
                window.history.back();
                return false;
            }
        </script>
         <style>
         .note {
             font-size :1.5em;
             text-align:right;
             vertical-align:middle;
         }

         .column {
                font-size :1.5em;
         }
     </style>
    </header>

    <div style="width: 100%; padding: 10px 10px;">
        <SmoothEnterpriseControlFlowwork:FlowClient ID="FlowClient1" runat="server" TypeName="sharflow12_2.Flowwork.sharflow12_21" Text="IPQC Ra 檢驗電子簽核">
        </SmoothEnterpriseControlFlowwork:FlowClient>
        <div style="color: #FF6142; font-weight: bolder; font-size: 16px">
            <asp:Label ID="lab_Ra_NO" runat="server">tst0001</asp:Label>
        </div>
        <div style="border: 1px solid #808080; width: 100%; padding: 5px 5px">
            <div style="width: 100%;">

                <div class="div_td note"><%=getStr("lab_no")%></div>
                <div class="div_td column">
                    <asp:Label ID="lab_Received" Text="2017/07/25" runat="server"></asp:Label>
                </div>

                <div class="div_td note"><%=getStr("week")%>:</div>
                <div class="div_td column">
                    <asp:Label ID="lab_week" Text="22" runat="server"></asp:Label>
                </div>
            </div>
            <div style="width: 100%">
                <div class="div_td note "><%=getStr("applicant")%>:</div>
                <div class="div_td column">
                    <asp:Label ID="lab_applicant" Text="王小明" runat="server"></asp:Label>

                </div>
                <div class="div_td note"><%=getStr("dept")%>:</div>
                <div class="div_td column">
                    <asp:Label ID="lab_depat" Text="" runat="server"></asp:Label>
                </div>
            </div>
            <div style="width: 100%">
                <div class="div_td note "><%=getStr("dispatch")%>:</div>
                <div class="div_td column">
                    <asp:Label ID="lab_dispatch" Text="" runat="server"></asp:Label>
                </div>
                <div class="div_td note "><%=getStr("bom_dt")%>:</div>
                <div class="div_td column">
                    <asp:Label ID="lab_bomdt" Text="" runat="server"></asp:Label>

                </div>
            </div>

            <div style="width: 100%;">

                <div class="div_td note "><%=getStr("tooling")%>:</div>
                <div class="div_td column">
                    <asp:Label ID="lab_tooling" Text="" runat="server"></asp:Label>
                </div>
                <div class="div_td note "><%=getStr("test_item")%>:</div>
                <div class="div_td column">
                    <asp:Label ID="lab_testitem" Text="" runat="server"></asp:Label>
                </div>
            </div>
            <div style="width: 100%;">

                <div class="div_td note "><%=getStr("test_type")%>:</div>
                <div class="div_td column">

                    <asp:Label ID="lab_testtype" Text="" runat="server"></asp:Label>
                </div>
                <div class="div_td note"><%=getStr("product")%>:</div>
                <div class="div_td column">
                    <asp:Label ID="lab_product" Text="" runat="server"></asp:Label>
                </div>
            </div>

            <div style="width: 100%">
                <div class="div_td note "><%=getStr("material")%>:</div>
                <div class="div_td column">
                    <asp:Label ID="lab_material" Text="" runat="server"></asp:Label>
                </div>
                <div class="div_td note"><%=getStr("program")%>:</div>
                <div class="div_td column">
                    <asp:Label ID="lab_program" Text="" runat="server"></asp:Label>
                </div>
            </div>

            <div style="width: 100%">
                <div class="div_td note "><%=getStr("sample")%>:</div>
                <div class="div_td column">
                    <asp:Label ID="lab_sample" Text="" runat="server"></asp:Label>
                </div>
                <div class="div_td note"><%=getStr("equipment")%>:</div>
                <div class="div_td column">

                    <asp:Label ID="lab_equipment" Text="" runat="server"></asp:Label>
                </div>
            </div>
            <div style="width: 100%">
                <div class="div_td note"><%=getStr("remark")%>:</div>
                <div class="div_td column">
                    <asp:Label ID="lab_remark" Text="" runat="server"></asp:Label>
                </div>

            </div>

        </div>
        <div class="t1" style="width: 100%; text-align: left">
            <table border="0" class="Normal" style="width:100%">
                <tr>
                    <td>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedback ID="FlowFeedback1" runat="server"
                            BackColor="#F0F0F0" BorderColor="#E0E0E0" BorderStyle="Solid" BorderWidth="1px"
                            CssClass="Normal" Font-Size="12px" OnFeedbackComplete="FlowFeedback1_FeedbackComplete" OnFlowStop="FlowFeedback1_FlowStop" OnFlowNodeComplete="FlowFeedback1_FlowNodeComplete" RedirectAfterCommit="False">
                            <Results>
                                <SmoothEnterpriseWebControlFlowwork:FlowResult ID="flowResult1" Text="允許" ResultType="Next"
                                    runat="server"></SmoothEnterpriseWebControlFlowwork:FlowResult> 
                                <SmoothEnterpriseWebControlFlowwork:FlowResult ID="FlowResult3" runat="server" ResultType="Terminate"
                                    Text="退回提案人" />
                            </Results>
                            <ReplyTemplate>
                                <SmoothEnterpriseWebControl:InputText ID="ResTxt" runat="server" BackColor="#F0F0F0"
                                    CssClass="Normal" Width="600px">
                                    <ErrorStyle BorderStyle="NotSet" />
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText>
                                <SmoothEnterpriseWebControl:InputText ID="Flow_loginID" runat="server" BackColor="#F0F0F0"
                                    CssClass="Normal" Visible="False">
                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText>
                                <SmoothEnterpriseWebControl:InputText ID="IniReviewer" runat="server" BackColor="#F0F0F0"
                                    ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                                    ErrorMessage="" FocusColor="" FormatType="None" Height="25px" HiddenMode="False"
                                    HTMLMode="Advance" IsValid="True" OnClickMore="" Personalize="False" Required="False"
                                    Rows="1" Visible="False" Width="162px">
                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText>
                                <asp:Button ID="BUTTON_FlowFeedback" runat="server" CssClass="NormalBold" Text="送出"
                                    OnClick="BUTTON_FlowFeedback_Click" Width="80px"></asp:Button>
                            </ReplyTemplate>
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedback>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer ID="FlowFeedbackViewer1" runat="server"
                            BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" CssClass="Normal"
                            Font-Size="11px" OnOnLoadHistory="FlowFeedbackViewer1_OnLoadHistory">
                            <Columns>
                                <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="No" Label=""></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                                <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Node" Label=""></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                                <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="ReviewerPhoto" Label=""></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                                <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Reviewer" Label=""></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                                <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Initdate" Label=""></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                                <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Receivedate" Label=""></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                                <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Reviewdate" Label=""></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                                <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Result" Label=""></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                                <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="ResultIcon" Label=""></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                            </Columns>
                            <HistoryTemplate>
                                <asp:Label ID="Show_Comment" runat="server" Text="Label"></asp:Label>
                                <asp:Image ID="Image2" runat="server" ImageAlign="Right" ImageUrl="/gif/AppDeputy.png" />
                                <asp:Image ID="Image1" runat="server" ImageAlign="Right" />
                            </HistoryTemplate>
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer>
                    </td>
                </tr>
            </table>
        </div>
        <div style="text-align: left">

            <SmoothEnterpriseWebControl:InputButton ID="Btn_Back"  OnClientClick="return backup_page()"  runat="server" Text="Back" Width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Arial" Font-Size="12px">
                <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
            </SmoothEnterpriseWebControl:InputButton>
        </div>
    </div>



</asp:Content>
