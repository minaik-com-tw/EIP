var curr_page = "";
$(function () {

    init_work();

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

        // if (typeof msg == "undefined") //預備沒有找到msg 預設為空

        //if (parent_id !== "" && typeof parent_id !== "undefined") {
        //    getOption($(this));
        //}
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
    if (curr_page !== "") {
        if (curr_page == "VMI") {
            $("#ctl00_ContentPlaceHolder1_up_vmi").css("display", "block");
        }
        if (curr_page == "PF") {
            $("#ft_Area").css("display", "block");
            $("#ctl00_ContentPlaceHolder1_up_ft").css("display", "block")
        }
    }
    else {
        $("#ctl00_ContentPlaceHolder1_ddl_inspect").val("");
    }
});


function clear_all() {
    init_work();
    clear_base();
    clear_ft();
}

function clear_base() {
    $("#ctl00_ContentPlaceHolder1_ddl_inspect").val("");
    $("#ctl00_ContentPlaceHolder1_txt_insp_count").val("");
    $("#ctl00_ContentPlaceHolder1_ddl_sp_stand").val("");
    $("#ctl00_ContentPlaceHolder1_txt_samp_count").val("");
    $("#ctl00_ContentPlaceHolder1_txt_birthDt").val("");
    $("#ctl00_ContentPlaceHolder1_txt_b_opeartor_show").val("");
    $("#ctl00_ContentPlaceHolder1_txt_b_opeartor").val("");
}

function clear_ft() {


    $('#ctl00_ContentPlaceHolder1_ddl_test').val("");
    $('#ctl00_ContentPlaceHolder1_ddl_ts_standard').val("");
    $("#ctl00_ContentPlaceHolder1_ddl_ft_judg")[0].selectedIndex = 0; //選取第二個欄位 單位B (索引從0開始)

    $("#ctl00_ContentPlaceHolder1_txt_ft_qty").val("");
    $("#ctl00_ContentPlaceHolder1_txt_s1").val("");
    $("#ctl00_ContentPlaceHolder1_txt_s2").val("");
    $("#ctl00_ContentPlaceHolder1_txt_s3").val("");
    $("#ctl00_ContentPlaceHolder1_txt_s4").val("");
    $("#ctl00_ContentPlaceHolder1_txt_s5").val("");

}

function clear_vmi() {

    $('#ctl00_ContentPlaceHolder1_ddl_position')[0].selectedIndex = 0; //選取第二個欄位 單位B (索引從0開始)
    $('#ctl00_ContentPlaceHolder1_ddl_shape')[0].selectedIndex = 0; //選取第二個欄位 單位B (索引從0開始)
    $('#ctl00_ContentPlaceHolder1_txt_vmi_qty').val("");
    $('#ctl00_ContentPlaceHolder1_ddl_vmi_judg')[0].selectedIndex = 0; //選取第二個欄位 單位B (索引從0開始)
}


///畫面隱藏
function init_work() {

    $("#ctl00_ContentPlaceHolder1_up_vmi").css("display", "none");

    $("#ft_Area").css("display", "none");
    $("#ctl00_ContentPlaceHolder1_up_ft").css("display", "none");

}

