<%@ Page Title="" Language="C#" MasterPageFile="~/_site/layout/ie7.master" AutoEventWireup="true" CodeFile="LabEdit.aspx.cs" Inherits="Lab.LabEdit" StylesheetTheme="Default" Culture="Auto" UICulture="Auto" Debug="true" %>

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
        <script src="../script/lab.js"></script>
        <link href="../css/lab.css" rel="stylesheet" />

        <script>
            $(function () {

                var url = location.href;

                //再來用去尋找網址列中是否有資料傳遞(QueryString)
                if (url.indexOf('?') != -1) {
                    var id = "";
                    //在此直接將各自的參數資料切割放進ary中
                    var ary = url.split('?')[1].split('&');
                    //此時ary的內容為：
                    //ary[0] = 'id=U001'，ary[1] = 'name=GQSM'

                    //下迴圈去搜尋每個資料參數
                    var lab = ary[1].replace("lab_id=", "");


                    if (lab == "" || lab == null) {
                        $("#Btn_Send").attr("disabled", "true");
                    }
                    else {
                        var disabled = $("#ctl00_ContentPlaceHolder1_Btn_RemindReviewer").attr("disabled");

                        if (disabled == "" || disabled == null) {
                            $("#Btn_Send").attr("disabled", "true");
                        }

                    }
                }

                $("#Btn_Send").click(function () {
                    document.getElementById("ctl00_ContentPlaceHolder1_Btn_SendRequest").click();
                });
            });

            function checkFile(obj) {
                if (window.attachEvent) {
                    return upload_ie(obj);
                } else {
                    return upload_other(obj);
                }
            }

            function upload_other(obj) {

                var pass = false;
                var range = 1024 * 1024 * 15;  //上傳上限，單位:byte
                var id = $(obj).attr("id");

                var file = id.replace("btn_", "file_");
                var uploader = $("#" + file);

                var value = $("#" + file).val();

                $("#ctl00_ContentPlaceHolder1_u_file").val(value);

                if (value !== "") {


                    //假設單檔上傳，所以直接取第零個檔案
                    var upload_name = uploader[0].files[0].name;
                    if (upload_name.length > 20) {
                        //file_name_long

                        var msg = $("#ctl00_ContentPlaceHolder1_file_name_long").val();
                        alert(msg);

                    } else {
                        pass = true;
                    }


                    if (pass) {
                        var upload_size = uploader[0].files[0].size * 1;

                        if (upload_size > range) {

                            msg = $("#ctl00_ContentPlaceHolder1_file_large").val();
                            alert(msg);
                        }
                        else {

                            pass = true;
                        }
                    }
                }
                return pass;
            }

            function upload_ie(obj) {
                var pass = false;
                var id = $(obj).attr("id");

                var file = id.replace("btn_", "file_");
                var uploader = $("#" + file).val();

                if (uploader.length > 0) {

                    $("#ctl00_ContentPlaceHolder1_u_file").val(uploader);
                    pass = true;
                }
                return pass;
            }


            //---------------------------------------
            function checkFile(obj) {
                if (window.attachEvent) {
                    return upload_ie(obj);
                } else {
                    return upload_other(obj);
                }
            }

            function upload_other(obj) {

                var pass = false;
                var range = 1024 * 1024 * 15;  //上傳上限，單位:byte
                var id = $(obj).attr("id");

                var file = id.replace("btn_", "file_");
                var uploader = $("#" + file);

                var value = $("#" + file).val();

                $("#ctl00_ContentPlaceHolder1_u_file").val(value);

                if (value !== "") {


                    //假設單檔上傳，所以直接取第零個檔案
                    var upload_name = uploader[0].files[0].name;
                    if (upload_name.length > 20) {
                        //file_name_long

                        var msg = $("#ctl00_ContentPlaceHolder1_file_name_long").val();
                        alert(msg);

                    } else {
                        pass = true;
                    }


                    if (pass) {
                        var upload_size = uploader[0].files[0].size * 1;

                        if (upload_size > range) {

                            msg = $("#ctl00_ContentPlaceHolder1_file_large").val();
                            alert(msg);
                        }
                        else {

                            pass = true;
                        }
                    }
                }
                return pass;
            }

            function upload_ie(obj) {
                var pass = false;
                var id = $(obj).attr("id");

                var file = id.replace("btn_", "file_");
                var uploader = $("#" + file).val();

                if (uploader.length > 0) {

                    $("#ctl00_ContentPlaceHolder1_u_file").val(uploader);
                    pass = true;
                }
                return pass;
            }

        </script>
        <style>
            .table div .th {
                background-color: #C0C5C7;
                width: 15%;
            }


            .t2 div .td {
                width: 30%;
            }

            .t2 div .th {
                background-color: #95B5D5;
            }

            .fa-users {
                font-size:2em;
            }
        </style>

    </header>
    <asp:ScriptManager ID="sm1" runat="server" EnablePartialRendering="false"></asp:ScriptManager>
    <div style="display: none">
        <div id="null_msg"><%=getStr("null_msg") %> </div>
        <div id="isStr_msg"><%=getStr("isInt_msg") %> </div>
        <div id="isNum_msg"><%=getStr("isNum_msg") %> </div>
        <div id="ts_null"><%=getStr("ts_null") %> </div>

        <asp:HiddenField ID="up" runat="server" />
        <asp:HiddenField ID="upper" runat="server" />
        <asp:HiddenField ID="down" runat="server" />
        <asp:HiddenField ID="lower" runat="server" />

    </div>

    <div style="width: 95%;">
        <asp:HiddenField ID="msg" runat="server" Value="" />

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
                    <asp:DropDownList ID="cbo_unit" runat="server" CssClass="confirm"></asp:DropDownList>
                </div>
                <div class="th "><%=getStr("receipt_date")%>:</div>
                <div class="td">
                    <asp:TextBox ID="txt_receiptdt" runat="server" CssClass="date"></asp:TextBox>

                </div>
            </div>
        </div>
    </div>
    <div style="width: 200px; height: 113px; z-index: 1; position: absolute; top: 280px; right: 250px">
        <asp:Image ID="img_result" runat="server" />
    </div>


    <div style="width: 95%; padding: 5px 0px 5px 0px">
        <asp:UpdatePanel ID="lab_up" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
            <ContentTemplate>
                <asp:GridView ID="gv_Lab" runat="server" AutoGenerateColumns="False" AllowPaging="False" AllowSorting="False" OnRowCreated="gv_Lab_RowCreated" OnRowCommand="gv_Lab_RowCommand" OnRowDataBound="gv_Lab_RowDataBound"
                    Width="100%" EnableModelValidation="True" GridLines="Both" CellPadding="0" CellSpacing="0" BorderStyle="Solid" BorderColor="#523971" BorderWidth="1" ForeColor="#fff" Font-Size="Medium">
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
                        <asp:TemplateField HeaderText="" HeaderStyle-CssClass="i_td1">

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
                                <td style="width: 60px;">
                                    <asp:Button runat="server" ID="Btn_Add" OnClick="Btn_Add_Click" Width="50" Text="ADD" />
                                </td>

                            </tr>
                            <tr>
                                <td colspan="6" style="text-align: center; padding: 5px 5px; font-size: 1.5em">
                                    <%=getStr("not_data") %></td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <div style="border: 1px solid #000; width: 95%;">

        <div style="background-color: #457CBF; color: #fff; height: 40px; vertical-align: middle; text-align: center; font-size: 2em; margin: 3px 3px 0px 3px">
            <div style="padding: 5px 0 5px 0"><%=getStr("review") %></div>
        </div>

        <div class="table t2">
            <div>
                <div class="th" id="re_result"><%=getStr("re_result") %></div>
                <div class="td" style="width: auto">
                    <asp:TextBox ID="txt_re_result" runat="server" Width="90%"></asp:TextBox>
                </div>

            </div>
            <div>
                <div id="reply" class="th" style="height: 160px;"><%=getStr("reply") %></div>
                <div class="td">
                    <asp:TextBox ID="txt_replay" runat="server" MaxLength="200" TextMode="MultiLine" Width="90%" Height="150px"></asp:TextBox>
                </div>

                <div class="th" style="height: 160px;"><%=getStr("retest") %></div>
                <div class="td" style="vertical-align: top; text-align: center; padding: 5px">
                    <asp:UpdatePanel runat="server" ID="panel_upload" UpdateMode="Conditional" ChildrenAsTriggers="true">
                        <ContentTemplate>
                            <asp:FileUpload ID="file_upload" runat="server" Width="200" Height="25" />

                            <asp:Button ID="btn_upload" runat="server" OnClick="btn_upload_Click" Text="上傳" OnClientClick="return checkFile(this)" Width="60" /><br />
                            <div>
                                <div style="float: left; width: 10%; padding: 5px; border: 0px  solid red">
                                    <asp:LinkButton ID="lbtn_del" runat="server" OnClick="lbtn_del_Click" CssClass="fa fa-trash fa-2x" Visible="false"></asp:LinkButton>
                                </div>
                                <div style="float: left; width: 75%; padding: 5px; text-align: left">
                                    <asp:LinkButton ID="lbtn_download" OnClick="lbtn_download_Click" runat="server" Visible="false"></asp:LinkButton>
                                </div>
                            </div>


                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btn_upload" EventName="click" />

                        </Triggers>
                    </asp:UpdatePanel>
                </div>

            </div>

        </div>

    </div>

    <div class="t1" style="width: 100%; text-align: left">
        <table border="0" class="Normal" style="width: 100%">
            <tr>
                <td>
                    <SmoothEnterpriseControlFlowwork:FlowClient ID="FlowClient1" runat="server" TypeName="sharflow12_2.Flowwork.sharflow12_21" Text="IPQC Ra檢驗電子簽核">
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
                    <asp:TextBox ID="txt_leader" runat="server" CssClass="Muser"></asp:TextBox>
                    
            </tr>

        </table>
    </div>
    <div style="text-align: left; margin: 2px 2px">

        <SmoothEnterpriseWebControl:InputButton ID="Btn_Save" OnClick="Btn_Save_Click" OnClientClick="return check_page()" CssClass="sysBtn" runat="server" Text="Save"  Flow="<%# FlowClient1 %>" />
        
        <div style="display: none">
            <SmoothEnterpriseWebControlFlowwork:SendRequestButton ID="Btn_SendRequest" OnClick="Btn_SendRequest_Click" CssClass="sysBtn" runat="server" Text="Submittal" Flow="<%# FlowClient1 %>" >
            </SmoothEnterpriseWebControlFlowwork:SendRequestButton>
        </div>
        <input type="button" name="Btn_Send" id="Btn_Send" value="<%=getStr("sb") %>"  class="sysBtn" /> 

        <SmoothEnterpriseWebControlFlowwork:RemindReviewerButton ID="Btn_RemindReviewer" OnClick="Btn_RemindReviewer_Click" runat="server" Text="Remind Reviewer" Flow="<%# FlowClient1 %>" CssClass="sysBtn" /> 

        <SmoothEnterpriseWebControlFlowwork:StopRequestButton ID="Btn_Stop" OnClick="Btn_Stop_Click" runat="server" Text="Stop" Flow="<%# FlowClient1 %>" CssClass="sysBtn" /> 

        <SmoothEnterpriseWebControl:InputButton ID="Btn_fail" OnClick="Btn_fail_Click" runat="server" Text="Fail" Flow="<%# FlowClient1 %>" CssClass ="sysBtn" /> 

        <SmoothEnterpriseWebControl:InputButton ID="Btn_Back" OnClick="Btn_Back_Click" runat="server" Text="Back" CssClass="sysBtn" /> 
    </div>

</asp:Content>
