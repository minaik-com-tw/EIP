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