<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="ShipmentView.aspx.cs" Inherits="Shipment.ShipmentView" StylesheetTheme="Default" Culture="Auto" UICulture="Auto" ValidateRequest="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlFlowwork" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <header>
        <style type="text/css">
            /*CSS隱形GRIDVIEW欄位*/
            .hiddencol {
                display: none;
            }

            .viscol {
                display: block;
            }
            /*CalendarExtender被DropList遮蓋的*/
            .ajax__calendar {
                position: relative;
                left: 0px !important;
                top: 0px !important;
                visibility: visible;
                display: block;
            }

                .ajax__calendar iframe {
                    left: 0px !important;
                    top: 0px !important;
                }
        </style>

        <script type="text/javascript" src="/PManagement/js/jquery.min.js"></script>
        <script src="jquery.autocomplete.js" type="text/javascript"></script>
        <link href="jquery.autocomplete.css" rel="stylesheet" />
        <script language="javascript" type="text/javascript" src="<%=ResolveClientUrl("~/sub.js")%>"></script>



        <script language="javascript" type="text/javascript">

            //附檔檔案
            var allowed_attachments = 5 - 1;
            var count_attachments = 0 + 1;
            function addfile() {

                if (allowed_attachments <= 0) {
                    return false;
                }
                else {
                    count_attachments = count_attachments + 1;
                    var attid = "InputFile" + count_attachments;
                    var str = '<SmoothEnterpriseWebControl:InputFile runat="server" id="IFid"  onchange="addfile()" BackColor="#F0F0F0" CssClass="Normal"> <Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputFile><br />';

                    str = str.replace("IFid", attid);

                    document.getElementById('uploadfiles').insertAdjacentHTML("beforeEnd", str)
                    allowed_attachments = allowed_attachments - 1;
                    return false;
                }
            }


            function j1() {

                if ($('#ctl00_ContentPlaceHolder1_FIELD_Labno').val() == "") {
                    alert("請輸入Lab NO");
                    return false;
                }

                if ($('#ctl00_ContentPlaceHolder1_FIELD_EngineeringTestNo').val() == "") {
                    alert("請輸入Engineering Test No");
                    return false;
                }

                if (($('#ctl00_ContentPlaceHolder1_FIELD_Shipment_type').val() == 'ec2fde0a-f9d9-49d6-a010-bb721e032553') &&
                    ($('#ctl00_ContentPlaceHolder1_FIELD_Explanation').val() == "")) {
                    alert("當Shipment_type選取“Other”時，請輸入Explanation")
                    return false;
                }

                if ($('#FIELD_DWG').val() == "") {
                    alert("請輸入DWG");
                    return false;
                }
                if ($('#FIELD_Component').val() == "") {
                    alert('請輸入Component')
                    return false;
                }
                if (document.getElementById("ctl00_ContentPlaceHolder1_FIELD_Qty").value.length == 0) {
                    alert('請輸入Qty')
                    return false;
                }
                if (document.getElementById("ctl00_ContentPlaceHolder1_FIELD_C_demand").value.length == 0) {
                    alert('請輸入MA commitment  date(ETD)')
                    return false;
                }
                if (document.getElementById("ctl00_ContentPlaceHolder1_FIELD_C_demand2").value.length == 0) {
                    alert('請輸入MA commitment date revise (ETD)s')
                    return false;
                }
                if (document.getElementById("ctl00_ContentPlaceHolder1_FIELD_purpose2").value.length == 0) {
                    alert('請輸入Purpose')
                    return false;

                }
                if (document.getElementById("ctl00_ContentPlaceHolder1_FIELD_shipment_type").value.length == 0) {
                    alert('請輸入Shipment Type')
                    return false;

                }

                var ele = document.getElementById("ctl00_ContentPlaceHolder1_CheckBoxList2").getElementsByTagName("input");
                var checkpaper = "0"; //0代表未選擇 1代表己選擇

                for (var i = 0; i < ele.length; i++) //先把checkboxlist2做清除
                {

                    if (ele[i].checked == true) {
                        checkpaper = "1";
                    }


                }
                if (checkpaper != "1") {
                    alert('請輸入Shipment Paper')
                    return false;

                }

                var checkpacking = document.getElementById("ctl00_ContentPlaceHolder1_FIELD_packing").value;
                var reg = /[0-9]/;
                if (!reg.test(checkpacking)) {
                    alert("Packing Data需輸入數字");
                    return false;
                }

                Date.prototype.format = function (format) //js日期轉換
                {
                    var o = {
                        "M+": this.getMonth() + 1, //month 
                        "d+": this.getDate(),    //day 
                        "h+": this.getHours(),   //hour 
                        "m+": this.getMinutes(), //minute 
                        "s+": this.getSeconds(), //second 
                        "q+": Math.floor((this.getMonth() + 3) / 3),  //quarter 
                        "S": this.getMilliseconds() //millisecond 
                    }
                    if (/(y+)/.test(format)) format = format.replace(RegExp.$1,
                        (this.getFullYear() + "").substr(4 - RegExp.$1.length));
                    for (var k in o) if (new RegExp("(" + k + ")").test(format))
                        format = format.replace(RegExp.$1,
                            RegExp.$1.length == 1 ? o[k] :
                                ("00" + o[k]).substr(("" + o[k]).length));
                    return format;
                }

                var stra = new Date().format("yyyyMMdd");

                var jsver = document.getElementById('ctl00_ContentPlaceHolder1_ver').innerText;
                var demand1 = document.getElementById("ctl00_ContentPlaceHolder1_FIELD_C_demand").value;
                var demand2 = document.getElementById("ctl00_ContentPlaceHolder1_FIELD_C_demand2").value;

                var url = window.location.toString();
                var str = "";
                var other_value = "";//抓other參數值
                if (url.indexOf("?") != -1) {
                    var ary = url.split("?")[1].split("&");
                    for (var i in ary) {
                        str = ary[i].split("=")[0];
                        if (str == "other") {
                            other_value = decodeURI(ary[i].split("=")[1]);
                        }
                    }
                }


                if (other_value != "1") //抓other參數值,在完成審核維護其它欄位時不用判斷
                {
                    if (jsver == "1")  //版次
                    {



                        if (demand2 < stra) {

                            alert('MA commitment date revise (ETD)需大於等於今天');
                            return false;
                        }
                    } else {

                        if (demand2 < stra) {

                            alert('MA commitment date revise (ETD)需大於等於今天');
                            return false;
                        }

                    }
                }
            }
            $(function () {

                var oother = <%= OTHER%>

        if (oother == "1") {
                    $('#FIELD_PartNo').css("background-color", "white");
                    $('#FIELD_Component').css("background-color", "white");
                    $('#FIELD_DWG').css("background-color", "white");
                }


                document.getElementById("ctl00_ContentPlaceHolder1_Button_UpdateItem").style.display = "none";

            })


            function num_only(e) {
                //只能輸入數值
                var keynum = e.keyCode || e.which;
                var numcheck = /^(8|48|49|50|51|52|53|54|55|56|57)$/;
                return numcheck.test(keynum);
            };


            function opendiv() {
                var choose = document.getElementById('div2');
                if (choose.style.display == 'none') {
                    choose.style.display = 'block';
                    $('#aaa').attr('value', '<Img Src=img/application_get.png Height=20px Width=20px>')
                } else {

                    choose.style.display = 'none';
                    $('#aaa').attr('value', '<Img Src=img/application_put.png Height=20px Width=20px>')
                }

            }

            function trim1(str) {  //去空白
                return str.replace(/^(\s|\xA0)+|(\s|\xA0)+$/g, '');
            }

            function onGridViewRowSelected(rowIdx, aa, count) {   //當gridview選擇修改時  rowIdx-->選擇列

                document.getElementById("ctl00_ContentPlaceHolder1_Button_UpdateItem").style.display = "block";

                var choose = document.getElementById('div2');
                choose.style.display = 'block';


                choose.style.display = 'block';
                $('#aaa').attr('value', '<Img Src=img/application_get.png Height=20px Width=20px>')

                //$('#FIELD_PartNo').css("background-color","blue");
                //$('#ctl00_ContentPlaceHolder1_FIELD_Material').css("background-color","blue");

                var rownumber = parseInt(rowIdx) + 1;
                //將gridview的值?回去欄位中，便於修改
                var gdview = document.getElementById("<%=GridView1.ClientID %>");
                document.getElementById("ctl00_ContentPlaceHolder1_rember_item").value = gdview.rows(rownumber).cells(2).innerText
                $('#FIELD_PartNo').val(gdview.rows(rownumber).cells(3).innerText);
                $('#FIELD_Component').val(gdview.rows(rownumber).cells(4).innerText);
                $('#FIELD_DWG').val(gdview.rows(rownumber).cells(5).innerText);


                document.getElementById("ctl00_ContentPlaceHolder1_FIELD_Material").value = gdview.rows(rownumber).cells(6).innerText;
                document.getElementById("ctl00_ContentPlaceHolder1_FIELD_Material2").value = gdview.rows(rownumber).cells(23).innerText;
                document.getElementById("ctl00_ContentPlaceHolder1_FIELD_Material3").value = gdview.rows(rownumber).cells(24).innerText;
                document.getElementById("ctl00_ContentPlaceHolder1_FIELD_Explanation").value = gdview.rows(rownumber).cells(25).innerText;
                document.getElementById("ctl00_ContentPlaceHolder1_FIELD_Qty").value = gdview.rows(rownumber).cells(7).innerText;

                document.getElementById("ctl00_ContentPlaceHolder1_FIELD_lv").value = trim1(gdview.rows(rownumber).cells(8).innerText);
                document.getElementById("ctl00_ContentPlaceHolder1_FIELD_hv").value = trim1(gdview.rows(rownumber).cells(9).innerText);

                if (gdview.rows(rownumber).cells(10).innerText.length != 1) //空的數字會回傳一格空白,故排除
                {
                    var a1 = gdview.rows(rownumber).cells(10).innerText;
                    a1 = a1.replace("/", "");
                    a1 = a1.replace("/", "");
                    document.getElementById("ctl00_ContentPlaceHolder1_FIELD_C_demand").value = a1;
                } else {

                    document.getElementById("ctl00_ContentPlaceHolder1_FIELD_C_demand").value = "";
                }

                if (gdview.rows(rownumber).cells(18).innerText.length != 1) //空的數字會回傳一格空白,故排除
                {
                    var b1 = gdview.rows(rownumber).cells(18).innerText;
                    b1 = b1.replace("/", "");
                    b1 = b1.replace("/", "");
                    document.getElementById("ctl00_ContentPlaceHolder1_FIELD_C_demand2").value = b1;

                } else {

                    document.getElementById("ctl00_ContentPlaceHolder1_FIELD_C_demand2").value = "";
                }



                if (gdview.rows(rownumber).cells(11).innerText.length != 1) {
                    var c1 = gdview.rows(rownumber).cells(11).innerText;
                    c1 = c1.replace("/", "");
                    c1 = c1.replace("/", "");
                    document.getElementById("ctl00_ContentPlaceHolder1_FIELD_ETD").value = c1;
                } else {

                    document.getElementById("ctl00_ContentPlaceHolder1_FIELD_ETD").value = "";
                }

                document.getElementById("ctl00_ContentPlaceHolder1_FIELD_Shipment_type").value = gdview.rows(rownumber).cells(15).innerText;

                document.getElementById("ctl00_ContentPlaceHolder1_FIELD_B_no").value = gdview.rows(rownumber).cells(17).innerText;

                //document.getElementById("ctl00_ContentPlaceHolder1_FIELD_C_demand2").value=gdview.rows(rownumber).cells(18).innerText;


                document.getElementById("ctl00_ContentPlaceHolder1_FIELD_Shipment_status").value = gdview.rows(rownumber).cells(16).innerText;

                if (gdview.rows(rownumber).cells(14).innerText.length != 1) //packing
                {
                    var packing = gdview.rows(rownumber).cells(14).innerText;
                    packing = packing.replace("NW/GW:", "\r\nNW/GW:");
                    packing = packing.replace("CARTON QTY:", "\r\nCARTON QTY:");
                    packing = packing.replace("VIA:", "\r\nVIA:");
                    packing = packing.replace("Attn to:", "\r\nAttn to:");
                    document.getElementById("ctl00_ContentPlaceHolder1_FIELD_packing").value = packing;
                }
                document.getElementById("ctl00_ContentPlaceHolder1_FIELD_purpose2").value = gdview.rows(rownumber).cells(19).innerText;

                var labno_var = gdview.rows(rownumber).cells(20).innerText.replace(/\ /g, ",");//因lab_no如多個,Gridview以空白分割,故將空白取代為逗號(/\ /g-->尋找全部空白)
                labno_var = labno_var.substring(0, labno_var.length - 1);                     //去除最後一個逗號
                document.getElementById("ctl00_ContentPlaceHolder1_FIELD_labno").value = labno_var;
                document.getElementById("ctl00_ContentPlaceHolder1_FIELD_labsn").value = gdview.rows(rownumber).cells(21).innerText;
                document.getElementById("ctl00_ContentPlaceHolder1_FIELD_engineeringtestno").value = gdview.rows(rownumber).cells(22).innerText;
                document.getElementById("ctl00_ContentPlaceHolder1_txt_remark").value = gdview.rows(rownumber).cells(26).innerText; //add by carol 20180719


                document.getElementById("ctl00_ContentPlaceHolder1_Button_UpdateItem").style.display = "block";  //顯示UPDATE ITEM按鈕

                var obj = document.getElementById("ctl00_ContentPlaceHolder1_FIELD_Potential_P_choose");
                for (var i = 0; i < obj.length; i++) {

                    if (obj.options[i].value == gdview.rows(rownumber).cells(12).innerText)  //obj.options[i].value-->FIELD_Shipment_type_choose的內容
                    {
                        document.getElementById("ctl00_ContentPlaceHolder1_FIELD_Potential_P_choose").value = gdview.rows(rownumber).cells(12).innerText;
                        document.getElementById("ctl00_ContentPlaceHolder1_FIELD_Potential_P").value = "";
                        document.all["ctl00_ContentPlaceHolder1_RadioButton1"].checked = true;
                        document.all["ctl00_ContentPlaceHolder1_RadioButton2"].checked = false;
                        break;                                                        //有對應就跳出


                    } else {
                        document.getElementById("ctl00_ContentPlaceHolder1_FIELD_Potential_P_choose").value = "";
                        document.getElementById("ctl00_ContentPlaceHolder1_FIELD_Potential_P").value = gdview.rows(rownumber).cells(12).innerText;
                        document.all["ctl00_ContentPlaceHolder1_RadioButton1"].checked = false;
                        document.all["ctl00_ContentPlaceHolder1_RadioButton2"].checked = true;
                    }

                }





                var ele = document.getElementById("ctl00_ContentPlaceHolder1_CheckBoxList2").getElementsByTagName("input");

                for (var i = 0; i < ele.length; i++) //先把checkboxlist2做清除
                {

                    ele[i].checked = false;


                }


                for (var i2 = 0; i2 < ele.length; i2++)  //歷遍checkboxlist2
                {

                    var entry = aa.split('@');  //切割字串
                    for (var i = 0; i < count; i++) {
                        if (i2 == entry[i])         //如果伺服器端有合的值checked=true
                        {
                            ele[i2].checked = true;
                        }

                    }
                }
            }
        </script>
    </header>
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
        Caption="NPI出貨及送樣流程-瀏覽" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
        <CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <table cellpadding="0" cellspacing="0" style="width: 1000px; border-collapse: collapse">
        <tr>
            <td align="left" colspan="1" style="height: 25px; text-align: left">
                <asp:Label ID="Label181" runat="server" CssClass="NormalBold" Font-Names="新細明體" Font-Size="9pt"
                    meta:resourcekey="Label34Resource1" Text="No. "></asp:Label><asp:Label ID="no" runat="server"
                        CssClass="NormalBold" ForeColor="DimGray" Height="5px" name="no" Width="108px"></asp:Label>
                <asp:Label ID="Label26" runat="server" CssClass="NormalBold" Font-Names="新細明體" Font-Size="9pt"
                    meta:resourcekey="Label34Resource1" Text="Ver" Width="28px"></asp:Label><asp:Label
                        ID="ver" runat="server" CssClass="NormalBold" ForeColor="DimGray" Height="5px"
                        name="ver" Width="55px"></asp:Label></td>
            <td align="left" colspan="1" style="height: 25px; text-align: right"></td>
            <td align="left" colspan="2" style="height: 25px; text-align: right">
                <asp:Label ID="Label28" runat="server" CssClass="NormalBold" Font-Names="Arial" Font-Size="9pt"
                    meta:resourcekey="Label6Resource1" Text="Plant"></asp:Label>
                <asp:Label ID="Plant"
                    runat="server" CssClass="NormalBold" ForeColor="DimGray" Height="5px" Text="林欣茹"
                    Width="32px"></asp:Label><asp:Label ID="Label6" runat="server" CssClass="NormalBold"
                        Font-Names="Arial" Font-Size="9pt" meta:resourcekey="Label6Resource1" Text="Inidate"
                        Width="48px"></asp:Label>&nbsp;<SmoothEnterpriseWebControl:InputText ID="FIELD_Add_date"
                            runat="server" BackColor="#F0F0F0" CssClass="Normal" Enabled="False" ErrorMessage="Please Input「ETD」!!"
                            FormatType="DateTime" MaxLength="0" Required="False" Width="100px">
                            <ErrorStyle BorderStyle="NotSet" />
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText>
                <asp:Label ID="Label7" runat="server" CssClass="NormalBold" Font-Names="Arial" Font-Size="9pt"
                    meta:resourcekey="Label6Resource1" Text="Applicant"></asp:Label><asp:Label ID="add_user"
                        runat="server" CssClass="NormalBold" ForeColor="DimGray" Height="5px" Text="林欣茹"
                        Width="50px"></asp:Label>&nbsp;</td>
        </tr>
    </table>
    <table border="1" bordercolor="silver" cellpadding="0" cellspacing="0" style="width: 1000px; border-collapse: collapse">
        <tr>
            <td style="height: 41px">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <table style="width: 1000px">
                    <tr>
                        <td style="width: 139px; height: 43px">
                            <span style="font-size: 10pt"></span>
                            <asp:Label ID="Label15" runat="server"
                                CssClass="NormalBold" Font-Size="Small" ForeColor="White" Height="10px" Text="*"
                                Width="6px"></asp:Label><span style="font-size: 10pt"></span><asp:Label ID="Label10" runat="server" CssClass="NormalBold" Font-Names="Arial" Font-Size="10pt"
                                    meta:resourcekey="LABEL_1" Text="ERP System PO" Width="123px"></asp:Label></td>
                        <td colspan="3" style="width: 780px; height: 43px">
                            <SmoothEnterpriseWebControl:InputText ID="FIELD_ERP_PO" runat="server" Style="border-left-color: gainsboro; border-bottom-color: gainsboro; width: 100px; border-top-color: gainsboro; border-right-color: gainsboro"
                                Width="1px">
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputText>&nbsp;
                        </td>
                    </tr>
                </table>
                <div id="div1" runat="server">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <table id="tab2" style="width: 1000px">
                                <tr>
                                    <td style="width: 150px; height: 26px">
                                        <span style="font-size: 10pt"></span>
                                        <asp:Label ID="Label13ab" runat="server" CssClass="NormalBold" Font-Size="Small"
                                            ForeColor="Red" Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="LABEL_1"
                                                runat="server" CssClass="NormalBold" Font-Names="Arial" Font-Size="10pt" meta:resourcekey="LABEL_1"
                                                Text="Customer" Width="90px"></asp:Label></td>
                                    <td style="width: 350px; height: 26px">
                                        <asp:DropDownList ID="FIELD_Customer" runat="server" BackColor="#FFFFC0" Style="border-left-color: gainsboro; border-bottom-color: gainsboro; width: 180px; border-top-color: gainsboro; border-right-color: gainsboro">
                                        </asp:DropDownList></td>
                                    <td style="width: 150px; height: 26px">
                                        <span style="font-size: 10pt">
                                            <asp:Label ID="Label145" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="White"
                                                Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="Label9" runat="server"
                                                    CssClass="NormalBold" Font-Names="Arial" Font-Size="10pt" meta:resourcekey="LABEL_backdateResource1"
                                                    Text="Customer PO"></asp:Label></span></td>
                                    <td style="width: 330px; height: 26px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_PO" runat="server" Style="width: 180px;" BackColor="#FFFFC0">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 150px; height: 27px">
                                        <span style="font-size: 10pt">
                                            <asp:Label ID="Label11" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="Red"
                                                Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="Label25" runat="server"
                                                    CssClass="NormalBold" Font-Names="Arial" Font-Size="10pt" meta:resourcekey="LABEL6a"
                                                    Text="Loc."></asp:Label></span></td>
                                    <td style="width: 350px; height: 27px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_loc" runat="server" BackColor="#FFFFC0"
                                            Height="49px" TextMode="MultiLine" Width="300px">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 150px; height: 27px">
                                        <span style="font-size: 10pt">
                                            <asp:Label ID="Label52" runat="server" CssClass="NormalBold"
                                                Font-Size="Small" ForeColor="White" Height="10px" Text="*" Width="6px"></asp:Label><asp:Label
                                                    ID="Label53" runat="server" CssClass="NormalBold" Font-Names="Arial" Font-Size="10pt"
                                                    meta:resourcekey="LABEL6a" Text="ETA"></asp:Label></span></td>
                                    <td style="width: 330px; height: 27px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ETA" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal" ErrorMessage="Please Input「SDate」!!" FormatType="Date" MaxLength="0">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText>
                                        <asp:Button ID="Button2" runat="server" Text="Urgent Notice" OnClick="Button2_Click" Height="27px" /></td>
                                </tr>
                            </table>
                            <input id="PK1" runat="server" type="hidden" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    &nbsp;
                </div>
                <table style="width: 1000px; height: 29px">
                    <tr>
                        <td>
                            <span style="font-size: 10pt">
                                <asp:Label ID="Label33a" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="White"
                                    Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="Label34a" runat="server"
                                        CssClass="NormalBold" Font-Names="Arial" Font-Size="10pt" meta:resourcekey="LABEL6a"
                                        Text="BARCODE No."></asp:Label>
                                <SmoothEnterpriseWebControl:InputFile ID="attach1" runat="server"
                                    BackColor="#F0F0F0" CssClass="Normal" Visible="false">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputFile>
                            </span>
                        </td>
                        <td>
                            <span>
                                <asp:Label ID="Label55" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="White"
                                    Height="10px" Text="*" Width="6px"></asp:Label>
                                <asp:Label ID="Label56" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="White"
                                    Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="Label57" runat="server"
                                        CssClass="NormalBold" Font-Names="Arial" Font-Size="10pt" meta:resourcekey="LABEL6a"
                                        Text="DCM code photo from WD"></asp:Label>
                                <SmoothEnterpriseWebControl:InputFile ID="attach2" runat="server"
                                    BackColor="#F0F0F0" CssClass="Normal" Visible="false">
                                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                </SmoothEnterpriseWebControl:InputFile>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBoxList ID="CheckBoxList1" runat="server" Font-Size="X-Small" Enabled="false"></asp:CheckBoxList>
                        </td>
                        <td>
                            <asp:CheckBoxList ID="CheckBoxFile3" runat="server" Font-Size="X-Small" Enabled="false"></asp:CheckBoxList>
                        </td>
                    </tr>
                </table>

                <table style="width: 1000px; height: 5px">
                    <tr>
                        <td style="width: 150px; height: 31px">
                            <span style="font-size: 10pt">
                                <asp:Label ID="Label46" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="White"
                                    Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="Label48" runat="server"
                                        CssClass="NormalBold" Font-Names="Arial" Font-Size="10pt"
                                        meta:resourcekey="LABEL6a" Text="SE Approved Doc"></asp:Label></span></td>
                        <td style="height: 31px; width: 304px;" id="uploadfiles">
                            <asp:CheckBoxList ID="CheckBoxFile2" runat="server" Font-Size="X-Small">
                            </asp:CheckBoxList>
                            <SmoothEnterpriseWebControl:InputFile ID="InputFile1" runat="server" BackColor="#F0F0F0"
                                CssClass="Normal" onchange="addfile()" EnableTheming="False" Visible="False">
                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            </SmoothEnterpriseWebControl:InputFile>
                        </td>
                        <td style="width: 150px; height: 31px">
                            <span style="font-size: 10pt">&nbsp;<asp:Button ID="Button1" runat="server" Text="Save attached file" OnClick="Button1_Click" Height="27px" Visible="false" /></span></td>
                        <td style="width: 330px; height: 31px"></td>
                    </tr>
                </table>
                <table width="1000">
                    <tr>
                        <td style="width: 659px; text-align: right"></td>
                        <td style="width: 3px; text-align: right">
                            <button id="aaa" name="aaa" onclick="opendiv()" type="button">
                                <img id="bbb" height="20" src="img/application_put.png" width="20" /></button></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="width: 83%; text-align: left">
                <div id="div2" style="text-align: left; display: none">
                    <table style="width: 1000px; height: 70px">
                        <tr>
                            <td style="width: 150px; height: 26px">
                                <span style="font-size: 10pt"></span>
                                <asp:Label ID="Label14" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="White"
                                    Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="Label4" runat="server"
                                        CssClass="NormalBold" Font-Names="Arial" Font-Size="10pt" meta:resourcekey="LABEL5"
                                        Text="PartNo"></asp:Label></td>
                            <td style="width: 350px; height: 26px">
                                <input id="FIELD_PartNo" autocomplete="off" name="FIELD_PartNo" style="width: 180px; background-color: #ffffcc;" type="textbox" /></td>
                            <td style="width: 150px; height: 26px">
                                <asp:Label ID="Label13x" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="Red"
                                    Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="lab3" runat="server"
                                        CssClass="NormalBold" Font-Names="Arial" Font-Size="10pt" meta:resourcekey="LABEL5"
                                        Text="Component"></asp:Label></td>
                            <td style="width: 330px; height: 26px">
                                <input id="FIELD_Component" autocomplete="off" name="FIELD_Component" style="width: 180px; background-color: #ffffcc"
                                    type="textbox" /></td>
                        </tr>
                        <tr>
                            <td style="width: 150px; height: 26px">
                                <asp:Label ID="Label12" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="Red"
                                    Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="Label3" runat="server"
                                        CssClass="NormalBold" Font-Names="Arial" Font-Size="10pt" meta:resourcekey="LABEL5"
                                        Text="DWG/Rev."></asp:Label></td>
                            <td style="width: 350px; height: 26px">
                                <input id="FIELD_DWG" autocomplete="off" name="FIELD_DWG" style="width: 180px; background-color: #ffffcc"
                                    type="textbox" /></td>
                            <td style="width: 150px; height: 26px">
                                <span style="font-size: 10pt">
                                    <asp:Label ID="Label1" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="White"
                                        Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="LABEL5" runat="server"
                                            CssClass="NormalBold" Font-Names="Arial" Font-Size="10pt" meta:resourcekey="LABEL5"
                                            Text="Material 1"></asp:Label><br />
                                    <asp:Label ID="Label16" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="White"
                                        Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="Label43" runat="server"
                                            CssClass="NormalBold" Font-Names="Arial" Font-Size="10pt" meta:resourcekey="LABEL5"
                                            Text="Material 2"></asp:Label><br />
                                    <asp:Label ID="Label50" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="White"
                                        Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="Label51" runat="server"
                                            CssClass="NormalBold" Font-Names="Arial" Font-Size="10pt" meta:resourcekey="LABEL5"
                                            Text="Material 3"></asp:Label></span></td>
                            <td style="width: 330px; height: 26px">
                                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="FIELD_Material" runat="server" BackColor="#FFFFC0" Style="border-left-color: gainsboro; border-bottom-color: gainsboro; width: 180px; border-top-color: gainsboro; border-right-color: gainsboro">
                                        </asp:DropDownList><asp:DropDownList ID="FIELD_Material2" runat="server" BackColor="#FFFFC0"
                                            Style="border-left-color: gainsboro; border-bottom-color: gainsboro; width: 180px; border-top-color: gainsboro; border-right-color: gainsboro">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:DropDownList ID="FIELD_Material3" runat="server" Style="border-left-color: gainsboro; border-bottom-color: gainsboro; width: 180px; border-top-color: gainsboro; border-right-color: gainsboro"
                                            BackColor="#FFFFC0">
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <table style="width: 1000px; height: 402px">
                                <tr>
                                    <td style="width: 150px; height: 27px">
                                        <span></span><span style="font-size: 10pt"></span>
                                        <asp:Label ID="Label17" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="Red"
                                            Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="Label19" runat="server"
                                                CssClass="NormalBold" Font-Names="Arial" Font-Size="10pt" meta:resourcekey="LABEL19"
                                                Text="Shipment Type"></asp:Label></td>
                                    <td style="width: 350px; height: 27px">
                                        <asp:DropDownList ID="FIELD_Shipment_type" runat="server" BackColor="#FFFFC0" Style="border-left-color: gainsboro; border-bottom-color: gainsboro; width: 180px; border-top-color: gainsboro; border-right-color: gainsboro">
                                            <asp:ListItem Selected="True"></asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td style="width: 150px; height: 27px">
                                        <span style="font-size: 10pt">
                                            <asp:Label ID="Label13xx" runat="server" CssClass="NormalBold" Font-Size="Small"
                                                ForeColor="Red" Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="Label2"
                                                    runat="server" CssClass="NormalBold" Font-Names="Arial" Font-Size="10pt" meta:resourcekey="Label8a"
                                                    Text="Qty"></asp:Label></span>
                                    </td>
                                    <td style="width: 330px; height: 27px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_Qty" runat="server" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')"
                                            Style="width: 180px;" BackColor="#FFFFC0">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 150px; height: 27px">
                                        <span></span><span style="font-size: 10pt"></span>
                                        <asp:Label ID="Label20" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="White"
                                            Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="Label54" runat="server" CssClass="NormalBold" Font-Names="Arial" Font-Size="10pt"
                                                meta:resourcekey="LABEL19" Text="Explanation"></asp:Label>
                                    </td>
                                    <td style="width: 330px; height: 27px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_Explanation" Text="" runat="server"
                                            Style="width: 180px; background-color: #ffffcc;">
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 150px; height: 27px">
                                        <span style="font-size: 10pt"></span>
                                        <asp:Label ID="Label18" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="White"
                                            Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="Label20a" runat="server"
                                                CssClass="NormalBold" Font-Names="Arial" Font-Size="10pt" meta:resourcekey="Label8a"
                                                Text="LV"></asp:Label></td>
                                    <td style="width: 350px; height: 27px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_LV" runat="server" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')"
                                            Style="width: 180px;" BackColor="#FFFFC0">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 150px; height: 27px">
                                        <span style="font-size: 10pt"></span>
                                        <asp:Label ID="Label14z" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="White"
                                            Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="Label8a" runat="server"
                                                CssClass="NormalBold" Font-Names="Arial" Font-Size="10pt" meta:resourcekey="Label8a"
                                                Text="HV"></asp:Label></td>
                                    <td style="width: 330px; height: 27px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_HV" runat="server" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')"
                                            Style="width: 180px;" BackColor="#FFFFC0">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 150px; height: 27px">
                                        <span style="font-size: 10pt"></span>
                                        <asp:Label ID="Label21" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="Red"
                                            Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="Label32" runat="server"
                                                CssClass="NormalBold" Font-Names="Arial" Font-Size="10pt" meta:resourcekey="LABEL6a"
                                                Text="MA commitment"></asp:Label><br />
                                        &nbsp;<asp:Label ID="Label44" runat="server" CssClass="NormalBold" Font-Names="Arial"
                                            Font-Size="10pt" ForeColor="WindowText" meta:resourcekey="LABEL6a" Text=" date(ETD)"></asp:Label></td>
                                    <td style="width: 350px; height: 27px">
                                        <asp:TextBox ID="FIELD_C_demand" runat="server" BackColor="#FFFFC0"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="yyyyMMdd" TargetControlID="FIELD_C_demand">
                                        </cc1:CalendarExtender>
                                    </td>
                                    <td style="width: 150px; height: 27px">
                                        <span style="font-size: 10pt"></span>
                                        <asp:Label ID="Label22" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="Red"
                                            Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="Label35" runat="server"
                                                CssClass="NormalBold" Font-Names="Arial" Font-Size="10pt" ForeColor="WindowText"
                                                meta:resourcekey="LABEL6a" Text="MA commitment date "></asp:Label><br />
                                        <asp:Label ID="Label23" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="White"
                                            Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="Label29" runat="server"
                                                CssClass="NormalBold" Font-Names="Arial" Font-Size="10pt" ForeColor="WindowText"
                                                meta:resourcekey="LABEL6a" Text="revise (ETD)"></asp:Label></td>
                                    <td style="width: 330px; height: 27px">
                                        <asp:TextBox ID="FIELD_C_demand2" runat="server" BackColor="#FFFFC0"></asp:TextBox><cc1:CalendarExtender
                                            ID="CalendarExtender2" runat="server" Format="yyyyMMdd" TargetControlID="FIELD_C_demand2">
                                        </cc1:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 150px; height: 35px">
                                        <span style="font-size: 10pt"></span>
                                        <asp:Label ID="Label24" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="White"
                                            Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="Label45" runat="server"
                                                CssClass="NormalBold" Font-Names="Arial" Font-Size="10pt" meta:resourcekey="LABEL6a"
                                                Text="Potential Problem"></asp:Label>
                                    </td>
                                    <td style="width: 350px; height: 35px">&nbsp;<br />
                                        <table>
                                            <tr>
                                                <td style="width: 72px">
                                                    <asp:RadioButton ID="RadioButton1" runat="server" Checked="True" Font-Bold="False"
                                                        Font-Size="8pt" ForeColor="Black" GroupName="selrad2" meta:resourcekey="RadioButton1Resource1"
                                                        Text="Choose:" Width="70px" /></td>
                                                <td style="width: 100px">
                                                    <asp:DropDownList ID="FIELD_Potential_P_choose" runat="server" BackColor="#FFFFC0"
                                                        Style="border-left-color: gainsboro; border-bottom-color: gainsboro; width: 180px; border-top-color: gainsboro; border-right-color: gainsboro">
                                                        <asp:ListItem Selected="True"></asp:ListItem>
                                                    </asp:DropDownList></td>
                                            </tr>
                                            <tr>
                                                <td style="vertical-align: top; width: 72px">
                                                    <asp:RadioButton ID="RadioButton2" runat="server" Font-Bold="False" Font-Size="8pt"
                                                        ForeColor="Black" GroupName="selrad2" meta:resourcekey="RadioButton2Resource1"
                                                        Text="Key in:" Width="70px" /></td>
                                                <td style="width: 100px">
                                                    <SmoothEnterpriseWebControl:InputText ID="FIELD_Potential_P" runat="server" BackColor="#FFFFC0"
                                                        Height="52px" HiddenMode="False" HTMLMode="Advance" Style="width: 180px" TextMode="MultiLine"
                                                        Width="182px">
                                                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                                        <Gradient GradientBegin="" GradientEnd="" />
                                                    </SmoothEnterpriseWebControl:InputText></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="width: 150px; height: 35px">
                                        <span style="font-size: 10pt">
                                            <asp:Label ID="Label26a" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="White"
                                                Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="Label49" runat="server"
                                                    CssClass="NormalBold" Font-Names="Arial" Font-Size="10pt" meta:resourcekey="LABEL6a"
                                                    Text="Shipment Paper"></asp:Label></span></td>
                                    <td style="width: 330px; height: 35px">
                                        <asp:CheckBoxList ID="CheckBoxList2" runat="server" Font-Size="9pt" name="CheckBoxList2"
                                            RepeatColumns="2" RepeatDirection="Horizontal" BackColor="#FFFFC0">
                                        </asp:CheckBoxList></td>
                                </tr>
                                <tr>
                                    <td style="width: 150px;" rowspan="3">
                                        <span style="font-size: 10pt">
                                            <asp:Label ID="Label30" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="Red"
                                                Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="Label47" runat="server"
                                                    CssClass="NormalBold" Font-Names="Arial" Font-Size="10pt" meta:resourcekey="LABEL6a"
                                                    Text="Packing Data"></asp:Label></span></td>
                                    <td style="width: 350px;" rowspan="3">
                                        <asp:TextBox ID="FIELD_Packing" runat="server" BackColor="#FFFFC0" Columns="4" Height="86px"
                                            TextMode="MultiLine" Width="328px"></asp:TextBox></td>
                                    <td style="width: 150px; height: 35px">
                                        <span style="font-size: 10pt">
                                            <asp:Label ID="Label27" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="White"
                                                Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="Label38" runat="server"
                                                    CssClass="NormalBold" Font-Names="Arial" Font-Size="10pt" meta:resourcekey="LABEL6a"
                                                    Text="Lab No"></asp:Label></span></td>
                                    <td style="width: 330px; height: 35px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_Labno" runat="server" Style="width: 250px;" BackColor="#FFFFC0">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 150px; height: 35px">
                                        <asp:Label ID="Label8" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="White"
                                            Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="Label13" runat="server"
                                                CssClass="NormalBold" Font-Names="Arial" Font-Size="10pt" meta:resourcekey="LABEL6a"
                                                Text="ME Lab SN"></asp:Label></td>
                                    <td style="width: 330px; height: 35px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_labsn" runat="server"
                                            Style="width: 250px;" BackColor="#FFFFC0">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 150px; height: 35px">
                                        <asp:Label ID="Label39" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="White"
                                            Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="Label40" runat="server"
                                                CssClass="NormalBold" Font-Names="Arial" Font-Size="10pt" meta:resourcekey="LABEL6a"
                                                Text="EngineeringTest No"></asp:Label></td>
                                    <td style="width: 330px; height: 35px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_EngineeringTestNo" runat="server"
                                            Style="width: 250px;" BackColor="#FFFFC0">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 150px; height: 35px">
                                        <asp:Label ID="Label42" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="Red"
                                            Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="Label6a" runat="server"
                                                CssClass="NormalBold" Font-Names="Arial" Font-Size="10pt" meta:resourcekey="LABEL6a"
                                                Text="Purpose"></asp:Label></td>
                                    <td style="width: 350px; height: 35px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_purpose2" runat="server" Style="width: 180px;" BackColor="#FFFFC0">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 150px; height: 35px">
                                        <asp:Label ID="Label36" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="White"
                                            Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="Label31" runat="server"
                                                CssClass="NormalBold" Font-Names="Arial" Font-Size="10pt" ForeColor="GrayText"
                                                meta:resourcekey="Label8a" Text="Bill of lading NO."></asp:Label></td>
                                    <td style="width: 330px; height: 35px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_B_NO" runat="server" Style="width: 180px;">
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 150px; height: 35px">
                                        <span style="font-size: 10pt">
                                            <asp:Label ID="Label33" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="White"
                                                Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="Label34" runat="server"
                                                    CssClass="NormalBold" Font-Names="Arial" Font-Size="10pt" ForeColor="GrayText"
                                                    meta:resourcekey="LABEL6a" Text="Approval Status"></asp:Label></span></td>
                                    <td style="width: 350px; height: 35px">
                                        <asp:DropDownList ID="FIELD_Shipment_status" runat="server" Style="border-left-color: gainsboro; border-bottom-color: gainsboro; width: 180px; border-top-color: gainsboro; border-right-color: gainsboro">
                                            <asp:ListItem Selected="True"></asp:ListItem>
                                            <asp:ListItem>P: Pass</asp:ListItem>
                                            <asp:ListItem>F : Fail</asp:ListItem>
                                            <asp:ListItem>N/A : -</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td style="width: 150px; height: 35px">
                                        <span style="font-size: 10pt"></span>
                                        <asp:Label ID="Label37" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="White"
                                            Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="Label41" runat="server"
                                                CssClass="NormalBold" Font-Names="Arial" Font-Size="10pt" ForeColor="GrayText"
                                                meta:resourcekey="LABEL6a" Text="Actual shipment date"></asp:Label></td>
                                    <td style="width: 330px; height: 35px">
                                        <asp:TextBox ID="FIELD_ETD" runat="server"></asp:TextBox><cc1:CalendarExtender
                                            ID="CalendarExtender3" runat="server" Format="yyyyMMdd" TargetControlID="FIELD_ETD">
                                        </cc1:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>

                                    <td style="width: 150px; height: 27px">
                                        <span style="font-size: 10pt">
                                            <span class="NormalBold" style="font-size: small; height: 10px; width: 6px; color: red; display: inline-block"></span>
                                            <span class="NormalBold" style="font-size: 10pt; font-family: Arial">Remark</span>

                                        </span>

                                    </td>
                                    <td colspan="3" style="height: 27px; text-align: left">
                                        <asp:TextBox ID="txt_remark" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 150px; height: 27px"></td>
                                    <td colspan="3" style="height: 27px; text-align: right">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                       &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                       &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                       &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
                                       &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                       &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                       <SmoothEnterpriseWebControl:InputButton
                                           ID="Button_UpdateItem" runat="server" BackColor="#C8C8C8" BorderColor="#606060"
                                           BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True"
                                           Font-Names="Arial" Font-Size="12px" OnClick="Button_UpdateItem_Click" Text="Update Item"
                                           Width="85px">
                                           <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                                       </SmoothEnterpriseWebControl:InputButton>
                                        <input id="rember_item" runat="server" style="width: 83px" text="rember_item" type="hidden" /></td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <br />
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GridView1" runat="server" ForeColor="#333333" Width="1000px" Font-Size="10pt" AutoGenerateColumns="False" CellPadding="4" GridLines="None" DataKeyNames="item,aid" OnRowDataBound="GridView1_RowDataBound">
                            <RowStyle BackColor="#E3EAEB" />
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' CausesValidation="false" CommandName="EditModel"
                                            ImageUrl="~/shipment/img/edit.gif" Text="Button" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="aid" HeaderText="aid" SortExpression="aid">
                                    <HeaderStyle CssClass="hiddencol" />
                                    <ItemStyle CssClass="hiddencol" />
                                </asp:BoundField>


                                <asp:BoundField DataField="item" HeaderText="Item" SortExpression="item"></asp:BoundField>
                                <asp:BoundField DataField="partno" HeaderText="PartNo" SortExpression="partno"></asp:BoundField>
                                <asp:BoundField DataField="component" HeaderText="Component" SortExpression="component"></asp:BoundField>
                                <asp:BoundField DataField="dwg" HeaderText="DWG" SortExpression="dwg"></asp:BoundField>
                                <asp:BoundField DataField="material" HeaderText="Material" SortExpression="material"></asp:BoundField>
                                <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty"></asp:BoundField>


                                <asp:BoundField DataField="lv" HeaderText="LV" SortExpression="lv">
                                    <HeaderStyle CssClass="hiddencol" />
                                    <ItemStyle CssClass="hiddencol" />
                                </asp:BoundField>
                                <asp:BoundField DataField="hv" HeaderText="HV" SortExpression="hv">
                                    <HeaderStyle CssClass="hiddencol" />
                                    <ItemStyle CssClass="hiddencol" />
                                </asp:BoundField>

                                <asp:BoundField DataField="c_demand" HeaderText="MA commitment date(ETD)" SortExpression="c_demand"></asp:BoundField>

                                <asp:BoundField DataField="ETD" HeaderText="ETD" SortExpression="ETD">
                                    <HeaderStyle CssClass="hiddencol" />
                                    <ItemStyle CssClass="hiddencol" />
                                </asp:BoundField>


                                <asp:BoundField DataField="potential_p" HeaderText="potential_p" SortExpression="potential_p">
                                    <HeaderStyle CssClass="hiddencol" />
                                    <ItemStyle CssClass="hiddencol" />
                                </asp:BoundField>
                                <asp:BoundField DataField="paper" HeaderText="paper" SortExpression="paper">
                                    <HeaderStyle CssClass="hiddencol" />
                                    <ItemStyle CssClass="hiddencol" />
                                </asp:BoundField>

                                <asp:BoundField DataField="packing" HeaderText="packing" SortExpression="packing">
                                    <HeaderStyle CssClass="hiddencol" />
                                    <ItemStyle CssClass="hiddencol" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Shipment_type" HeaderText="Shipment_type" SortExpression="Shipment_type">
                                    <HeaderStyle CssClass="hiddencol" />
                                    <ItemStyle CssClass="hiddencol" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Shipment_status" HeaderText="Shipment_status" SortExpression="Shipment_status">
                                    <HeaderStyle CssClass="hiddencol" />
                                    <ItemStyle CssClass="hiddencol" />
                                </asp:BoundField>
                                <asp:BoundField DataField="b_no" HeaderText="b_no" SortExpression="b_no">
                                    <HeaderStyle CssClass="hiddencol" />
                                    <ItemStyle CssClass="hiddencol" />
                                </asp:BoundField>

                                <asp:BoundField DataField="c_demand2" HeaderText="MA commitment date revise (ETD)" SortExpression="c_demand2" />
                                <asp:BoundField DataField="purpose2" HeaderText="Purpose" SortExpression="purpose2" />
                                <asp:BoundField DataField="purpose2" HeaderText="Purpose" SortExpression="purpose2" />
                                <asp:BoundField DataField="lab_no" HeaderText="Lab No" HeaderStyle-Width="100" ItemStyle-Width="100" />

                                <asp:TemplateField HeaderText="ME Lab SN">

                                    <ItemTemplate>
                                        <a href="javascript:void(window.open('http://eip.minaik.com.tw/LAP_Test/LAP_Wear_testView.aspx?rowno=<%#Eval("wear_rowno")%>','_blank'))"><%#Eval("labsn")%> </a>
                                    </ItemTemplate>

                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="EngineeringTest No">

                                    <ItemTemplate>
                                        <a href="javascript:void(window.open('http://eip.minaik.com.tw/EngineeringTest/EngineeringTestView.aspx?id=<%#Eval("cid")%>','_blank'))"><%#Eval("EngineeringTest_no")%> </a>
                                    </ItemTemplate>

                                </asp:TemplateField>

                                <asp:BoundField DataField="material2" HeaderText="material2" SortExpression="material2">
                                    <HeaderStyle CssClass="hiddencol" />
                                    <ItemStyle CssClass="hiddencol" />
                                </asp:BoundField>

                                <asp:BoundField DataField="material3" HeaderText="material3" SortExpression="material3">
                                    <HeaderStyle CssClass="hiddencol" />
                                    <ItemStyle CssClass="hiddencol" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Explanation" HeaderText="Explanation" SortExpression="Explanation">
                                    <HeaderStyle CssClass="hiddencol" />
                                    <ItemStyle CssClass="hiddencol" />
                                </asp:BoundField>
                                <asp:BoundField DataField="remark" HeaderText="Remark" SortExpression="remark"></asp:BoundField>
                            </Columns>
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#7C6F57" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td style="width: 83%"></td>
        </tr>
    </table>

    <table border="0" class="Normal">
        <tr>
            <td>
                <SmoothEnterpriseWebControlFlowwork:FlowFeedback ID="FlowFeedback1" runat="server"
                    BackColor="#F0F0F0" BorderColor="#E0E0E0" BorderStyle="Solid" BorderWidth="1px"
                    CssClass="Normal" Font-Size="12px" OnFeedbackComplete="FlowFeedback1_FeedbackComplete" OnFlowNodeComplete="FlowFeedback1_FlowNodeComplete" OnFlowStop="FlowFeedback1_FlowStop" RedirectAfterCommit="False">
                    <Results>
                        <SmoothEnterpriseWebControlFlowwork:FlowResult runat="server" Text="同意" ResultType="Next" ID="flowResult1" meta:resourcekey="flowResult1Resource1"></SmoothEnterpriseWebControlFlowwork:FlowResult>
                        <SmoothEnterpriseWebControlFlowwork:FlowResult runat="server" Text="退回(退至上一關) " ResultType="Back" ID="flowResult2" meta:resourcekey="flowResult2Resource1"></SmoothEnterpriseWebControlFlowwork:FlowResult>
                        <SmoothEnterpriseWebControlFlowwork:FlowResult ID="FlowResult3" runat="server" Text="退回(退至提案人)  " ResultType="Return" meta:resourcekey="FlowResultResource1"></SmoothEnterpriseWebControlFlowwork:FlowResult>

                    </Results>
                    <ReplyTemplate>
                        請輸入簽核意見：<br />
                        <SmoothEnterpriseWebControl:InputText ID="Input_Comment" runat="server" BackColor="#F0F0F0"
                            ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                            ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance"
                            IsValid="True" meta:resourcekey="Input_CommentResource1" OnClickMore="" Personalize="False"
                            Required="False" Width="500px">
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText>
                        <SmoothEnterpriseWebControl:InputText ID="InputText3" runat="server" BackColor="#F0F0F0"
                            ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                            ErrorMessage="" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance"
                            IsValid="True" meta:resourcekey="InputText3Resource1" OnClickMore="" Personalize="False"
                            Required="False" Visible="False">
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText>
                        <asp:Button ID="BUTTON_FlowFeedback" runat="server" CssClass="NormalBold" meta:resourcekey="BUTTON_FlowFeedbackResource1"
                            OnClick="BUTTON_FlowFeedback_Click" Text="送出" Width="80px" />
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
                        <SmoothEnterpriseWebControl:InputText ID="Show_Comment" runat="server" BackColor="#F0F0F0"
                            CssClass="Normal" Width="400px">
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText><asp:Image ID="Image1" runat="server" meta:resourcekey="Image1Resource1" />
                    </HistoryTemplate>
                </SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer>
            </td>
        </tr>
    </table>
    <table border="0" class="Normal">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Text="回上頁" Width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_back_Click">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
            </td>
        </tr>
    </table>
</asp:Content>
