<%@ Page Title="" Language="C#" MasterPageFile="~/_site/layout/ie7.master" AutoEventWireup="true" CodeFile="IPQC_RaEdit.aspx.cs" Inherits="IPQC_Ra.IPQC_RaEdit" StylesheetTheme="Default" Culture="Auto"
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
        <script src="script/IPQC_Ra.js"></script>
        <style>
            .note {
                font-size: 1.5em;
                text-align: right;
                vertical-align: middle;
            }

            .column {
                font-size: 1.5em;
            }

            .fa-users {
                font-size: 1.8em;
            }
        </style>


    </header>
    <div style="color: red; display: none">
        <div id="chk_msg"><%=getStr("chk_msg") %> </div>
        <div id="isNum_msg"><%=getStr("isNum_msg") %> </div>
        <div id="isStr_msg"><%=getStr("isStr_msg") %> </div>
        <asp:HiddenField ID="msg" Value="" runat="server" />
    </div>

    <div style="width: 90%; padding: 10px 10px;">
        <SmoothEnterpriseControlFlowwork:FlowClient ID="FlowClient1" runat="server" TypeName="sharflow12_2.Flowwork.sharflow12_21" Text="IPQC Ra 檢驗電子簽核">
        </SmoothEnterpriseControlFlowwork:FlowClient>
        <div style="color: #FF6142; font-weight: bolder; font-size: 16px">
            <asp:Label ID="lab_Ra_NO" runat="server">tst0001</asp:Label>
        </div>
        <div style="border: 1px solid #808080; width: 100%; padding: 5px 5px">
            <div style="width: 100%;">

                <div class="div_td note"><%=getStr("received_date")%></div>
                <div class="div_td column">
                    <asp:Label ID="lab_Received" Text="" runat="server"></asp:Label>
                </div>

                <div class="div_td note"><%=getStr("week")%>:</div>
                <div class="div_td column">
                    <asp:Label ID="lab_week" Text="" runat="server"></asp:Label>
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
                    <asp:TextBox ID="txt_dispatch" runat="server" MaxLength="20"></asp:TextBox>
                </div>
                <div class="div_td note "><%=getStr("bom_dt")%>:</div>
                <div class="div_td column">
                    <asp:TextBox ID="txt_bomdt" runat="server" class="date"></asp:TextBox>
                </div>
            </div>

            <div style="width: 100%;">
                <div class="div_td note "><%=getStr("tooling")%>:</div>
                <div class="div_td column">
                    <asp:TextBox ID="txt_tooling" runat="server" MaxLength="20" CssClass="required"></asp:TextBox>
                </div>
                <div class="div_td note "><%=getStr("test_item")%>:</div>
                <div class="div_td column">
                    <asp:DropDownList runat="server" ID="cbo_testitem" CssClass="required"></asp:DropDownList>
                </div>
            </div>
            <div style="width: 100%">
                <div class="div_td note "><%=getStr("test_type")%>:</div>
                <div class="div_td column">
                    <asp:DropDownList runat="server" ID="cbo_testtype" CssClass="required"></asp:DropDownList>
                </div>
                <div class="div_td note"><%=getStr("product")%>:</div>
                <div class="div_td column">
                    <asp:DropDownList runat="server" ID="cbo_product"></asp:DropDownList>
                </div>
            </div>
            <div style="width: 100%">
                <div class="div_td note "><%=getStr("material")%>:</div>
                <div class="div_td column">
                    <asp:DropDownList runat="server" ID="cbo_material" CssClass="required"></asp:DropDownList>
                </div>
                <div class="div_td note"><%=getStr("program")%>:</div>
                <div class="div_td column">
                    <asp:DropDownList ID="cbo_program" runat="server" CssClass="required"></asp:DropDownList>
                </div>
            </div>

            <div style="width: 100%">
                <div class="div_td note "><%=getStr("sample")%>:</div>
                <div class="div_td column">
                    <asp:TextBox ID="txt_sample" runat="server" MaxLength="10" CssClass="required"></asp:TextBox>
                </div>
                <div class="div_td note"><%=getStr("equipment")%>:</div>
                <div class="div_td column">
                    <asp:DropDownList ID="cbo_Machine" runat="server"></asp:DropDownList>
                </div>
            </div>
            <div style="width: 100%">
                <div class="div_td note"><%=getStr("remark")%>:</div>
                <div class="div_td column" style="width: 75%">
                    <asp:TextBox ID="txt_remark" runat="server" MaxLength="200" Width="90%"></asp:TextBox>
                </div>

            </div>

        </div>
        <div class="t1" style="width: 100%; text-align: left">
            <table border="0" class="Normal" width="1024">
                <tr>
                    <td>
                        <SmoothEnterpriseControlFlowwork:FlowClient ID="FlowClient2" runat="server" TypeName="sharflow12_2.Flowwork.sharflow12_21" Text="IPQC檢驗電子簽核">
                        </SmoothEnterpriseControlFlowwork:FlowClient>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer ID="FlowFeedbackViewer1" runat="server"
                            BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" CssClass="Normal"
                            Font-Size="11px" OnOnLoadHistory="FlowFeedbackViewer1_OnLoadHistory" Width="1024px">
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
                                <SmoothEnterpriseWebControl:InputText ID="S_Comment" runat="server" BackColor="Moccasin"
                                    BorderColor="DarkOrange" CssClass="Normal" ForeColor="#400040" Height="31px"
                                    Width="513px">
                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText>
                                <asp:Image ID="Image1" runat="server" /><br />
                                &nbsp;
                            </HistoryTemplate>
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer>
                    </td>
                </tr>
            </table>

        </div>
        <div class="t1" style="text-align: left; margin: 2px 2px">

            <table border="0" style="margin: 20px 2px">
                <tr>
                    <td style="text-align: right">

                        <asp:Label ID="lab_Mg1" runat="server" Text="Confirm" Width="102px" CssClass="NormalBold ML" Font-Size="Small" ML_Tag="confirm"> </asp:Label></td>
                    <td>

                        <asp:TextBox ID="txt_user" class="Muser" runat="server"></asp:TextBox>
                </tr>

            </table>
        </div>
        <div style="text-align: left; margin: 2px 2px"> 
            <div style="float: left">
                <SmoothEnterpriseWebControl:InputButton ID="Btn_Save" OnClick="Btn_Save_Click" OnClientClick="return check()" runat="server" Text="Save" Flow="<%# FlowClient1 %>" CssClass="sysBtn">
                </SmoothEnterpriseWebControl:InputButton>
            </div>
            <div style="float: left">
                <SmoothEnterpriseWebControlFlowwork:SendRequestButton ID="Btn_SendRequest" OnClick="Btn_SendRequest_Click" runat="server" Text="Submittal" Flow="<%# FlowClient1 %>" CssClass="sysBtn">
                </SmoothEnterpriseWebControlFlowwork:SendRequestButton>
            </div>
            <div style="float: left">
                <SmoothEnterpriseWebControlFlowwork:RemindReviewerButton ID="Btn_RemindReviewer" OnClick="Btn_RemindReviewer_Click" runat="server" Text="Remind Reviewer" Flow="<%# FlowClient1 %>" CssClass="sysBtn">
                </SmoothEnterpriseWebControlFlowwork:RemindReviewerButton>
            </div>
            <div style="float: left">
                <SmoothEnterpriseWebControlFlowwork:StopRequestButton ID="Btn_Stop" OnClick="Btn_Stop_Click" runat="server" Text="Stop" Flow="<%# FlowClient1 %>" CssClass="sysBtn">
                </SmoothEnterpriseWebControlFlowwork:StopRequestButton>
            </div>
            <div style="float: left">
                <SmoothEnterpriseWebControl:InputButton ID="Btn_fail" OnClick="Btn_fail_Click" runat="server" Text="Fail" Flow="<%# FlowClient1 %>" CssClass="sysBtn">
                </SmoothEnterpriseWebControl:InputButton>
            </div>
            <div style="float: left">
                <SmoothEnterpriseWebControl:InputButton ID="Btn_Back" OnClick="Btn_Back_Click" runat="server" Text="Back" Flow="<%# FlowClient1 %>" CssClass="sysBtn">
                </SmoothEnterpriseWebControl:InputButton>
            </div>
            <div style="float: left">
                <asp:Button ID="Btn_AddNext" OnClick="Btn_AddNext_Click" runat="server" Text="Add Next" CssClass="sysBtn" />
            </div>
            
        </div>
    </div>


</asp:Content>
