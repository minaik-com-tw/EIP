<%@ Page Title="" Language="C#" MasterPageFile="~/_site/layout/ie_Edge.master" AutoEventWireup="true" CodeFile="LeicaAdd.aspx.cs" Inherits="Leica.LeicaAdd" StylesheetTheme="Edge" Culture="Auto" UICulture="Auto" Debug="true" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <header>

        <script src="js/Leica.js"></script>
        <script>
            var curr_page = "";
            $(function () {

               // $("#ft_Area").css("display", "none");
                $("#ctl00_ContentPlaceHolder1_up_vmi").css("display", "none");

                $("#ctl00_ContentPlaceHolder1_up_vmi").addClass("t1");
                $("#ctl00_ContentPlaceHolder1_up_ft").addClass("t1");
                $("#ctl00_ContentPlaceHolder1_up_list").addClass("t1");

                $("#ctl00_ContentPlaceHolder1_ddl_inspect").change(function () {
                    var inspect = $(this).find(":selected").val();

                    if (inspect != "") {
                        $(this).parent().css("background-color", "#fff");
                    }


                    $("#ctl00_ContentPlaceHolder1_txt_insp_count").val("0");
                    $("#ctl00_ContentPlaceHolder1_txt_samp_count").val("0");
                    $('#ctl00_ContentPlaceHolder1_ddl_sp_stand')[0].selectedIndex = 0;

                    $("#ctl00_ContentPlaceHolder1_txt_insp_count").focus();
                });

                $(".qty").focusout(function () {

                    Nomarl.int($(this));

                    var qty = $(this).val();
                    if (qty == 0) {
                        alert($("#is_zero").text());
                    }
                });

                $(".AutoPost").change(function () {

                    var parent_id = $(this).val();

                    if (parent_id == "") {
                        var Level = $(this).attr("level");
                        clear_list(Level);
                    }
                    else {
                        getOption($(this));
                    }

                });

                $("#ctl00_ContentPlaceHolder1_ddl_sp_stand").change(function () {
                    stand_chnage();
                });

                $("#ctl00_ContentPlaceHolder1_msg").change(function () {
                    var msg = $(this).val();

                    if (typeof msg == "undefined") //預備沒有找到msg 預設為空
                    {
                        msg = "";
                    }

                    if (msg !== "") {
                        alert(msg);
                    }
                });

                curr_page = $("#ctl00_ContentPlaceHolder1_curr_page").val();

                if (curr_page == "VMI") {
                    $("#ctl00_ContentPlaceHolder1_up_vmi").css("display", "block");
                }
                if (curr_page == "Performance") {
                    $("#ft_Area").css("display", "block");
                }

            });

            function clear_list(curr) {
                var curr_obj = curr * 1;

                $(".AutoPost").each(function () {
                    var level = $(this).attr("level") * 1;
                    if (curr_obj > level) {

                        $(this).val("");
                        $(this).attr("disabled", true);
                    }
                    $(this).empty();
                });

            }

            function stand_chnage() {
                var standard = $("#ctl00_ContentPlaceHolder1_ddl_sp_stand").val();
                var sample = $("#ctl00_ContentPlaceHolder1_txt_insp_count").val();


                $.ajax({
                    url: 'leicaconnector.ashx',                        // url位置
                    type: 'post',                   // post/get
                    data: {
                        type: "standard",
                        stand_id: standard,
                        sample: sample

                    },       // 輸入的資料
                    error: function error(xhr, status, error) {
                        $("#debug").html(xhr.responseText);

                    },      // 錯誤後執行的函數
                    success: function (data) {

                        if (data == "") {
                            data = "0";
                        }
                        $("#ctl00_ContentPlaceHolder1_txt_samp_count").val(data)



                    }// 成功後要執行的函數
                });
            }

            function getOption(obj) {

                var parent_id = $(obj).val();
                var next_name = $(obj).attr("Next");


                $.ajax({
                    url: 'leicaconnector.ashx',                        // url位置
                    type: 'post',                   // post/get
                    data: {
                        type: "option",
                        parent_id: parent_id

                    },       // 輸入的資料
                    error: function error(xhr, status, error) {
                        $("#debug").html(xhr.responseText);

                    },      // 錯誤後執行的函數
                    success: function (data) {

                        var next_obj = "#ctl00_ContentPlaceHolder1_ddl_" + next_name;
                        $(next_obj).attr("disabled", false);
                        $(next_obj).empty();
                        var select = "";
                        for (var i = 0; i < data.length; i++) {

                            var option = "<option value='" + data[i]["value"] + "'>" + data[i]["text"] + "</option>";
                            if (data[i]["selected"]) {
                                $(next_obj).val(data[i]["value"]);
                            }


                            $(next_obj).append(option);
                        }

                    }// 成功後要執行的函數
                });
            }

            function add_inspct() {

                var pass = false;

                if (check_head()) {

                    var inspect = $("#ctl00_ContentPlaceHolder1_ddl_inspect").val();

                    //$("#ft_Area").css("display", "none");
                    //$("#ctl00_ContentPlaceHolder1_up_vmi").css("display", "none");
                    $("#ctl00_ContentPlaceHolder1_ddl_inspect").parent().css("background-color", "#fff");

                    //if (inspect != "") {
                    //    if (inspect == "vmi") {

                    //        $("#ctl00_ContentPlaceHolder1_up_vmi").css("display", "block");
                    //    }
                    //    else {

                    //        $("#ft_Area").css("display", "block");
                    //    }

                    pass = true;
                }
                else {
                    var msg = $("#inspect_empty").text();
                    $("#ctl00_ContentPlaceHolder1_ddl_inspect").parent().css("background-color", "red");
                    alert(msg);
                    pass = false;
                }
                return pass;
            }

            function check_head() {
                var isPadd = true;
                $("#head").find(".required").each(function () {

                    $(this).parent().removeClass("wrong");
                    var value = $(this).val();
                    if (value == "" || value == null) {

                        $(this).parent().addClass("wrong");
                        isPadd = false;
                    }

                });

                $("#lbase").find(".required").each(function () {

                    $(this).parent().removeClass("wrong");
                    var value = $(this).val();
                    if (value == "" || value == null) {
                        $(this).parent().addClass("wrong");
                        isPadd = false;
                    }
                });
                if (!isPadd) {
                    alert($("#required").text());
                }

                return isPadd;
                //return true;
            }

            function add_shape() {
                var pass = true;

                $("#ctl00_ContentPlaceHolder1_ddl_shape").css("background-color", "#fff");
                var shape = $("#ctl00_ContentPlaceHolder1_ddl_shape").val();

                if (shape == "") {

                    alert($("#required").text());
                    $("#ctl00_ContentPlaceHolder1_ddl_shape").css("background-color", "red");
                    pass = false;

                }

                return pass;
            }

            function vmi_add() {

                var isPadd = true;
                $("#ctl00_ContentPlaceHolder1_up_vmi").find(".required").each(function () {

                    $(this).parent().removeClass("wrong");
                    var value = $(this).val();
                    if (value == "" || value == null) {
                        $(this).parent().addClass("wrong");
                        isPadd = false;
                    }
                });


                if (isPadd) {
                    //   var tds = $(originalTable).children('tbody').children('tr').children('td').length;
                    var td = $("#ctl00_ContentPlaceHolder1_up_vmi").find("#ctl00_ContentPlaceHolder1_stemp_list").find("td").length;
                    $("#ctl00_ContentPlaceHolder1_ddl_shape").parent().removeClass("wrong");
                    if (td == 0) {
                        $("#ctl00_ContentPlaceHolder1_ddl_shape").parent().addClass("wrong");
                        isPadd = false;
                    }
                }

                if (!isPadd) {
                    alert($("#required").text());
                }

                return isPadd;
            }


            function cancel() {

                var ispass = false;
                var msg = "是否要放棄已輸入的資料?";
                if (confirm(msg) == true) {
                    ispass = true;
                }

                return ispass;
            }

            function Leica_chk() {

                var isPass = false;

                isPass = check_head();
                if (isPass) {
                    var all_count = $("#ctl00_ContentPlaceHolder1_all_count").text();
                    if (all_count == "0") {

                        alert($("#all_empty").text());
                        isPass = false;
                    }
                    else {
                        isPass = true;
                    }
                }
                return isPass;
            }

            function ft_add_chk() {

                var isPadd = false;

                if (add_inspct()) {

                    var isPadd = true;
                    $("#ft_left").find(".required").each(function () {

                        $(this).parent().removeClass("wrong");
                        var value = $(this).val();

                        if (value == "" || value == null) {
                            $(this).parent().addClass("wrong");
                            isPadd = false;
                        }
                    });

                    if (!isPadd) {
                        alert($("#required").text());
                    }
                }


                return isPadd;
            }

            function S5_add_chk() {


                var isPadd = true;
                $("#ft_right").find(".required").each(function () {

                    $(this).parent().removeClass("wrong");
                    var value = $(this).val();

                    if (value == "" || value == null) {
                        $(this).parent().addClass("wrong");
                        isPadd = false;
                    }
                });

                if (!isPadd) {
                    alert($("#required").text());
                }

                return isPadd;
            }

            function Svr_Replay(msg) {
                alert(msg);
            }

        </script>

        <style type="text/css">
            .tb1 {
                border: 1px solid #B19693;
                width: 100%;
                border-spacing: 0px;
            }



            .Tempty .td {
                border-left: 0px solid #8a988e;
                border-top: 0px solid #8a988e;
                text-align: center;
            }

            .td, .th {
                font-size: 0.9em;
                vertical-align: middle;
                width: 180px;
                border: 1px solid #8a988e;
                height: 25px;
                margin: 0px;
                padding: 2px 2px 2px 2px;
            }

                .td input, .td select {
                    width: 120px;
                    height: 22px;
                }

            .th {
                /*color: #FCFEEF;
                        background-color: #1E88A8;*/
                font-weight: bolder;
                width: 120px;
                text-align: right;
                color: #7B90D2;
                background-color: #FCF4F5;
            }

            #head .th {
                /*background-color: #A5A051;
                    color: #FCFEEF;*/
                font-weight: bolder;
                text-align: right;
                width: 110px;
                color: #A5A051;
            }

            #lbase .th {
                /*background-color: #bf3553;
                    color: #fff;*/
                background-color: #fff3ee;
                color: #bf3553;
                font-weight: bolder;
                text-align: right;
                width: 110px;
            }

            #head {
                margin-top: 10px;
                padding: 4px 4px 4px 4px;
                border: 2px solid #74759b;
            }

            .add_btn {
                position: relative;
                color: #41ae3c;
                font-size: 2em;
                text-shadow: #5e665b 2px 2px 1px;
                cursor: pointer;
                text-decoration: none;
            }

                .add_btn:hover {
                    color: #96c24e;
                    font-size: 2em;
                }



            /*.fa-pen {
                color: #fff;
                text-shadow: #bf3553 2px 2px 1px;
            }

                .fa-pen :hover {
                    color: yellowgreen;
                }*/

            #leica .cell {
                display: table-cell;
                text-align: center;
                vertical-align: top;
            }

            .t1 {
                padding: 4px 4px 4px 4px;
                border: 2px solid #74759b;
                border-top: 0px solid #74759b;
            }




            #ctl00_ContentPlaceHolder1_up_vmi .cell {
                padding: 4px 4px 4px 4px;
            }



            #ctl00_ContentPlaceHolder1_up_vmi .th {
                background-color: #F4F6F7;
                color: #5e665b;
            }

            /* fontawesome merge */

            .fa-merge {
                position: relative;
                display: inline-block;
                width: 1em;
                height: 1em;
                line-height: 1em;
                vertical-align: middle;
                font-size: 0.8em;
                padding: 0.2em;
                cursor: pointer;
            }

            .fa-minus {
                color: #fff;
                font-size: 0.8em;
                text-shadow: #5e665b 0.1em 0.1em 0.15em;
            }

                .fa-minus:hover {
                    color: #74759b;
                    font-size: 0.8em;
                }

            .fa-pen-square, .fa-angle-double-down {
                position: relative;
                color: #005CAF;
                text-shadow: #c5c5ce 2px 2px 1px;
                cursor: pointer;
                text-decoration: none;
            }

                .fa-pen-square:hover, .fa-angle-double-down:hover {
                    font-size: 3em;
                    color: #4588C4;
                    text-shadow: #005CAF 1px 1px 1px;
                }

            #ft_left .th {
                background-color: #B5CAA0;
                color: #0B346E;
            }

            .fa-clock {
                color: #4588C4;
                text-shadow: #484891 1px 1px 2px;
            }

                .fa-clock:hover {
                    color: red;
                    text-shadow: #005CAF 1px 1px 1px;
                }
            /*-----------------------------------*/
            div.time-picker {
                position: absolute;
                height: 200px;
                width: 60px; /* needed for IE */
                overflow: auto;
                background: #fff;
                border: 1px solid #000;
                z-index: 99;
                margin-top: 1.1em;
            }

            div.time-picker-12hours {
                width: 90px; /* needed for IE */
            }

            div.time-picker ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
            }

            div.time-picker li {
                padding: 1px;
                cursor: pointer;
            }

                div.time-picker li.selected {
                    background: #316AC5;
                    color: #fff;
                }

            #ctl00_ContentPlaceHolder1_up_s5 {
                
                border:0px solid #bf3553;
            }
        </style>
    </header>
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>


    <div id="leica" style="margin: 10px; width: 1200px">
        <div style="display: none">
            <!--隱藏傳Server的預設資訊-->

            <asp:HiddenField ID="head_id" runat="server" />
            <asp:HiddenField ID="base_id" runat="server" />
            <asp:HiddenField ID="curr_page" runat="server" />

            <asp:HiddenField ID="msg" runat="server" />

            <div id="integer"><%=getStr("integer")%></div>
            <div id="inspect_empty"><%=getStr("inspect_empty") %></div>
            <div id="required"><%=getStr("required") %></div>
            <div id="isNum"><%=getStr("isnum") %></div>

            <div id="more_zero"><%=getStr("more_zero")%></div>
            <div id="is_zero"><%=getStr("is_zero")%></div>
            <div id="all_empty"><%=getStr("all_empty")%></div>
        </div>
        <div style="font-size: 2em; color: #9b1e64; height: 35px; font-weight: bolder;">
            Leica Inspection Record             
        </div>
        <div id="head" class="t1">
            <div class="tb1">
                <div class="tr">
                    <div class="th"><%=getStr("type") %></div>
                    <div class="td">
                        <asp:DropDownList ID="ddl_kind" runat="server" Next="product" level="5" CssClass="required AutoPost">
                        </asp:DropDownList>
                    </div>

                    <div class="th"><%=getStr("operator") %></div>
                    <div class="td">
                        <asp:TextBox ID="txt_operator" runat="server" CssClass="Operater required"></asp:TextBox>
                    </div>
                    <div class="th"><%=getStr("Inspect_dt") %></div>

                    <div class="td">
                        <asp:TextBox ID="txt_inspDt" runat="server" CssClass="date required"></asp:TextBox>
                    </div>
                </div>
                <div class="tr">

                    <div class="th"><%=getStr("product") %></div>
                    <div class="td">
                        <asp:DropDownList ID="ddl_product" runat="server" Enabled="false" Next="program" level="4" CssClass="required AutoPost">
                        </asp:DropDownList>
                    </div>
                    <div class="th"><%=getStr("program") %></div>
                    <div class="td">
                        <asp:DropDownList ID="ddl_program" runat="server" Enabled="false" Next="test" level="3" CssClass="required AutoPost">
                        </asp:DropDownList>
                    </div>

                    <div class="th"><%=getStr("result") %></div>
                    <div class="td">
                        <asp:DropDownList ID="ddl_result" runat="server" CssClass="required">
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
        </div>
        <div class="t1" id="lbase">
            <div class="tb1" style="width: 100%; border-bottom: 0px">
                <div class="tr ">
                    <div class="td" style="text-align: center; font-size: 1.4em; color: #bf3553; font-weight: bold">
                        <%=getStr("insp_info") %>
                    </div>
                </div>
            </div>
            <div class="tb1">
                <div class="tr">
                    <div class="th"><%=getStr("insp_type") %></div>
                    <div class="td">
                        <asp:DropDownList ID="ddl_inspect" runat="server"></asp:DropDownList>
                    </div>
                    <div class="th"><%=getStr("inspct_num") %></div>

                    <div class="td">
                        <asp:TextBox ID="txt_insp_count" runat="server" Text="0" CssClass="required qty"></asp:TextBox>
                    </div>
                    <div class="th"><%=getStr("sp_stand") %></div>
                    <div class="td">
                        <asp:DropDownList ID="ddl_sp_stand" CssClass="required" runat="server"></asp:DropDownList>
                    </div>
                    <div class="th"><%=getStr("samp_num") %></div>
                    <div class="td">
                        <asp:TextBox ID="txt_samp_count" runat="server" Text="0" CssClass="required qty"></asp:TextBox>
                    </div>

                </div>
                <div class="tr">
                    <div class="th"><%=getStr("birth_dt") %></div>
                    <div class="td">
                        <asp:TextBox ID="txt_birthDt" runat="server" Text="" CssClass="date required"></asp:TextBox>
                    </div>

                    <div class="th"><%=getStr("assembly_staff") %></div>
                    <div class="td" style="text-align: center">
                        <asp:TextBox ID="txt_b_opeartor" runat="server" CssClass="Operater required"></asp:TextBox>
                    </div>
                    <div class="td" style="border: 0px; border-bottom: 1px solid #8a988e; text-align: left">
                        <asp:LinkButton ID="lbtn_insp_add" runat="server" OnClientClick="return add_inspct()" Class="fas fa-edit add_btn" OnClick="lbtn_insp_add_Click" title="add"></asp:LinkButton>
                    </div>

                    <div class="td" style="border: 0px; border-bottom: 1px solid #8a988e;"></div>
                    <div class="td" style="border: 0px; border-bottom: 1px solid #8a988e;"></div>
                    <div class="td" style="border: 0px; border-bottom: 1px solid #8a988e; border-right: 1px solid #8a988e;"></div>

                </div>

            </div>
        </div>
        <asp:UpdatePanel runat="server" ID="up_vmi" UpdateMode="Conditional" ChildrenAsTriggers="true">
            <ContentTemplate>
                <div class="tb1 all" style="border-bottom: 0px">
                    <div class="tr">
                        <div class="td" style="text-align: center; font-size: 1.4em; color: #7B90D2; font-weight: bold; height: 30px">
                            <%=getStr("vmi")%>
                        </div>
                    </div>
                </div>
                <div class="tb1 all">
                    <div class="tr">
                        <div class="td">
                            <div class="cell" style="width: 40%; border-right: 2px solid #B19693;">
                                <div style="float: left; width: 90%; margin: 5px">
                                    <div class="tb1 edit " style="width: 100%; float: left; font-size: medium">
                                        <div class="tr ">
                                            <div class="th">*<%=getStr("position")%></div>
                                            <div class="td">
                                                <asp:DropDownList ID="ddl_position" runat="server" CssClass="required"></asp:DropDownList>

                                            </div>
                                        </div>
                                        <div class="tr ">
                                            <div class="th">*<%=getStr("shape")%></div>
                                            <div class="td">
                                                <div style="padding: 2px">
                                                    <asp:DropDownList ID="ddl_shape" runat="server"></asp:DropDownList>
                                                    <asp:LinkButton ID="lbin_shape_add" CssClass="fa fa-1x fa-plus" runat="server" Style="padding: 2px; cursor: pointer; text-decoration: none;" OnClick="lbin_shape_add_Click" OnClientClick="return add_shape()" ToolTip="add"></asp:LinkButton>
                                                </div>
                                                <div style="padding: 2px">

                                                    <asp:DataList ID="stemp_list" runat="server" OnDeleteCommand="stemp_list_DeleteCommand">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lab_stemp" runat="server"><%#Eval("shape").ToString().Trim() %></asp:Label>

                                                            <asp:LinkButton CommandName="Delete" CommandArgument='<%# Bind("shape_id") %>' ID="del_shape" runat="server">
                                                              
                                                            <i class="fas fa-minus"></i>
                                                            </asp:LinkButton>

                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                </div>

                                            </div>

                                        </div>
                                        <div class="tr ">
                                            <div class="th"><%=getStr("d_qty") %></div>
                                            <div class="td">
                                                <asp:TextBox ID="txt_vmi_qty" runat="server" Text="0" CssClass="qty required"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="tr ">
                                            <div class="th"><%=getStr("judgment") %></div>
                                            <div class="td">
                                                <asp:DropDownList ID="ddl_vmi_judg" runat="server" CssClass="required">
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div style="float: left; margin: 5px 5px;">

                                    <asp:LinkButton ID="lbtn_vmi_add" runat="server" CssClass="far fa-plus-square add_btn" OnClick="lbtn_vmi_add_Click" OnClientClick="return vmi_add()" Style="text-decoration: none;" title="lbtn_vmi_add_Click"></asp:LinkButton>
                                </div>
                            </div>
                            <div class="cell" style="width: 60%">
                                <div style="float: left; margin: 5px; width: 90%;">

                                    <asp:GridView ID="vmi_list" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                        OnRowDataBound="vmi_list_RowDataBound" OnRowDeleting="vmi_list_RowDeleting" DataKeyNames="vmi_id"
                                        CellPadding="0" BorderColor="#B19693" BorderStyle="Solid" BorderWidth="1px" Width="100%" EnableModelValidation="True" ForeColor="#9fa39a" GridLines="Both">
                                        <AlternatingRowStyle BackColor="#F4F6F7" />
                                        <FooterStyle BackColor="#F4F6F7" />
                                        <HeaderStyle BackColor=" #F4F6F7" Font-Bold="True" ForeColor="#7B90D2" Font-Size="Medium" />
                                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />

                                        <Columns>

                                            <asp:BoundField DataField="vmi_id" HeaderText="vmi_id" Visible="false">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="position" HeaderText="Position of defective">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="Shape of defective">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="qty" HeaderText="Defect Quantity">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="judg" HeaderText="Judgement">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>

                                            <asp:TemplateField HeaderText="Delete">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <%--<asp:Button ID="lbtn_vmi_del" runat="server" CommandName="Delete" Text="Delete"  CommandArgument='<%# Eval("vmi_id") %>' />
                                            <i class="far fa-trash-alt"></i>--%>
                                                    <asp:LinkButton ID="lbtn_vmi_del" runat="server" CommandName="Delete" title="Del" class="far fa-trash-alt" Width="50"></asp:LinkButton>
                                                </ItemTemplate>

                                            </asp:TemplateField>

                                        </Columns>
                                        <EmptyDataTemplate>

                                            <div class="tb1 Tempty" style="background-color: #F4F6F7; color: #7B90D2; width: 100%; height: 25px; text-align: center; border: 0px; font-size: medium">
                                                <div class="tr">
                                                    <div class="td">
                                                        <%=getStr("position")%>
                                                    </div>
                                                    <div class="td">
                                                        <%=getStr("shape")%>
                                                    </div>
                                                    <div class="td">
                                                        <%=getStr("d_qty")%>
                                                    </div>
                                                    <div class="td" style="border-right: 0px">
                                                        <%=getStr("judgment")%>
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="background-color: #FFF; color: #7B90D2; width: 100%; height: 25px">
                                                <%=getStr("not_data")%>
                                            </div>

                                        </EmptyDataTemplate>
                                    </asp:GridView>
                                </div>

                                <div style="float: left; margin: 5px;">
                                    <asp:LinkButton ID="lbtn_base_add" runat="server" class="far fa-file-alt add_btn" title="save" OnClick="lbtn_base_add_Click">
                                    </asp:LinkButton>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="lbin_shape_add" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>

        <div id="ft_Area" class="t1" style="display: block">
            <div class="tb1">
                <div class="td" style="text-align: center; font-size: x-large; color: #5e665b; font-weight: bold; color: #636F58; width: 100%">
                    <%=getStr("fun_test") %>
                </div>
            </div>

            <div class="tb1">

                <div class="tr">
                    <div class="td" style="width: 30%">
                        <div id="ft_right" class="tb1" style="vertical-align: top; border: 0px">
                            <div class="tr">
                                <div class="th">測試項目</div>
                                <div class="td">
                                    <asp:DropDownList ID="ddl_test" runat="server" Next="ts_standard" level="2" CssClass="required AutoPost" OnSelectedIndexChanged="ddl_test_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                </div>
                                <div class="th">測試標準</div>
                                <div class="td">
                                    <asp:DropDownList ID="ddl_ts_standard" runat="server" level="1" CssClass="required AutoPost"></asp:DropDownList>
                                </div>

                            </div>
                            <div class="tr">
                                <div class="th">數量</div>
                                <div class="td">
                                    <asp:TextBox ID="txt_ft_qty" CssClass="required" runat="server" Text="0"></asp:TextBox>
                                </div>
                                <div class="th">判定</div>
                                <div class="td">
                                    <asp:DropDownList ID="ddl_ft_judg" CssClass="required" runat="server">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="tr">

                                <div class="th">S1</div>
                                <div class="td">
                                    <asp:TextBox ID="txt_s1" runat="server"></asp:TextBox>
                                </div>
                                <div class="th">S2</div>
                                <div class="td">
                                    <asp:TextBox ID="txt_s2" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="tr">
                                <div class="th">S3</div>
                                <div class="td">
                                    <asp:TextBox ID="txt_s3" runat="server"></asp:TextBox>
                                </div>
                                <div class="th">S4</div>
                                <div class="td">
                                    <asp:TextBox ID="txt_s4" runat="server"></asp:TextBox>
                                </div>



                            </div>
                            <div class="tr">
                                <div class="th">S5</div>
                                <div class="td">
                                    <asp:TextBox ID="txt_s5" runat="server"></asp:TextBox>
                                </div>
                                <div class="td"></div>
                                <div class="td">

                                    <asp:LinkButton class="far fa-file-alt fa-3x add_btn" runat="server" ID="lbtn_S5_add" OnClick="lbtn_S5_add_Click" OnClientClick="return S5_add_chk();"></asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:UpdatePanel runat="server" ID="up_s5" UpdateMode="Conditional" ChildrenAsTriggers="true">
                        <ContentTemplate>
                            <div class="td" style=" vertical-align: top; padding: 2px">
                                <div style="float: left; width: 70%; border: 0px solid red"> 
                                    <asp:GridView ID="gv_s5" runat="server" AutoGenerateColumns="true">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Seq" HeaderStyle-Width="40">
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <%#Container.DataItemIndex + 1%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="test" HeaderText="Test Item" Visible="true">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="ts_standard" HeaderText="Test Standard" Visible="true">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="ft_qty" HeaderText="Qty" Visible="true">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="ft_jdug" HeaderText="ft jdug" Visible="true">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="s1" HeaderText="s1" Visible="true">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="s2" HeaderText="s2" Visible="true">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="s3" HeaderText="s3" Visible="true">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="s4" HeaderText="s4" Visible="true">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="s5" HeaderText="s5" Visible="true">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="Del">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtn_del_s5" runat="server" CommandName="del_row" title="del" Text="del" class="far fa-trash-alt"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <div>a</div>
                                    <div>b</div>
                                    <div>c</div>
                                </div>
                                <div style="float: left; width: 30%; border: 1px solid #8a988e">
                                    <div id="ft_left">
                                        <div>
                                            <div class="th">產品編號</div>
                                            <div class="td">
                                                <asp:TextBox ID="txt_prod_index" runat="server" CssClass="required"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="th">檢測時間</div>
                                            <div class="td">
                                                <asp:TextBox ID="txt_insp_time" runat="server" CssClass="Mclock required"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div>
                                            <asp:LinkButton ID="lbtn_ft_add" runat="server" class="fas fa-angle-double-down fa-3x" OnClick="lbtn_ft_add_Click" OnClientClick="return ft_add_chk();"></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="lbtn_S5_add" EventName="Click" />

                        </Triggers>
                    </asp:UpdatePanel>

                </div>
            </div>
        </div>

    </div>


    <asp:UpdatePanel runat="server" ID="up_ft" UpdateMode="Conditional" ChildrenAsTriggers="true">
        <ContentTemplate>
            <asp:GridView ID="ft_list" runat="server" AllowPaging="false" AutoGenerateColumns="false"
                OnRowDataBound="ft_list_RowDataBound" OnRowCommand="ft_list_RowCommand" EnableModelValidation="True"
                CellPadding="0" GridLines="Both"
                BorderColor="#96c24e" BorderStyle="Solid" BorderWidth="1px" Width="100%"
                ForeColor="#5e665b" Font-Size="Medium" Font-Bold="true">
                <AlternatingRowStyle BackColor="#dfecd5" />
                <FooterStyle BackColor="#9abeaf" />
                <HeaderStyle BackColor="#9abeaf" Font-Size="Medium" ForeColor="#ffffff" Height="30" />

                <Columns>

                    <asp:TemplateField HeaderText="base_id" Visible="true">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ft_id" Visible="true">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Item" HeaderStyle-Width="40">

                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%#Container.DataItemIndex + 1%>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="prod_index" HeaderStyle-Width="70">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="insp_time" HeaderStyle-Width="100">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="test_standard" HeaderStyle-Width="110">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Qty" HeaderStyle-Width="110">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="jdug" HeaderStyle-Width="110">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="S1" HeaderStyle-Width="30">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="S2" HeaderStyle-Width="30">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="S3" HeaderStyle-Width="30">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="S4" HeaderStyle-Width="30">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="S5" HeaderStyle-Width="30">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="del">
                        <HeaderStyle HorizontalAlign="Center" Width="60" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>

                            <asp:LinkButton ID="lbtn_All_del" runat="server" CommandName="del_row" title="Del" Text="del" class="far fa-trash-alt"></asp:LinkButton>
                        </ItemTemplate>

                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Copy">
                        <HeaderStyle HorizontalAlign="Center" Width="60" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>

                            <asp:LinkButton ID="lbtn_Copy_del" runat="server" CommandName="del_row" title="copy" Text="copy" class="far fa-trash-alt"></asp:LinkButton>
                        </ItemTemplate>

                    </asp:TemplateField>

                </Columns>
                <%--item 產品編號 檢測時間 測試項目 測試標準 數量 判定 S1 S2 S3 S4 S5 Edit Del Copy --%>
                <EmptyDataTemplate>
                    <tr style="width: 100%; border: 0px solid #96c24e; border-collapse: collapse; font-size: medium; font-weight: bold; background-color: #9abeaf; color: #fff">
                        <td align="center">Item</td>
                        <td align="center" style="width: 10%">產品編號</td>
                        <td align="center" style="width: 10%">檢測時間</td>
                        <td align="center" style="width: 10%">測試項目</td>
                        <td align="center" style="width: 10%">測試標準</td>
                        <td align="center" style="width: 10%">數量</td>
                        <td align="center" style="width: 10%">判定</td>
                        <td align="center" style="width: 5%">S1</td>
                        <td align="center" style="width: 5%">S2</td>
                        <td align="center" style="width: 5%">S3</td>
                        <td align="center" style="width: 5%">S4</td>
                        <td align="center" style="width: 5%">S5</td>
                        <td align="center" style="width: 5%">Copy</td>
                    </tr>
                    <tr style="background-color: #FFF; color: #5e665b; width: 100%; text-align: center; font-size: medium">
                        <td colspan="15" style="height: 25px">
                            <%=getStr("not_data")%></td>
                    </tr>
                </EmptyDataTemplate>
            </asp:GridView>
        </ContentTemplate>

    </asp:UpdatePanel>


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
                        <asp:GridView ID="all_list" runat="server" AllowPaging="false" AutoGenerateColumns="false" Font-Size="Medium"
                            OnRowDataBound="all_list_RowDataBound" OnRowCommand="all_list_RowCommand"
                            CellPadding="0" BorderColor="#B19693" BorderStyle="Solid" BorderWidth="1px" Width="100%" EnableModelValidation="True" ForeColor="#9fa39a" GridLines="Both">
                            <AlternatingRowStyle BackColor="#F1ECED" />
                            <FooterStyle BackColor="Yellow" />
                            <HeaderStyle BackColor="#b598a1" Font-Bold="True" ForeColor="#ffffff" BorderWidth="0" Font-Size="Medium" />

                            <SelectedRowStyle BackColor="Pink" Font-Bold="True" ForeColor="White" />
                            <Columns>

                                <asp:BoundField DataField="base_id" HeaderText="base_id" Visible="false">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                <asp:TemplateField HeaderText="Item" HeaderStyle-Width="40">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex + 1%>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Inspect" HeaderStyle-Width="70">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lab_inspect" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Inspect Count Quantity" HeaderStyle-Width="100">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lab_insp_count" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Sample Standard" HeaderStyle-Width="100">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lab_sp_standard" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Sample Count Quantity" HeaderStyle-Width="100">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lab_samp_count" runat="server"></asp:Label>
                                    </ItemTemplate>
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
                                    <ItemTemplate>
                                    </ItemTemplate>
                                </asp:TemplateField>


                                <asp:TemplateField HeaderText="del">
                                    <HeaderStyle HorizontalAlign="Center" Width="60" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>

                                        <asp:LinkButton ID="lbtn_All_del" runat="server" CommandName="del_row" title="Del" CommandArgument='<%#Eval("base_id") %>' class="far fa-trash-alt"></asp:LinkButton>
                                    </ItemTemplate>

                                </asp:TemplateField>

                            </Columns>
                            <EmptyDataTemplate>
                                <tr style="background-color: #b598a1; color: #fff; font-weight: bolder; height: 25px; font-size: medium; width: 95%">
                                    <td align="center" style="width: 5%">Item</td>
                                    <td align="center" style="width: 10%"><%=getStr("insp_type") %></td>
                                    <td align="center" style="width: 10%"><%=getStr("inspct_num") %></td>
                                    <td align="center" style="width: 15%"><%=getStr("sp_stand") %></td>
                                    <td align="center" style="width: 10%"><%=getStr("samp_num") %></td>
                                    <td align="center" style="width: 10%"><%=getStr("birth_dt") %></td>
                                    <td align="center" style="width: 10%"><%=getStr("assembly_staff") %></td>
                                    <td align="center" style="width: 30%">View</td>
                                    <td align="center" style="width: 5%">Del</td>


                                </tr>
                                <tr style="background-color: #FFF; color: #b598a1; font-weight: bolder; width: 100%; text-align: center">
                                    <td colspan="10" style="height: 35px">
                                        <%=getStr("not_data")%></td>
                                </tr>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <div class="t1">
        <div class="tb1">
            <div class="tr" style="text-align: left">
                <div class="td">
                    <SmoothEnterpriseWebControl:InputButton ID="Btn_Save" runat="server" Text="save" OnClick="Btn_Save_Click" OnClientClick="return Leica_chk()">
                    </SmoothEnterpriseWebControl:InputButton>

                    <SmoothEnterpriseWebControl:InputButton ID="Btn_Cancel" runat="server" Text="Cancel" Visible="true" OnClientClick="return cancel()" OnClick="Btn_Cancel_Click" />


                    <SmoothEnterpriseWebControl:InputButton ID="Btn_Back" runat="server" Text="Back" Visible="true" OnClientClick="return Nomarl.goto('Leica.aspx')" />

                </div>
            </div>
        </div>
    </div>
    </div>
</asp:Content>

