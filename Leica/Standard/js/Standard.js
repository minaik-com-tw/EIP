
function chk() {

    var isPass = true;
    
    var max = $("#ctl00_ContentPlaceHolder1_txt_max").val();
    var min = $("#ctl00_ContentPlaceHolder1_txt_min").val();
    var v = $("#ctl00_ContentPlaceHolder1_txt_val").val();

  

    if (isPass) isPass = isNumber(max, "Max");
    if (isPass) isPass = isNumber(min, "Min");
    if (isPass) isPass = isNumber(v, "Value");

    var imax = 1 * max;
    var imin = 1 * min;
    var ival = 1 * v;
    

    if (isPass) {
        if (imin > imax) {
            isPass = false;
            alert("上限 請大於下限");
        }
    }

    if (isPass) {
        if (ival > imax) {
            isPass = false;
            alert("抽樣數　不得大於 上限");
        }
    }
  

    if (isPass) {
        return Nomarl.Check();
    }
    return false;
}



function isNumber(n, msg) {

    var isNum = !isNaN(parseFloat(n)) && isFinite(n);

    if (isNum == false) {

        alert(msg + "必需為數字");
    }
    if (n <= 0) {
        alert(msg + "必需大於0");
        isNum = false;
    }

    return isNum;
}