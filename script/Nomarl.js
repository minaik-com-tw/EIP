
//網頁完全載入才觸發
$(window).load(function () {
    
    var msg = $("#ctl00_ContentPlaceHolder1_msg").val();

    if (typeof msg == "undefined") //預備沒有找到msg 預設為空
    {
        msg = "";
    }

    if (msg !== "") {
        alert(msg);
    }
});

var b_w = 0, b_h = 0; var count = 0;
var language = "zh-tw";
$(function () {

    language = $("#ctl00_HeaderControl1_FIELD_language").val();

    b_w = $(window).width();
    b_h = $(window).height();

    $(window).resize(function () {
        b_w = $(window).width();
        b_h = $(window).height();
    });

    //僅日期
    $(".date").each(function () {
        var id = $(this).attr("id");
        var obj = "#" + id;
        setDatepicker(obj);

    });

    $(".Muser").each(function () {

        var id = "'" + $(this).attr("id") + "'";
        var txt = $(this).val();
        $(this).hide();

        var cc = $(this).attr("class");

        var add = "";
        //如果要检索的字符串值没有出现，则该方法返回 -1。
        if (cc.indexOf("required") > -1) {
            add = "class='required'";
        }


        var temp = $(this).attr("id") + "_show";

        $(this).parent().append('<div style="float:left;width:130px;margin:0px;padding:0px; border:0px solid #849483; cursor: pointer;" ><input id="' + temp + '" type="text" value="' + txt + '" ' + add + '  onchange="member_change(this,\'' + $(this).attr("id") + '\' )" /></div>');
        $(this).parent().append('<div title="select member" style="border:0px;float:left;width:auto;cursor: pointer;color:#fd7e14" class="fa-x fa fa-users" onclick="setMember(' + id + ')" ></div>');


    });

    //僅時間
    $(".Mclock").each(function () {

    
        var id = "#" + $(this).attr("id").trim();

        $(id).timepicker({
            timeFormat: 'HH:mm:00',
            hour: 12,
            minute: 30

        });

        //$(this).parent().append("<div id='clock' class='fa-user-edit' style='margin:1px;padding:0px;border: 1px solid red;mcursor:pointer;width:25px' onclick='clock_trigger(\"" + id + "\");' ><img style='width: 22px;' src='.././gif/clock4.png'></div>");
        $(this).parent().append("<a href='#' style='cursor: pointer'  onclick='clock_trigger(\"" + id + "\");' ><img src='../../gif/clock4.png' width='22'/></a>");
        
        $(this).click(function () { setClock(id); });
    });


});
 
var txtbox = "";
 
function setMember(obj) {


    txtbox = "#" + obj;

    $.blockUI({
        message: $('#divLoading2'),
        //css: { borderWidth: '0px', backgroundColor: 'transparent' }
        css: {
            padding: 0,
            margin: 0,
            top: 30,
            left: ((b_w * 0.4)) / 2,
            width: b_w * 0.5,
            heigth: b_h * 0.4,
            backgroundColor: '#fff',
            cursor: 'auto',
            border: '6px solid #dddddd'

        },

        // styles for the overlay  
        overlayCSS: {
            backgroundColor: '#000',
            opacity: 0.6,
            cursor: 'wait'
        }

    });

    $('.blockOverlay').click($.unblockUI);   //遮罩层属性的设置以及当鼠标单击遮罩层可以关闭弹出层  
    $('#close').click($.unblockUI);  //也可以自定义一个关闭按钮来关闭弹出层  
}

function setUser(obj) {

    // var id = $(obj).attr("id").replace("img", "txt");
    txtbox = "#" + obj;

    $.blockUI({
        message: $('#divLoading2'),
        //css: { borderWidth: '0px', backgroundColor: 'transparent' }
        css: {
            padding: 0,
            margin: 0,
            top: 30,
            left: ((b_w * 0.4)) / 2,
            width: b_w * 0.5,
            heigth: b_h * 0.4,
            backgroundColor: '#fff',
            cursor: 'auto',
            border: '6px solid #dddddd'

        },

        // styles for the overlay  
        overlayCSS: {
            backgroundColor: '#000',
            opacity: 0.6,
            cursor: 'wait'
        }

    });

    $('.blockOverlay').click($.unblockUI);   //遮罩层属性的设置以及当鼠标单击遮罩层可以关闭弹出层  
    $('#close').click($.unblockUI);  //也可以自定义一个关闭按钮来关闭弹出层  
}

//搭配 /Comm/UserList.aspx取回的人員名稱
function getUser(obj) {


    var user = $(obj).attr("username");
    var userid = $(obj).attr("userid");
    var logonid = $(obj).attr("logonid");
    var id = $(obj).attr("id");

    $(txtbox).val(logonid);

    var temp = txtbox + "_show";

    //$(temp).val(logonid + "-" + user);
    $(temp).val(logonid);


    //$(txtbox).hide();
    $('#close').click();
}

function check() {
    var isPadd = true;
    var i = 0;


    $(".required").each(function () {

        $(this).parent().removeClass("wrong");
        var value = $(this).val();

        if (value == "" || value == null) {

            $(this).parent().addClass("wrong");
            isPadd = false;
        }
    });
    if (!isPadd) {
        alert("紅色項目為必填");

    }

    if (isPadd) {

        $(":file").each(function () {
            $(this).parent().removeClass("wrong");
            var file = $(this).val();

            if (file.length > 0) {

                $(this).parent().addClass("wrong");
                isPadd = false;
            }

        });

        if (!isPadd) {
            alert("檔案尚未上傳");
        }
    }

    return isPadd;
    //return false;
}

