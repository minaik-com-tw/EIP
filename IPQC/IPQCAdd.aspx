<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true"
    CodeFile="IPQCAdd.aspx.cs" Inherits="IPQC.IPQCAdd" StylesheetTheme="Default"
    Culture="Auto" UICulture="Auto" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <header>
        <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server"
            Details="The desciption for this program" Caption="IPQC Add Page" Width="100%"
            CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
            <CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
            <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
        </SmoothEnterpriseWebControlEnterprise:Descriptor>
        <link href="../script/css/normalize.css" rel="stylesheet" />
        <link href="../script/css/mak_base.css" rel="stylesheet" />
        <link href="css/ipqc.css" rel="stylesheet" />
        <script type="text/javascript" lang="javascript">
            $(function () {
                var t = $("#ctl00_ContentPlaceHolder1_FIELD_Judgement").find("input").css("width", "50px");

            });

            function check() {
                var result = false;


                if (
                   checkFIELDsheetNO("#<%=this.FIELD_sheet_NO.ClientID%>") &&
                checkFIELDstation("#<%=this.FIELD_station.ClientID%>") &&
                checkFieldCustomer("#<%=this.FIELD_customer.ClientID%>") &&
                checkFieldPro("#<%=this.FIELD_Product_Name.ClientID%>") &&
                checkFieldProgame("#<%=this.FIELD_Program_Name.ClientID%>") &&
                checkFIELDPN("#<%=this.FIELD_PN.ClientID%>") &&
                checkFIELDRev("#<%=this.FIELD_Rev.ClientID%>") &&
                checkFIELDStage("#<%=this.FIELD_Stage.ClientID%>") &&
                checkFIELDDefectRat("#<%=this.FIELD_Defect_Rat.ClientID%>") &&
                checkFIELDDescription("#<%=this.FIELD_Description.ClientID%>") &&

                    // checkFIELD_Dimension_check("#<%=this.FIELD_Dimension_check.ClientID%>") && 
                    // checkFIELD_Appearance_check("#<%=this.FIELD_Appearance_check.ClientID%>") &&
                    //checkFIELD_Cleanliness_check("#<%=this.FIELD_Cleanliness_check.ClientID%>") &&
                    // checkFIELD_Reliability_check("#<%=this.FIELD_Reliability_check.ClientID%>") && 


                checkFIELD_Judgement("#<%=this.FIELD_Judgement.ClientID%>")) //&&checkFIELD_QA_Judgement_commit("#<%=this.FIELD_Judgement.ClientID%>"))*/
                    result = true;
                return result;
            }

            function addfile(id) {
                var thiselement = $('#' + id);
                var attid = id + ($("input[type='file']").length + "");
                var attname = thiselement.prop('name') + ($("input[type='file']").length + "");
                var clonelement = $('#' + id).clone().attr({
                    id: attid,
                    name: attname
                })
                thiselement.after(clonelement);
                return false;
            }

            function checkFIELD_QA_Judgement_commit(field_id) {
                var field = $(field_id);
                if ($.trim(field.val()) == "") {
                    alert("請填入處置計畫判定 !!");
                    return false;
                } else
                    return true;
            }

            function checkFIELD_Judgement(field_id) {

                var tempfield = field_id.substr(1, field_id.length - 1);
                var field = $(field_id);



                //if ($.trim(field.val()) == "") {$('input[name=radio使用的name的值]:checked').val()
                if ($.trim($("input[name*='FIELD_Judgement']:checked").val()) == "") {
                    alert("請選取QA判定!!");
                    return false;
                } else
                    return true;
            }

            function checkFIELDsheetNO(field_id) {
                var field = $(field_id);
                if ($.trim(field.val()) == "") {
                    alert("請填入工單號碼!!");
                    return false;
                } else
                    return true;
            }
            function checkFIELDDescription(field_id) {
                var field = $(field_id);
                if (field.val() == "") {
                    alert("請填寫異常描述!!");
                    return false;
                } else
                    return true;
            }
            function checkFIELD_Dimension_check(field_id) {
                var field = $(field_id);
                if (field.val() == "") {
                    alert("請選尺寸合格或不合格!!");
                    return false;
                } else
                    return true;
            }
            function checkFIELD_Appearance_check(field_id) {
                var field = $(field_id);
                if (field.val() == "") {
                    alert("請選外觀合格或不合格!!");
                    return false;
                } else
                    return true;
            }
            function checkFIELD_Cleanliness_check(field_id) {
                var field = $(field_id);
                if (field.val() == "") {
                    alert("請選清潔度合格或不合格!!");
                    return false;
                } else
                    return true;
            }
            function checkFIELD_Reliability_check(field_id) {
                var field = $(field_id);
                if (field.val() == "") {
                    alert("請選可靠度合格或不合格!!");
                    return false;
                } else
                    return true;
            }
            function checkFIELDStage(field_id) {
                var field = $(field_id);
                if (field.val() == "") {
                    alert("請選取產品階段!!");
                    return false;
                } else
                    return true;
            }
            function checkFIELDDefectRat(field_id) {
                var field = $(field_id);
                if ($.trim(field.val()) == "") {
                    alert("請填入不良率!!");
                    return false;
                } else
                    return true;
            }
            function checkFIELDstation(field_id) {
                var field = $(field_id);
                if (field.val() == "") {
                    alert("請選擇站別!!");
                    return false;
                } else
                    return true;
            }
            function checkFIELDRev(field_id) {
                var field = $(field_id);
                if ($.trim(field.val()) == "") {
                    alert("請填入產品版本!!");
                    return false;
                } else
                    return true;
            }
            function checkFIELDPN(field_id) {
                var field = $(field_id);
                if (field.val() == "") {
                    alert("請選取產品圖號!!");
                    return false;
                } else
                    return true;
            }
            function checkFieldCustomer(field_id) {
                var field = $(field_id);
                if (field.val() == "") {
                    alert("請選擇客戶!!");
                    return false;
                } else
                    return true;
            }

            function checkFieldProgame(field_id) {
                var field = $(field_id);
                if (field.val() == "") {
                    alert("請選取機種");
                    return false;
                } else
                    return true;
            }

            function checkFieldPro(field_id) {
                var field = $(field_id);
                if (field.val() == "") {
                    alert("請選取產品");
                    return false;
                } else
                    return true;
            }
        </script>

    </header>
    <div style="width: 95%">
        <div class="tl1"><%=getStr("mk") %></div>
        <div class="tl2"><%=getStr("quality_record") %></div>
        <div class="all" style="border: 1px solid #808080;">
            <div class="div_table all">
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
                        <asp:DropDownList ID="FIELD_customer" AutoPostBack="true" OnSelectedIndexChanged="FIELD_customer_SelectedIndexChanged" runat="server" />
                    </div>

                </div>
                <div class="div_tr">
                    <div class="div_td note"><%=getStr("product") %> </div>
                    <div class="div_td col ">
                        <asp:DropDownList ID="FIELD_Product_Name" AutoPostBack="true" OnSelectedIndexChanged="FIELD_Product_Name_SelectedIndexChanged" runat="server" />
                    </div>
                    <div class="div_td note"><%=getStr("program") %> </div>
                    <div class="div_td col ">
                        <asp:DropDownList ID="FIELD_Program_Name" AutoPostBack="true" OnSelectedIndexChanged="FIELD_Program_Name_SelectedIndexChanged" runat="server" />
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
                        <SmoothEnterpriseWebControl:InputText ID="FIELD_Rev" runat="server" BackColor="#F0F0F0"
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
                        <SmoothEnterpriseWebControl:InputText ID="FIELD_Defect_Rat" runat="server" BackColor="#F0F0F0"
                            CssClass="Normal" ErrorMessage="Please Input「Defect_Rat」!!" MaxLength="50">
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText>
                    </div>
                </div>
                <div class="div_tr">
                    <div class="div_td note" style="height: 120px"><%=getStr("description") %> </div>
                    <div class="div_td col" style="height: 120px">
                        <SmoothEnterpriseWebControl:InputText ID="FIELD_Description" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Description」!!" MaxLength="500" TextMode="MultiLine" Style="text-align: left" FormatType="None" Height="100px" Width="95%">
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:InputText>
                    </div>


                    <div class="div_td note" style="height: 120px"><%=getStr("attach") %> </div>
                    <div class="div_td col" style="height: 120px">
                        <SmoothEnterpriseWebControl:InputFile ID="FIELD_Abnormal_FILE" name="Abnormal_FILE" Width="200"
                            runat="server" onchange="addfile(this.id);" BackColor="#C8C8C8" CssClass="NormalBold"
                            Visible="true" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True"
                            Font-Names="Arial" Font-Size="10pt">
                            <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                        </SmoothEnterpriseWebControl:InputFile>
                        <asp:CheckBoxList ID="Check_Abnormal_FILE" runat="server" Font-Size="X-Small">
                        </asp:CheckBoxList>
                    </div>

                </div>
            </div>
            <div class="div_table all">
                <div class="div_tr">
                    <div class="div_td note" style="width: 100%; text-align: center; vertical-align: middle; font-size: 16px; font-weight: bolder; background-color: #B6CDC9"><%=getStr("quality") %> </div>
                </div>
            </div>
            <div class="div_table all">
                <div class="div_tr">
                    <div class="div_td note" style="height: 100px"><%=getStr("dimension") %> </div>
                    <div class="div_td col ">
                        <asp:DropDownList ID="FIELD_Dimension_check" runat="server"></asp:DropDownList>
                        <SmoothEnterpriseWebControl:InputText ID="FIELD_Dimension" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Dimension」!!" MaxLength="500" TextMode="MultiLine" Height="50px" Width="95%" Style="text-align: left">
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:InputText>
                    </div>
                    <div class="div_td note" style="height: 100px"><%=getStr("dim_attach") %> </div>
                    <div class="div_td col ">
                        <SmoothEnterpriseWebControl:InputFile ID="FIELD_Dimension_FILE" name="Dimension_FILE" runat="server" onchange="addfile(this.id);" Width="200"
                            BackColor="#C8C8C8" CssClass="NormalBold" Visible="true" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Arial" Font-Size="10pt">
                            <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                        </SmoothEnterpriseWebControl:InputFile>

                    </div>
                </div>
                <div class="div_tr">
                    <div class="div_td note" style="height: 100px"><%=getStr("appearance") %> </div>
                    <div class="div_td col ">
                        <asp:DropDownList ID="FIELD_Appearance_check" runat="server"></asp:DropDownList>
                        <SmoothEnterpriseWebControl:InputText ID="FIELD_Appearance" runat="server" BackColor="#F0F0F0" Width="95%" CssClass="Normal" ErrorMessage="Please Input「Appearance」!!" MaxLength="500" Height="50px" TextMode="MultiLine" Style="text-align: left">

                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:InputText>

                    </div>
                    <div class="div_td note" style="height: 100px"><%=getStr("app_attach") %> </div>
                    <div class="div_td col ">
                        <SmoothEnterpriseWebControl:InputFile ID="FIELD_Appearance_FILE" name="Appearance_FILE" runat="server" onchange="addfile(this.id);" Width="200"
                            BackColor="#C8C8C8" CssClass="NormalBold" Visible="true" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Arial" Font-Size="10pt">
                            <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                        </SmoothEnterpriseWebControl:InputFile>
                    </div>
                </div>
                <div class="div_tr">
                    <div class="div_td note" style="height: 100px"><%=getStr("cleanliness") %> </div>
                    <div class="div_td col ">
                        <asp:DropDownList ID="FIELD_Cleanliness_check" runat="server"></asp:DropDownList>
                        <SmoothEnterpriseWebControl:InputText ID="FIELD_Cleanlines" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Cleanlines」!!" MaxLength="500" TextMode="MultiLine" Style="text-align: left" Height="50px" Width="95%">
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:InputText>

                    </div>
                    <div class="div_td note" style="height: 100px"><%=getStr("cl_attach") %> </div>
                    <div class="div_td col ">
                        <SmoothEnterpriseWebControl:InputFile ID="FIELD_Cleanlines_FILE" name="Cleanlines_FILE" Width="200"
                            runat="server" onchange="addfile(this.id);" BackColor="#C8C8C8" CssClass="NormalBold"
                            Visible="true" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True"
                            Font-Names="Arial" Font-Size="10pt">
                            <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                        </SmoothEnterpriseWebControl:InputFile>

                    </div>
                </div>
                <div class="div_tr">
                    <div class="div_td note" style="height: 100px"><%=getStr("reliability") %> </div>
                    <div class="div_td col ">
                        <asp:DropDownList ID="FIELD_Reliability_check" runat="server"></asp:DropDownList>
                        <SmoothEnterpriseWebControl:InputText ID="FIELD_Reliability" runat="server" BackColor="#F0F0F0"
                            CssClass="Normal" ErrorMessage="Please Input「Reliability」!!" MaxLength="500" Style="text-align: left" TextMode="MultiLine"
                            Height="50px" Width="95%">
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:InputText>
                    </div>
                    <div class="div_td note" style="height: 100px"><%=getStr("rel_attach") %> </div>

                    <div class="div_td col">
                        <SmoothEnterpriseWebControl:InputFile ID="FIELD_Reliability_FIEL" name="Reliability_FILE" Width="200"
                            runat="server" onchange="addfile(this.id);" BackColor="#C8C8C8" CssClass="NormalBold"
                            Visible="true" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True"
                            Font-Names="Arial" Font-Size="10pt">
                            <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                        </SmoothEnterpriseWebControl:InputFile>

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
                                    <SmoothEnterpriseWebControl:InputText ID="FIELD_CAPA_Sheet_NO" runat="server" BackColor="#F0F0F0"
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
                                    <SmoothEnterpriseWebControl:InputText ID="FIELD_UAI_no" runat="server"
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
               
                <div style="float: left; height: auto; <%=s1%>; background-color: #EAF2E7;width:50%" id="left_foot">
                    <div class="all" style="text-align: center">
                        <div style="background-color: #8CBA80; height: 35px; color: azure"><%=getStr("flow")%></div>
                    </div>
                    <asp:Panel ID="p_list" runat="server" CssClass="div_table all" HorizontalAlign="Center">
                    </asp:Panel>

                </div>
                
                <div style="float: left; height:auto; width:auto; background-color: #E5DEE4;<%=s2%>" id="right_foot">
                    <div class="div_table all" style="text-align: center">
                        <div style="background-color: #744D6E; height: 35px; color: azure; vertical-align: middle"><%=getStr("view") %></div>
                    </div>
                    <div class="div_table all" style="text-align: center;">
                        <%=view %>
                    </div>
                </div>
            </div>

        </div>


        <div style="margin: 20px 0px">
            <table border="0" class="Normal">
                <tr>
                    <td>
                        
                        <SmoothEnterpriseWebControl:InputButton ID="BUTTON_save" runat="server" OnClientClick="return check()"
                            Width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" Text="儲存"
                            BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px"
                            OnClick="BUTTON_save_Click">
                            <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                        </SmoothEnterpriseWebControl:InputButton>&nbsp;
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_savenext" runat="server" Text="儲存後繼續操作"
                    BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px"
                    CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_save_Click">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
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
