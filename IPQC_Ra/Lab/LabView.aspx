<%@ Page Title="" Language="C#" MasterPageFile="~/_site/layout/ie7.master" AutoEventWireup="true" CodeFile="LabView.aspx.cs" Inherits="Lab.LabView" StylesheetTheme="Default" Culture="Auto"
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

        <link href="../../script/css/normalize.css" rel="stylesheet" />
        <link href="../../script/css/mak_base.css" rel="stylesheet" />
        <link href="../css/IPQC_Ra.css" rel="stylesheet" />
        <link href="../css/lab.css" rel="stylesheet" />
        <script src="../script/lab.js"></script>

        <script>
            function backup_page() {
                window.history.back();
                return false;
            }

            $(function () {
                $("#copy_mail").click(function () {
                    var value = $("#ctl00_ContentPlaceHolder1_FlowFeedback1_ctl03_txt_mail").val();
                    var name = $("#ctl00_ContentPlaceHolder1_FlowFeedback1_ctl03_txt_mail_display").val();

                    if (value != "") {
                        $("#mail_list").append('<a href="#" id="a_' + value + '" onclick="del_item(this)" ><div class="Rmail" id="' + value + '" style="display:table-cell;float: left;margin: 2px 10px;" >' + name + '</div> </a>');
                    }
                });
            });

            function del_item(obj) {
                var id = $(obj).remove();
            }

            function chk() {
                var mail = "";
                $(".Rmail").each(function (i) {
                    var id = $(this).attr("id");
                    if (mail != "") {
                        mail += ",";
                    }
                    mail += id;
                });
                //mail = "02CA2090-C5D0-455B-A671-5D7168D08559";
                $("#ctl00_ContentPlaceHolder1_txt_Rmail").val(mail);

                $("input[name='rd_result']").each(function () {
                    var chk = $(this).prop("checked");
                    if (chk) {
                        var result = $(this).attr("value");
                        $("#ctl00_ContentPlaceHolder1_test_Result").val(result);
                    }
                });

                return true;
            }
        </script>
        <style>
            .table div .th {
                background-color: #C0C5C7;
            }

            .table div .th2 {
                background-color: #C0C5C7;
            }


            .t2 div .td {
                width: 30%;
            }

            .t2 div {
                border: 1px solid #fff;
            }

                .t2 div .th {
                    background-color: #95B5D5;
                }
        </style>
    </header>



    <asp:HiddenField ID="up" runat="server" />
    <asp:HiddenField ID="upper" runat="server" />
    <asp:HiddenField ID="down" runat="server" />
    <asp:HiddenField ID="lower" runat="server" />
    <asp:ScriptManager ID="sm1" runat="server" EnablePartialRendering="false"></asp:ScriptManager>
    <div style="width: 95%; padding: 10px 10px; z-index: 10">
        <SmoothEnterpriseControlFlowwork:FlowClient ID="FlowClient1" runat="server" TypeName="sharflow12_2.Flowwork.sharflow12_21" Text="IPQC Ra 檢驗電子簽核">
        </SmoothEnterpriseControlFlowwork:FlowClient>
        <asp:HiddenField ID="txt_Rmail" runat="server" />
        <asp:HiddenField ID="test_Result" runat="server" />
        <div class="table" style="border: 1px solid #000">

            <div>
                <div class="th"><%=getStr("lab_no") %>:</div>
                <div class="td">
                    <asp:Label ID="lab_Ra_no" Text="t0001" runat="server"></asp:Label>

                </div>
                <div class="th"><%=getStr("received_date") %>:</div>
                <div class="td">
                    <asp:Label ID="lab_Received" runat="server"></asp:Label>
                </div>

                <div class="th"><%=getStr("week") %>:</div>
                <div class="td">
                    <asp:Label ID="lab_week" runat="server"></asp:Label>
                </div>
            </div>
            <div>
                <div class="th "><%=getStr("applicant") %>:</div>
                <div class="td">
                    <asp:Label ID="lab_applicant" runat="server"></asp:Label>

                </div>
                <div class="th"><%=getStr("dept") %>:</div>
                <div class="td">
                    <asp:Label ID="lab_depat" runat="server"></asp:Label>
                </div>
                <div class="th "><%=getStr("dispatch") %>:</div>
                <div class="td">
                    <asp:Label ID="lab_dispatch" runat="server"></asp:Label>
                </div>
            </div>
            <div>

                <div class="th "><%=getStr("bom_dt") %>:</div>
                <div class="td">
                    <asp:Label ID="lab_bomdt" runat="server"></asp:Label>

                </div>


                <div class="th "><%=getStr("tooling") %>:</div>
                <div class="td">
                    <asp:Label ID="lab_tooling" runat="server"></asp:Label>
                </div>
                <div class="th "><%=getStr("test_item") %>:</div>
                <div class="td">
                    <asp:Label ID="lab_testitem" runat="server"></asp:Label>
                </div>
            </div>
            <div>

                <div class="th "><%=getStr("test_type") %>:</div>
                <div class="td">

                    <asp:Label ID="lab_testtype" runat="server"></asp:Label>
                </div>
                <div class="th"><%=getStr("product") %>:</div>
                <div class="td">
                    <asp:Label ID="lab_product" runat="server"></asp:Label>
                </div>
                <div class="th "><%=getStr("material") %>:</div>
                <div class="td">
                    <asp:Label ID="lab_material" runat="server"></asp:Label>
                </div>
            </div>

            <div>

                <div class="th"><%=getStr("program") %>:</div>
                <div class="td">
                    <asp:Label ID="lab_program" runat="server"></asp:Label>
                </div>

                <div class="th "><%=getStr("sample") %>:</div>
                <div class="td">
                    <asp:Label ID="lab_sample" runat="server"></asp:Label>
                </div>
                <div class="th"><%=getStr("equipment") %>:</div>
                <div class="td">
                    <asp:Label ID="lab_equipment" runat="server"></asp:Label>
                </div>
            </div>
            <div>
                <div class="th "><%=getStr("remark") %>:</div>
                <div class="td">
                    <asp:Label ID="lab_remark" runat="server"></asp:Label>
                </div>
                <div class="th"><%=getStr("data_unit") %>:</div>
                <div class="td">
                    <asp:Label ID="lab_unit" runat="server"></asp:Label>
                </div>
                <div class="th "><%=getStr("receipt_date")%>:</div>
                <div class="td">
                    <asp:Label ID="lab_receipt" runat="server"></asp:Label>
                </div>
            </div>

        </div>
    </div>
    <div style="width: 200px; height: 113px; z-index: 1; position: absolute; top: 280px; right: 250px">
        <asp:Image ID="img_result" runat="server" />
    </div>

    <div style="width: 100%; padding: 5px 5px; margin: 10px 5px;">

        <asp:GridView ID="gv_Lab" runat="server" AutoGenerateColumns="False" AllowPaging="False" AllowSorting="False" OnRowDataBound="gv_Lab_RowDataBound" OnRowCreated="gv_Lab_RowCreated"
            Width="100%" EnableModelValidation="True" GridLines="Both" CellPadding="0" CellSpacing="0" BorderStyle="Solid" BorderColor="#523971" BorderWidth="1" ForeColor="#fff">
            <AlternatingRowStyle BackColor="#DFDBE5" />
            <RowStyle BackColor="White" ForeColor="#4A3C8C" Height="20px" />
            <Columns>
                <asp:TemplateField HeaderText="id" Visible="false" HeaderStyle-CssClass="i_td1">
                    <HeaderStyle Font-Size="14px" HorizontalAlign="Center" CssClass="list_style" />
                    <ItemStyle Font-Size="14px" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Item">
                    <HeaderStyle Font-Size="14px" HorizontalAlign="Center" CssClass="list_style" Width="5%" Height="30" />
                    <ItemStyle Font-Size="14px" HorizontalAlign="Center" />
                    <ItemTemplate>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Measuring position" meta:resourcekey="m_position" HeaderStyle-CssClass="i_td1">
                    <HeaderStyle Font-Size="14px" HorizontalAlign="Center" CssClass="list_style" Width="24%" Height="30" />
                    <ItemStyle Font-Size="14px" HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Completed Date" meta:resourcekey="cmp_dt" HeaderStyle-CssClass="i_td1">
                    <HeaderStyle Font-Size="14px" HorizontalAlign="Center" CssClass="list_style" Width="9%" Height="30" />
                    <ItemStyle Font-Size="14px" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="RART side" meta:resourcekey="rart" HeaderStyle-CssClass="i_td1">
                    <HeaderStyle Font-Size="14px" HorizontalAlign="Center" CssClass="list_style" Width="9%" Height="30" />
                    <ItemStyle Font-Size="14px" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Test result" meta:resourcekey="test_result" HeaderStyle-CssClass="i_td1">
                    <HeaderStyle Font-Size="14px" HorizontalAlign="Center" CssClass="list_style" Width="48%" Height="30" />
                    <ItemStyle Font-Size="14px" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="" HeaderStyle-CssClass="i_td1" Visible="false">

                    <HeaderStyle Font-Size="14px" HorizontalAlign="Center" CssClass="list_style" Width="5%" Height="30" />
                    <ItemStyle Font-Size="14px" HorizontalAlign="Center" />
                </asp:TemplateField>


            </Columns>
            <EmptyDataTemplate>
                <table class="all" border="1" style="border: 1px solid #808080; margin: 2px 2px">
                    <tr style="height: 30px; background-color: #523971; color: #fff; font-weight: bolder; text-align: center">
                        <td style="width: 50px;">Item</td>
                        <td style="width: 150px;"><%=getStr("m_position") %></td>
                        <td style="width: 150px;"><%=getStr("cmp_dt") %></td>
                        <td style="width: 120px;"><%=getStr("rart") %></td>
                        <td style="width: 480px;"><%=getStr("test_result") %></td>
                        <td style="width: 60px;"></td>

                    </tr>
                    <tr>
                        <td colspan="6" style="text-align: center; padding: 5px 5px">
                            <%=getStr("not_data") %></td>
                    </tr>
                </table>
            </EmptyDataTemplate>
        </asp:GridView>

    </div>
    <asp:UpdatePanel ID="panel_file" runat="server">
        <ContentTemplate>
            <div id="report" class="table t2" style="border: 1px  solid #808080">

                <div>
                    <div class="th" id="re_result"><%=getStr("re_result") %></div>
                    <div class="td" style="width: auto">
                        <asp:Label ID="lab_re_result" runat="server" Width="90%"></asp:Label>
                    </div>

                    <div id="reply" class="th"><%=getStr("reply") %></div>
                    <div class="td">
                        <asp:Label ID="lab_replay" runat="server" MaxLength="200" TextMode="MultiLine" Width="90%"></asp:Label>
                    </div>
                </div>
                <div>
                    <div class="th"><%=getStr("retest") %></div>
                    <div style="float: left; width: 75%; padding: 5px; text-align: left">
                        <asp:LinkButton ID="lbtn_download" OnClick="lbtn_download_Click" runat="server"></asp:LinkButton>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="t1" style="width: 100%; text-align: left">
        <table border="0" class="Normal" style="width: 100%">
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

                            <div style="margin: 5px 1px">
                                <div style="width: 100%; float: left; margin: 3px 2px; font-weight: bolder"><%=getStr("chk_result") %></div>
                                <div style="width: 100%; font-size: 12px; margin: 3px 2px">
                                    <input type="radio" name="rd_result" checked="checked" value="0"><font color="Red">FAIL</font>
                                    <input type="radio" name="rd_result" value="1"><font color="green">PASS</font>
                                    <input type="radio" name="rd_result" value="2"><font color="#FF9F1C">OOC</font>
                                </div>
                            </div>

                            <div style="margin: 5px 1px; width: 100%">
                                <div style="width: 100%; float: left; margin: 3px 2px; font-weight: bolder"><%=getStr("result_mail") %></div>
                                <div style="width: 100%; font-size: 12px; margin: 3px 2px">
                                    <div style="float: left; text-align: left; border: 1px solid #808080; margin: 2px 2px">

                                        <SmoothEnterpriseWebControlEnterprise:PopupUser ID="txt_mail" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal" DisplayField="name" FormatType="InputCombo" FormatValueField="logonid"
                                            ValueField="id">
                                            <Gradient GradientBegin="" GradientEnd="" />
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControlEnterprise:PopupUser>
                                    </div>
                                    <div style="width: 100%">
                                        <img src="../img/add2.png" width="15" height="15" id="copy_mail" />
                                    </div>
                                </div>
                                <div id="mail_list" style="border: 1px solid #808080; background-color: white; height: 30px; width: 800px; margin: 5px 1px"></div>
                            </div>

                            <div>
                                備註:
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
                                    OnClick="BUTTON_FlowFeedback_Click" OnClientClick="return chk()" Width="80px"></asp:Button>

                            </div>
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

        <SmoothEnterpriseWebControl:InputButton ID="Btn_Back" OnClick="Btn_Back_Click" runat="server" Text="Back" Width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Arial" Font-Size="12px">
            <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
        </SmoothEnterpriseWebControl:InputButton>
    </div>




</asp:Content>
