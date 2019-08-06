<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="APMI610View.aspx.cs" Inherits="ERP_APMI610.APMI610View" StylesheetTheme="Default" Culture="Auto" UICulture="Auto" Debug="true" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlFlowwork" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>



<%@ Register Assembly="SmoothEnterprise.Web.Control.Flowwork" Namespace="SmoothEnterprise.Flowwork.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlFlowwork" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="/PManagement/js/jquery-latest.min.js"></script>
    <script>
        function ModPmc01() {
            var inpstr = document.getElementById("ctl00_ContentPlaceHolder1_FIELD_pmca01").value;
            document.getElementById("ctl00_ContentPlaceHolder1_FIELD_pmca04").value = inpstr;
            document.getElementById("ctl00_ContentPlaceHolder1_FIELD_pmca04_2").value = inpstr;
        }


        function OpenWin(x) {
            var strURL = 'Getid.aspx';
            var winFeatures = 'dialogHeight:470px;resizable:yes;status:no';
            window.showModalDialog(strURL, self, winFeatures);

        }
        function OpenWin4(x) {
            var Plant = $("#ctl00_ContentPlaceHolder1_FIELD_PlantID").val();
            var strURL = 'Getsn.aspx?plant=' + Plant;
            var winFeatures = 'dialogHeight:470px;resizable:yes;status:no';
            window.showModalDialog(strURL, self, winFeatures);

        }

        function c1() {
            ct = document.getElementById("ctl00_ContentPlaceHolder1_TextBox1").value;
            str = "document.getElementById('ctl00_ContentPlaceHolder1_email" + ct + "').value";
            alert(eval(str));

            return false;
        }


        function oemail(x) {
            var strURL = 'Getemail.aspx?id=' + x;


            var winFeatures = 'dialogHeight:520px;resizable:yes;status:no';
            window.showModalDialog(strURL, self, winFeatures);

        }


        function BankChange() {
            if ((document.getElementById("ctl00_ContentPlaceHolder1_TexBankAco").value != "") ||
                (document.getElementById("ctl00_ContentPlaceHolder1_Texpmca02").value != "")) {
                document.getElementById("ctl00_ContentPlaceHolder1_CheckBox3").checked = true;
            } else {
                document.getElementById("ctl00_ContentPlaceHolder1_CheckBox3").checked = false;

            }

        }


        function Getlength(strName) {
            var $spans = $('span[name="' + strName + '"]');
            var nowlength = $spans.length + 1;

            return nowlength;
        }

        function addnew(stype, tman, tel, main, remark, email) {
            if (item != null) {
                today = new Date();
                var inputid = today.getTime();
                $('#remind').css('display', 'none');
                var table2 = $('#table2');
                var nowlength = Getlength('itemno');

                table2.append(
                    $('<tr>').append(
                        $('<td>').html($('<span>').html(nowlength)
                            .attr("name", "itemno")
                            .css('width', '20px')
                        ).css("text-align", "center"),

                        $('<td>').html($('<input>').attr("type", "text")
                            .val(stype)
                            .attr("name", "typenm")
                            .css('width', '50px')
                        ).css("text-align", "center"),
                        $('<td>').html($('<input>').attr("type", "text")
                            .val(tman)
                            .attr("name", "Tman")
                            .attr("maxlength", 30)
                            .css('width', '100px')
                        ).css("text-align", "center"),
                        $('<td>').html($('<input>').attr("type", "text")
                            .val(tel)
                            .attr("name", "TEL")
                            .attr("maxlength", 20)
                            .css('width', '100px')
                        ).css("text-align", "center"),
                        $('<td>').html($('<input>').attr("type", "text")
                            .val(main)
                            .attr("name", "main")
                            .attr("maxlength", 1)
                            .css('width', '30px')
                        ).css("text-align", "center"),
                        $('<td>').html($('<input>').attr("type", "text")
                            .val(remark)
                            .attr("name", "remark")
                            .attr("maxlength", 255)
                            .css('width', '80px')
                        ).css("text-align", "center"),
                        $('<td>').html($('<input>').attr("type", "text")
                            .val(email)
                            .attr("name", "email")
                            .attr("maxlength", 255)
                            .attr("id", "ctl00_ContentPlaceHolder1_email" + inputid)
                            .css('width', '450px')
                        ).css("text-align", "center"),

                        $('<td>').html('<input name="PU" value="show" type="button"  onclick="oemail(' + inputid + ')" id="Pu' + inputid + '" Width="80px"           >')
                            .css("text-align", "center"),
                        $('<td>').html(
                            $('<input>').attr("type", "button")
                                .val("Delete")
                                .click(function () {
                                    $(this).parents("tr:first").remove();
                                    //重新編排數字
                                    var $spans = $('span[name="itemno"]');
                                    for (var i = 0; i < $spans.length; i++)
                                        $spans[i].innerText = i + 1;
                                    //重新編排數字					
                                    if ($spans.length == 0)
                                        $('#remind').css('display', 'block');
                                })

                        ).css("text-align", "center")
                    ).mouseover(function () { $(this).css("background-color", "#E6EDFF"); }).mouseout(function () { $(this).css("background-color", "white"); })
                );
            }

        }


        function addnew2() {
            today = new Date();
            var inputid = today.getTime();
            $('#remind').css('display', 'none');
            var table2 = $('#table2');
            var nowlength = Getlength('itemno');
            table2.append(
                $('<tr>').append(
                    $('<td>').html($('<span>').html(nowlength)
                        .attr("name", "itemno")
                        .css('width', '20px')
                    ).css("text-align", "center"),
                    $('<td>').html($('<input>').attr("type", "text")
                        .val("")
                        .attr("name", "typenm")
                        .attr("maxlength", 10)
                        .css('width', '50px')
                    ).css("text-align", "center"),
                    $('<td>').html($('<input>').attr("type", "text")
                        .val("")
                        .attr("name", "Tman")
                        .attr("maxlength", 30)
                        .css('width', '100px')
                    ).css("text-align", "center"),
                    $('<td>').html($('<input>').attr("type", "text")
                        .val("")
                        .attr("name", "TEL")
                        .attr("maxlength", 20)
                        .css('width', '100px')
                    ).css("text-align", "center"),
                    $('<td>').html($('<input>').attr("type", "text")
                        .val("")
                        .attr("name", "main")
                        .attr("maxlength", 1)
                        .css('width', '30px')
                    ).css("text-align", "center"),
                    $('<td>').html($('<input>').attr("type", "text")
                        .val("")
                        .attr("name", "remark")
                        .attr("maxlength", 255)
                        .css('width', '80px')
                    ).css("text-align", "center"),
                    $('<td>').html($('<input>').attr("type", "text")
                        .val("")
                        .attr("name", "email")
                        .attr("maxlength", 255)
                        .attr("id", "ctl00_ContentPlaceHolder1_email" + inputid)
                        .css('width', '450px')
                    ).css("text-align", "center"),
                    $('<td>').html('<input name="PU" value="show" type="button"  onclick="oemail(' + inputid + ')" id="Pu' + inputid + '" Width="80px"           >')
                        .css("text-align", "center"),
                    $('<td>').html(
                        $('<input>').attr("type", "button")
                            .val("Delete")
                            .click(function () {
                                $(this).parents("tr:first").remove();
                                //重新編排數字
                                var $spans = $('span[name="itemno"]');
                                for (var i = 0; i < $spans.length; i++)
                                    $spans[i].innerText = i + 1;
                                //重新編排數字
                                if ($spans.length == 0)
                                    $('#remind').css('display', 'block');
                            })

                    ).css("text-align", "center")
                ).mouseover(function () { $(this).css("background-color", "#E6EDFF"); }).mouseout(function () { $(this).css("background-color", "white"); })
            );
        }


        $(window).load(function () {

            //var loca = location.href;
            //var a = loca.substring(loca.length,loca.length-36);
            var sn = document.getElementById("ctl00_ContentPlaceHolder1_FIELD_pmcsn").value;
            //alert(sn); 

            $.post("Got_JoinList.aspx?sn=" + sn, function (result) {

                ShoweMail(result)
            });

            //add by carol 2017/12/01
            var pmca01 = $("#ctl00_ContentPlaceHolder1_FIELD_pmca01").val();

            $("#ctl00_ContentPlaceHolder1_FIELD_pmca01").change(function () {
                confim_supplier(this, pmca01);
            });

        });


        function ShoweMail(result) {


            var eecount = result.split("@@").length;
            var mailstring = result.split("@@");
            for (i = 0; i < eecount; i++) {
                var perdata = mailstring[i].split(",");
                addnew(perdata[0], perdata[1], perdata[2], perdata[3], perdata[4], perdata[5]);
            }
        }

        // 擷取資料庫中的資料並新增表格 	


        function confim_supplier(obj, old)　//Add by Carol 2017/12/01
        {
            var name = $(obj).val();

            //20181221 暫時停止供應商編號檢查 by carol

            var Plant=$("#ctl00_ContentPlaceHolder1_FIELD_PlantID").val();
            $.post("./Supplier.ashx", {plant:Plant ,name: name }, function (data) {

                if (data > 0) {
                    alert("供應商編號已存在");
                    $(obj).val(old);
                    $(obj).focus();
                    name = old;
                }

                $("#ctl00_ContentPlaceHolder1_FIELD_pmca04").val(name);
                $("#ctl00_ContentPlaceHolder1_FIELD_pmca04_2").val(name);

            });

            $("#ctl00_ContentPlaceHolder1_FIELD_pmca04").val(name);
                $("#ctl00_ContentPlaceHolder1_FIELD_pmca04_2").val(name);
        }
    </script>

















    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
        Caption="APMI610 View Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
        <CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <asp:Panel ID="MainPanel" runat="server">

        <table style="width: 884px" cellspacing="0" cellpadding="0" border="1">
            <tbody>
                <tr>
                    <td colspan="3">
                        <br />
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                        <br />
                        <table style="width: 1024px">
                            <tbody>
                                <tr>
                                    <td align="center" colspan="8">
                                        
                                            <asp:Image ID="img_icon" runat="server" />
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td
                                        align="center" colspan="8">
                                        <asp:Label ID="Label1" runat="server" Font-Names="新細明體" Text="供應商代號申請單" Font-Bold="True"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td
                                        align="center" colspan="8">
                                        <asp:Label ID="Label4" runat="server" Height="25px" CssClass="NormalBold"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 65px; height: 25px">
                                        <asp:Label ID="LABEL_pmca00" runat="server" CssClass="NormalBold" Text="類別"></asp:Label></td>
                                    <td
                                        style="width: 184px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmca00" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="10" ErrorMessage="Please Input「類別」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass=""></ErrorStyle>

                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <asp:Label ID="LABEL_PlantID" runat="server" CssClass="NormalBold" Text="廠別"></asp:Label></td>
                                    <td
                                        style="width: 105px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_PlantID" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="15" ErrorMessage="Please Input「PlantID」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass=""></ErrorStyle>

                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 78px">
                                        <asp:Label ID="LABEL_pmcano" runat="server" CssClass="NormalBold" Text="ERP單號"></asp:Label></td>
                                    <td
                                        style="width: 134px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmcano" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="40" ErrorMessage="Please Input「申請單號」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass=""></ErrorStyle>

                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <asp:Label ID="LABEL_pmcsn" runat="server" CssClass="NormalBold" Text="EIP單號"></asp:Label></td>
                                    <td
                                        style="width: 5px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmcsn" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="15" ErrorMessage="Please Input「Pmcsn」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass=""></ErrorStyle>

                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 65px; height: 25px">
                                        <asp:Label ID="LABEL_pmcaud15" runat="server" Width="80px" CssClass="NormalBold" Text="申請日期"></asp:Label></td>
                                    <td
                                        style="width: 184px; height: 25px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmcaud15" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="10" ErrorMessage="Please Input「申請日期」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass=""></ErrorStyle>

                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="height: 25px">
                                        <asp:Label ID="LABEL_pmcauser" runat="server" CssClass="NormalBold" Text="資料所有者"></asp:Label></td>
                                    <td
                                        style="width: 105px; height: 25px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmcauser" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="10" ErrorMessage="Please Input「資料所有者」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass=""></ErrorStyle>

                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td
                                        style="width: 78px; height: 25px">
                                        <asp:Label ID="LABEL_pmcagrup" runat="server" Width="108px" CssClass="NormalBold" Text="部門"></asp:Label></td>
                                    <td
                                        style="width: 134px; height: 25px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmcagrup" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="10" ErrorMessage="Please Input「資料所有部門」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass=""></ErrorStyle>

                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="height: 25px">
                                        <asp:Label ID="Label32" runat="server" CssClass="NormalBold" Text="原有效碼"></asp:Label></td>
                                    <td style="width: 5px; height: 25px">
                                        <asp:Label ID="Labpmcaud01" runat="server" CssClass="NormalBold"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td
                                        style="height: 25px; background-color: #cac9de" colspan="8">
                                        <asp:Label ID="Label2" runat="server" CssClass="NormalBold" Text="廠商基本資料"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 65px; height: 25px">
                                        <asp:Label ID="LABEL_pmca24" runat="server" CssClass="NormalBold" Text="統一編號"></asp:Label></td>
                                    <td
                                        style="width: 184px; height: 25px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmca24" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="20" ErrorMessage="Please Input「統一編號」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass=""></ErrorStyle>

                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="height: 25px">
                                        <asp:Label ID="LABEL_pmca03" runat="server" CssClass="NormalBold" Text="簡稱"></asp:Label></td>
                                    <td
                                        style="width: 105px; height: 25px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmca03" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="30" ErrorMessage="Please Input「簡稱」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass=""></ErrorStyle>

                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td
                                        style="width: 78px; height: 25px">
                                        <asp:Label ID="LABEL_pmca02" runat="server" CssClass="NormalBold" Text="廠商分類"></asp:Label></td>
                                    <td
                                        style="width: 134px; height: 25px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmca02" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="4" ErrorMessage="Please Input「廠商分類」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass=""></ErrorStyle>

                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="height: 25px">
                                        <asp:Label ID="LABEL_pmca14" runat="server" CssClass="NormalBold" Text="資料性質" Width="78px"></asp:Label></td>
                                    <td
                                        style="width: 5px; height: 25px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmca14" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="20" ErrorMessage="Please Input「資料性質」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass=""></ErrorStyle>

                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 65px; height: 16px">
                                        <asp:Label ID="LABEL_pmca081" runat="server" CssClass="NormalBold" Text="全名"></asp:Label></td>
                                    <td colspan="2" style="height: 16px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmca081" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="80" ErrorMessage="Please Input「全名」!!" ReadOnly="True" Width="278px">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td colspan="2" style="height: 16px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmca082" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="80" ErrorMessage="Please Input「全名」!!" ReadOnly="True" Width="262px">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td
                                        style="width: 134px; height: 16px"></td>
                                    <td
                                        style="height: 16px">
                                        <asp:Label ID="LABEL_pmca30" runat="server" CssClass="NormalBold" Text="廠商性質"></asp:Label></td>
                                    <td style="width: 5px; height: 16px">

                                        <asp:HiddenField ID="hide_pmca30" runat="server"></asp:HiddenField>

                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmca30" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="30" ErrorMessage="Please Input「廠商性質」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass=""></ErrorStyle>

                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td
                                        style="width: 65px; height: 16px">
                                        <asp:Label ID="LABEL_pmca11" runat="server" Width="73px" CssClass="NormalBold" Text="傳真號碼"></asp:Label></td>
                                    <td
                                        style="width: 184px; height: 16px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmca11" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="50" ErrorMessage="Please Input「傳真號碼」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass=""></ErrorStyle>

                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="height: 16px"></td>
                                    <td
                                        style="width: 105px; height: 16px"></td>
                                    <td
                                        style="width: 78px; height: 16px">
                                        <asp:Label ID="LABEL_pmca10" runat="server" CssClass="NormalBold" Text="電話號碼"></asp:Label></td>
                                    <td
                                        style="width: 134px; height: 16px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmca10" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="50" ErrorMessage="Please Input「電話號碼」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass=""></ErrorStyle>

                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="height: 16px">
                                        <asp:Label ID="LABEL_ta_pmca40" runat="server" CssClass="NormalBold" Text="廠商類別"></asp:Label></td>
                                    <td
                                        style="width: 5px; height: 16px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_pmca40" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="50" ErrorMessage="Please Input「電話號碼」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 65px; height: 25px">
                                        <asp:Label ID="LABEL_pmca06" runat="server" CssClass="NormalBold" Text="區域代號"></asp:Label></td>
                                    <td
                                        style="width: 184px; height: 25px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_gea02_0" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="20" ErrorMessage="Please Input「區域」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass=""></ErrorStyle>

                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="height: 25px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="LABEL_pmca07" runat="server" Width="74px" CssClass="NormalBold" Text="國別代號."></asp:Label>&nbsp;</td>
                                    <td
                                        style="width: 105px; height: 25px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_geb02_1" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="20" ErrorMessage="Please Input「國別」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass=""></ErrorStyle>

                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td
                                        style="width: 78px; height: 25px">
                                        <asp:Label ID="LABEL_pmca904" runat="server" Width="78px" CssClass="NormalBold" Text="郵遞區號 "></asp:Label></td>
                                    <td
                                        style="width: 134px; height: 25px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmca904" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="10" ErrorMessage="Please Input「郵遞區號 」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass=""></ErrorStyle>

                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="height: 25px">
                                        <asp:Label ID="LABEL_ta_pmca41" runat="server" CssClass="NormalBold" Text="類別說明"></asp:Label></td>
                                    <td
                                        style="width: 5px; height: 25px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_pmca41" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="50" ErrorMessage="Please Input「電話號碼」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 65px;"></td>
                                    <td style="width: 184px;"></td>
                                    <td></td>
                                    <td style="width: 105px;"></td>
                                    <td style="width: 78px;">
                                        <asp:Label ID="Label48" runat="server" CssClass="NormalBold" Text="股票代號"></asp:Label></td>
                                    <td style="width: 134px;">
                                        <SmoothEnterpriseWebControl:InputText ID="Tex_ta_pmca47" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="20" ErrorMessage="Please Input「稅別名稱」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <asp:Label ID="LABEL_ta_pmca42" runat="server" CssClass="NormalBold" Text="產業別"></asp:Label></td>
                                    <td style="width: 5px;">
                                        <SmoothEnterpriseWebControl:InputText ID="Inta_pmca42" runat="server" BackColor="White"
                                            BorderStyle="None" CssClass="Normal" ErrorMessage="Please Input「電話號碼」!!" MaxLength="50"
                                            ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td
                                        style="width: 65px; height: 25px">
                                        <asp:Label ID="LABEL_pmca091" runat="server" CssClass="NormalBold" Text="辦公/聯絡地址"
                                            Width="98px"></asp:Label></td>
                                    <td colspan="5" style="height: 16px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmca091" runat="server" Width="675px" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="255" ErrorMessage="Please Input「地址」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass=""></ErrorStyle>

                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="height: 16px"></td>
                                    <td
                                        style="width: 5px; height: 16px">
                                        <asp:HiddenField ID="Repatt" runat="server"></asp:HiddenField>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 65px; height: 25px">
                                        <asp:Label ID="LABEL_pmca52" runat="server" CssClass="NormalBold" Text="發票/登記地址" Width="113px"></asp:Label></td>
                                    <td colspan="6" style="height: 25px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmca52" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="255" ErrorMessage="Please Input「發票/折讓單地」!!" ReadOnly="True" Width="675px">
                                            <ErrorStyle BorderStyle="NotSet" CssClass=""></ErrorStyle>

                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 5px; height: 25px"></td>
                                </tr>
                                <tr>
                                    <td
                                        style="height: 25px; background-color: #cac9de" colspan="8">
                                        <asp:Label ID="Label3" runat="server" CssClass="NormalBold" Text="交易資料"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 65px; height: 25px">
                                        <asp:Label ID="LABEL_pmca17" runat="server" Width="78px" CssClass="NormalBold" Text="付款條件"></asp:Label></td>
                                    <td
                                        style="width: 184px">
                                        <asp:HiddenField ID="hiden_pmca17" runat="server" />
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmca17" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="10" ErrorMessage="Please Input「付款方式」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass=""></ErrorStyle>

                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <asp:Label ID="LABEL_pmca22" runat="server" CssClass="NormalBold" Text="慣用幣別"></asp:Label></td>
                                    <td
                                        style="width: 105px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmca22" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="10" ErrorMessage="Please Input「採購幣別」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass=""></ErrorStyle>

                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 78px">
                                        <asp:Label ID="LABEL_gec02_4" runat="server" Width="63px" CssClass="NormalBold" Text="慣用稅別"></asp:Label></td>
                                    <td
                                        style="width: 134px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_gec02_4" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="20" ErrorMessage="Please Input「稅別名稱」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass=""></ErrorStyle>

                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td></td>
                                    <td style="width: 5px"></td>
                                </tr>
                                <tr>
                                    <td style="width: 65px; height: 25px"></td>
                                    <td
                                        style="width: 184px"></td>
                                    <td>
                                        <asp:Label ID="LABEL_pmca911" runat="server" Width="89px" CssClass="NormalBold" Text="慣用語言"></asp:Label></td>
                                    <td
                                        style="width: 105px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmca911" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="10" ErrorMessage="Please Input「慣用語言別」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass=""></ErrorStyle>

                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 78px">
                                        <asp:Label ID="LABEL_pmca49" runat="server" Width="87px" CssClass="NormalBold" Text="價格條件 "></asp:Label></td>
                                    <td
                                        colspan="3">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_oah02_5" runat="server" Width="289px" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="100" ErrorMessage="Please Input「慣用價格條件名稱 」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass=""></ErrorStyle>

                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td colspan="8" style="height: 25px; background-color: #cac9de">
                                        <asp:Label ID="Label35" runat="server" CssClass="NormalBold" Text="財務資料"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 65px; height: 25px">
                                        <asp:Label ID="Label36" runat="server" CssClass="NormalBold" Text="最近3年度年度" Width="107px"></asp:Label></td>
                                    <td style="width: 184px">
                                        <SmoothEnterpriseWebControl:InputText ID="Tex_ta_pmca43a" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="20" ErrorMessage="Please Input「稅別名稱」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="Tex_ta_pmca44a" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="20" ErrorMessage="Please Input「稅別名稱」!!" ReadOnly="True" AutoCompleteType="Disabled">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 105px">
                                        <SmoothEnterpriseWebControl:InputText ID="Tex_ta_pmca45a" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="20" ErrorMessage="Please Input「稅別名稱」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 78px"></td>
                                    <td colspan="3"></td>
                                </tr>
                                <tr>
                                    <td style="width: 65px; height: 25px">
                                        <asp:Label ID="Label37" runat="server" CssClass="NormalBold" Text="最近3年度年度營業額" Width="138px"></asp:Label></td>
                                    <td style="width: 184px">
                                        <SmoothEnterpriseWebControl:InputText ID="Tex_ta_pmca43b" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="20" ErrorMessage="Please Input「稅別名稱」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="Tex_ta_pmca44b" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="20" ErrorMessage="Please Input「稅別名稱」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 105px">
                                        <SmoothEnterpriseWebControl:InputText ID="Tex_ta_pmca45b" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="20" ErrorMessage="Please Input「稅別名稱」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 78px"></td>
                                    <td colspan="3"></td>
                                </tr>
                                <tr>
                                    <td style="width: 65px; height: 25px">
                                        <asp:Label ID="Label38" runat="server" CssClass="NormalBold" Text="最近3年度年度稅後近利" Width="151px"></asp:Label></td>
                                    <td style="width: 184px">
                                        <SmoothEnterpriseWebControl:InputText ID="Tex_ta_pmca43c" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="20" ErrorMessage="Please Input「稅別名稱」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="Tex_ta_pmca44c" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="20" ErrorMessage="Please Input「稅別名稱」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 105px">
                                        <SmoothEnterpriseWebControl:InputText ID="Tex_ta_pmca45c" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="20" ErrorMessage="Please Input「稅別名稱」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 78px"></td>
                                    <td colspan="3"></td>
                                </tr>
                                <tr>
                                    <td style="width: 65px; height: 25px">
                                        <asp:Label ID="Label39" runat="server" CssClass="NormalBold" Text="最近年度" Width="107px"></asp:Label></td>
                                    <td style="width: 184px">
                                        <SmoothEnterpriseWebControl:InputText ID="Tex_ta_pmca46a" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="20" ErrorMessage="Please Input「稅別名稱」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td></td>
                                    <td style="width: 105px"></td>
                                    <td style="width: 78px"></td>
                                    <td colspan="3"></td>
                                </tr>
                                <tr>
                                    <td style="width: 65px; height: 25px">
                                        <asp:Label ID="Label40" runat="server" CssClass="NormalBold" Text="最近年度流動資產" Width="140px"></asp:Label></td>
                                    <td style="width: 184px">
                                        <SmoothEnterpriseWebControl:InputText ID="Tex_ta_pmca46b" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="20" ErrorMessage="Please Input「稅別名稱」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <asp:Label ID="Label41" runat="server" CssClass="NormalBold" Text="最近年度資產總額" Width="140px"></asp:Label></td>
                                    <td style="width: 105px">
                                        <SmoothEnterpriseWebControl:InputText ID="Tex_ta_pmca46c" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="20" ErrorMessage="Please Input「稅別名稱」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 78px">
                                        <asp:Label ID="Label42" runat="server" CssClass="NormalBold" Text="最近年度流動負債" Width="140px"></asp:Label></td>
                                    <td colspan="3">
                                        <SmoothEnterpriseWebControl:InputText ID="Tex_ta_pmca46d" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="20" ErrorMessage="Please Input「稅別名稱」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 65px; height: 25px">
                                        <asp:Label ID="Label43" runat="server" CssClass="NormalBold" Text="最近年度負債總額" Width="140px"></asp:Label></td>
                                    <td style="width: 184px">
                                        <SmoothEnterpriseWebControl:InputText ID="Tex_ta_pmca46e" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="20" ErrorMessage="Please Input「稅別名稱」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td>
                                        <asp:Label ID="Label44" runat="server" CssClass="NormalBold" Text="最近年度淨資產價值" Width="140px"></asp:Label></td>
                                    <td style="width: 105px">
                                        <SmoothEnterpriseWebControl:InputText ID="Tex_ta_pmca46f" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="20" ErrorMessage="Please Input「稅別名稱」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 78px">
                                        <asp:Label ID="Label46" runat="server" CssClass="NormalBold" Text="最近年度營業活動淨現金流量"
                                            Width="120px"></asp:Label></td>
                                    <td colspan="3">
                                        <SmoothEnterpriseWebControl:InputText ID="Tex_ta_pmca46g" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="20" ErrorMessage="Please Input「稅別名稱」!!" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 65px; height: 25px">
                                        <asp:Label ID="Label47" runat="server" CssClass="NormalBold" Text="財務資料說明備註" Width="140px"></asp:Label></td>
                                    <td colspan="7">
                                        <SmoothEnterpriseWebControl:InputText ID="Tex_ta_pmca48" runat="server" BorderStyle="None" BackColor="White" CssClass="Normal" MaxLength="10" ErrorMessage="Please Input「採購幣別」!!" ReadOnly="True" Width="778px">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td
                                        style="height: 25px; background-color: #cac9de" colspan="8">
                                        <asp:Label ID="Label6" runat="server" ForeColor="Black" CssClass="NormalBold" Text="採購人員作業"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 65px; height: 25px">
                                        <asp:Label ID="LABEL_pmca23" runat="server" Width="96px" CssClass="NormalBold" Text="申請原因類別"></asp:Label></td>
                                    <td
                                        style="width: 184px; height: 25px">
                                        <asp:DropDownList ID="List1" runat="server" Width="136px" CssClass="Normal">
                                            <asp:ListItem Value="1">價格優勢</asp:ListItem>
                                            <asp:ListItem Value="2">交期優勢</asp:ListItem>
                                            <asp:ListItem Value="3">服務優勢</asp:ListItem>
                                            <asp:ListItem Value="4">客戶指定</asp:ListItem>
                                            <asp:ListItem Value="5">唯一供應商</asp:ListItem>
                                            <asp:ListItem Value="X">其他</asp:ListItem>
                                        </asp:DropDownList><br />
                                        <asp:DropDownList ID="List2" runat="server" Width="136px" CssClass="Normal" Visible="False">
                                            <asp:ListItem Value="1">銀行資料變更</asp:ListItem>
                                            <asp:ListItem Value="2">付款條件變更</asp:ListItem>
                                            <asp:ListItem Value="X">其他</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td style="height: 25px">
                                        <asp:Label ID="Label5" runat="server" CssClass="NormalBold" Text="說明"></asp:Label></td>
                                    <td
                                        style="height: 25px" colspan="3">
                                        <SmoothEnterpriseWebControl:InputText ID="InpPurDesc1" runat="server" Width="290px" BackColor="White" CssClass="Normal" MaxLength="20" ErrorMessage="Please Input「統一編號」!!" BorderStyle="None" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet"></ErrorStyle>

                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="height: 25px"></td>
                                    <td style="width: 5px; height: 25px"></td>
                                </tr>
                                <tr>
                                    <td style="height: 25px"
                                        colspan="2">
                                        <asp:Label ID="Label7" runat="server" Width="241px" CssClass="NormalBold" Text="小於月結90天說明原因及每月交易金額"></asp:Label></td>
                                    <td
                                        style="height: 25px" colspan="4">
                                        <SmoothEnterpriseWebControl:InputText ID="InpPurDesc2" runat="server" Width="393px" BackColor="White" CssClass="Normal" MaxLength="20" ErrorMessage="Please Input「統一編號」!!" BorderStyle="None" ReadOnly="True">
                                            <ErrorStyle BorderStyle="NotSet" CssClass=""></ErrorStyle>

                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="height: 25px"></td>
                                    <td
                                        style="width: 5px; height: 25px"></td>
                                </tr>
                                <tr>
                                    <td
                                        style="width: 65px;" rowspan="2">
                                        <asp:Label ID="Label45" runat="server" CssClass="NormalBold" Text="上傳檔案"></asp:Label></td>
                                    <td
                                        colspan="4" style="height: 75px">
                                        <asp:Panel ID="Panel2" runat="server">
                                        </asp:Panel>
                                    </td>
                                    <td valign="top"
                                        colspan="3" style="height: 75px"></td>
                                </tr>
                                <tr>
                                    <td colspan="7" style="height: 11px" valign="top">
                                        <asp:Label ID="Label30" runat="server" CssClass="NormalBold" Text="檢附公司印鑑章(大小章)及發票章,匯款資料文件(銀行存摺影本)及公司變更登記"></asp:Label></td>
                                </tr>
                            </tbody>
                        </table>
                        <asp:Panel ID="Panel1" runat="server">
                            <table style="width: 1052px">
                                <tr>
                                    <td colspan="6" style="height: 1px; background-color: #99cc66">
                                        <asp:Label ID="Label9" runat="server" CssClass="NormalBold" ForeColor="Black" Text="財務人員作業-Payment"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 106px">
                                        <asp:Label ID="LABEL_pmca01" runat="server" Width="93px" CssClass="NormalBold" Text="供應廠商編號"></asp:Label></td>
                                    <td style="width: 125px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmca01" runat="server" BackColor="White" CssClass="Normal" MaxLength="10" ErrorMessage="Please Input「供應廠商編號」!!" Width="91px">
                                            <ErrorStyle BorderStyle="NotSet" CssClass=""></ErrorStyle>

                                            <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                        </SmoothEnterpriseWebControl:InputText>
                                        <asp:Image ID="Image4" runat="server" onclick="OpenWin4()" ImageUrl="~/gif/icon-zoom.gif" /></td>
                                    <td style="width: 6px">
                                        <asp:Label ID="LABEL_pmca04" runat="server" CssClass="NormalBold" Text="付款廠商編號" Width="106px"></asp:Label></td>
                                    <td>
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmca04" runat="server" BackColor="White" CssClass="Normal" MaxLength="10" ErrorMessage="Please Input「付款廠商編號」!!">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                    <td style="width: 218px">
                                        <asp:Label ID="Label31" runat="server" CssClass="NormalBold" Text="出貨廠商編號" Width="106px"></asp:Label></td>
                                    <td style="width: 309px">
                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_pmca04_2" runat="server" BackColor="White" CssClass="Normal" MaxLength="10" ErrorMessage="Please Input「付款廠商編號」!!">
                                            <ErrorStyle BorderStyle="NotSet" />
                                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                        </SmoothEnterpriseWebControl:InputText></td>
                                </tr>
                                <tr>
                                    <td style="width: 106px">
                                        <asp:CheckBox ID="CheckBox1" runat="server" CssClass="NormalBold" Text="是否為關係人" /></td>
                                    <td style="width: 125px">
                                        <asp:CheckBox ID="CheckBox2" runat="server" CssClass="NormalBold" Text="是否代扣稅款或補充保費" Width="185px" /></td>
                                    <td style="width: 6px">
                                        <asp:CheckBox ID="CheckBox3" runat="server" CssClass="NormalBold" Text="B2B廠商否" Width="114px" /></td>
                                    <td></td>
                                    <td style="width: 218px"></td>
                                    <td style="width: 309px"></td>
                                </tr>
                                <tr>
                                    <td style="width: 106px">
                                        <asp:Label ID="Label8" runat="server" CssClass="NormalBold" Text="通知"></asp:Label></td>
                                    <td style="width: 125px">
                                        <asp:DropDownList ID="LisRes" runat="server" CssClass="NormalBold" Width="131px">
                                            <asp:ListItem Value="0">不通知</asp:ListItem>
                                            <asp:ListItem Value="1">E-Mail</asp:ListItem>
                                            <asp:ListItem Value="2">FAX</asp:ListItem>
                                            <asp:ListItem Value="3">電話</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td style="width: 6px"></td>
                                    <td></td>
                                    <td style="width: 218px"></td>
                                    <td style="width: 309px"></td>
                                </tr>
                                <tr>
                                    <td style="width: 106px; height: 15px;">
                                        <asp:Label ID="Label10" runat="server" CssClass="NormalBold" Text="台幣銀行帳號"></asp:Label></td>
                                    <td colspan="2" style="height: 15px">
                                        <asp:TextBox ID="TexBankAco" runat="server" Width="335px"></asp:TextBox></td>
                                    <td style="height: 15px">
                                        <asp:Label ID="Label11" runat="server" CssClass="NormalBold" Text="台幣匯款銀行編號" Width="113px"></asp:Label></td>
                                    <td style="height: 15px; width: 218px;">
                                        <asp:TextBox ID="TexBankSn" runat="server" AutoCompleteType="Disabled" Width="136px"></asp:TextBox>
                                        <asp:Image ID="Image3" runat="server" onclick="OpenWin()" ImageUrl="~/gif/icon-zoom.gif" />
                                    </td>
                                    <td style="width: 309px; height: 15px;">
                                        <asp:TextBox ID="TexBankName" runat="server" AutoCompleteType="Disabled" Width="154px"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 106px; height: 15px">
                                        <asp:Label ID="Label12" runat="server" CssClass="NormalBold" Text="台幣收款人戶名" Width="136px"></asp:Label></td>
                                    <td colspan="2" style="height: 15px">
                                        <asp:TextBox ID="TxtRecName" runat="server" Width="335px"></asp:TextBox></td>
                                    <td style="height: 15px"></td>
                                    <td style="height: 15px; width: 218px;"></td>
                                    <td style="width: 309px; height: 15px"></td>
                                </tr>
                                <tr>
                                    <td style="height: 1px; background-color: #99cc66;" colspan="6"></td>
                                </tr>
                                <tr>
                                    <td style="width: 106px">
                                        <asp:Label ID="Label14" runat="server" CssClass="NormalBold" Text="外幣受款人帳號" Width="166px"></asp:Label></td>
                                    <td colspan="2">
                                        <asp:TextBox ID="Texpmca02" runat="server" Width="290px" MaxLength="50"></asp:TextBox></td>
                                    <td>
                                        <asp:Label ID="Label13" runat="server" CssClass="NormalBold" Text="外幣匯款性質編號" Width="129px"></asp:Label></td>
                                    <td colspan="2">
                                        <asp:TextBox ID="Texpmca01" runat="server" Width="73px" MaxLength="3"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 106px">
                                        <asp:Label ID="Label15" runat="server" CssClass="NormalBold" Text="外幣受款人名稱" Width="166px"></asp:Label></td>
                                    <td colspan="2">
                                        <asp:TextBox ID="Texpmca03" runat="server" Width="299px" MaxLength="150"></asp:TextBox></td>
                                    <td>
                                        <asp:Label ID="Label16" runat="server" CssClass="NormalBold" Text="外幣受款人swift code" Width="142px"></asp:Label></td>
                                    <td colspan="2">
                                        <asp:TextBox ID="Texpmca04" runat="server" Width="299px" MaxLength="100"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 106px">
                                        <asp:Label ID="Label18" runat="server" CssClass="NormalBold" Text="外幣受款人銀行名稱" Width="148px"></asp:Label></td>
                                    <td colspan="2">
                                        <asp:TextBox ID="Texpmca05" runat="server" Width="299px" MaxLength="140"></asp:TextBox></td>
                                    <td>
                                        <asp:Label ID="Label20" runat="server" CssClass="NormalBold" Text="外幣中間銀行swift code" Width="149px"></asp:Label></td>
                                    <td colspan="2">
                                        <asp:TextBox ID="Texpmca06" runat="server" Width="299px" MaxLength="100"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 106px; height: 12px;">
                                        <asp:Label ID="Label17" runat="server" CssClass="NormalBold" Text="外幣中間銀行名稱" Width="132px"></asp:Label></td>
                                    <td colspan="2" style="height: 12px">
                                        <asp:TextBox ID="Texpmca07" runat="server" Width="299px" MaxLength="140"></asp:TextBox></td>
                                    <td style="height: 12px">
                                        <asp:Label ID="Label19" runat="server" CssClass="NormalBold" Text="外幣費用明細" Width="87px"></asp:Label></td>
                                    <td colspan="2" style="height: 12px">
                                        <asp:DropDownList ID="Lispmca08" runat="server" CssClass="NormalBold" Width="131px">
                                            <asp:ListItem>SHA</asp:ListItem>
                                            <asp:ListItem>OUR</asp:ListItem>
                                            <asp:ListItem>BEN</asp:ListItem>
                                        </asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td style="width: 106px; height: 12px">
                                        <asp:Label ID="Label21" runat="server" CssClass="NormalBold" Text="外幣交易國別" Width="120px"></asp:Label></td>
                                    <td colspan="2" style="height: 12px">
                                        <asp:DropDownList ID="Lispmca09" runat="server" CssClass="NormalBold" Width="196px">
                                        </asp:DropDownList></td>
                                    <td style="height: 12px">
                                        <asp:CheckBox ID="CheRes" runat="server" CssClass="NormalBold" Text="拍發兩通電文" /></td>
                                    <td style="height: 12px; width: 218px;"></td>
                                    <td style="width: 309px; height: 12px"></td>
                                </tr>
                                <tr>
                                    <td style="width: 106px; height: 12px"></td>
                                    <td style="width: 125px; height: 12px"></td>
                                    <td style="width: 6px; height: 12px"></td>
                                    <td style="height: 12px"></td>
                                    <td style="height: 12px; width: 218px;"></td>
                                    <td style="width: 309px; height: 12px"></td>
                                </tr>
                                <tr>
                                    <td style="width: 106px; height: 12px"></td>
                                    <td style="width: 125px; height: 12px"></td>
                                    <td style="width: 6px; height: 12px"></td>
                                    <td style="height: 12px"></td>
                                    <td style="height: 12px; width: 218px;">
                                        <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox></td>
                                    <td style="width: 309px; height: 12px">
                                        <asp:Button ID="Button1" runat="server" OnClientClick="return c1()" Text="Button" Visible="False" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 106px; height: 12px"></td>
                                    <td style="width: 125px; height: 12px"></td>
                                    <td style="width: 6px; height: 12px"></td>
                                    <td style="height: 12px"></td>
                                    <td style="height: 12px; width: 218px;"></td>
                                    <td style="width: 309px; height: 12px"></td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="height: 1px; background-color: #99cc66">
                                        <asp:Label ID="Label22" runat="server" CssClass="NormalBold" ForeColor="Black" Text="財務人員作業-供應商聯絡人資料"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="6">
                                        <asp:Image ID="Image2" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/PManagement/images/list.png"
                                            Width="20px" /><asp:Label ID="Label28" runat="server" Font-Bold="True" Font-Size="X-Small"
                                                ForeColor="Blue" Text="供應商聯絡人資料"></asp:Label><input onclick="addnew2();" style="border-right: #000000 1px solid; border-top: #000000 1px solid; font-weight: bold; font-size: 12px; background: #c8c8c8; border-left: #000000 1px solid; border-bottom: #000000 1px solid; height: 22px; font-names: Arial"
                                                    type="button" value="增加項次" /></td>
                                </tr>
                                <tr>
                                    <td colspan="6">
                                        <table id="table2" cellpadding="2" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <td align="center" bgcolor="#fff0f5" style="height: 27px" width="50">
                                                        <asp:Label ID="Label29" runat="server" CssClass="NormalBold" Text="序號"></asp:Label></td>
                                                    <td align="center" bgcolor="#fff0f5" style="width: 75px; height: 27px">
                                                        <asp:Label ID="Label100" runat="server" CssClass="NormalBold" Text="類別"></asp:Label></td>
                                                    <td align="center" bgcolor="#fff0f5" style="width: 97px; height: 27px">
                                                        <asp:Label ID="Label24" runat="server" CssClass="NormalBold" Text="聯絡人"></asp:Label></td>
                                                    <td align="center" bgcolor="#fff0f5" style="width: 102px; height: 27px">
                                                        <asp:Label ID="Label23" runat="server" Width="72px" CssClass="NormalBold" Text="聯絡電話"></asp:Label></td>
                                                    <td align="center" bgcolor="#fff0f5" style="width: 53px; height: 27px">
                                                        <asp:Label ID="Label26" runat="server" CssClass="NormalBold" Text="主要"></asp:Label>&nbsp;</td>
                                                    <td align="center" bgcolor="#fff0f5" style="width: 207px; height: 27px">
                                                        <asp:Label ID="Label27" runat="server" CssClass="NormalBold" Text="備註"></asp:Label></td>
                                                    <td align="center" bgcolor="#fff0f5" style="height: 27px; width: 224px;">
                                                        <asp:Label ID="Label25" runat="server" CssClass="NormalBold" Text="E-mail"></asp:Label></td>
                                                    <td align="center" bgcolor="#fff0f5" style="height: 27px" width="140"></td>
                                                </tr>
                                                <tr id="remind" align="center">
                                                    <td colspan="8" style="height: 24px">
                                                        <asp:Label ID="Label33" runat="server" Font-Bold="True" Font-Size="X-Small" ForeColor="Black"
                                                            Text="尚未增加項次"></asp:Label></td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>

                                <tr>
                                    <td></td>
                                    <td colspan="5"></td>

                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td style="width: 218px"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td style="width: 218px"></td>
                                    <td></td>
                                </tr>


                            </table>
                        </asp:Panel>
                        <br />
                    </td>
                </tr>
            </tbody>
        </table>






    </asp:Panel>

    <table border="0" class="Normal">
        <tr>
            <td style="height: 357px">&nbsp;<SmoothEnterpriseWebControlFlowwork:FlowFeedback ID="FlowFeedback1" runat="server"
                BackColor="#F0F0F0" BorderColor="#E0E0E0" BorderStyle="Solid" BorderWidth="1px"
                CssClass="normal" Font-Size="12px" OnFeedbackComplete="FlowFeedback1_FeedbackComplete"
                OnFlowNodeComplete="FlowFeedback1_FlowNodeComplete" OnFlowStop="FlowFeedback1_FlowStop"
                RedirectAfterCommit="False" Width="1024px">
                <Results>
                    <SmoothEnterpriseWebControlFlowwork:FlowResult ID="flowResult1" runat="server" ResultType="Next"
                        Text="同意" Width="120px" />
                    <SmoothEnterpriseWebControlFlowwork:FlowResult ID="flowResult2" runat="server" ResultType="Back"
                        Text="退回(退至上一關)" Width="200px" />
                    <SmoothEnterpriseWebControlFlowwork:FlowResult ID="FlowResult3" runat="server" ResultType="Return"
                        Text="退回(退至提案人)" Width="200px" />
                </Results>
                <ReplyTemplate>
                    <asp:Label ID="Label3" runat="server" Text="請輸入簽核意見："></asp:Label>
                    &nbsp;<br />
                    <SmoothEnterpriseWebControl:InputText ID="Input_Comment" runat="server" BackColor="#F0F0F0"
                        CssClass="Normal" Height="26px" Width="1008px">
                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    </SmoothEnterpriseWebControl:InputText>
                    <br />
                    <asp:Button ID="BUTTON_FlowFeedback" runat="server" CssClass="NormalBold" Height="31px"
                        OnClick="BUTTON_FlowFeedback_Click" Text="送出" Width="91px" /><br />
                    <SmoothEnterpriseWebControl:InputText ID="InputText3" runat="server" BackColor="#F0F0F0"
                        CssClass="Normal" Visible="False" Width="209px">
                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    </SmoothEnterpriseWebControl:InputText>&nbsp;
                        <SmoothEnterpriseWebControl:InputText ID="IniReviewer" runat="server" BackColor="#F0F0F0"
                            ButtonClick="True" ButtonIconUrl="" CssClass="Normal" DateSeparator="Slash" DateType="YYYYMMDD"
                            ErrorMessage="" FocusColor="" FormatType="None" Height="25px" HiddenMode="False"
                            HTMLMode="Advance" IsValid="True" OnClickMore="" Personalize="False" Required="False"
                            Rows="1" Visible="False" Width="45px">
                            <ErrorStyle BorderStyle="NotSet" />
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText>
                </ReplyTemplate>
            </SmoothEnterpriseWebControlFlowwork:FlowFeedback>
                <br />
                <SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer ID="FlowFeedbackViewer1" runat="server"
                    BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" CssClass="Normal"
                    Font-Size="11px" OnOnLoadHistory="FlowFeedbackViewer1_OnLoadHistory">
                    <Columns>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="No" Label="" />
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Node" Label="" />
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="ReviewerPhoto"
                            Label="" />
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Reviewer" Label="" />
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Initdate" Label="" />
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Receivedate" Label="" />
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Reviewdate" Label="" />
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Result" Label="" />
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="ResultIcon" Label="" />
                    </Columns>
                    <HistoryTemplate>
                        &nbsp;
                        <SmoothEnterpriseWebControl:InputText ID="S_Comment" runat="server" CssClass="Normal"
                            ForeColor="Red" Height="30px" Width="586px">
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText>
                        <asp:Image ID="Image1" runat="server" />&nbsp;
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/gif/AppDeputy.png" />
                    </HistoryTemplate>
                </SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer>

            </td>
        </tr>
    </table>
    <table border="0" class="Normal" style="width: 625px">
        <tr>
            <td style="height: 24px; width: 477px;">
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Text="回上頁" Width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_back_Click">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
                <SmoothEnterpriseWebControl:InputButton ID="InputButton1" runat="server" Text="儲存" Width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="InputButton1_Click" Visible="False">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;<SmoothEnterpriseWebControl:InputButton ID="InputButton2" runat="server" Text="產生txt" Width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="InputButton2_Click1" Visible="False">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;<asp:Button ID="Button2" runat="server"
                    OnClick="Button2_Click" Text="TEXXX" Visible="False" />
                &nbsp;
                <asp:Button ID="Button3" runat="server"
                    OnClick="Button2_Click" Text="test  mail2" Visible="False" /></td>
        </tr>
    </table>
</asp:Content>
