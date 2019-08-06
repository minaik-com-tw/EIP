function back() {
    location.replace("IPQC_Ra.aspx");
    return false;
}

function check() {

    var isPass = true;
    var msg = "";
    $(" .required").each(function () {
        $(this).parent().css("background-color", "#fff");
       
        var value = $(this).val();

        if (value == "" || value == null) {
            $(this).parent().css("background-color", "red");
            isPass = false;
        }
    });

    if (!isPass) {
        msg = $("#chk_msg").text();
        alert(msg);
         
    } else {

        var sample = $("#ctl00_ContentPlaceHolder1_txt_sample").val();
        sample = sample * 1;

        if (isNaN(sample)) {
            msg = $("#isStr_msg").text();
            isPass = false;
        }

        if (sample <= 0) {
            msg = $("#isNum_msg").text();
            isPass = false;
        }
         
        if (!isPass ) {
            $("#ctl00_ContentPlaceHolder1_txt_sample").parent().css("background-color", "red");
            alert(msg);
        } 
    }
    return isPass;
}

 


