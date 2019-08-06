$(function () {
    $(".sys_btn").each(function () {
        $(this).mouseover(function () {
            $(this).attr("class", "sys_btn_on");
        });
        $(this).mouseout(function () {
            $(this).attr("class", "sys_btn");
        });
    });

    $("#ctl00_ContentPlaceHolder1_Btn_Previous").click(function () {
        CloseCell();

    });

    $("#ctl00_ContentPlaceHolder1_Btn_Next").click(function () {
        CloseCell();
    });
});


function CloseCell() {

    $("#ctl00_ContentPlaceHolder1_UpPer_display").val("");
    $("#ctl00_ContentPlaceHolder1_UpPer_formatvalue").val("");
    $("#ctl00_ContentPlaceHolder1_UpPer").val("");


    $("#ctl00_ContentPlaceHolder1_DownPer_display").val("");
    $("#ctl00_ContentPlaceHolder1_DownPer_formatvalue").val("");
    $("#ctl00_ContentPlaceHolder1_DownPer").val("");

    $("#ctl00_ContentPlaceHolder1_UpDt_formatvalue").val("");
    $("#ctl00_ContentPlaceHolder1_UpDt").val("");

    $("#ctl00_ContentPlaceHolder1_UpDown_formatvalue").val("");
    $("#ctl00_ContentPlaceHolder1_UpDown").val("");
}

function Del_Confirm() {
    var isSubmit = false;

    if (window.confirm("Do you want to delete the data?")) {
        //Yes
        isSubmit = true;
    }

    return isSubmit;
}

function send() {
    var UpPer = $("#ctl00_ContentPlaceHolder1_UpPer").val();
    var UpDt = $("#ctl00_ContentPlaceHolder1_UpDt").val();
    var DownPer = $("#ctl00_ContentPlaceHolder1_DownPer").val();
    var DownDt = $("#ctl00_ContentPlaceHolder1_DownDt").val();
    var Qty = $("#ctl00_ContentPlaceHolder1_Qty").val();
    var DownItem = $("#ctl00_ContentPlaceHolder1_DownReason").val();

    var Msg = "";

    if (UpPer == "" || UpPer == null) { Msg += "上模人員 "; }

    if (UpDt == "" || UpDt == null) { Msg += "上模時間 "; }

    if (DownPer == "" || DownPer == null) { Msg += "下模人員 "; }

    if (DownDt == "" || DownDt == null) { Msg += "下模時間 "; }

    if (DownItem == "0") { Msg += "下模原因 "; }

    Qty = Qty * 1

    if (Qty <= 0) { Msg += "數量需大於0"; }

    if (isNaN(Qty)) { Msg += "數量輸入數字"; }

    var sQ = String(Qty)
    if (sQ.indexOf(".") > -1)
    { Msg += "數量為整數"; }

    if (Msg == "") {
        return true;

    }
    else {
        alert("輸入欄位有誤:" + Msg);
        return false;
    }
}

