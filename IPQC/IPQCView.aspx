<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="IPQCView.aspx.cs" Inherits="IPQC.IPQCView" StylesheetTheme="Default" Culture="Auto" UICulture="Auto" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlFlowwork" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register assembly="SmoothEnterprise.Web.Control.Flowwork" namespace="SmoothEnterprise.Flowwork.UI.WebControl" tagprefix="SmoothEnterpriseWebControlFlowwork" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server"
        Details="The desciption for this program" Caption="IPQC View Page" Width="100%"
        CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
        <CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>

    <script type="text/javascript" src="js/jquery.min.js"></script>

    <link href="../script/css/normalize.css" rel="stylesheet" />
    <link href="../script/css/mak_base.css" rel="stylesheet" />
    <link href="css/ipqc.css" rel="stylesheet" />
    <script type="text/javascript" language="javascript">
        var commit = "NA";
        var Restxt = "";
        $(function () {
            var t = $("#ctl00_ContentPlaceHolder1_FIELD_Judgement").find("input").css("width", "50px");
            $("#copy_mail").click(function () {
                var value = $("#ctl00_ContentPlaceHolder1_FlowFeedback1_ctl03_txt_mail").val();
                var name = $("#ctl00_ContentPlaceHolder1_FlowFeedback1_ctl03_txt_mail_display").val();

                if (value != "") {
                    $("#mail_list").append('<a href="#" id="a_' + value + '" onclick="del_item(this)" ><div class="Rmail" id="' + value + '" style="display:table-cell;float: left;margin: 2px 10px;" >' + name + '</div> </a>');
                }
            });


            $(".require").each(function () {
                var id = $(this).attr("id");
                $("#" + id).change(function () {
                    commit = $(this).find("option:selected").text();
                });
            });

            $("#ctl00_ContentPlaceHolder1_FlowFeedback1_ctl03_ResTxt").change(function () {
                Restxt = $(this).val();
            });
        });

        function del_item(obj) {
            var id = $(obj).remove();
        }

        function addfile(id) {
            var thiselement = $('#' + id);
            var attid = id + ($("input[type='file']").length + "");
            var attname = thiselement.prop('name') + ($("input[type='file']").length + "");
            var clonelement = $('#' + id).clone().attr({
                id: attid,
                name: attname
            });

            thiselement.after(clonelement);
            return false;

        }

        function check() {

            var result = true;
            $("#ctl00_ContentPlaceHolder1_txt_Rmail").val("");
            $("#p1").remove();


            if (commit != "NA" && Restxt == "") {
                alert("please input remark");
                $("#ctl00_ContentPlaceHolder1_FlowFeedback1_ctl03_ResTxt").parent().append('<div id="p1" style="color:red" >**please input remark**</div>');
                result = false;
            }

            if (result) {

                var mail = "";

                $(".Rmail").each(function (i) {
                    var id = $(this).attr("id");
                    if (mail != "") {
                        mail += ",";
                    }
                    mail += id;
                });

                $("#ctl00_ContentPlaceHolder1_txt_Rmail").val(mail);

                if (commit == "NA") {
                    commit = "";
                }

                comment = commit + ":" + Restxt;
                $("#ctl00_ContentPlaceHolder1_FlowFeedback1_ctl03_ResTxt").val(comment);
            }

            return result;
        }




        $(function () {

            var index = "";
            $(":radio").each(function () {
                var name = $(this).attr('name');
                if (name == "ctl00$ContentPlaceHolder1$FlowFeedback1_Results") {
                    if (index == "") {
                        index = 1;
                        $(this).attr("checked", true);
                    }
                }
            });

            var Origin = $("#ctl00_ContentPlaceHolder1_Origin").val();

            if (Origin == "N") {
                $("input:radio").each(function () {
                    var Val = $(this).attr("value");
                    if (Val == "退回提案人") {
                        $(this).remove();
                    }

                });

                $("#IPQC_Flow td").each(function (i) {
                    var txt = $(this).text().trim();

                    if (txt == "退回提案人") {
                        $(this).text("");
                        return;
                    }
                });
            }
        });

    </script>
    <input type="hidden" id="Origin" value="N" runat="server" />

    <asp:HiddenField ID="hd_title" runat="server" Value="" />
    <asp:HiddenField ID="hd_controls" runat="server" Value="" />
    <asp:HiddenField ID="txt_Rmail" runat="server" />

    <div style="width: 95%">
        <div class="tl1"><%=getStr("mk") %></div>
        <div class="tl2"><%=getStr("quality_record") %></div>
        <div class=" all" style="border: 1px solid #808080;">
            <div class="div_table">
                <div class="div_tr">
                    <div class="div_td note"><%=getStr("initiator") %> </div>
                    <div class="div_td col ">
                        <SmoothEnterpriseWebControlEnterprise:PopupUser ID="FIELD_inituser" runat="server"
                            BackColor="#F0F0F0" CssClass="Normal" DisplayField="name" FormatType="InputCombo"
                            FormatValueField="logonid" Gradient-GradientType="Top" ValueField="id" ErrorMessage="Please Input「申請人」!!"
                            DisplayFieldHidden="False" Width="120px">
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top"></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControlEnterprise:PopupUser>
                    </div>
                    <div class="div_td note"><%=getStr("record_dt") %> </div>
                    <div class="div_td col ">
                        <SmoothEnterpriseWebControl:InputText ID="FIELD_initdate" runat="server" BackColor="#F0F0F0"
                            CssClass="Normal" ErrorMessage="Please Input「Initdate」!!" MaxLength="10" FormatType="Date">
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            <ErrorStyle BorderStyle="NotSet" />
                        </SmoothEnterpriseWebControl:InputText>
                    </div>

                </div>
                <div class="div_tr">
                    <div class="div_td note"><%=getStr("disposition") %> </div>
                    <div class="div_td col ">
                        <SmoothEnterpriseWebControl:InputText ID="FIELD_IPQC_NO" Enabled="false" runat="server"
                            BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「IPQC_NO」!!"
                            MaxLength="11">
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText>
                    </div>
                    <div class="div_td note"><%=getStr("traveling") %> </div>
                    <div class="div_td col ">
                        <SmoothEnterpriseWebControl:InputText ID="FIELD_sheet_NO" runat="server" BackColor="#F0F0F0"
                            CssClass="Normal" ErrorMessage="Please Input「Sheet_NO」!!" MaxLength="10">
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText>
                    </div>

                </div>
                <div class="div_tr">
                    <div class="div_td note"><%=getStr("station") %> </div>
                    <div class="div_td col ">
                        <asp:DropDownList ID="FIELD_station" runat="server" />
                    </div>
                    <div class="div_td note"><%=getStr("customer") %> </div>
                    <div class="div_td col ">
                        <asp:DropDownList ID="FIELD_customer" Enabled="false" runat="server" />
                    </div>

                </div>
                <div class="div_tr">
                    <div class="div_td note"><%=getStr("product") %> </div>
                    <div class="div_td col ">
                        <asp:DropDownList ID="FIELD_Product_Name" AutoPostBack="true" Enabled="false" runat="server" />
                    </div>
                    <div class="div_td note"><%=getStr("program") %> </div>
                    <div class="div_td col ">
                        <asp:DropDownList ID="FIELD_Program_Name" AutoPostBack="true" Enabled="false" runat="server" />
                    </div>
                </div>
                <div class="div_tr">
                    <div class="div_td note"><%=getStr("pn") %> </div>
                    <div class="div_td col ">
                        <asp:DropDownList ID="FIELD_PN" runat="server" BackColor="#F0F0F0" CssClass="Normal">
                        </asp:DropDownList>
                    </div>
                    <div class="div_td note"><%=getStr("rev") %> </div>
                    <div class="div_td col ">
                        <SmoothEnterpriseWebControl:InputText ID="FIELD_Rev" Enabled="false" runat="server" BackColor="#F0F0F0"
                            CssClass="Normal" ErrorMessage="Please Input「Rev」!!" MaxLength="5">
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText>
                    </div>
                </div>
                <div class="div_tr">
                    <div class="div_td note"><%=getStr("stage") %> </div>
                    <div class="div_td col ">
                        <asp:DropDownList ID="FIELD_Stage" runat="server" />
                    </div>
                    <div class="div_td note"><%=getStr("defect_rate") %> </div>
                    <div class="div_td col ">
                        <SmoothEnterpriseWebControl:InputText ID="FIELD_Defect_Rat" Enabled="false" runat="server" BackColor="#F0F0F0"
                            CssClass="Normal" ErrorMessage="Please Input「Defect_Rat」!!" MaxLength="50">
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText>
                    </div>
                </div>
                <div class="div_tr">
                    <div class="div_td note" style="height: 120px"><%=getStr("description") %> </div>
                    <div class="div_td col" style="height: 120px">

                        <SmoothEnterpriseWebControl:InputText ID="FIELD_Description" Enabled="false" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Description」!!" MaxLength="500" FormatType="None" Height="100px" TextMode="MultiLine" Style="text-align: left" ReadOnly="true" Width="95%">
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:InputText>
                    </div>

                    <div class="div_td note" style="height: 120px"><%=getStr("attach") %> </div>
                    <div class="div_td col" style="height: 120px">
                        <asp:HyperLink ID="hl_Abnormal_FILE" RepeatColumns="5" runat="server"
                            Font-Size="X-Small" />
                    </div>

                </div>
            </div>
            <div class="div_table all">
                <div class="div_tr">
                    <div class="div_td note" style="width: 100%; text-align: center; vertical-align: middle; font-size: 16px; font-weight: bolder; background-color: #B6CDC9"><%=getStr("quality") %> </div>
                </div>
            </div>
            <div class="div_table">
                <div class="div_tr">
                    <div class="div_td note" style="height: 100px"><%=getStr("dimension") %> </div>
                    <div class="div_td col ">
                        <asp:DropDownList ID="FIELD_Dimension_check" runat="server"></asp:DropDownList>
                        <SmoothEnterpriseWebControl:InputText ID="FIELD_Dimension" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Dimension」!!" ReadOnly="true" MaxLength="500" TextMode="MultiLine" Height="50px" Width="95%" Style="text-align: left">
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:InputText>
                    </div>
                    <div class="div_td note" style="height: 100px"><%=getStr("dim_attach") %> </div>
                    <div class="div_td col ">

                        <asp:HyperLink ID="hDimension_file" runat="server" Font-Size="X-Small" RepeatColumns="3"></asp:HyperLink>
                    </div>
                </div>
                <div class="div_tr">
                    <div class="div_td note" style="height: 100px"><%=getStr("appearance") %> </div>
                    <div class="div_td col ">
                        <asp:DropDownList ID="FIELD_Appearance_check" runat="server"></asp:DropDownList>
                        <SmoothEnterpriseWebControl:InputText ID="FIELD_Appearance" runat="server" BackColor="#F0F0F0" Width="95%" CssClass="Normal" ErrorMessage="Please Input「Appearance」!!" ReadOnly="true" MaxLength="500" TextMode="MultiLine" Height="50px" Style="text-align: left">

                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:InputText>

                    </div>
                    <div class="div_td note" style="height: 100px"><%=getStr("app_attach") %> </div>
                    <div class="div_td col ">

                        <asp:HyperLink ID="hlAppearance_file" runat="server" Font-Size="X-Small" RepeatColumns="3"></asp:HyperLink>
                    </div>
                </div>
                <div class="div_tr">
                    <div class="div_td note" style="height: 100px"><%=getStr("cleanliness") %> </div>
                    <div class="div_td col ">
                        <asp:DropDownList ID="FIELD_Cleanliness_check" runat="server"></asp:DropDownList>
                        <SmoothEnterpriseWebControl:InputText ID="FIELD_Cleanlines" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Cleanlines」!!" ReadOnly="true" MaxLength="500" TextMode="MultiLine" Height="50px" Width="95%" Style="text-align: left">
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:InputText>

                    </div>
                    <div class="div_td note" style="height: 100px"><%=getStr("cl_attach") %> </div>
                    <div class="div_td col ">

                        <asp:HyperLink ID="hlCleanlines_file" runat="server" Font-Size="X-Small" RepeatColumns="3"></asp:HyperLink>

                    </div>
                </div>
                <div class="div_tr">
                    <div class="div_td note" style="height: 100px"><%=getStr("reliability") %> </div>
                    <div class="div_td col ">
                        <asp:DropDownList ID="FIELD_Reliability_check" runat="server"></asp:DropDownList>
                        <SmoothEnterpriseWebControl:InputText ID="FIELD_Reliability" runat="server" BackColor="#F0F0F0"
                            CssClass="Normal" ErrorMessage="Please Input「Reliability」!!" MaxLength="500" TextMode="MultiLine" ReadOnly="true"
                            Height="50px" Width="95%" Style="text-align: left">
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:InputText>
                    </div>
                    <div class="div_td note" style="height: 100px"><%=getStr("rel_attach") %> </div>

                    <div class="div_td col">

                        <asp:HyperLink ID="hlReliability_file" runat="server" Font-Size="X-Small" RepeatColumns="3"></asp:HyperLink>

                    </div>
                </div>
                <div class="div_tr">
                    <div class="div_td note" style="height: 180px"><%=getStr("judgement") %> </div>
                    <div class="div_td col">
                        <div class="div_table">
                            <div class="div_tr">
                                <div class="div_td col2" style="width: 100px">
                                    <asp:RadioButtonList ID="FIELD_Judgement" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Text="OK" Value="OK" />
                                        <asp:ListItem Text="NG" Value="NG" />
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                            <div class="div_tr">
                                <div class="div_td col2">
                                    <%=getStr("qa_commit") %>
                                    <asp:DropDownList ID="FIELD_QA_Judgement_commit" runat="server" />
                                </div>
                            </div>
                            <div class="div_tr">
                                <div class="div_td col2">
                                    <%=getStr("capa") %>
                                    <SmoothEnterpriseWebControl:InputText ID="FIELD_CAPA_Sheet_NO" Enabled="false" runat="server" BackColor="#F0F0F0"
                                        CssClass="Normal" ErrorMessage="Please Input「CAPA_Sheet_NO」!!" MaxLength="20"
                                        Width="60%">
                                        <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                    </SmoothEnterpriseWebControl:InputText>
                                </div>
                            </div>
                            <div class="div_tr">
                                <div class="div_td col2">
                                    <%=getStr("uia_no") %>
                                    <SmoothEnterpriseWebControl:InputText ID="FIELD_UAI_no" Enabled="false" runat="server"
                                        BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Other_Sheet_no」!!"
                                        MaxLength="20">
                                        <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                    </SmoothEnterpriseWebControl:InputText>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="div_td note" style="height: 180px"></div>
                </div>
            </div>
            <div class="div_table all" style="border: 1px solid #808080; text-align: center; height: 35px; color: #ff6a00; background-color: #CBCE62">MRB Team</div>
            <div id="ctr2" class="div_table all">
               
                <div style="float: left; height: auto; <%=s1%>;width:50%;  background-color: #EAF2E7" id="left_foot">
                    <div class="all" style="text-align: center">
                        <div style="background-color: #8CBA80; height: 35px; color: azure"><%=getStr("flow")%></div>
                    </div>
                    <asp:Panel ID="p_list" runat="server" CssClass="div_table all" HorizontalAlign="Center">
                    </asp:Panel>

                </div>
                
                <div style="float: left; height:auto; width:auto%; background-color: #E5DEE4;<%=s2%>" id="right_foot">
                    <div class="div_table all" style="text-align: center">
                        <div style="background-color: #744D6E; height: 35px; color: azure; vertical-align: middle"><%=getStr("view") %></div>
                    </div>
                    <div class="div_table all" style="text-align: center;">
                        <%=view %>
                    </div>
                </div>
            </div>
            

        </div>
        <div style="margin: 10px 0px">
            <table border="0" class="Normal" id="IPQC_flow">
                <tr>
                    <td>


                        <SmoothEnterpriseWebControlFlowwork:FlowFeedback ID="FlowFeedback1" runat="server"
                            BackColor="#F0F0F0" BorderColor="#E0E0E0" BorderStyle="Solid" BorderWidth="1px"
                            CssClass="Normal" Font-Size="12px" OnFeedbackComplete="FlowFeedback1_FeedbackComplete"
                            OnFlowStop="FlowFeedback1_FlowStop" OnFlowNodeComplete="FlowFeedback1_FlowNodeComplete"
                            RedirectAfterCommit="False">

                            <Results>
                                <SmoothEnterpriseWebControlFlowwork:FlowResult ID="flowResult1" Text="approve" ResultType="Next" runat="server" />
                                <SmoothEnterpriseWebControlFlowwork:FlowResult ID="flowResult2" Text="other" ResultType="Next" runat="server" />

                            </Results>

                            <ReplyTemplate>
                                <div>
                                    <font colro="red">*<%=getStr("remark") %></font><SmoothEnterpriseWebControl:InputText ID="ResTxt" runat="server" BackColor="#F0F0F0"
                                        CssClass="Normal" Width="600px">
                                        <ErrorStyle BorderStyle="NotSet" />
                                        <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                    </SmoothEnterpriseWebControl:InputText>
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
                                            <img src="img/add2.png" width="15" height="15" id="copy_mail" />
                                        </div>
                                    </div>
                                    <div id="mail_list" style="border: 1px solid #808080; background-color: white; height: 30px; width: 800px; margin: 5px 1px"></div>
                                </div>

                                <div>
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
                                        OnClick="BUTTON_FlowFeedback_Click" Width="80px" OnClientClick="return check() ; "></asp:Button>
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
        <div>
            <table border="0" class="Normal">
                <tr>
                    <td>
                        
                        <SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Text="回上頁"
                            Width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px"
                            CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_back_Click">
                            <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                        </SmoothEnterpriseWebControl:InputButton>

                    </td>
                </tr>
            </table>

        </div>
    </div>


</asp:Content>
