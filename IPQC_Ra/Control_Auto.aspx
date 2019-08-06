
<html>
<script src="../script/js/jquery.js"></script>
<script src="../script/json/json2.js"></script>
<script>
    $(function () {
        jQuery.support.cors = true;
        var data = $.ajax({
            type: 'POST',
            dataType: "json",
            //url: '<%=Utility.Report2Url%>/IPQC_Ra/Control_chart.ashx',
            url: 'http://localhost:9004/IPQC_Ra/Control_chart.ashx',
            data: JSON.stringify({   Type: "a" })
        });

         //成功得到資料
         data.success(function (msg) {
             console.log("OK");
           //  var data = JSON.parse(msg);
             var status = data.status

             if (status > 0) {
                 //send
                 var Msg = data.send + "郵件已發送";
                 $("#msg").val(Msg);
             }
             else {
                 var Msg = "查無資料，不發送郵件";
                 $("#msg").val(Msg);
             }
         });

         //取得資料失敗
         data.error(function (xhr, ajaxOptions, thrownError) {
             console.log("NG");
             console.log("xhr:", xhr.responseText);
             console.log("ajaxOptions", ajaxOptions);
             console.log("thrownError:", thrownError);
         });

     });
</script>

<body>
<div id="msg" ></div> 
</body>

</html>

