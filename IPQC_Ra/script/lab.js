$(function () {



    var up = $("#ctl00_ContentPlaceHolder1_up").val() * 1;
    var upper = $("#ctl00_ContentPlaceHolder1_upper").val();

    var down = $("#ctl00_ContentPlaceHolder1_down").val() * 1;
    var lower = $("#ctl00_ContentPlaceHolder1_lower").val();

    var color = "";
    $(".ts_rs").each(function (i) {
        var table = "#" + $(this).attr("id");

        $(this).find(".avg").each(function () {
            color = "#778CA5";
            var avg = $(this).text();
            avg = avg * 1;
            if (!isNaN(avg)) {

                if (avg >= down) {
                    color = lower;
                }

                if (avg >= up) {
                    color = upper;
                }

            }

            $(table).find(".avg").css('background-color', color);
            $(table).find(".avg").css('color', "#000000");


        });
    });

});


function check_lab() {
    var ispass = true;
    $(".required").each(function (i) {
        var value = $(this).val();


        if (value == "") {
            $(this).parent().css("background-color", "red");
            ispass = false;
        }
        else {
            $(this).parent().css("background-color", "#fff");
        }
    });

    if (ispass == false) {
        var msg = $("#null_msg").text();
        alert(msg);
    }

    return ispass;
}



function check_ts(obj) {



    //-------------------------------------------
    var ID = $(obj).attr("id");
    //ctl00_ContentPlaceHolder1_gv_Lab_ctl04_ts_result
    //ctl00$ContentPlaceHolder1$gv_Lab$ctl04$Btn_TS_OK"
    var win = "#" + ID.replace("Btn_TS_OK", "") + "ts_result";

    var ispass = true;
    var msg = "";
    $(win).find(".ts_r").each(function () {
        var ts_r = $(this).val();
        var tag = $(this).attr("id");
        if (ts_r == "") {
            msg = $("#null_msg").text() + "\r";
            $(this).parent().css("background-color", "red");
            ispass = false;
        }
        else {
            $(this).parent().css("background-color", "#fff");
        }

        if (tag.indexOf('txt_mm') > 0) {

            var sample = ts_r * 1;

            if (isNaN(sample)) {
                msg += $("#isInt_msg").text() + "\r";
                isPass = false;
            }

            if (sample <= 0) {
                msg += $("#isNum_msg").text() + "\r";
                isPass = false;
            }
        }
    });


    /*
    //----------------------------
    if (isPass) {
        var tbox = new Array();
        tbox[0] = "#ctl00_ContentPlaceHolder1_txt_re_result";
        tbox[1] = "#ctl00_ContentPlaceHolder1_txt_replay";
        tbox[2] = "#ctl00_ContentPlaceHolder1_txt_re_result"; 

        
        var error = new Array();
        for (var j = 0; j < tbox.length; j++) {

            var value = $(tbox[j]).val();
            $(tbox[j]).parent().css("background-color", "#fff");

            if (value == "") {

                if (error == null) {
                    error[0] = tbox[j];
                }
                else {
                    var index = error.length;
                    error[index] = tbox[j];
                }
            }
        }

        if (error.length > 0 && error.length !== tbox.length) {
            $(error).parent().css("background-color", "red");
            isPass = "false ";
        }
    }

    //-----------------------------------------
    */
    if (ispass == false) {

        alert(msg);
    }


    return ispass;

}


function check_page() {


    var ispass = true;
    var msg = "";


    $(".confirm").each(function (i) {
        var value = $(this).val();
        if (value == "") {
            $(this).parent().css("background-color", "red");
            msg = $("#null_msg").text() + "\r";
            ispass = false;
        }
        else {
            $(this).parent().css("background-color", "#fff");
        }
    });


    var tr_count = $(".ts_seq").length;//基本數2行所以是4
    var avg_count = $(".ts_rs:contains(average)").length;

    if (tr_count == 0) {
        msg += $("#ts_null").text();
        ispass = false;
    }
    else if (tr_count !== avg_count) {

        msg += $("#ts_null").text();
        ispass = false;
    }

    if (ispass == false) {

        alert(msg);
    }

    return ispass;

}