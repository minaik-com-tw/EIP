<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="ERP_AXMI25View.aspx.cs" Inherits="CNE.CNEView" StylesheetTheme="Default" Culture="Auto" UICulture="Auto" Debug="true" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlFlowwork" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Flowwork" Namespace="SmoothEnterprise.Flowwork.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlFlowwork" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<script type="text/javascript" src="js/jquery.min.js"></script>--%>
    <script language="javascript" type="text/javascript">
        //            $(document).ready(function(){
        //                //$( "div" ).hide();
        //                
        //                $( "label[name='slider']" ).click(function () {
        //                    var nearly = $(this).closest("tr").next().find("div[name='slider']");
        //                  if ( nearly.is( ":hidden" ) ) {
        //                    nearly.slideDown( "slow" );
        //                  } else {
        //                    nearly.slideUp();
        //                  }
        //                });
        //                
        //                $("#ctl00_ContentPlaceHolder1_queryform1").click(function(){
        //                    var strURL = 'QueryFrom.aspx?ROWNO=<%=Request.QueryString["ROWNO"] %>';
        //                    var winFeatures = 'dialogHeight:470px;resizable:yes;status:no';
        //                    window.showModalDialog(strURL,self,winFeatures);
        //                })
        //                                
        //            });

        $(function(){
            $("#ctl00_ContentPlaceHolder1_FIELD_occa01").change(function () {
                customer_chang();
            })

            $("#ctl00_ContentPlaceHolder1_FIELD_occa61_s").change(function () {
               var oocca61 =$(this).val();
            $("#ctl00_ContentPlaceHolder1_FIELD_occa61").val( oocca61);    
            });
        })

        function customer_chang()
        {
            var occa01 = $("#ctl00_ContentPlaceHolder1_FIELD_occa01").val();
            $("#ctl00_ContentPlaceHolder1_FIELD_occa07").val(occa01);
            $("#ctl00_ContentPlaceHolder1_FIELD_occa09").val(occa01);
            $("#ctl00_ContentPlaceHolder1_FIELD_occa33").val(occa01);
        }

        function Open() {
            //var ele = document.getElementById(id);
            var strURL = 'QueryFrom.aspx?ROWNO=<%=Request.QueryString["ROWNO"] %>';
            var winFeatures = 'dialogHeight:470px;resizable:yes;status:no';
            window.showModalDialog(strURL, self, winFeatures);
        }
        function num_format(field) {
            var ele = document.getElementById(field);
            var digit_ = "";
            var field_value = ele.value.replace(",", "");
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
        //                $("#ctl00_ContentPlaceHolder1_queryform1").click(function(){
        //                    var strURL = 'QueryFrom.aspx?ROWNO=<%=Request.QueryString["ROWNO"] %>';
        //                    var winFeatures = 'dialogHeight:470px;resizable:yes;status:no';
        //                    window.showModalDialog(strURL,self,winFeatures);
        //                })

        function check() {
            var isPass = true;

            var Dt = $("#ctl00_ContentPlaceHolder1_FIELD_occa12").val();
            if (Dt != null & Dt != "") {
                isPass = dateValidationCheck(Dt);
            }

            var curr_ts = Date.parse(new Date());
            curr_ts = curr_ts / 1000;

            var dt_ts = Date.parse(new Date(Dt));
            dt_ts = dt_ts / 1000;

            if (dt_ts > curr_ts) {
                alert("創業日-不得大於今日");
                isPass = false;
            }


            var occa01 = $("#ctl00_ContentPlaceHolder1_FIELD_occa01").val();
            var occa61= $("#ctl00_ContentPlaceHolder1_FIELD_occa61_s").val();
            if (occa01 != "" && occa61=="") {

                alert("請填寫-信用評等");
                isPass = false;
            }

            return isPass;
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
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
        Caption="CNE View Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
        <CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>

<asp:HiddenField ID="PlantID" runat="server"   />

    
    <table>
        <tr>
            <td align="center" style="width: 100%">
                <asp:Image ID="img_mark" runat="server" ImageUrl="minaik.gif"   /> </td>
        </tr>
        <tr>
            <td align="center" style="width: 100%; background-color: #cac9de">
                <label class="NormalBold" style="font-size: small">基本資料</label>
            </td>
        </tr>
        <tr>
            <td>
                <%--<div name="slider">--%>
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
                        <td style="text-align: right">
                            <asp:Label ID="LABEL_occa00" runat="server" CssClass="NormalBold" Text="申請類別" Width="110px"></asp:Label>
                        </td>
                        <td>
                            <asp:HiddenField ID="hide_occa00" runat="server" Value="" />
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
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa01" runat="server" BackColor="#F0F0F0" Width="60px" CssClass="Normal" ErrorMessage="Please Input「Occa01」!!" Required="false">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText>
                            <img id="queryform1" runat="server" visible="False" src="../gif/icon-zoom.gif" onclick="Open()" />
                        </td>
                        <td>
                            <asp:Label ID="LABEL_occaud15" runat="server" CssClass="NormalBold" Text="申請日期"></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occaud15" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occaud15」!!">
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
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occauser" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occauser」!!">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>

                    </tr>
                    <tr>
                        <td rowspan="2">
                            <asp:Label ID="LABEL_occa18" runat="server" CssClass="NormalBold" Text="公司全名 "></asp:Label></td>
                        <td colspan="3" rowspan="2">
                            <SmoothEnterpriseWebControl:InputText Width="100%" Wrap="true" ReadOnly="true" runat="server" TextMode="MultiLine" ID="FIELD_occa18" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa07」!!">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText><%--<asp:TextBox ID="FIELD_occa18" Width="100%" Wrap="true" ReadOnly="true" runat="server" TextMode="MultiLine" />--%></td>
                        <td>
                            <asp:Label ID="LABEL_occa09" runat="server" CssClass="NormalBold" Text="送貨客戶編號"></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa09" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa09」!!">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_occa07" runat="server" CssClass="NormalBold" Text="收款客戶編號"></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa07" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa07」!!">
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
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa03" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa07」!!">
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
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa15" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Ta_occa15」!!">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>
                        <td colspan="2"><%--<asp:CheckBox ID="FIELD_occa56" Enabled="false" CssClass="NormalBold" Text="須出貨通知否" TextAlign="Right" runat="Server" />--%></td>

                        <td>
                            <asp:Label ID="LABEL_ta_occa27" runat="server" CssClass="NormalBold" Text="股票代號 "></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa27" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa15」!!" MaxLength="30">
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
                            <asp:Label ID="Label1" CssClass="NormalBold" runat="server" Text="上傳附件" /></td>
                        <td colspan="4">
                            <asp:CheckBoxList ID="CheckBoxFile" runat="server" Font-Size="X-Small">
                            </asp:CheckBoxList>
                            <asp:Label ID="Label22" runat="server" Font-Size="X-Small" ForeColor="#C00000" Text="(勾選後按下儲存即可刪除檔案)"></asp:Label>
                            <br />
                            <SmoothEnterpriseWebControl:InputFile Visible="false" ID="uploadfile" onchange="addfile(this)" runat="server" BackColor="#F0F0F0" CssClass="Normal">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputFile>
                            <asp:Label ID="Label2" runat="server" Font-Size="X-Small" ForeColor="#C00000" Text="本表資料未提供建立完整者,相關單位不得出貨(相關資料: 公司變更登記表(公司登記証照) 、財務報表、訂單 or FORECAST)."></asp:Label>
                        </td>
                    </tr>
                </table>
                <%--</div> --%>          
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 100%; background-color: #cac9de">
                <label class="NormalBold" style="font-size: small" name="slider">客戶資料一</label>
            </td>
        </tr>
        <tr>
            <td>
                <%--<div name="slider">--%>
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
                                        <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa35" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa35」!!">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="LABEL_occa23_" runat="server" CssClass="NormalBold" Text="發票地址"></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ReadOnly="true" TextMode="MultiLine" Width="770px" Wrap="true" ID="FIELD_occa231" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa23」!!" MaxLength="255">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="LABEL_occa24_" runat="server" CssClass="NormalBold" Text="送貨地址"></asp:Label></td>
                                    <td>
                                       <asp:HiddenField ID="hide_occa243" runat="server"  />
                                        <SmoothEnterpriseWebControl:InputText ReadOnly="true" TextMode="MultiLine" Width="770px" Wrap="true" ID="FIELD_occa241" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa24」!!" MaxLength="255">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa19_" runat="server" CssClass="NormalBold" Text="登記地址"></asp:Label></td>
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
                <%--</div>--%>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 100%; background-color: #cac9de">
                <label class="NormalBold" style="font-size: small" name="slider">會計/狀態</label>
            </td>
        </tr>
        <tr>
            <td>
                <%--<div name="slider">--%>
                <table>
                    <tr>

                        <td align="left" valign="top">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="LABEL_occa1301" runat="server" CssClass="NormalBold" Text="客戶月結日"></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa1301" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa38」!!" MaxLength="2">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText>

                                    </td>
                                    <td>
                                        <asp:Label ID="LABEL_occa38" runat="server" CssClass="NormalBold" Text="月結日(AR用)"></asp:Label></td>
                                    <td>
                                        <asp:TextBox ID="FIELD_occa38" runat="server" BackColor="#F0F0F0"></asp:TextBox>
                                    </td>
                                    <td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="LABEL_occa1302" runat="server" CssClass="NormalBold" Text="客戶付款日 "></asp:Label>
                                    </td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa1302" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa39」!!" MaxLength="2">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText>
                                    </td>
                                    <td>
                                        <asp:Label ID="LABEL_occa39" runat="server" CssClass="NormalBold" Text="付款日(AR用)"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="FIELD_occa39" runat="server" BackColor="#F0F0F0"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <%--</div>--%>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 100%; background-color: #cac9de">
                <label class="NormalBold" style="font-size: small" name="slider">慣用條件設定</label>
            </td>
        </tr>
        <tr>
            <td>
                <%--<div name="slider">--%>
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
                        <td><%--<asp:Label ID="LABEL_occa51" runat="server" CssClass="NormalBold" Text="慣用forwarder"></asp:Label></td><td><SmoothEnterpriseWebControl:InputText ReadOnly="true" id="FIELD_occa51" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa51」!!"   ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText>--%><asp:Label ID="LABEL_occa55" runat="server" CssClass="NormalBold" Text="慣用語言 "></asp:Label></td>
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
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_occa45_NOTE" runat="server" Width="580px" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa45」!!" MaxLength="6">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                </table>
                <%--</div>--%>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 100%; background-color: #cac9de">
                <label class="NormalBold" style="font-size: small" name="slider">財務資料</label>
            </td>
        </tr>
        <tr>
            <td>
                <%--<div name="slider">--%>
                <table border="0" class="Normal">
                    <tr>
                        <td valign="top">
                            <table style="text-align: right">
                                <tr>
                                    <td>
                                        <asp:Label ID="LABEL_occa12" runat="server" CssClass="NormalBold" Text="創業日"></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_occa12" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa12」!!">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <asp:Label ID="LABEL_occa15" runat="server" CssClass="NormalBold" Text="員工人數 "></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_occa15" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa15」!!" MaxLength="0">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa29" runat="server" CssClass="NormalBold" Text="資本額 "></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa29" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa15」!!" MaxLength="0" Style="text-align: right" tag="Money" >
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa23a" runat="server" CssClass="NormalBold" Text="最近3 年年度1"></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa23a" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa12」!!">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa23b" runat="server" CssClass="NormalBold" Text="最近3 年營業額1"></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa23b" runat="server" BackColor="#F0F0F0" CssClass="Normal" Style="text-align: right" ErrorMessage="Please Input「Occa12」!!" tag="Money" >
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa23c" runat="server" CssClass="NormalBold" Text="最近3 年稅後淨利1"></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa23c" runat="server" BackColor="#F0F0F0" CssClass="int" Style="text-align: right" ErrorMessage="Please Input「Occa12」!!" tag="Money" >
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>


                                    <%--<td><asp:Label ID="LABEL_occa14" runat="server" CssClass="NormalBold" Text="年營業額 "></asp:Label></td><td><SmoothEnterpriseWebControl:InputText ReadOnly="true" id="FIELD_occa14" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa14」!!" MaxLength="20"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>--%>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa24a" runat="server" CssClass="NormalBold" Text="最近3 年年度2"></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa24a" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa12」!!">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa24b" runat="server" CssClass="NormalBold" Text="最近3 年營業額2"></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa24b" runat="server" BackColor="#F0F0F0" CssClass="Normal" Style="text-align: right" ErrorMessage="Please Input「Occa12」!!" tag="Money" >
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa24c" runat="server" CssClass="NormalBold" Text="最近3 年稅後淨利2"></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa24c" runat="server" BackColor="#F0F0F0" CssClass="Normal" Style="text-align: right" ErrorMessage="Please Input「Occa12」!!" tag="Money" >
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>

                                    <%--<td><asp:Label ID="LABEL_occa13" runat="server" CssClass="NormalBold" Text="資本額"></asp:Label></td><td><SmoothEnterpriseWebControl:InputText ReadOnly="true" id="FIELD_occa13" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa13」!!" MaxLength="20"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>--%>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa25a" runat="server" CssClass="NormalBold" Text="最近3 年年度3 "></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa25a" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa15」!!" MaxLength="0">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa25b" runat="server" CssClass="NormalBold" Text="最近3 年營業額3 "></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa25b" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa15」!!" MaxLength="0" Style="text-align: right" tag="Money" >
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa25c" runat="server" CssClass="NormalBold" Text="最近3 年稅後淨利3 "></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa25c" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa15」!!" MaxLength="0" Style="text-align: right" tag="Money">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa26a" runat="server" CssClass="NormalBold" Text="最近年度 "></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa26a" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa15」!!" MaxLength="0">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa26b" runat="server" CssClass="NormalBold" Text="最近年度流動資產 "></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa26b" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa15」!!" MaxLength="0" Style="text-align: right" tag="Money" >
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa26c" runat="server" CssClass="NormalBold" Text="最近年度資產總額 "></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa26c" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa15」!!" MaxLength="0" Style="text-align: right" tag="Money">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>

                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa26d" runat="server" CssClass="NormalBold" Text="最近年度流動負債 "></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa26d" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa15」!!" MaxLength="0" Style="text-align: right" tag="Money">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa26e" runat="server" CssClass="NormalBold" Text="最近年度負債總額 "></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa26e" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa15」!!" MaxLength="0" Style="text-align: right" tag="Money">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa26f" runat="server" CssClass="NormalBold" Text="最近年度淨資產價值 "></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa26f" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa15」!!" MaxLength="0" Style="text-align: right" tag="Money">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>

                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa26g" runat="server" CssClass="NormalBold" Text="最近年度營業活動淨現金流量 "></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa26g" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa15」!!" MaxLength="0" Style="text-align: right" tag="Money">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>

                                    <td>
                                        <asp:Label ID="LABEL_ta_occa28" runat="server" CssClass="NormalBold" Text="財務說明備註 "></asp:Label></td>
                                    <td colspan="3">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa28" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa15」!!" MaxLength="0" Width="100%">
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
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_occa704" runat="server" Width="100%" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa45」!!">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <%--</div>--%>            
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
                <table style="font-size:9pt" > 
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_ta_occa01" runat="server" CssClass="NormalBold" Text="帳號" Width="50"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="FIELD_ta_occa01" runat="server" BackColor="#F0F0F0" ForeColor="#000000" Font-Size="9" ></asp:TextBox></td>
                        <td style="text-align: left; width: 50px">
                            <asp:Label ID="LABEL_ta_occa02" runat="server" CssClass="NormalBold" Text="SWIFT" Width="50"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="FIELD_ta_occa02" runat="server" BackColor="#F0F0F0" ForeColor="#000000" Font-Size="9" >	</asp:TextBox></td>
                    </tr>

                    <tr>
                       <td>
                            <asp:Label ID="LABEL_ta_occa03" runat="server" CssClass="NormalBold" Text="電話" Width="50"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="FIELD_ta_occa03" runat="server" BackColor="#F0F0F0" ForeColor="#000000" Font-Size="9">	</asp:TextBox></td>
                        <td style="text-align: left; width: 50px">
                            <asp:Label ID="LABEL_ta_occa04" runat="server" CssClass="NormalBold" Text="傳真" Width="50"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="FIELD_ta_occa04" runat="server" BackColor="#F0F0F0" ForeColor="#000000" Font-Size="9"  >	</asp:TextBox></td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="LABEL_ta_occa05" runat="server" CssClass="NormalBold" Text="地址" Width="50"></asp:Label></td>
                        <td colspan="3">
                            <asp:TextBox ID="FIELD_ta_occa05" runat="server" BackColor="#F0F0F0" ForeColor="#000000" Width="800" Font-Size="9" ></asp:TextBox></td>
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
                <%--<div name="slider">--%>
                <asp:HiddenField ID="hidd_ta_occa0801" runat="server" Value="" />
                <asp:HiddenField ID="hidd_ta_occa0802" runat="server" Value="" />
                <asp:HiddenField ID="hidd_ta_occa0803" runat="server" Value="" />
                <asp:HiddenField ID="hidd_ta_occa0901" runat="server" Value="" />
                <asp:HiddenField ID="hidd_ta_occa0902" runat="server" Value="" />
                <asp:HiddenField ID="hidd_ta_occa0903" runat="server" Value="" />
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_occa61" runat="server" CssClass="NormalBold" Text="信用評等"></asp:Label></td>
                        <td>
                            <asp:DropDownList Enabled="false" ID="FIELD_occa61_s" runat="server" BackColor="#F0F0F0" CssClass="Normal" /></td>
                        <td>
                            <asp:Label ID="LABEL_ta_occa10" runat="server" CssClass="NormalBold" Text="銷售產品"></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa10" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Ta_occa10」!!" MaxLength="255">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>
                        <td>
                            <asp:Label ID="LABEL_ta_occa0801" runat="server" CssClass="NormalBold" Text="主要供應商1"></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa0801" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Ta_occa0801」!!">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText>


                        </td>
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
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" Style="text-align: right" ID="FIELD_occa63" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa63」!!" MaxLength="0" tag="Money">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>
                        <td style="text-align: right">

                            <asp:Label ID="LABEL_occa631" runat="server" CssClass="NormalBold" Text="幣別"></asp:Label></td>
                        <td>

                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" Style="text-align: left" ID="FIELD_occa631" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Occa631」!!" MaxLength="0">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText>

                        </td>
                        <td>
                            <asp:Label ID="LABEL_ta_occa11" runat="server" CssClass="NormalBold" Text="訂單方式"></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa11" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Ta_occa0802」!!">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText>
                            <asp:HiddenField ID="hidden_ta_occa11" Value="" runat="server" />
                            <%--<asp:DropDownList id="FIELD_ta_occa11" Enabled="false" runat="server" />--%></td>
                        <td>
                            <asp:Label ID="LABEL_ta_occa0802" runat="server" CssClass="NormalBold" Text="主要供應商2"></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa0802" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Ta_occa0802」!!">
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
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa0803" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Ta_occa0803」!!">
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
                            <SmoothEnterpriseWebControl:InputText TextMode="MultiLine" Width="100%" Wrap="false" ID="FIELD_ta_occa1201" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Ta_occa0902」!!" MaxLength="6">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_ta_occa1202" runat="server" CssClass="NormalBold" Text="說明2"></asp:Label></td>
                        <td colspan="7">
                            <SmoothEnterpriseWebControl:InputText TextMode="MultiLine" Width="100%" Wrap="false" ID="FIELD_ta_occa1202" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Ta_occa0902」!!" MaxLength="6">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_ta_occa1203" runat="server" CssClass="NormalBold" Text="說明3"></asp:Label></td>
                        <td colspan="7">
                            <SmoothEnterpriseWebControl:InputText TextMode="MultiLine" Width="100%" Wrap="false" ID="FIELD_ta_occa1203" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input「Ta_occa0902」!!" MaxLength="6">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                </table>
        
            </td>
        </tr>
    </table>
    ---
       <div style="display:none" >
                     隱藏欄位，因為必需比對後回傳，所以隱藏起來<br />
                     額度客戶 <asp:TextBox ID="FIELD_occa33" runat="server" BackColor="#F0F0F0" ForeColor="#000000" Font-Size="9" >	</asp:TextBox>
                     信用評等 <asp:TextBox ID="FIELD_occa61" runat="server" BackColor="#F0F0F0" ForeColor="#000000" Font-Size="9" >	</asp:TextBox>
                </div>
    <table border="0" class="Normal">
        <tr>
            <td>
                <SmoothEnterpriseWebControlFlowwork:FlowFeedback ID="FlowFeedback1" runat="server"
                    BackColor="#F0F0F0" BorderColor="#E0E0E0" BorderStyle="Solid" BorderWidth="1px"
                    CssClass="Normal" Font-Size="12px" OnFeedbackComplete="FlowFeedback1_FeedbackComplete" OnFlowStop="FlowFeedback1_FlowStop" OnFlowNodeComplete="FlowFeedback1_FlowNodeComplete" RedirectAfterCommit="False">
                    <Results>
                        <SmoothEnterpriseWebControlFlowwork:FlowResult ID="flowResult1" Text="允許" ResultType="Next"
                            runat="server"></SmoothEnterpriseWebControlFlowwork:FlowResult>
                        <SmoothEnterpriseWebControlFlowwork:FlowResult ID="flowResult2" Text="退回上一關審核人" ResultType="Back"
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
    <table border="0" class="Normal">
        <tr>
            <td>
                <%--			    <asp:Button ID="BUTTON_save" runat="server" Visible="false" Text="儲存" Width="80px"
			    BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold"
			    Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_save_Click">
			    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
			    </asp:Button>--%>
                <SmoothEnterpriseWebControl:InputButton Visible="false" ID="BUTTON_save" runat="server" Text="儲存" Width="80px"
                    BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" OnClientClick="return check() "
                    Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_save_Click">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Text="回上頁" Width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_back_Click">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
                <asp:Button ID="Button1" runat="server" Text="ToERP" OnClick="SENDTXT_Click" Visible="false" />

                <asp:Button ID="Btn_XML" runat="server" Text="Out XML not mail" OnClick="Btn_XML_Click" Visible="false" ForeColor="Red" />

            </td>
        </tr>
    </table>

</asp:Content>
