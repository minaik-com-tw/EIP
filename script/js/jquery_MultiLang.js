/// <reference path="jquery-1.4.2.js" />
/* 
jQuery Multilanguage Helper 
v 0.5 by Jeffrey Lee, 2010-07-21 

*/


function MultiLang(language) {

    if (language == "undefined" || language == "") {
        language = "en-us";
    }

    $.ajax({
        url: '../../script/Language.xml',
        type: 'GET',
        timeout: 1000,
        error: function (xml) {
            alert('Language 讀取錯誤' ); //當xml讀取失敗
        },

        success: function (xml) {
            
            $(".ML").each(function (index) {

                var Tag = $(this).prop("tagName");

                switch (Tag) {
                    case "SELECT"://value()
                        var context = $(this).children().each(function () {
                            var option = $(this).attr("ML_Tag");
                            var obj = $(xml).find(option);
                            var show = $(obj).attr(language);
                            $(this).text(show);
                            //console.log("SELECT-option:", option, " language:", language, " show:", show);
                        });
                        break;

                    case "INPUT"://value()
                        var value = $(this).attr("ML_Tag");
                        var obj = $(xml).find(value);
                        var show = $(obj).attr(language);
                        $(this).attr("value", show);
                        //console.log("INPUT-option:", value, " language:", language, " show:", show);
                        break;


                    default: //text
                        var value = $(this).attr("ML_Tag")
                        var obj = $(xml).find(value);
                        var show = $(obj).attr(language);
                        $(this).text(show);
                        //console.log("other-option:", value, " language:", language, " show:", show);
                        break;
                }
            });
        }
    });

}

