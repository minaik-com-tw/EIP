$(function () {

    $(".Operater").each(function () {

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

        $(this).parent().append('<div style="float:left;width:130px;margin:0px;padding:0px; border:0px solid #849483; cursor: pointer;" ><input id="' + temp + '" type="text" value="' + txt + '" ' + add + '  onchange="Operater_change(this,\'' + $(this).attr("id") + '\' )" /></div>');
        $(this).parent().append('<div title="select member" style="border:0px;float:left;width:auto;cursor: pointer;" class="fa-x fa fa-users" onclick="getOperater(' + id + ')" ></div>');


    });
});
function getOperater(obj) {


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

function Operater_change(obj, ctr) {

    var member = $(obj).val();

    if (member == "" || member == null) {
        $("#" + ctr).val("");
    }
}