function Datepicker_Wk(sDt_control, eDt_control) {
    var sDt = "#" + sDt_control;
    var eDt = "#" + eDt_control;

    self.moveTo(0, 0);
    self.resizeTo(screen.availWidth, screen.availHeight);
    setDatepicker(sDt);
    setDatepicker(eDt);

    //$(sDt).change(function () {
    //    var curr = $(this).val();
    //    GetNowWeekPeriod(curr, sDt, eDt);
    //});
}

function setDatepicker(obj) {

    $(obj).datepicker({
        dateFormat: 'yy/mm/dd',
        showButtonPanel: true,
        showOn: "both",
        buttonImage: "../../gif/calendar.gif",
        buttonImageOnly: true,
        buttonText: "日期",
        //default:false
        showWeek: true,
        //顯示周數的標題
        //default""wk"
        weekHeader: "W",
        //自訂計算周數的方法，
        //default datepicker.iso8601Week
        calculateWeek: myWeekCalc
    });

    $("#ui-datepicker-div").css('font-size', '0.7em'); //改变大小  
}

function myWeekCalc(date) {
    var checkDate = new Date(date.getTime());
    checkDate.setDate(checkDate.getDate() + 4 - (checkDate.getDay()));
    var time = checkDate.getTime();
    //設定1月1日
    checkDate.setMonth(0);
    checkDate.setDate(1);
    return Math.floor(Math.round((time - checkDate) / 86400000) / 7) + 1;
}

function GetNowWeekPeriod(Curr, obj1, obj2) {
    // 現在日期
    var cDt = Curr.replace(/-/g, '/');
    var myDate = new Date(cDt);


    // 現在是星期幾，日為0、一為1、二為2、三為3、四為4、五為5、六為6
    var myDay = myDate.getDay();

    // 設成日為7
    //if (myDay == 0) {
    //    myDay = 7;
    //}

    var myStartDate = new Date(cDt);

    // 將日期變成目前禮拜的星期一
    // myStartDate.setDate(myStartDate.getDate() + (0 - (myDay - 1)));
    //myDate.setDate(myStartDate.getDate() + (0 - (myDay - 1)));
    myDate.setDate(myStartDate.getDate() + (0 - (myDay)));

    var myEndDate = new Date(cDt);

    // 將日期變成目前禮拜的星期日
    myEndDate.setDate(myEndDate.getDate() + (7 - myDay - 1));


    var x = myStartDate.getFullYear() + '/' + GetFormatDate((myStartDate.getMonth() + 1)) + '/' + GetFormatDate(myStartDate.getDate());
    var y = myEndDate.getFullYear() + '/' + GetFormatDate((myEndDate.getMonth() + 1)) + '/' + GetFormatDate(myEndDate.getDate());
    $(obj1).val(myDate.format("yyyy/MM/dd"));
    $(obj2).val(myEndDate.format("yyyy/MM/dd"));

}

function setClock(obj) {
    $(obj).val("12:30:00"); //預設 只按沒選，就會出現
}

function clock_trigger(obj) {
    $(obj).focus();
    $(obj).click();
}

function member_change(obj, ctr) {

    var member = $(obj).val();

    if (member == "" || member == null) {
        $("#" + ctr).val("");
    }
}


//https://dotblogs.com.tw/threeday0905/2011/01/10/20699
var Nomarl = {                  //共用的AjaxOnError函式
    getCookie: function (cname) {
        var name = cname + "=";
        var decodedCookie = decodeURIComponent(document.cookie);
        var ca = decodedCookie.split('&');
        for (var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) == ' ') {
                c = c.substring(1);
            }
            if (c.indexOf(name) == 0) {
                return c.substring(name.length, c.length);
            }
        }
        return "";
    },

    goto: function (url) {

        if (typeof (url) === 'undefined') {
            window.history.go(-1);
        }
        else {

            //   window.location.href = url;
            window.location.replace(url);
        }
        return false;
    },

    reload: function () {
        history.go(0);
    },
     
    Check: function () {
        check();

    },

    Guid: function () {
        return 'xxxxxxxx-xxxx-xxxx-yxyx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
            var string = Math.random() * 16 | 0, v = c === 'x' ? string : (string & 0x3 | 0x8);
            return string.toString(16);
        }).toUpperCase();
    },

    Msg: function (show) {
        alert(show);
    },
    ///正整數
    int: function (obj) {
        var show = "";
        var num = $(obj).val();
        if (num == "") {
            $(obj).val(0);
        }
        else if (isNaN(num)) {
            //lert($("#isNum").text());

            if (language == "zh-tw") {
                show = "請輸入數字";
            }
            else {
                show = "Not a number";
            }

        }
        else {

            //^/+?[1-9][0-9]*$
            //var reg = /^[0-9]{*}$/;//-> \d一个0-9之间的数字 ->包含一个0-9之间的数字的规则

            var reg = /^\d*$/;

            var inum = (num * 1);
            if (inum < 0) {
                if (language == "zh-tw") {
                    show = "輸入值需大於或等於0";
                }
                else {
                    show = "value must be more than 0 or is equal 0";
                }

            }
            else if (!reg.test(num)) {

                var msg = $("#integer").text();

                if (language == "zh-tw") {
                    show = "輸入值必需是整數";
                }
                else {
                    show = "Value must be an integer";
                }



            }
        }

        if (show != "") {
            $(obj).focus();
            alert(show);
        }
    }
};