function clear_list(curr) {
    var curr_obj = curr * 1;

    $(".AutoPost").each(function () {
        var level = $(this).attr("level") * 1;
        //if (curr_obj > level) {

        //    $(this).val("");
        //    $(this).attr("disabled", true);
        //}
        //$(this).empty();

        if (curr_obj > level) {
            $(this)[0].selectedIndex = 0;
        }


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

function upload_base(baseid, guid) {

    $("#ctl00_ContentPlaceHolder1_base_id").val(guid);

    var i = 0;
    //var ft_1 = $('#ctl00_ContentPlaceHolder1_ft_list tr:eq(' + i + ')').find(".ft_list_1").text();

    var obj = "#" + baseid;


    var insp_count = $(obj + "_insp_count").text();
    $("#ctl00_ContentPlaceHolder1_txt_insp_count").val(insp_count);

    //var standard = $(row).find(".standard").text();
    var standard = $(obj + "_standard").text();

    $("#ctl00_ContentPlaceHolder1_ddl_sp_stand").children().each(function () {
        if ($(this).text() == standard) {
            //jQuery給法
            $(this).attr("selected", "true"); //或是給"selected"也可
        }
    });

    //var samp_count = $(row).find(".samp_count").text();
    var samp_count = $(obj + "_samp_count").text();
    $("#ctl00_ContentPlaceHolder1_txt_samp_count").val(samp_count);

    //var bith_date = $(row).find(".bith_date").text();
    var bith_date = $(obj + "_bith_date").text();
    $("#ctl00_ContentPlaceHolder1_txt_birthDt").val(bith_date);

    //var b_operator = $(row).find(".b_operator").text();
    var b_operator = $(obj + "_b_operator").text();
    $("#ctl00_ContentPlaceHolder1_txt_b_opeartor").val(b_operator);
    $("#ctl00_ContentPlaceHolder1_txt_b_opeartor_show").val(b_operator);

    var inspect_id = $(obj + "_inspect_id").text();

    init_work();

    $("#ctl00_ContentPlaceHolder1_curr_page").val(inspect_id);
    $("#ctl00_ContentPlaceHolder1_ddl_inspect").val(inspect_id);

    if (inspect_id == "VMI") {
        $("#ctl00_ContentPlaceHolder1_up_vmi").css("display", "block");
        $('#ctl00_ContentPlaceHolder1_ddl_inspect option[value=VMI]').attr('selected', true);
    }
    if (inspect_id == "PF") {
        $("#ft_Area").css("display", "block");
        $("#ctl00_ContentPlaceHolder1_up_ft").css("display", "block");
        $('#ctl00_ContentPlaceHolder1_ddl_inspect option[value=PF]').attr('selected', true);
    }

    return true;
}

function check_head() {
    var isPass = true;
    $("#head").find(".required").each(function () {

        $(this).parent().removeClass("wrong");
        var value = $(this).val();
        if (value == "" || value == null) {

            $(this).parent().addClass("wrong");
            isPass = false;
        }

    });

    $("#lbase").find(".required").each(function () {

        $(this).parent().removeClass("wrong");
        var value = $(this).val();
        if (value == "" || value == null) {
            $(this).parent().addClass("wrong");
            isPass = false;
        }
    });
    if (!isPass) {
        alert($("#required").text());
    }
    else {

        init_work();

        var insp = $("#ctl00_ContentPlaceHolder1_ddl_inspect").val();
        $("#ctl00_ContentPlaceHolder1_curr_page").val(insp);

        if (insp == "VMI") {
            $("#ctl00_ContentPlaceHolder1_up_vmi").css("display", "block");
        }
        if (insp == "PF") {
            $("#ft_Area").css("display", "block");
            $("#ctl00_ContentPlaceHolder1_up_ft").css("display", "block");
        }


    }

    return isPass;
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

    var isPass = true;
    $("#ctl00_ContentPlaceHolder1_up_vmi").find(".required").each(function () {

        $(this).parent().removeClass("wrong");
        var value = $(this).val();
        if (value == "" || value == null) {
            $(this).parent().addClass("wrong");
            isPass = false;
        }
    });


    if (isPass) {
        //   var tds = $(originalTable).children('tbody').children('tr').children('td').length;
        var td = $("#ctl00_ContentPlaceHolder1_up_vmi").find("#ctl00_ContentPlaceHolder1_stemp_list").find("td").length;
        $("#ctl00_ContentPlaceHolder1_ddl_shape").parent().removeClass("wrong");
        if (td == 0) {
            $("#ctl00_ContentPlaceHolder1_ddl_shape").parent().addClass("wrong");
            isPass = false;
        }
    }

    if (!isPass) {
        alert($("#required").text());
    }

    return isPass;
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

    var isPass = true;

    $("#head").find(".required").each(function () {

        $(this).parent().removeClass("wrong");
        var value = $(this).val();
        if (value == "" || value == null) {

            $(this).parent().addClass("wrong");
            isPass = false;
        }

    });

    if (isPass) {
        var all_count = $("#ctl00_ContentPlaceHolder1_all_count").text();
        if (all_count == "0") {

            alert($("#all_empty").text());
            isPass = false;
        }
        else {
            isPass = true;
        }
    }else{
        alert($("#required").text());
    }
    return isPass;
}

function ft_add_chk() {
    $("#test_s5").css("border", " 0px solid red");
    $("#ctl00_ContentPlaceHolder1_ft_list").css("display", "block");

    var isPass = false;

    if (check_head()) {

         isPass = true;
        $("#ft_left").find(".required").each(function () {

            $(this).parent().removeClass("wrong");
            var value = $(this).val();

            if (value == "" || value == null) {
                $(this).parent().addClass("wrong");
                isPass = false;
            }
        });


        if (!isPass) {
            alert($("#required").text());
        }

        var prod = $("#ctl00_ContentPlaceHolder1_txt_prod_index").val();
        var time = $("#ctl00_ContentPlaceHolder1_txt_insp_time").val();

        //檢查是否有重覆資料
        if (isPass) {
            //var td = $('#ctl00_ContentPlaceHolder1_ft_list tr td:eq(1)').text();
            //console.log("td", td); 

            var tr_length = $('#ctl00_ContentPlaceHolder1_ft_list tr').length; //tr 長度
            for (var i = 1; i <= tr_length; i++) {

                var ft_1 = $('#ctl00_ContentPlaceHolder1_ft_list tr:eq(' + i + ')').find(".ft_list_1").text();
                var ft_2 = $('#ctl00_ContentPlaceHolder1_ft_list tr:eq(' + i + ')').find(".ft_list_2").text();

                if (prod == ft_1 && time == ft_2) {
                    $("#test_s5").css("border", " 2px solid red");
                    isPass = false;

                    alert($("#duplicate").text());
                }
            }

        }

    }


    return isPass;
}

function S5_add_chk() {


    var isPass = true;
    $("#ft_right").find(".required").each(function () {

        $(this).parent().removeClass("wrong");
        var value = $(this).val();

        if (value == "" || value == null) {
            $(this).parent().addClass("wrong");
            isPass = false;
        }
    });

    if (!isPass) {
        alert($("#required").text());
    }

    return isPass;
}

function ft_edit_check() {

    var isPass = false;
    var th = $("#ctl00_ContentPlaceHolder1_s5_list").find("th").length; //empty_data th is 9


    $("#test_s5").css("border", " 0px solid red");

    if (th > 9) {

        $("#test_s5").css("border", " 2px solid red");
        alert($("#unable_to_run").text());

    } else {
        isPass = true;
    }


    return isPass;
}

function ft_update(prod, test_time) {

    var pass = ft_edit_check();
    if (pass) {
        $("#ctl00_ContentPlaceHolder1_txt_prod_index").val(prod);
        $("#ctl00_ContentPlaceHolder1_txt_insp_time").val(test_time);
    }
    return pass;
}

function base_add_chk() {
    var pass = true;
    var base_id = $("#ctl00_ContentPlaceHolder1_base_id").val();

    $(this).css("#a96360", "1px solid red");
    //if (typeof msg == "undefined") //預備沒有找到msg 預設為空

    $("#ctl00_ContentPlaceHolder1_all_list").find("tr").each(function () {
        var tr_id = $(this).attr("id");
        if (base_id == tr_id) {
            $(this).css("border", "3px solid red");
            alert($("#is_exist").text());
            pass = false;
        }
    });



    return pass;
}



