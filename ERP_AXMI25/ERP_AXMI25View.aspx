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
                alert("�з~��-���o�j�󤵤�");
                isPass = false;
            }


            var occa01 = $("#ctl00_ContentPlaceHolder1_FIELD_occa01").val();
            var occa61= $("#ctl00_ContentPlaceHolder1_FIELD_occa61_s").val();
            if (occa01 != "" && occa61=="") {

                alert("�ж�g-�H�ε���");
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
                if (i <= 0 || i > 9999) { /*�~*/
                    infoValidation = false;
                }
                i = parseFloat(strDataValue[2]);
                if (i <= 0 || i > 12) { /*��*/
                    infoValidation = false;
                }
                i = parseFloat(strDataValue[3]);
                if (i <= 0 || i > 31) { /*��*/
                    infoValidation = false;
                }
            } else {
                infoValidation = false;
            }
            if (!infoValidation) {
                alert("�з~��-�п�J YYYY/MM/DD ����榡");
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
                <label class="NormalBold" style="font-size: small">�򥻸��</label>
            </td>
        </tr>
        <tr>
            <td>
                <%--<div name="slider">--%>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_argv2" runat="server" CssClass="NormalBold" Text="�O�_������"></asp:Label>

                        </td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_argv2" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOccano�v!!" MaxLength="40" Required="True">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText>
                            <%--<asp:DropDownList ID="FIELD_argv2" Enabled="false" runat="server" CssClass="NormalBold" />--%>
                                
                        </td>
                        <td style="text-align: right">
                            <asp:Label ID="LABEL_occa00" runat="server" CssClass="NormalBold" Text="�ӽ����O" Width="110px"></asp:Label>
                        </td>
                        <td>
                            <asp:HiddenField ID="hide_occa00" runat="server" Value="" />
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa00" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOccano�v!!" MaxLength="40" Required="True">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText>
                            <%--<asp:DropDownList ID="FIELD_occa00" Enabled="false" runat="server" CssClass="NormalBold" /--%>                            
                        </td>
                        <td>
                            <asp:Label ID="LABEL_occano" runat="server" CssClass="NormalBold" Text="�ӽг渹 "></asp:Label>
                            <%--<asp:Label ID="LABEL_occa1004" runat="server" CssClass="NormalBold" Text="���A�X"></asp:Label>--%>
                        </td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occano" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOccano�v!!" MaxLength="40" Required="True">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText>
                            <%--<asp:DropDownList ID="FIELD_occa1004" Enabled="false" runat="server" CssClass="NormalBold" />  --%>                              
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_occanote" runat="server" CssClass="NormalBold" Text="���ʭ�]"></asp:Label>
                        </td>
                        <td colspan="3">
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" Width="100%" ID="FIELD_occanote" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOccanote�v!!" MaxLength="255">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText>
                        </td>
                        <td>
                            <asp:Label ID="LABEL_occa06" runat="server" CssClass="NormalBold" Text="�ʽ� "></asp:Label>
                        </td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa06" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca06�v!!" MaxLength="1">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_occa01" runat="server" CssClass="NormalBold" Text="�Ȥ�s��"></asp:Label>
                        </td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa01" runat="server" BackColor="#F0F0F0" Width="60px" CssClass="Normal" ErrorMessage="Please Input�uOcca01�v!!" Required="false">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText>
                            <img id="queryform1" runat="server" visible="False" src="../gif/icon-zoom.gif" onclick="Open()" />
                        </td>
                        <td>
                            <asp:Label ID="LABEL_occaud15" runat="server" CssClass="NormalBold" Text="�ӽФ��"></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occaud15" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOccaud15�v!!">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>

                        <td>
                            <asp:Label ID="LABEL_occagrup" runat="server" CssClass="NormalBold" Text="��ƩҦ�����"></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occagrup" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOccagrup�v!!" MaxLength="6">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_occa02" CssClass="NormalBold" runat="server" Text="�Ȥ�²��"></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa02" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca02�v!!" MaxLength="40">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>
                        <td>
                            <asp:Label ID="LABEL_ta_occa14" runat="server" CssClass="NormalBold" Text="��Ȥ��Ʀ��ħ_"></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa14" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uTa_occa14�v!!" MaxLength="1">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>
                        <td>
                            <asp:Label ID="LABEL_occauser" runat="server" CssClass="NormalBold" Text="��ƩҦ���"></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occauser" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOccauser�v!!">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>

                    </tr>
                    <tr>
                        <td rowspan="2">
                            <asp:Label ID="LABEL_occa18" runat="server" CssClass="NormalBold" Text="���q���W "></asp:Label></td>
                        <td colspan="3" rowspan="2">
                            <SmoothEnterpriseWebControl:InputText Width="100%" Wrap="true" ReadOnly="true" runat="server" TextMode="MultiLine" ID="FIELD_occa18" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca07�v!!">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText><%--<asp:TextBox ID="FIELD_occa18" Width="100%" Wrap="true" ReadOnly="true" runat="server" TextMode="MultiLine" />--%></td>
                        <td>
                            <asp:Label ID="LABEL_occa09" runat="server" CssClass="NormalBold" Text="�e�f�Ȥ�s��"></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa09" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca09�v!!">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_occa07" runat="server" CssClass="NormalBold" Text="���ګȤ�s��"></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa07" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca07�v!!">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_occa11" runat="server" CssClass="NormalBold" Text="�Τ@�s��"></asp:Label>
                        </td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa11" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca11�v!!" MaxLength="20">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText>
                        </td>
                        <td colspan="2">
                            <asp:CheckBox ID="FIELD_occa37" Enabled="false" CssClass="NormalBold" Text="�O�_�����Y�H" TextAlign="Right" runat="Server" />
                        </td>
                        <td>
                            <asp:Label ID="LABEL_occa04" runat="server" CssClass="NormalBold" Text="�t�d�~�ȭ��s��"></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa04" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca11�v!!" MaxLength="20">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText><%--<asp:TextBox ID="FIELD_occa04" ReadOnly="true" runat="server" />--%></td>

                    </tr>
                    <tr>
                        <td>
                            <%--<asp:Label ID="LABEL_ta00cc08" Text="GST ID" runat="server"></asp:Label>--%>
                        </td>
                        <td>
                            <%--<SmoothEnterpriseWebControl:InputText ReadOnly="true" id="FIELD_ta00cc08" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca11�v!!" MaxLength="20"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText>--%>
                        </td>
                        <td colspan="2">
                            <asp:CheckBox ID="FIELD_ta_occa06" Enabled="false" runat="server" CssClass="NormalBold" Text="���Y�H�^��_" />
                        </td>
                        <td>
                            <asp:Label ID="LABEL_occa03" runat="server" CssClass="NormalBold" Text="�Ȥ����"></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa03" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca07�v!!">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText><%--<asp:TextBox ID="FIELD_occa03" ReadOnly="true" runat="server" />--%></td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_occa28" runat="server" CssClass="NormalBold" Text="���q�t�d�H"></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa28" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca28�v!!" MaxLength="30">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>

                        <td colspan="2">
                            <asp:CheckBox ID="FIELD_ta_occa07" Enabled="false" CssClass="NormalBold" runat="server" Text="�D���Y�H�^��" /></td>
                        <td>
                            <asp:Label ID="LABEL_ta_occa21" runat="server" CssClass="NormalBold" Text="���O����"></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa21" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca28�v!!" MaxLength="30">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>

                        <td>
                            <asp:Label ID="LABEL_ta_occa15" runat="server" CssClass="NormalBold" Text="�ӷ��t��  "></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa15" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uTa_occa15�v!!">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>
                        <td colspan="2"><%--<asp:CheckBox ID="FIELD_occa56" Enabled="false" CssClass="NormalBold" Text="���X�f�q���_" TextAlign="Right" runat="Server" />--%></td>

                        <td>
                            <asp:Label ID="LABEL_ta_occa27" runat="server" CssClass="NormalBold" Text="�Ѳ��N�� "></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa27" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca15�v!!" MaxLength="30">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td colspan="4"></td>
                        <td>
                            <asp:Label ID="LABEL_ta_occa20" runat="server" CssClass="NormalBold" Text="���~���O"></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa20" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca28�v!!" MaxLength="30">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" CssClass="NormalBold" runat="server" Text="�W�Ǫ���" /></td>
                        <td colspan="4">
                            <asp:CheckBoxList ID="CheckBoxFile" runat="server" Font-Size="X-Small">
                            </asp:CheckBoxList>
                            <asp:Label ID="Label22" runat="server" Font-Size="X-Small" ForeColor="#C00000" Text="(�Ŀ����U�x�s�Y�i�R���ɮ�)"></asp:Label>
                            <br />
                            <SmoothEnterpriseWebControl:InputFile Visible="false" ID="uploadfile" onchange="addfile(this)" runat="server" BackColor="#F0F0F0" CssClass="Normal">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputFile>
                            <asp:Label ID="Label2" runat="server" Font-Size="X-Small" ForeColor="#C00000" Text="�����ƥ����ѫإߧ����,������줣�o�X�f(�������: ���q�ܧ�n�O��(���q�n�O����) �B�]�ȳ���B�q�� or FORECAST)."></asp:Label>
                        </td>
                    </tr>
                </table>
                <%--</div> --%>          
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 100%; background-color: #cac9de">
                <label class="NormalBold" style="font-size: small" name="slider">�Ȥ��Ƥ@</label>
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
                                        <asp:Label ID="LABEL_occa21" runat="server" CssClass="NormalBold" Text="��O�s��"></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa21" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca21�v!!" MaxLength="4">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="LABEL_occa20" runat="server" CssClass="NormalBold" Text="�ϰ�s��"></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa20" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca20�v!!" MaxLength="4">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="LABEL_occa35" runat="server" CssClass="NormalBold" Text="�l���ϸ�"></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa35" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca35�v!!">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="LABEL_occa23_" runat="server" CssClass="NormalBold" Text="�o���a�}"></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ReadOnly="true" TextMode="MultiLine" Width="770px" Wrap="true" ID="FIELD_occa231" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca23�v!!" MaxLength="255">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="LABEL_occa24_" runat="server" CssClass="NormalBold" Text="�e�f�a�}"></asp:Label></td>
                                    <td>
                                       <asp:HiddenField ID="hide_occa243" runat="server"  />
                                        <SmoothEnterpriseWebControl:InputText ReadOnly="true" TextMode="MultiLine" Width="770px" Wrap="true" ID="FIELD_occa241" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca24�v!!" MaxLength="255">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa19_" runat="server" CssClass="NormalBold" Text="�n�O�a�}"></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ReadOnly="true" TextMode="MultiLine" Width="770px" Wrap="true" ID="FIELD_ta_occa191" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uTa_occa19�v!!" MaxLength="255">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <%--<tr><td><asp:Label ID="LABEL_occa29" runat="server" CssClass="NormalBold" Text="�~���p���H "></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText ReadOnly="true" id="FIELD_occa29" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca29�v!!" MaxLength="150"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td><td><asp:Label ID="LABEL_occa292" runat="server" CssClass="NormalBold" Text="�~���p���H�������X"></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText ReadOnly="true" id="FIELD_occa292" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca292�v!!" MaxLength="15"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td></tr>--%>
                                <%--<tr><td><asp:Label ID="LABEL_occa30" runat="server" CssClass="NormalBold" Text="�]���p���H"></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText ReadOnly="true" id="FIELD_occa30" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca30�v!!" MaxLength="150"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td><td><asp:Label ID="LABEL_occa302" runat="server" CssClass="NormalBold" Text="�]���p���H�������X"></asp:Label></td></tr><tr><td><SmoothEnterpriseWebControl:InputText ReadOnly="true" id="FIELD_occa302" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca302�v!!" MaxLength="15"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td></tr>--%>
                            </table>
                        </td>
                    </tr>
                </table>
                <%--</div>--%>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 100%; background-color: #cac9de">
                <label class="NormalBold" style="font-size: small" name="slider">�|�p/���A</label>
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
                                        <asp:Label ID="LABEL_occa1301" runat="server" CssClass="NormalBold" Text="�Ȥ�뵲��"></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa1301" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca38�v!!" MaxLength="2">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText>

                                    </td>
                                    <td>
                                        <asp:Label ID="LABEL_occa38" runat="server" CssClass="NormalBold" Text="�뵲��(AR��)"></asp:Label></td>
                                    <td>
                                        <asp:TextBox ID="FIELD_occa38" runat="server" BackColor="#F0F0F0"></asp:TextBox>
                                    </td>
                                    <td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="LABEL_occa1302" runat="server" CssClass="NormalBold" Text="�Ȥ�I�ڤ� "></asp:Label>
                                    </td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa1302" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca39�v!!" MaxLength="2">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText>
                                    </td>
                                    <td>
                                        <asp:Label ID="LABEL_occa39" runat="server" CssClass="NormalBold" Text="�I�ڤ�(AR��)"></asp:Label>
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
                <label class="NormalBold" style="font-size: small" name="slider">�D�α���]�w</label>
            </td>
        </tr>
        <tr>
            <td>
                <%--<div name="slider">--%>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_occa42" runat="server" CssClass="NormalBold" Text="�D�ι��O "></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa42" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca42�v!!" MaxLength="4">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>
                        <td>
                            <asp:Label ID="LABEL_occa43" runat="server" CssClass="NormalBold" Text="�D�ξP�����"></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa43" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca43�v!!" MaxLength="4">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>
                        <td><%--<asp:Label ID="LABEL_occa51" runat="server" CssClass="NormalBold" Text="�D��forwarder"></asp:Label></td><td><SmoothEnterpriseWebControl:InputText ReadOnly="true" id="FIELD_occa51" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca51�v!!"   ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText>--%><asp:Label ID="LABEL_occa55" runat="server" CssClass="NormalBold" Text="�D�λy�� "></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa55" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca55�v!!" MaxLength="1">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_occa41" runat="server" CssClass="NormalBold" Text="�D�ε|�O"></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa41" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca41�v!!" MaxLength="4">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>
                        <td>
                            <asp:Label ID="LABEL_occa44" runat="server" CssClass="NormalBold" Text="�D�λ������"></asp:Label></td>
                        <td colspan="3">
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa44" runat="server" Width="300px" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca44�v!!" MaxLength="6">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_occa08" runat="server" CssClass="NormalBold" Text="�D�εo���O"></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa08" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca08�v!!" MaxLength="1">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>
                        <td>
                            <asp:Label ID="LABEL_occa45" runat="server" CssClass="NormalBold" Text="�D�Φ��ڱ���"></asp:Label></td>
                        <td colspan="3">
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa45" runat="server" Width="300px" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca45�v!!" MaxLength="6">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_occa45_NOTE" runat="Server" CssClass="NormalBold" Text="�D�Φ��ڱ��󻡩�"></asp:Label></td>
                        <td colspan="5">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_occa45_NOTE" runat="server" Width="580px" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca45�v!!" MaxLength="6">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                </table>
                <%--</div>--%>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 100%; background-color: #cac9de">
                <label class="NormalBold" style="font-size: small" name="slider">�]�ȸ��</label>
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
                                        <asp:Label ID="LABEL_occa12" runat="server" CssClass="NormalBold" Text="�з~��"></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_occa12" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca12�v!!">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <asp:Label ID="LABEL_occa15" runat="server" CssClass="NormalBold" Text="���u�H�� "></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_occa15" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca15�v!!" MaxLength="0">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa29" runat="server" CssClass="NormalBold" Text="�ꥻ�B "></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa29" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca15�v!!" MaxLength="0" Style="text-align: right" tag="Money" >
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa23a" runat="server" CssClass="NormalBold" Text="�̪�3 �~�~��1"></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa23a" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca12�v!!">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa23b" runat="server" CssClass="NormalBold" Text="�̪�3 �~��~�B1"></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa23b" runat="server" BackColor="#F0F0F0" CssClass="Normal" Style="text-align: right" ErrorMessage="Please Input�uOcca12�v!!" tag="Money" >
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa23c" runat="server" CssClass="NormalBold" Text="�̪�3 �~�|��b�Q1"></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa23c" runat="server" BackColor="#F0F0F0" CssClass="int" Style="text-align: right" ErrorMessage="Please Input�uOcca12�v!!" tag="Money" >
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>


                                    <%--<td><asp:Label ID="LABEL_occa14" runat="server" CssClass="NormalBold" Text="�~��~�B "></asp:Label></td><td><SmoothEnterpriseWebControl:InputText ReadOnly="true" id="FIELD_occa14" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca14�v!!" MaxLength="20"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>--%>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa24a" runat="server" CssClass="NormalBold" Text="�̪�3 �~�~��2"></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa24a" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca12�v!!">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa24b" runat="server" CssClass="NormalBold" Text="�̪�3 �~��~�B2"></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa24b" runat="server" BackColor="#F0F0F0" CssClass="Normal" Style="text-align: right" ErrorMessage="Please Input�uOcca12�v!!" tag="Money" >
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa24c" runat="server" CssClass="NormalBold" Text="�̪�3 �~�|��b�Q2"></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa24c" runat="server" BackColor="#F0F0F0" CssClass="Normal" Style="text-align: right" ErrorMessage="Please Input�uOcca12�v!!" tag="Money" >
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>

                                    <%--<td><asp:Label ID="LABEL_occa13" runat="server" CssClass="NormalBold" Text="�ꥻ�B"></asp:Label></td><td><SmoothEnterpriseWebControl:InputText ReadOnly="true" id="FIELD_occa13" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca13�v!!" MaxLength="20"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputText></td>--%>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa25a" runat="server" CssClass="NormalBold" Text="�̪�3 �~�~��3 "></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa25a" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca15�v!!" MaxLength="0">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa25b" runat="server" CssClass="NormalBold" Text="�̪�3 �~��~�B3 "></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa25b" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca15�v!!" MaxLength="0" Style="text-align: right" tag="Money" >
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa25c" runat="server" CssClass="NormalBold" Text="�̪�3 �~�|��b�Q3 "></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa25c" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca15�v!!" MaxLength="0" Style="text-align: right" tag="Money">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa26a" runat="server" CssClass="NormalBold" Text="�̪�~�� "></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa26a" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca15�v!!" MaxLength="0">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa26b" runat="server" CssClass="NormalBold" Text="�̪�~�׬y�ʸ겣 "></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa26b" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca15�v!!" MaxLength="0" Style="text-align: right" tag="Money" >
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa26c" runat="server" CssClass="NormalBold" Text="�̪�~�׸겣�`�B "></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa26c" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca15�v!!" MaxLength="0" Style="text-align: right" tag="Money">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>

                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa26d" runat="server" CssClass="NormalBold" Text="�̪�~�׬y�ʭt�� "></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa26d" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca15�v!!" MaxLength="0" Style="text-align: right" tag="Money">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa26e" runat="server" CssClass="NormalBold" Text="�̪�~�׭t���`�B "></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa26e" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca15�v!!" MaxLength="0" Style="text-align: right" tag="Money">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa26f" runat="server" CssClass="NormalBold" Text="�̪�~�ײb�겣���� "></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa26f" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca15�v!!" MaxLength="0" Style="text-align: right" tag="Money">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>

                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="LABEL_ta_occa26g" runat="server" CssClass="NormalBold" Text="�̪�~����~���ʲb�{���y�q "></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa26g" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca15�v!!" MaxLength="0" Style="text-align: right" tag="Money">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>

                                    <td>
                                        <asp:Label ID="LABEL_ta_occa28" runat="server" CssClass="NormalBold" Text="�]�Ȼ����Ƶ� "></asp:Label></td>
                                    <td colspan="3">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_occa28" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca15�v!!" MaxLength="0" Width="100%">
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>

                                </tr>
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="FIELD_ta_occa22" Enabled="False" CssClass="NormalBold" Text="NDA�_" runat="Server" /></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="LABEL_occa704" runat="server" CssClass="NormalBold" Text="NDA���� "></asp:Label></td>
                                    <td colspan="5">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_occa704" runat="server" Width="100%" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca45�v!!">
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
                <label class="NormalBold" style="font-size: small" name="slider">�Ȧ���</label>
            </td>
        </tr>
        <tr>
            <td>
                <table style="font-size:9pt" > 
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_ta_occa01" runat="server" CssClass="NormalBold" Text="�b��" Width="50"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="FIELD_ta_occa01" runat="server" BackColor="#F0F0F0" ForeColor="#000000" Font-Size="9" ></asp:TextBox></td>
                        <td style="text-align: left; width: 50px">
                            <asp:Label ID="LABEL_ta_occa02" runat="server" CssClass="NormalBold" Text="SWIFT" Width="50"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="FIELD_ta_occa02" runat="server" BackColor="#F0F0F0" ForeColor="#000000" Font-Size="9" >	</asp:TextBox></td>
                    </tr>

                    <tr>
                       <td>
                            <asp:Label ID="LABEL_ta_occa03" runat="server" CssClass="NormalBold" Text="�q��" Width="50"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="FIELD_ta_occa03" runat="server" BackColor="#F0F0F0" ForeColor="#000000" Font-Size="9">	</asp:TextBox></td>
                        <td style="text-align: left; width: 50px">
                            <asp:Label ID="LABEL_ta_occa04" runat="server" CssClass="NormalBold" Text="�ǯu" Width="50"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="FIELD_ta_occa04" runat="server" BackColor="#F0F0F0" ForeColor="#000000" Font-Size="9"  >	</asp:TextBox></td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="LABEL_ta_occa05" runat="server" CssClass="NormalBold" Text="�a�}" Width="50"></asp:Label></td>
                        <td colspan="3">
                            <asp:TextBox ID="FIELD_ta_occa05" runat="server" BackColor="#F0F0F0" ForeColor="#000000" Width="800" Font-Size="9" ></asp:TextBox></td>
                    </tr> 
                </table>
            </td>

        </tr>
        <!--V1.0.1-->
        <tr>
            <td align="center" style="width: 100%; background-color: #cac9de">
                <label class="NormalBold" style="font-size: small" name="slider">�H�άd��</label>
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
                            <asp:Label ID="LABEL_occa61" runat="server" CssClass="NormalBold" Text="�H�ε���"></asp:Label></td>
                        <td>
                            <asp:DropDownList Enabled="false" ID="FIELD_occa61_s" runat="server" BackColor="#F0F0F0" CssClass="Normal" /></td>
                        <td>
                            <asp:Label ID="LABEL_ta_occa10" runat="server" CssClass="NormalBold" Text="�P�ⲣ�~"></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa10" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uTa_occa10�v!!" MaxLength="255">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>
                        <td>
                            <asp:Label ID="LABEL_ta_occa0801" runat="server" CssClass="NormalBold" Text="�D�n������1"></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa0801" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uTa_occa0801�v!!">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText>


                        </td>
                        <td>
                            <asp:Label ID="LABEL_ta_occa0901" runat="server" CssClass="NormalBold" Text="�I�ڱ���1"></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa0901" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uTa_occa0901�v!!" MaxLength="6">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_occa63" runat="server" CssClass="NormalBold" Text="�H���B��"></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" Style="text-align: right" ID="FIELD_occa63" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca63�v!!" MaxLength="0" tag="Money">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>
                        <td style="text-align: right">

                            <asp:Label ID="LABEL_occa631" runat="server" CssClass="NormalBold" Text="���O"></asp:Label></td>
                        <td>

                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" Style="text-align: left" ID="FIELD_occa631" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca631�v!!" MaxLength="0">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText>

                        </td>
                        <td>
                            <asp:Label ID="LABEL_ta_occa11" runat="server" CssClass="NormalBold" Text="�q��覡"></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa11" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uTa_occa0802�v!!">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText>
                            <asp:HiddenField ID="hidden_ta_occa11" Value="" runat="server" />
                            <%--<asp:DropDownList id="FIELD_ta_occa11" Enabled="false" runat="server" />--%></td>
                        <td>
                            <asp:Label ID="LABEL_ta_occa0802" runat="server" CssClass="NormalBold" Text="�D�n������2"></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa0802" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uTa_occa0802�v!!">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>
                        <td>
                            <asp:Label ID="LABEL_ta_occa0902" runat="server" CssClass="NormalBold" Text="�I�ڱ���2"></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa0902" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uTa_occa0902�v!!" MaxLength="6">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_occa36" runat="server" CssClass="NormalBold" Text="�e���Ѽ�"></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_occa36" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uOcca36�v!!" MaxLength="0" FormatType="Number">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>
                        <td></td>
                        <td></td>
                        <td>
                            <asp:Label ID="LABEL_ta_occa0803" runat="server" CssClass="NormalBold" Text="�D�n������3 "></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa0803" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uTa_occa0803�v!!">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>
                        <td>
                            <asp:Label ID="LABEL_ta_occa0903" runat="server" CssClass="NormalBold" Text="�I�ڱ���3"></asp:Label></td>
                        <td>
                            <SmoothEnterpriseWebControl:InputText ReadOnly="true" ID="FIELD_ta_occa0903" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uTa_occa0903�v!!" MaxLength="6">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText></td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_ta_occa1201" runat="server" CssClass="NormalBold" Text="����1"></asp:Label></td>
                        <td colspan="7">
                            <SmoothEnterpriseWebControl:InputText TextMode="MultiLine" Width="100%" Wrap="false" ID="FIELD_ta_occa1201" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uTa_occa0902�v!!" MaxLength="6">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_ta_occa1202" runat="server" CssClass="NormalBold" Text="����2"></asp:Label></td>
                        <td colspan="7">
                            <SmoothEnterpriseWebControl:InputText TextMode="MultiLine" Width="100%" Wrap="false" ID="FIELD_ta_occa1202" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uTa_occa0902�v!!" MaxLength="6">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LABEL_ta_occa1203" runat="server" CssClass="NormalBold" Text="����3"></asp:Label></td>
                        <td colspan="7">
                            <SmoothEnterpriseWebControl:InputText TextMode="MultiLine" Width="100%" Wrap="false" ID="FIELD_ta_occa1203" runat="server" BackColor="#F0F0F0" CssClass="Normal" ErrorMessage="Please Input�uTa_occa0902�v!!" MaxLength="6">
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
                     �������A�]�����ݤ���^�ǡA�ҥH���ð_��<br />
                     �B�׫Ȥ� <asp:TextBox ID="FIELD_occa33" runat="server" BackColor="#F0F0F0" ForeColor="#000000" Font-Size="9" >	</asp:TextBox>
                     �H�ε��� <asp:TextBox ID="FIELD_occa61" runat="server" BackColor="#F0F0F0" ForeColor="#000000" Font-Size="9" >	</asp:TextBox>
                </div>
    <table border="0" class="Normal">
        <tr>
            <td>
                <SmoothEnterpriseWebControlFlowwork:FlowFeedback ID="FlowFeedback1" runat="server"
                    BackColor="#F0F0F0" BorderColor="#E0E0E0" BorderStyle="Solid" BorderWidth="1px"
                    CssClass="Normal" Font-Size="12px" OnFeedbackComplete="FlowFeedback1_FeedbackComplete" OnFlowStop="FlowFeedback1_FlowStop" OnFlowNodeComplete="FlowFeedback1_FlowNodeComplete" RedirectAfterCommit="False">
                    <Results>
                        <SmoothEnterpriseWebControlFlowwork:FlowResult ID="flowResult1" Text="���\" ResultType="Next"
                            runat="server"></SmoothEnterpriseWebControlFlowwork:FlowResult>
                        <SmoothEnterpriseWebControlFlowwork:FlowResult ID="flowResult2" Text="�h�^�W�@���f�֤H" ResultType="Back"
                            runat="server"></SmoothEnterpriseWebControlFlowwork:FlowResult>
                        <SmoothEnterpriseWebControlFlowwork:FlowResult ID="FlowResult3" runat="server" ResultType="Terminate"
                            Text="�h�^���פH" />
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
                        <asp:Button ID="BUTTON_FlowFeedback" runat="server" CssClass="NormalBold" Text="�e�X"
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
                <%--			    <asp:Button ID="BUTTON_save" runat="server" Visible="false" Text="�x�s" Width="80px"
			    BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold"
			    Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_save_Click">
			    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
			    </asp:Button>--%>
                <SmoothEnterpriseWebControl:InputButton Visible="false" ID="BUTTON_save" runat="server" Text="�x�s" Width="80px"
                    BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" OnClientClick="return check() "
                    Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_save_Click">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Text="�^�W��" Width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_back_Click">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
                <asp:Button ID="Button1" runat="server" Text="ToERP" OnClick="SENDTXT_Click" Visible="false" />

                <asp:Button ID="Btn_XML" runat="server" Text="Out XML not mail" OnClick="Btn_XML_Click" Visible="false" ForeColor="Red" />

            </td>
        </tr>
    </table>

</asp:Content>
