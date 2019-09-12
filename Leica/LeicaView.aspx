<%@ Page Title="" Language="C#" MasterPageFile="~/_site/layout/ie_Edge.master" AutoEventWireup="true" CodeFile="LeicaView.aspx.cs" Inherits="Leica.LeicaView" StylesheetTheme="Edge" Culture="Auto" UICulture="Auto" Debug="true" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlFlowwork" %>
<%@ Register Assembly="SmoothEnterprise.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.Control" TagPrefix="SmoothEnterpriseControlFlowwork" %>
<%@ Register assembly="SmoothEnterprise.Web.Control.Flowwork" namespace="SmoothEnterprise.Flowwork.UI.WebControl" tagprefix="SmoothEnterpriseWebControlFlowwork" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <header>
        <script src="js/Leica.js"></script>
        <link href="js/Lieca.css" rel="stylesheet" />
    </header>
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>

    <div id="leica" style="margin: 10px; width: 1200px">
        <div style="display: none">
            <!--隱藏傳Server的預設資訊-->

            <asp:HiddenField ID="head_id" runat="server" />
            <asp:HiddenField ID="base_id" runat="server" />
            <asp:HiddenField ID="curr_page" runat="server" />

            <asp:HiddenField ID="msg" runat="server" Value="" />

            <div id="integer"><%=getStr("integer")%></div>
            <div id="inspect_empty"><%=getStr("inspect_empty") %></div>
            <div id="required"><%=getStr("required") %></div>
            <div id="isNum"><%=getStr("isnum") %></div>

            <div id="more_zero"><%=getStr("more_zero")%></div>
            <div id="is_zero"><%=getStr("is_zero")%></div>
            <div id="all_empty"><%=getStr("all_empty")%></div>
            <div id="duplicate"><%=getStr("duplicate") %></div>
            <div id="unable_to_run"><%=getStr("unable_to_run") %> </div>
            <div id="is_exist"><%=getStr("is_exist") %> </div>

        </div>

        <div>
            <%=all_sb.ToString() %>
        </div>

        <div id="no_postion">NO:<asp:Label ID="lab_NO" Text="" runat="server"></asp:Label></div>
        <div style="font-size: 2em; color: #9b1e64; height: 35px; font-weight: bolder;">
            Leica Inspection Record             
        </div>
        <div id="head" class="t1">
            <div class="tb1">
                <div class="tr">
                    <div class="th"><%=getStr("type") %></div>
                    <div class="td">
                        <asp:Label ID="lab_kind" runat="server" Next="product" level="5">
                        </asp:Label>
                    </div>

                    <div class="th"><%=getStr("inpecter") %></div>
                    <div class="td">
                        <asp:Label ID="lab_operator" runat="server"></asp:Label>
                    </div>
                    <div class="th"><%=getStr("Inspect_dt") %></div>

                    <div class="td">
                        <asp:Label ID="lab_inspDt" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="tr">

                    <div class="th"><%=getStr("product") %></div>
                    <div class="td">
                        <asp:Label ID="lab_product" runat="server" Next="program" level="4">
                        </asp:Label>
                    </div>
                    <div class="th"><%=getStr("program") %></div>
                    <div class="td">
                        <asp:Label ID="lab_program" runat="server" Next="test" level="3">
                        </asp:Label>
                    </div>

                    <div class="th"><%=getStr("result") %></div>
                    <div class="td">
                        <asp:Label ID="lab_result" runat="server">
                        </asp:Label>
                    </div>
                </div>
            </div>
        </div>


        <asp:UpdatePanel runat="server" ID="up_list" UpdateMode="Conditional" ChildrenAsTriggers="true">
            <ContentTemplate>
                <asp:HiddenField ID="ft_rowid" runat="server" />

                <div class="tb1">
                    <div class="tr">
                        <div class="td" style="text-align: center; font-size: 1.4em; color: #b598a1; font-weight: bold; width: 100%">
                            檢測記錄總表
                        </div>
                    </div>
                    <div class="tr">
                        <div class="td" style="width: 95%; margin: 0;">
                            <asp:GridView ID="all_list" runat="server" AllowPaging="false" AutoGenerateColumns="false" Font-Size="Medium" Width="100%"
                                OnRowDataBound="all_list_RowDataBound" CssClass="all_table" EmptyDataText="沒有資料" EmptyDataRowStyle-BackColor="White">
                                <Columns>


                                    <asp:BoundField DataField="base_id" HeaderText="base_id" Visible="true">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>

                                    <asp:BoundField DataField="inspect_id" HeaderText="inspect_id" Visible="true">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>

                                    <asp:TemplateField HeaderText="Item" HeaderStyle-Width="40">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                        <ItemTemplate>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Inspect" HeaderStyle-Width="70">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Inspect Count Quantity" HeaderStyle-Width="100">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sample Standard" HeaderStyle-Width="100">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sample Count Quantity" HeaderStyle-Width="100">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="bith_date" HeaderText="Manufacturing Date" HeaderStyle-Width="110">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>

                                    <asp:BoundField DataField="b_operator" HeaderText="Operator" HeaderStyle-Width="100">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>

                                    <asp:TemplateField HeaderText="View" HeaderStyle-Width="500">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>

                                </Columns>
                                <EmptyDataTemplate>
                                    <thead>
                                        <tr>
                                            <th style="width: 5%">Item</th>
                                            <th style="width: 10%"><%=getStr("insp_type") %></th>
                                            <th style="width: 10%"><%=getStr("inspct_num") %></th>
                                            <th style="width: 12%"><%=getStr("sp_stand") %></th>
                                            <th style="width: 10%"><%=getStr("samp_num") %></th>
                                            <th style="width: 10%"><%=getStr("birth_dt") %></th>
                                            <th style="width: 10%"><%=getStr("assembly_staff") %></th>
                                            <th style="width: 25%">View</th>
                                            <th style="width: 8%">Del</th>
                                        </tr>
                                    </thead>

                                </EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <div style="text-align: left">
           <SmoothEnterpriseWebControlFlowwork:FlowFeedback ID="FlowFeedback1" runat="server"
                    BackColor="#F0F0F0" BorderColor="#E0E0E0" BorderStyle="Solid" BorderWidth="1px"
                    CssClass="Normal" Font-Size="12px" OnFeedbackComplete="FlowFeedback1_FeedbackComplete" OnFlowStop="FlowFeedback1_FlowStop" OnFlowNodeComplete="FlowFeedback1_FlowNodeComplete" RedirectAfterCommit="False">
                    <Results>
                        <SmoothEnterpriseWebControlFlowwork:FlowResult ID="flowResult1" Text="允許" ResultType="Next"
                            runat="server"></SmoothEnterpriseWebControlFlowwork:FlowResult> 
                        <SmoothEnterpriseWebControlFlowwork:FlowResult ID="FlowResult3" runat="server" ResultType="Terminate"
                            Text="退回" />
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
                    <div style="text-align:center" >
                   <asp:Label runat="server" ID="S_Comment" ReadOnly="true" ForeColor="Red"></asp:Label>
                    <asp:Image ID="Image2" runat="server" ImageAlign="Right" ImageUrl="/gif/AppDeputy.png" Visible="False" />
                    <asp:Image ID="Image1" runat="server" />
                     </div>
                </HistoryTemplate>
            </SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer>

        </div>
        <div>
            <div class="tb1">
                <div class="tr" style="text-align: left">
                    <div class="td">

                        <SmoothEnterpriseWebControl:InputButton ID="Btn_Back" runat="server" Text="Back" Visible="true" OnClientClick="return Nomarl.goto('Leica.aspx')" />
                    </div>

                </div>
            </div>
        </div>
    </div>




</asp:Content>

