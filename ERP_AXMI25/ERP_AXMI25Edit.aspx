<%@ Page Language="C#" MasterPageFile="~/_site/layout/ie7.master" AutoEventWireup="true" CodeFile="ERP_AXMI25Edit.aspx.cs" Inherits="CNE.CNEEdit" StylesheetTheme="Default" Culture="Auto" UICulture="Auto" Debug="true" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.Control" TagPrefix="SmoothEnterpriseControlFlowwork" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlFlowwork" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <head>
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script language="javascript" type="text/javascript">
            function num_format(field) {
                var ele = document.getElementById(field);
                var digit_ = "";
                var field_value = ele.value;
                if (isNaN(field_value))
                    return;
                var del = "";
                if (field_value.search("-") > -1) {
                    del = "-";
                    field_value = field_value.substring(1);
                }
                //field_value = field_value.replace(",","");
                var vale = formatfloat(field_value, 2) + "";
                var digits = vale.split('.');

                if (digits.length > 1) {
                    digit_ = digits[1];
                }

                if (digit_.length != 0) {
                    ele.value = del + num_mask(digits[0]) + "." + digit_;
                }
                else {
                    ele.value = del + num_mask(digits[0]);
                }
            }

            function formatfloat(num, pos) {
                var size = Math.pow(10, pos);
                return Math.round(num * size) / size;
            }

            function num_mask(digits) {
                var temp = "";
                if (digits.length > 3) {
                    temp = "," + digits.substring((digits.length - 3));
                    return num_mask(digits.substring(0, (digits.length - 3))) + temp;
                }
                else
                    return digits;
            }

            $(document).ready(function () {
                //$( "div" ).hide();

                $("label[name='slider']").click(function () {
                    var nearly = $(this).closest("tr").next().find("div[name='slider']");
                    if (nearly.is(":hidden")) {
                        nearly.slideDown("slow");
                    } else {
                        nearly.slideUp();
                    }
                });

                $("#queryform1").click(function () {
                    var strURL = 'QueryFrom.aspx';
                    var winFeatures = 'dialogHeight:470px;resizable:yes;status:yes';
                    window.showModalDialog(strURL, self, winFeatures);
                })


                //if($("#ctl00$ContentPlaceHolder1$FIELD_occa45"))

            });

            //        $(window).load(function(){
            function check() {
                if (!(($("#ctl00_ContentPlaceHolder1_FIELD_occa00[value*='V']").length > 0) &&
                     ($("#ctl00_ContentPlaceHolder1_FIELD_l_day[value*='Y']").length > 0))
                  ) {
                    var st = $.trim($("#ctl00_ContentPlaceHolder1_FIELD_occa45_NOTE").val());
                    var yorn = $("#" + this + "")
                    if ((st.length == 0) && ($("#ctl00_ContentPlaceHolder1_FIELD_occa45_NOTE").length > 0)) {
                        alert("大於60天的收款原因為必填");
                        return false;
                    }
                }

            }
            //        });


            var allowed_attachments = 5 - 1;
            var count_attachments = 0 + 1;
            function addfile(obj) {
                var objcont = $('#' + obj.id + '');
                var name = objcont.attr('name');
                var intdex_of = $("[name='" + name + "']").length + 1;
                var id = objcont.attr('id').substr(0, objcont.attr('id').length - 1) + intdex_of;
                var str = '<br /><input type="file" name="' + name + '" id="' + id + '" class="Normal" row="adverse" onchange="addfile(this)" style="background-color:#F0F0F0;FILTER:progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff);" />';
                objcont.after(str);
            }
			
			
			function dateValidationCheck(str) {
  var re = new RegExp("^([0-9]{4})[./]{1}([0-9]{1,2})[./]{1}([0-9]{1,2})$");
  var strDataValue;
  var infoValidation = true;
  if ((strDataValue = re.exec(str)) != null) {
    var i;
    i = parseFloat(strDataValue[1]);
    if (i <= 0 || i > 9999) { /*年*/
      infoValidation = false;
    }
    i = parseFloat(strDataValue[2]);
    if (i <= 0 || i > 12) { /*月*/
      infoValidation = false;
    }
    i = parseFloat(strDataValue[3]);
    if (i <= 0 || i > 31) { /*日*/
      infoValidation = false;
    }
  } else {
    infoValidation = false;
  }
  if (!infoValidation) {
    alert("創業日-請輸入 YYYY/MM/DD 日期格式");
  }
  return infoValidation;
}
        </script>
    </head>
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
        Caption="CNE Edit Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
        <CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <table>
        <tr>
            <td>
                <asp:TextBox ID="FIELD_l_day" runat="server" Style="display: none"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 100%">
               <asp:Image ID="img_mark" runat="server" ImageUrl="minaik.gif" />  </td>
        </tr>
        <tr>
            <td align="center" style="width: 100%; background-color: #cac9de">
                <label class="NormalBold" style="font-size: small">基本資料</label>
            </td>
        </tr>
        <tr>
            <td>
                <div name="slider">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="LABEL_argv2" runat="server" CssClass="NormalBold" Text="是否有異動"></asp:Label>

                            </td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_argv2" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occano」!!" MaxLength="40" Required="True">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText>
                                <%--<asp:DropDownList ID="FIELD_argv2" Enabled="false" runat="server" CssClass="NormalBold" />--%>
                                
                            </td>
                            <td>
                                <asp:Label ID="LABEL_occa00" runat="server" CssClass="NormalBold" Text="申請類別" Width="110px"></asp:Label>
                            </td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa00" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occano」!!" MaxLength="40" Required="True">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText>
                                <%--<asp:DropDownList ID="FIELD_occa00" Enabled="false" runat="server" CssClass="NormalBold" /--%>                            
                            </td>
                            <td>
                                <asp:Label ID="LABEL_occano" runat="server" CssClass="NormalBold" Text="申請單號 "></asp:Label>
                                <%--<asp:Label ID="LABEL_occa1004" runat="server" CssClass="NormalBold" Text="狀態碼"></asp:Label>--%>
                            </td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occano" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occano」!!" MaxLength="40" Required="True">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText>
                                <%--<asp:DropDownList ID="FIELD_occa1004" Enabled="false" runat="server" CssClass="NormalBold" />  --%>                              
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="LABEL_occanote" runat="server" CssClass="NormalBold" Text="異動原因"></asp:Label>
                            </td>
                            <td colspan="3">
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" Width="100%" ID="FIELD_occanote" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occanote」!!" MaxLength="255">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText>
                            </td>
                            <td>
                                <asp:Label ID="LABEL_occa06" runat="server" CssClass="NormalBold" Text="性質 "></asp:Label>
                            </td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa06" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa06」!!" MaxLength="1">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="LABEL_occa01" runat="server" CssClass="NormalBold" Text="客戶編號"></asp:Label>
                            </td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa01" runat="server" BackColor="#F0F0F0" Width="60px" CssClass="Normal" ErrorMessage="Please Input「Occa01」!!" MaxLength="10" Required="false">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText>
                                <img id="queryform1" runat="server" visible="False" src="../gif/icon-zoom.gif" />
                            </td>
                            <td>
                                <asp:Label ID="LABEL_occaud15" runat="server" CssClass="NormalBold" Text="申請日期"></asp:Label></td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occaud15" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occaud15」!!" MaxLength="10">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText></td>

                            <td>
                                <asp:Label ID="LABEL_occagrup" runat="server" CssClass="NormalBold" Text="資料所有部門"></asp:Label></td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occagrup" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occagrup」!!" MaxLength="6">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="LABEL_occa02" CssClass="NormalBold" runat="server" Text="客戶簡稱"></asp:Label></td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa02" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa02」!!" MaxLength="40">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText></td>
                            <td>
                                <asp:Label ID="LABEL_ta_occa14" runat="server" CssClass="NormalBold" Text="原客戶資料有效否"></asp:Label></td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa14" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Ta_occa14」!!" MaxLength="1">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText></td>
                            <td>
                                <asp:Label ID="LABEL_occauser" runat="server" CssClass="NormalBold" Text="資料所有者"></asp:Label></td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occauser" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occauser」!!" MaxLength="10">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText></td>

                        </tr>
                        <tr>
                            <td rowspan="2">
                                <asp:Label ID="LABEL_occa18" runat="server" CssClass="NormalBold" Text="公司全名 "></asp:Label></td>
                            <td colspan="3" rowspan="2">
                                <SmoothEnterpriseWebControl:InputText Width="100%" Wrap="true" ReadOnly="true" runat="server" TextMode="MultiLine" ID="FIELD_occa18" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa07」!!" MaxLength="10">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText><%--<asp:TextBox ID="FIELD_occa18" Width="100%" Wrap="true" ReadOnly="true" runat="server" TextMode="MultiLine" />--%></td>
                            <td>
                                <asp:Label ID="LABEL_occa09" runat="server" CssClass="NormalBold" Text="送貨客戶編號"></asp:Label></td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa09" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa09」!!" MaxLength="10">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText></td>

                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="LABEL_occa07" runat="server" CssClass="NormalBold" Text="收款客戶編號"></asp:Label></td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa07" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa07」!!" MaxLength="10">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="LABEL_occa11" runat="server" CssClass="NormalBold" Text="統一編號"></asp:Label>
                            </td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa11" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa11」!!" MaxLength="20">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText>
                            </td>
                            <td colspan="2">
                                <asp:CheckBox ID="FIELD_occa37" Enabled="false" CssClass="NormalBold" Text="是否為關係人" TextAlign="Right" runat="Server" />
                            </td>
                            <td>
                                <asp:Label ID="LABEL_occa04" runat="server" CssClass="NormalBold" Text="負責業務員編號"></asp:Label></td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa04" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa11」!!" MaxLength="20">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText><%--<asp:TextBox ID="FIELD_occa04" ReadOnly="true" runat="server" />--%></td>

                        </tr>
                        <tr>
                            <td>
                                <%--<asp:Label ID="LABEL_ta00cc08" Text="GST ID" runat="server"></asp:Label>--%>
                            </td>
                            <td>
                                <%--<SmoothEnterpriseWebControl:InputText ReadOnly="true" id="FIELD_ta00cc08" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa11」!!" MaxLength="20"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText>--%>
                            </td>
                            <td colspan="2">
                                <asp:CheckBox ID="FIELD_ta_occa06" Enabled="false" runat="server" CssClass="NormalBold" Text="關係人回轉否" />
                            </td>
                            <td>
                                <asp:Label ID="LABEL_occa03" runat="server" CssClass="NormalBold" Text="客戶分類"></asp:Label></td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa03" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa07」!!" MaxLength="10">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText><%--<asp:TextBox ID="FIELD_occa03" ReadOnly="true" runat="server" />--%></td>

                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="LABEL_occa28" runat="server" CssClass="NormalBold" Text="公司負責人"></asp:Label></td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa28" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa28」!!" MaxLength="30">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText></td>

                            <td colspan="2">
                                <asp:CheckBox ID="FIELD_ta_occa07" Enabled="false" CssClass="NormalBold" runat="server" Text="非關係人回轉" /></td>
                            <td>
                                <asp:Label ID="LABEL_ta_occa21" runat="server" CssClass="NormalBold" Text="類別說明"></asp:Label></td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa21" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa28」!!" MaxLength="30">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText></td>
                        </tr>
                        <tr>

                            <td>
                                <asp:Label ID="LABEL_ta_occa15" runat="server" CssClass="NormalBold" Text="來源廠區  "></asp:Label></td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa15" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Ta_occa15」!!" MaxLength="10">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText></td>
                            <td colspan="2"><%--<asp:CheckBox ID="FIELD_occa56" Enabled="false" CssClass="NormalBold" Text="須出貨通知否" TextAlign="Right" runat="Server" />--%></td>

                            <td>
                                <asp:Label ID="LABEL_ta_occa27" runat="server" CssClass="NormalBold" Text="股票代號 "></asp:Label></td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa27" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa15」!!" MaxLength="0" FormatType="Number">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText></td>
                        </tr>
                        <tr>
                            <td colspan="4"></td>
                            <td>
                                <asp:Label ID="LABEL_ta_occa20" runat="server" CssClass="NormalBold" Text="產業類別"></asp:Label></td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa20" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa28」!!" MaxLength="30">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label CssClass="NormalBold" runat="server" Text="上傳附件" /></td>
                            <td colspan="4">
                                <asp:CheckBoxList ID="CheckBoxFile" runat="server" Font-Size="X-Small">
                                </asp:CheckBoxList>
                                <asp:Label ID="Label22" runat="server" Font-Size="X-Small" ForeColor="#C00000" Text="(勾選後按下儲存即可刪除檔案)"></asp:Label>
                                <br />
                                <SmoothEnterpriseWebControl:InputFile ID="uploadfile" onchange="addfile(this)" runat="server" BackColor="#F0F0F0" CssClass="Normal">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputFile>
                                <asp:Label ID="Label1" runat="server" Font-Size="X-Small" ForeColor="#C00000" Text="(本表資料未提供建立完整者,相關單位不得出貨(相關資料: 公司變更登記表(公司登記証照) 、財務報表、訂單 or FORECAST)."></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 100%; background-color: #cac9de">
                <label class="NormalBold" style="font-size: small" name="slider">客戶資料一</label>
            </td>
        </tr>
        <tr>
            <td>
                <div name="slider">
                    <table>
                        <tr>
                            <td align="left" valign="top">
                                <table width="100%">
                                    <tr>
                                        <td>
                                            <asp:Label ID="LABEL_occa21" runat="server" CssClass="NormalBold" Text="國別編號"></asp:Label></td>
                                        <td>
                                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa21" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa21」!!" MaxLength="4">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            </SmoothEnterpriseWebControl:InputText></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="LABEL_occa20" runat="server" CssClass="NormalBold" Text="區域編號"></asp:Label></td>
                                        <td>
                                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa20" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa20」!!" MaxLength="4">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            </SmoothEnterpriseWebControl:InputText></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="LABEL_occa35" runat="server" CssClass="NormalBold" Text="郵遞區號"></asp:Label></td>
                                        <td>
                                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa35" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa35」!!" MaxLength="10">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            </SmoothEnterpriseWebControl:InputText></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="LABEL_occa231" runat="server" CssClass="NormalBold" Text="發票地址"></asp:Label></td>
                                        <td>
                                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" TextMode="MultiLine" Width="770px" Wrap="true" ID="FIELD_occa231" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa23」!!" MaxLength="255">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            </SmoothEnterpriseWebControl:InputText></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="LABEL_occa24" runat="server" CssClass="NormalBold" Text="送貨地址"></asp:Label></td>
                                        <td>
                                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" TextMode="MultiLine" Width="770px" Wrap="true" ID="FIELD_occa241" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa24」!!" MaxLength="255">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            </SmoothEnterpriseWebControl:InputText></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="LABEL_ta_occa19" runat="server" CssClass="NormalBold" Text="登記地址"></asp:Label></td>
                                        <td>
                                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" TextMode="MultiLine" Width="770px" Wrap="true" ID="FIELD_ta_occa191" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Ta_occa19」!!" MaxLength="255">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            </SmoothEnterpriseWebControl:InputText></td>
                                    </tr>
                                    <%--<tr><td><asp:Label ID="LABEL_occa29" runat="server" CssClass="NormalBold" Text="業務聯絡人 "></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText ReadOnly="true" id="FIELD_occa29" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa29」!!" MaxLength="150"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td><td><asp:Label ID="LABEL_occa292" runat="server" CssClass="NormalBold" Text="業務聯絡人分機號碼"></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText ReadOnly="true" id="FIELD_occa292" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa292」!!" MaxLength="15"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td></tr>--%>
                                    <%--<tr><td><asp:Label ID="LABEL_occa30" runat="server" CssClass="NormalBold" Text="財務聯絡人"></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText ReadOnly="true" id="FIELD_occa30" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa30」!!" MaxLength="150"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td><td><asp:Label ID="LABEL_occa302" runat="server" CssClass="NormalBold" Text="財務聯絡人分機號碼"></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText ReadOnly="true" id="FIELD_occa302" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa302」!!" MaxLength="15"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td></tr>--%>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 100%; background-color: #cac9de">
                <label class="NormalBold" style="font-size: small" name="slider">會計/狀態</label>
            </td>
        </tr>
        <tr>
            <td>
                <div name="slider">
                    <table>
                        <tr>

                            <td align="left" valign="top">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="LABEL_occa38" runat="server" CssClass="NormalBold" Text="客戶月結日"></asp:Label></td>
                                        <td>
                                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa1301" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa38」!!" MaxLength="2">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            </SmoothEnterpriseWebControl:InputText>

                                        </td>
                                        <td>
                                            <asp:Label ID="LABEL9" runat="server" CssClass="NormalBold" Text="月結日(AR用)"></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="FIELD_occa38" runat="server" BackColor="#F0F0F0"></asp:TextBox>
                                        </td>
                                        <td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="LABEL_occa39" runat="server" CssClass="NormalBold" Text="客戶付款日 "></asp:Label>
                                        </td>
                                        <td>
                                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa1302" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa39」!!" MaxLength="2">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            </SmoothEnterpriseWebControl:InputText>
                                        </td>
                                        <td>
                                            <asp:Label ID="LABEL10" runat="server" CssClass="NormalBold" Text="付款日(AR用)"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="FIELD_occa39" runat="server" BackColor="#F0F0F0"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 100%; background-color: #cac9de">
                <label class="NormalBold" style="font-size: small" name="slider">慣用條件設定</label>
            </td>
        </tr>
        <tr>
            <td>
                <div name="slider">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="LABEL_occa42" runat="server" CssClass="NormalBold" Text="慣用幣別 "></asp:Label></td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa42" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa42」!!" MaxLength="4">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText></td>
                            <td>
                                <asp:Label ID="LABEL_occa43" runat="server" CssClass="NormalBold" Text="慣用銷售分類"></asp:Label></td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa43" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa43」!!" MaxLength="4">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText></td>
                            <td><%--<asp:Label ID="LABEL_occa51" runat="server" CssClass="NormalBold" Text="慣用forwarder"></asp:Label></td><td><SmoothEnterpriseWebControl:InputText ReadOnly="true" id="FIELD_occa51" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa51」!!" MaxLength="10"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText>--%><asp:Label ID="LABEL_occa55" runat="server" CssClass="NormalBold" Text="慣用語言 "></asp:Label></td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa55" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa55」!!" MaxLength="1">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="LABEL_occa41" runat="server" CssClass="NormalBold" Text="慣用稅別"></asp:Label></td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa41" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa41」!!" MaxLength="4">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText></td>
                            <td>
                                <asp:Label ID="LABEL_occa44" runat="server" CssClass="NormalBold" Text="慣用價格條件"></asp:Label></td>
                            <td colspan="3">
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa44" runat="server" Width="300px" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa44」!!" MaxLength="6">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                </SmoothEnterpriseWebControl:InputText></td>

                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="LABEL_occa08" runat="server" CssClass="NormalBold" Text="慣用發票別"></asp:Label></td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa08" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa08」!!" MaxLength="1">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText></td>
                            <td>
                                <asp:Label ID="LABEL_occa45" runat="server" CssClass="NormalBold" Text="慣用收款條件"></asp:Label></td>
                            <td colspan="3">
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa45" runat="server" Width="300px" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa45」!!" MaxLength="6">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="LABEL_occa45_NOTE" runat="Server" CssClass="NormalBold" Text="慣用收款條件說明"></asp:Label></td>
                            <td colspan="5">
                                <SmoothEnterpriseWebControl:InputText ID="FIELD_occa45_NOTE" runat="server" Width="580px" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa45」!!">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText></td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 100%; background-color: #cac9de">
                <label class="NormalBold" style="font-size: small" name="slider">財務資料</label>
            </td>
        </tr>
        <tr>
            <td>
                <div name="slider">
                    <table border="0" class="Normal">
                        <tr>
                            <td valign="top">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="LABEL_occa12" runat="server" CssClass="NormalBold" Text="創業日"></asp:Label></td>
                                        <td>
                                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa12" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa12」!!" MaxLength="10">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            </SmoothEnterpriseWebControl:InputText></td>
                                        <td>
                                            <asp:Label ID="LABEL_occa15" runat="server" CssClass="NormalBold" Text="員工人數 "></asp:Label></td>
                                        <td>
                                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa15" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa15」!!" MaxLength="0" FormatType="Number">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            </SmoothEnterpriseWebControl:InputText></td>
                                        <td>
                                            <asp:Label ID="LABEL_ta_occa29" runat="server" CssClass="NormalBold" Text="資本額 "></asp:Label></td>
                                        <td>
                                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa29" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa15」!!" MaxLength="0" FormatType="Number">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            </SmoothEnterpriseWebControl:InputText></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="LABEL_ta_occa23a" runat="server" CssClass="NormalBold" Text="最近3 年年度1"></asp:Label></td>
                                        <td>
                                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa23a" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa12」!!" MaxLength="10">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            </SmoothEnterpriseWebControl:InputText></td>
                                        <td>
                                            <asp:Label ID="LABEL_ta_occa23b" runat="server" CssClass="NormalBold" Text="最近3 年營業額1"></asp:Label></td>
                                        <td>
                                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa23b" FormatType="Number" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa12」!!" MaxLength="10">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            </SmoothEnterpriseWebControl:InputText></td>
                                        <td>
                                            <asp:Label ID="LABEL_ta_occa23c" runat="server" CssClass="NormalBold" Text="最近3 年稅後淨利1"></asp:Label></td>
                                        <td>
                                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa23c" FormatType="Number" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa12」!!" MaxLength="10">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            </SmoothEnterpriseWebControl:InputText></td>


                                        <%--<td><asp:Label ID="LABEL_occa14" runat="server" CssClass="NormalBold" Text="年營業額 "></asp:Label></td><td><SmoothEnterpriseWebControl:InputText ReadOnly="true" id="FIELD_occa14" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa14」!!" MaxLength="20"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>--%>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="LABEL_ta_occa24a" runat="server" CssClass="NormalBold" Text="最近3 年年度2"></asp:Label></td>
                                        <td>
                                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa24a" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa12」!!" MaxLength="10">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            </SmoothEnterpriseWebControl:InputText></td>
                                        <td>
                                            <asp:Label ID="LABEL_ta_occa24b" runat="server" CssClass="NormalBold" Text="最近3 年營業額2"></asp:Label></td>
                                        <td>
                                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa24b" FormatType="Number" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa12」!!" MaxLength="10">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            </SmoothEnterpriseWebControl:InputText></td>
                                        <td>
                                            <asp:Label ID="LABEL_ta_occa24c" runat="server" CssClass="NormalBold" Text="最近3 年稅後淨利2"></asp:Label></td>
                                        <td>
                                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa24c" FormatType="Number" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa12」!!" MaxLength="10">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            </SmoothEnterpriseWebControl:InputText></td>

                                        <%--<td><asp:Label ID="LABEL_occa13" runat="server" CssClass="NormalBold" Text="資本額"></asp:Label></td><td><SmoothEnterpriseWebControl:InputText ReadOnly="true" id="FIELD_occa13" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa13」!!" MaxLength="20"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>--%>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="LABEL_ta_occa25a" runat="server" CssClass="NormalBold" Text="最近3 年年度3 "></asp:Label></td>
                                        <td>
                                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa25a" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa15」!!" MaxLength="0">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            </SmoothEnterpriseWebControl:InputText></td>
                                        <td>
                                            <asp:Label ID="LABEL_ta_occa25b" runat="server" CssClass="NormalBold" Text="最近3 年營業額3 "></asp:Label></td>
                                        <td>
                                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa25b" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa15」!!" MaxLength="0" FormatType="Number">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            </SmoothEnterpriseWebControl:InputText></td>
                                        <td>
                                            <asp:Label ID="LABEL_ta_occa25c" runat="server" CssClass="NormalBold" Text="最近3 年稅後淨利3 "></asp:Label></td>
                                        <td>
                                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa25c" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa15」!!" MaxLength="0" FormatType="Number">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            </SmoothEnterpriseWebControl:InputText></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="LABEL_ta_occa26a" runat="server" CssClass="NormalBold" Text="最近年度 "></asp:Label></td>
                                        <td>
                                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa26a" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa15」!!" MaxLength="0">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            </SmoothEnterpriseWebControl:InputText></td>
                                        <td>
                                            <asp:Label ID="LABEL_ta_occa26b" runat="server" CssClass="NormalBold" Text="最近年度流動資產 "></asp:Label></td>
                                        <td>
                                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa26b" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa15」!!" MaxLength="0" FormatType="Number">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            </SmoothEnterpriseWebControl:InputText></td>
                                        <td>
                                            <asp:Label ID="LABEL_ta_occa26c" runat="server" CssClass="NormalBold" Text="最近年度資產總額 "></asp:Label></td>
                                        <td>
                                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa26c" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa15」!!" MaxLength="0" FormatType="Number">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            </SmoothEnterpriseWebControl:InputText></td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="LABEL_ta_occa26d" runat="server" CssClass="NormalBold" Text="最近年度流動負債 "></asp:Label></td>
                                        <td>
                                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa26d" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa15」!!" MaxLength="0" FormatType="Number">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            </SmoothEnterpriseWebControl:InputText></td>
                                        <td>
                                            <asp:Label ID="LABEL_ta_occa26e" runat="server" CssClass="NormalBold" Text="最近年度負債總額 "></asp:Label></td>
                                        <td>
                                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa26e" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa15」!!" MaxLength="0" FormatType="Number">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            </SmoothEnterpriseWebControl:InputText></td>
                                        <td>
                                            <asp:Label ID="LABEL_ta_occa26f" runat="server" CssClass="NormalBold" Text="最近年度淨資產價值 "></asp:Label></td>
                                        <td>
                                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa26f" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa15」!!" MaxLength="0" FormatType="Number">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            </SmoothEnterpriseWebControl:InputText></td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="LABEL_ta_occa26g" runat="server" CssClass="NormalBold" Text="最近年度營業活動淨現金流量 "></asp:Label></td>
                                        <td>
                                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa26g" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa15」!!" MaxLength="0" FormatType="Number">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            </SmoothEnterpriseWebControl:InputText></td>

                                        <td>
                                            <asp:Label ID="LABEL_ta_occa28" runat="server" CssClass="NormalBold" Text="財務說明備註 "></asp:Label></td>
                                        <td colspan="3">
                                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa28" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa15」!!" MaxLength="0" Width="100%">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            </SmoothEnterpriseWebControl:InputText></td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="FIELD_ta_occa22" Enabled="False" CssClass="NormalBold" Text="NDA否" runat="Server" /></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="LABEL_occa704" runat="server" CssClass="NormalBold" Text="NDA說明 "></asp:Label></td>
                                        <td colspan="5">
                                            <SmoothEnterpriseWebControl:InputText ID="FIELD_occa704" runat="server" ReadOnly="TRUE" Width="100%" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa45」!!">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            </SmoothEnterpriseWebControl:InputText></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <!--V1.0.1-->
        <tr>
            <td align="center" style="width: 100%; background-color: #cac9de">
                <label class="NormalBold" style="font-size: small" name="slider">銀行資料</label>
            </td>
        </tr>
        <tr>
            <td>
                <table>

                    <tr>
                        <td style="text-align: left">
                            <asp:Label ID="LABEL3" runat="server" CssClass="NormalBold" Text="帳號" Width="50"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="FIELD_ta_occa01" runat="server" BackColor="#F0F0F0" ForeColor="#000000"></asp:TextBox></td>
                        <td style="text-align: left; width: 50px">
                            <asp:Label ID="LABEL4" runat="server" CssClass="NormalBold" Text="SWIFT" Width="50"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="FIELD_ta_occa02" runat="server" BackColor="#F0F0F0" ForeColor="#000000">	</asp:TextBox></td>
                    </tr>

                    <tr>
                        <td style="text-align: left">
                            <asp:Label ID="LABEL5" runat="server" CssClass="NormalBold" Text="電話" Width="50"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="FIELD_ta_occa03" runat="server" BackColor="#F0F0F0" ForeColor="#000000">	</asp:TextBox></td>
                        <td style="text-align: left; width: 50px">
                            <asp:Label ID="LABEL6" runat="server" CssClass="NormalBold" Text="傳真" Width="50"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="FIELD_ta_occa04" runat="server" BackColor="#F0F0F0" ForeColor="#000000">	</asp:TextBox></td>
                    </tr>

                    <tr>
                        <td style="text-align: left">
                            <asp:Label ID="LABEL7" runat="server" CssClass="NormalBold" Text="地址" Width="50"></asp:Label></td>
                        <td colspan="3">
                            <asp:TextBox ID="FIELD_ta_occa05" runat="server" BackColor="#F0F0F0" ForeColor="#000000" Width="800"></asp:TextBox></td>
                    </tr>


                </table>
            </td>

        </tr>
        <!--V1.0.1-->
        <tr>
            <td align="center" style="width: 100%; background-color: #cac9de">
                <label class="NormalBold" style="font-size: small" name="slider">信用查核</label>
            </td>
        </tr>
        <tr>
            <td>
                <div name="slider">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="LABEL_occa61" runat="server" CssClass="NormalBold" Text="信用評等"></asp:Label></td>
                            <td>
                                <asp:DropDownList Enabled="false" ID="FIELD_occa61" runat="server" BackColor="#F0F0F0" CssClass="Normal" /></td>
                            <td>
                                <asp:Label ID="LABEL_ta_occa10" runat="server" CssClass="NormalBold" Text="銷售產品"></asp:Label></td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa10" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Ta_occa10」!!" MaxLength="255">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText></td>
                            <td>
                                <asp:Label ID="LABEL_ta_occa0801" runat="server" CssClass="NormalBold" Text="主要供應商1"></asp:Label></td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa0801" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Ta_occa0801」!!" MaxLength="10">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText></td>
                            <td>
                                <asp:Label ID="LABEL_ta_occa0901" runat="server" CssClass="NormalBold" Text="付款條件1"></asp:Label></td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa0901" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Ta_occa0901」!!" MaxLength="6">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="LABEL_occa63" runat="server" CssClass="NormalBold" Text="信用額度"></asp:Label></td>
                            <td>

                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" FormatType="Number" ID="FIELD_occa63" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa63」!!" MaxLength="0">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText></td>

                            <td>
                                <asp:Label ID="LABEL8" runat="server" CssClass="NormalBold" Text="幣別"></asp:Label></td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" Style="text-align: left" ID="LABEL_occa631" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa631」!!" MaxLength="0">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText>
                            </td>
                            <td>
                                <asp:Label ID="LABEL_ta_occa11" runat="server" CssClass="NormalBold" Text="訂單方式"></asp:Label></td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa11" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Ta_occa0802」!!" MaxLength="10">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText><%--<asp:DropDownList id="FIELD_ta_occa11" Enabled="false" runat="server" />--%></td>
                            <td>
                                <asp:Label ID="LABEL_ta_occa0802" runat="server" CssClass="NormalBold" Text="主要供應商2"></asp:Label></td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa0802" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Ta_occa0802」!!" MaxLength="10">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText></td>
                            <td>
                                <asp:Label ID="LABEL_ta_occa0902" runat="server" CssClass="NormalBold" Text="付款條件2"></asp:Label></td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa0902" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Ta_occa0902」!!" MaxLength="6">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="LABEL_occa36" runat="server" CssClass="NormalBold" Text="寬限天數"></asp:Label></td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa36" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa36」!!" MaxLength="0" FormatType="Number">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText></td>
                            <td></td>
                            <td></td>
                            <td>
                                <asp:Label ID="LABEL_ta_occa0803" runat="server" CssClass="NormalBold" Text="主要供應商3 "></asp:Label></td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa0803" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Ta_occa0803」!!" MaxLength="10">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText></td>
                            <td>
                                <asp:Label ID="LABEL_ta_occa0903" runat="server" CssClass="NormalBold" Text="付款條件3"></asp:Label></td>
                            <td>
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa0903" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Ta_occa0903」!!" MaxLength="6">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText></td>

                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="LABEL_ta_occa1201" runat="server" CssClass="NormalBold" Text="說明1"></asp:Label></td>
                            <td colspan="7">
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" TextMode="MultiLine" Width="100%" Wrap="false" ID="FIELD_ta_occa1201" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Ta_occa0902」!!" MaxLength="6">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="LABEL_ta_occa1202" runat="server" CssClass="NormalBold" Text="說明2"></asp:Label></td>
                            <td colspan="7">
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" TextMode="MultiLine" Width="100%" Wrap="false" ID="FIELD_ta_occa1202" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Ta_occa0902」!!" MaxLength="6">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="LABEL_ta_occa1203" runat="server" CssClass="NormalBold" Text="說明3"></asp:Label></td>
                            <td colspan="7">
                                <SmoothEnterpriseWebControl:InputText ReadOnly="true" TextMode="MultiLine" Width="100%" Wrap="false" ID="FIELD_ta_occa1203" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Ta_occa0902」!!" MaxLength="6">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputText></td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="LABEL2" runat="server" CssClass="NormalBold" Text="直屬主管"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="height: 20px">
                <SmoothEnterpriseWebControlEnterprise:PopupUser ID="FIELD_charge" runat="server" BackColor="#F0F0F0"
                    CssClass="Normal" DisplayField="name" FormatType="InputCombo" FormatValueField="logonid"
                    Gradient-GradientType="Top" ValueField="id">
                </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
        </tr>
    </table>
    <table border="0" class="Normal">
        <tr>
            <td>
                <SmoothEnterpriseControlFlowwork:FlowClient ID="FlowClient1" runat="server" TypeName="sharflow12_3.Flowwork.sharflow12_31">
                </SmoothEnterpriseControlFlowwork:FlowClient>
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
                        <asp:Image ID="Image2" runat="server" ImageAlign="Right" ImageUrl="/gif/AppDeputy.png" Visible="False" />
                        <asp:Image ID="Image1" runat="server" ImageAlign="Right" />
                    </HistoryTemplate>
                </SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer>
            </td>

        </tr>
    </table>
    <div style="color: red"><%=show %></div>
    <table border="0" class="Normal">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_save" runat="server" Text="儲存" Width="80px"
                    BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold"
                    Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_save_Click1">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;&nbsp;
				<SmoothEnterpriseWebControlFlowwork:SendRequestButton ID="BUTTON_SendRequest" OnClientClick="return check()" OnClick="BUTTON_SendRequest_Click" runat="server"
                    BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px"
                    CssClass="NormalBold" Flow="<%# FlowClient1 %>" Font-Bold="True" Font-Names="Arial"
                    Font-Size="12px" gradient-gradienttype="Bottom" Width="60px" Height="22px">
                    <Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
                </SmoothEnterpriseWebControlFlowwork:SendRequestButton>&nbsp;
                <SmoothEnterpriseWebControlFlowwork:StopRequestButton ID="BUTTON_StopRequest" runat="server"
                    BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" OnClick="ButStop_Click"
                    CssClass="NormalBold" Flow="<%# FlowClient1 %>" Font-Bold="True" Font-Names="Arial"
                    Font-Size="12px" gradient-gradienttype="Bottom" Width="60px" Height="22px">
                    <Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
                </SmoothEnterpriseWebControlFlowwork:StopRequestButton>&nbsp;
                <SmoothEnterpriseWebControlFlowwork:RemindReviewerButton OnClick="BUTTON_RemindReviewer_Click"
                    ID="BUTTON_RemindReviewer" runat="server" BackColor="#C8C8C8" BorderColor="#606060"
                    BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True"
                    Font-Names="Arial" Font-Size="12px" Gradient-GradientType="Bottom" Height="22px"
                    Width="60px" Flow="<%# FlowClient1 %>">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControlFlowwork:RemindReviewerButton>&nbsp;
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Text="回上頁" Width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_back_Click">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;				
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_delete" runat="server" Text="退回ERP" Width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_delete_Click">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
                <br />
                <asp:Panel runat="server" ID="p1" Visible="false" BackColor="LightYellow" Font-Size="12">
                    系統流程測試，以","分隔審核者，直接寄出<br />
                    人員<asp:TextBox ID="t_user" runat="server">02CA2090-C5D0-455B-A671-5D7168D08559,13FEB136-9F48-416A-B495-7C2BE8C3B548</asp:TextBox>預設:葉沛涵,謝珮真<br />
                    簽核欄名
                    <asp:TextBox ID="t_tag" runat="server">test1,財務</asp:TextBox>職務名稱(最後一關的Tag必需是財務)<br />


                    <SmoothEnterpriseWebControlFlowwork:SendRequestButton ID="btn_test" OnClientClick="return check()" OnClick="btn_test_Click1" runat="server"
                        BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" Text="Test"
                        CssClass="NormalBold" Flow="<%# FlowClient1 %>" Font-Bold="True" Font-Names="Arial"
                        Font-Size="12px" gradient-gradienttype="Bottom" Width="60px" Height="22px">
                        <Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
                    </SmoothEnterpriseWebControlFlowwork:SendRequestButton>&nbsp;
                </asp:Panel>

                <asp:Button ID="btn_flow" runat="server" OnClick="btn_flow_Click1" Text="Flow Test"  Visible="false" />
                 

            </td>
        </tr>
    </table>
    <%--    <asp:Button ID="Button1" runat="server" Text="測試" OnClick="Button1_Click" />--%>
</asp:Content>
