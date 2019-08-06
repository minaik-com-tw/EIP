var allowed_attachments = 15 - 1;
var count_attachments1 = 0 + 1;
var count_attachments2 = 0 + 1;

var oqc_row = 0;
var oqc_sn = 0;

var work_row = 0;
var work_sn = 0;

var orm_row = 0;
var orm_sn = 0;

var bcode_row = 0;
var bcode_sn = 0;

var defect_row = 0;
var defect_sn = 0;

var other_msg = "";
var Model_msg = "";
var Int_msg = "";

var row_count = 0;

var today = new Date();
var CurrentDate = today.getFullYear() + "/" + (today.getMonth() + 1) + "/" + today.getDate();

var defect = {
	"width": 5,
	"height": 3,
	"getArea": function () {
		return width * height;
	}
};


$(function () {
    var language = "";
    $('#ctl00_HeaderControl1_FIELD_language').children().each(function () {
        //input_BARCODE()
        var check = $(this).prop("selected");
        if (check == true) {
            language = $(this).prop("value");
            MultiLang(language);
        }
    });
     
	$(".curr_date").each(function () {
		$(this).val(getToDay());
	});

	$(".top_5").each(function () {
		var oqc_sn = $(this).attr("oqc_sn");
		$(this).attr('oqc_sn', oqc_sn).bind('click', defect_add);

	});

	$(".top_del").each(function () {
		var oqc_sn = $(this).attr("oqc_sn");
		$(this).attr('oqc_sn', oqc_sn).bind('click', defect_del);
	});


	$("input[id^='oqc_del_']").each(function () {
		var oqc_sn = $(this).attr("oqc_sn");
		$(this).attr('oqc_sn', oqc_sn).bind('click', oqc_row_del);
	});

	//work_del_

	$("input[id^='work_del_']").each(function () {
		var work_sn = $(this).attr("work_sn");
		$(this).bind('click', work_row_del);
	});

	$("input[id^='orm_row_del_']").each(function () {
		var orm_sn = $(this).attr("orm_sn");
		$(this).attr('orm_sn', orm_sn).bind('click', orm_row_del);
	});

	$("input[type=checkbox]").each(function () {

		$(this).bind("click", setChk);
	});



});


function getSmaple(row) {

	var spid = $("#ctl00_ContentPlaceHolder1_Drop_spappid").val();
	var Qty = $("#oqc_totalQ_" + row);

	var q = 0;
	q = $(Qty).val() * 1;

	if (q > 0) {

		$.get("jsfunction.aspx", { type: "GetSampling", ID: spid, NO: q }, function (data, status) {
			$("#oqc_sampleQ_" + row).val(data);
		});
	}
	else {
		alert("please inupt Number Quarantine, the value is greater than 0 necessary ");
		$("#oqc_totalQ_" + row).val("");
	}

}

function input_BARCODE2() {
	var row = $(this).attr("bcode_sn");
	var record = $("#bcode_record_" + row).val();

	var entry = prompt("please input Barcode ", "")

	if (entry != "") {
		if (record !== "") {
			record += " ";
		}

		record = record + entry;

		$("#bcode_record_" + row).val(record);

		var show = record.split(' ');

		$("#bcode_record_" + row).empty();

		var html = "";
		if (show.length > 0) {
			for (var i = 0; i < show.length; i++) {
				html += show[i] + "<br>"
			}
		}

		$("#bcode_show_" + row).empty();
		$("#bcode_show_" + row).append(html);
	}
}

function input_BARCODE(obj) {

	var barcode = prompt("please input Barcode ", "")

	var show = obj.id.replace("img", "show");
	var record = obj.id.replace("img", "record");
	var source = $("#" + record).val().replace("undefined", "");
	 
	if (barcode != "") {

		if (source.length>0) {
			source = source + ";" + barcode;
		}
		else {
			source = barcode;
		}  
	}

	$("#" + record).val(source);
	$("#" + show).empty();
	var sp = source.split(";");
	var scode = "";
	for (var i = 0; i < sp.length; i++) {
		scode += sp[i] + "<br>";
	}
	$("#" + show).append(scode);
	 
}
/***************Check input data***************/

function confirm() {
	var send = false;
	var oqc_msg = "", work_msg = "", orm_msg = "", bcode_msg = "", defect_msg = "", Msg = "";

	oqc_msg = check_oqc();
	var error = $("#error").text();

	if (oqc_msg !== "") {
		var txt = $("#ctl00_ContentPlaceHolder1_Label2").text();
		Msg += txt + "-" + oqc_msg + "\n\r";
	}

	work_msg = check_work();

	if (work_msg !== "") {

		var txt = $("#ctl00_ContentPlaceHolder1_Label1").text();
		Msg += txt + "-" + work_msg + "\n\r";
	}

	var orm_msg = check_ORM();

	if (orm_msg !== "") {

		Msg += " ORM-" + orm_msg + "\n\r";
	}

	bcode_msg = chek_bcode();

	if (bcode_msg !== "") {
		Msg += " Barcode-" + bcode_msg + "\n\r";

	}

	defect_msg = chek_defect();

	if (defect_msg !== "") {

		Msg += "Top 5-" + defect_msg + "\n\r";
	}
	var bcode = $(".bcode_item").size() - 1;
	var oqc = $(".oqc_itme").size() - 1;
	var work = $(".work_row").size() - 1;
	var orm = $(".orm_item").size() - 1;



	row_count = bcode + oqc + work + orm;


	if (row_count > 0) {
		if (Msg == "") {
			send = true;
		} else {

			alert(error + ":\n\r" + Msg);
		}

	}
	else {
		var txt = $("#not_input").text();
		alert(txt);
	}
	return send;
}

function defect_text() {

	var first = Array();

	$("#oqc_body").find(".oqc_row").each(function (row) {
		row++;
		var Item = $(this);

		var bottom = Array();
		$(Item).find("#defect_body").children().each(function (i) {
			var def = new defect();
			i++;
			def.level = $("#oqc_" + row + "_def_type_" + i).val();
			def.item = $("#oqc_" + row + "_def_item_" + i).val();
			def.qty = $("#oqc_" + row + "_def_qty_" + i).val();

			bottom.push(def);
		});

		first.push(bottom);
	});

	var jsonObj = JSON.stringify(jsofirstnData);  // 將JSON格式資料轉為物件


}

function chek_defect() {

	var msg = "", chk_type = true, chk_item = true, chk_qty = true;

	$("#defect_body>.top5").each(function () {

		var type = $(this).find("select[id*='def_type']").val();

		var item = $(this).find("select[id*='def_item']").val();

		var qty = $(this).find("input[id*='def_qty']").val();

		if (type == "") {
			chk_type = false;
		}
		if (item == "") {
			chk_item = false;
		}

		if (qty <= 0) {
			chk_qty = false;
		}
	});

	if (chk_type == false) {
		var txt = $("#defect_leve").text();
		msg += "[" + txt + "]";
	}

	if (chk_item == false) {
		var txt = $("#defect_item").text();
		msg += "[" + txt + "]";
	}

	if (chk_qty == false) {
		var txt = $("#defect_qty").text();
		msg += "[" + txt + "]";
	}
	return msg;

}

function chek_bcode() {

	var chk_models = true, chk_BARCODE = true, chk_th = true;
	var msg = "";

	$("tr[id^='bcode_row']").each(function () {


		var model = $(this).find("select[id*='bcode_model']").val();
		var prod = $(this).find("select[id*='bcode_prod']").val();

		var th = $(this).find("input[id*='bcode_th']").val();

		var recode = $(this).find("input[id*='bcode_record").val();

		if (model == "" && prod == "") {
			chk_models = false;
		}

		if (recode == "") {
			chk_BARCODE = false;
		}

		if (th <= 0) {
			chk_th = false;
		}
	});

	if (chk_models == false) {
		var Models = $("#Models").text();
		var product = $("#product").text();
		msg += "[" + Models + "/" + product + "]";
	}

	if (chk_BARCODE == false) {
		msg += "[BARCODE]";
	}

	if (chk_th == false) {
		var txt = $("#tooling").text();
		msg += "[" + txt + "]";
	}

	return msg;

}

function check_work() {

	var chk_work = true, chk_dt = true;
	var msg = "";
	$("tr[id^='work_row']").each(function () {

		var work = $(this).find("select[id*='work_item']").val();
		var startDt = $(this).find("input[id*='work_starDt']").val();
		var endDt = $(this).find("input[id*='work_endDt']").val();

		if (work == "") {
			chk_work = false;
		}

		if (startDt == "" || endDt == "") {
			chk_dt = false;
		}
	});

	if (chk_work == false) {
		var Models = $("#Models").text();
		var product = $("#product").text();
		msg += "[" + Models + "/" + product + "]";
	}

	return msg
}

function check_ORM() {

	var chk_models = true;
	var chk_ORM = true;
	var chk_th = true;
	var msg = "";

	$("tr[id^='orm_row']").each(function () {

		var chk_item = false;
		var model = $(this).find("select[id*='orm_model']").val();
		var prod = $(this).find("select[id*='orm_prod']").val();
		var th = $(this).find("input[id*='orm_th']").val();

		$(this).find(".orm_check").each(function () {
			if ($(this).prop("checked") == true) {
				chk_item = true;
			}

		});

		if (model == "" && prod == "") {
			chk_models = false;
		}

		if (chk_item == false) {
			chk_ORM = false;
		}

		if (th <= 0) {
			chk_th = false;
		}

	});

	if (chk_models == false) {
		var Models = $("#Models").text();
		var product = $("#product").text();
		msg += "[" + Models + "/" + product + "]";
	}

	if (chk_ORM == false) {
		msg += "[ORM FA ODE ]";
	}


	if (chk_th == false) {
		var txt = $("#tooling").text();
		msg += "[" + txt + "]";

	}

	return msg;
}

function check_oqc() {

	var Msg = "";
	var chk_pord = true;
	var chk_th = true;
	var chk_total = true;
	var chk_sample = true;
	var chk_user = true;

	$("tr[id^='oqc_row_']").each(function () {

		var model = $(this).find("select[id*='oqc_model']").val();
		var pord = $(this).find("select[id*='oqc_pord']").val();
		var th = $(this).find("input[id*='oqc_th']").val();
		var total = $(this).find("input[id*='oqc_totalQ']").val();
		var sample = $(this).find("input[id*='oqc_sampleQ']").val();
		var user = $(this).find("input[id*='oqc_user']").val();

		if (model == "" && pord == "") {
			chk_pord = false;
		}
		if (th <= 0) {
			chk_th = false;
		}

		if (total <= 0) {
			chk_total = false;
		}

		if (sample <= 0) {
			chk_sample = false;
		}

		if (user == "") {
			chk_user = false;
		}

	});

	if (chk_pord == false) {
		var Models = $("#Models").text();
		var product = $("#product").text();
		Msg += "[" + Models + "/" + product + "]";
	}

	if (chk_th == false) {
		var txt = $("#tooling").text();
		Msg += "[" + txt + "]";
	}

	if (chk_total == false) {
		var txt = $("#Number_Quarantine").text();
		Msg += "[" + txt + "]";
	}

	if (chk_sample == false) {
		var txt = $("#samples").text();
		Msg += "[" + txt + "]";
	}

	if (chk_user == false) {
		var txt = $("#inspect_person").text();
		Msg += "[" + txt + "]";
	}

	return Msg;
}

/**********************************************/

function getToDay() {
	return today.getFullYear() + "/" + (today.getMonth() + 1) + "/" + today.getDate();
}

/***************Add Row Data*******************************/
function defect_add() {
	var oqc_sn = $(this).attr("oqc_sn");

	defect_sn = $("#oqc_row_" + oqc_sn).find("#defect_body>div").size();

	defect_sn++;

	var defect = $("#defect_detail").clone();
	$(defect).find(".defect").each(function () {
		var id = $(this).attr("id");

		var nid = "oqc_" + oqc_sn + "_" + id + "_" + defect_sn;
		$(this).attr("id", nid);
		var name = $(this).attr("name");
		if (name != 'undefined') {
			$(this).attr("name", "oqc_" + oqc_sn + "_" + name);
		}

	});

	$(defect).show();
	$(defect).attr("id", "oqc_" + oqc_sn + "_defect_" + defect_sn);


	$('#top5_del', defect)
		.attr('oqc_sn', oqc_sn)
		.attr('defect_sn', defect_sn)
		.bind('click', defect_del);

	var defect_body = $("#oqc_row_" + oqc_sn).find("#defect_body");
	var txt = $("#txt");

	if (defect_sn >= 5) {
		$(this).hide();
	}
	$(defect_body).append(defect);

}

function defect_del() {
	var oqc_sn = $(this).attr("oqc_sn");
	var defect_sn = $(this).attr("defect_sn");

	$("#oqc_" + oqc_sn + "_defect_" + defect_sn).remove();

	var defect_body = $("#oqc_row_" + oqc_sn).find("#defect_body")

	var div = $(defect_body).children('div').size();
	console.log(div);
	if (div < 5) {
		var img = $("#oqc_row_" + oqc_sn).find("img#top_add");
		$(img).show();
	}

}

function oqc_row_add() {

	row_count++;
	defect_sn = 0;
	oqc_row++;

	var addItem = $("#oqc_detail");

	var copyItem = addItem.clone();

	$('#oqc_del', copyItem)
		.attr('id', 'oqc_del' + oqc_row)
		.attr('oqc_sn', oqc_row)
		.bind('click', oqc_row_del);


	var total = $(copyItem).find('#oqc_totalQ');
	var total_tag = $(total).attr("id");
	$(total).parent().append('<input name="' + total_tag + '" class="oqc number" id="' + total_tag + '" style="width: 30px;" onblur="getSmaple(' + oqc_row + ')" type="text" value="0"/>');
	$(total).remove();

	var user = $(copyItem).find('.user');
	var user_tag = $(user).attr("id") + oqc_row;

	$(user).parent().append(
		'<input name="oqc_user" type="text" id="txt_' + user_tag + '" value="" Width="60px"  FormatType="InputCombo"  DateSeparator="/" ButtonIconUrl="/lib/img/icon-man1.gif" OnClickMore="Rick_OpenShowModalDialog(' + oqc_row + ',this.value);"  style="width:100px;background-color:#F0F0F0;behavior:url(/lib/htc/inputbox.htc);FILTER:progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff);" />' +

		'<input type="text" id="txt_' + user_tag + '_display" style="width:90px;BACKGROUND-COLOR: transparent;BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none" ReadOnly>');
	$(user).parent().css("text-align", "center");
	$(user).remove();

	var calendar = $(copyItem).find('.date');
	var calendar_tag = $(calendar).attr("id") + oqc_row;

	$(calendar).parent().html('<input name="oqc_bonDt" type="text" value="' + CurrentDate + '"  maxlength="10"  id="' + calendar_tag + '" class="Normal" FormatType="Date" DateType="YYYYMMDD" DateSeparator="/" ButtonIconUrl="" OnClickMore="" FocusinColor="" style="width:100px;background-color:#F0F0F0;behavior:url(/lib/htc/inputbox.htc);FILTER:progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff);" />');
	$(calendar).remove();

	$("#top_add", copyItem)
		.attr('oqc_sn', oqc_row)
		.bind('click', defect_add);

	oqc_sn = $(".oqc_itme").size();

	$(copyItem).find('p').text(oqc_sn);

    $(copyItem).find('.oqc').each(function () {
        var id = $(this).attr("id");
        var n_id = id + "_" + oqc_row;
        $(this).attr("id", n_id);
    });



	if (oqc_sn > 0) {
		$("#oqc_default").hide();
	}

	$(copyItem).attr("id", "oqc_row_" + oqc_row);
	$(copyItem).attr("class", "oqc_row");
	$(copyItem).show();

	$("#oqc_body").append(copyItem);
}

function oqc_row_del() {

	var oqc_sn = $(this).attr("oqc_sn");
	row_count--;
	$("#oqc_row_" + oqc_sn).remove();

	$(".oqc_itme").each(function (i) {
		$(this).text(i);
		oqc_sn = i;
	});

	if (oqc_sn == 0) {
		$("#oqc_default").show();
	}

}

function work_row_add() {

	row_count++;
	work_row++;

	var wroktemp = $("#work_detail");

	var workItem = wroktemp.clone();

	$('#work_del', workItem)
		.attr('work_sn', work_row)
		.attr('value', 'DEL')
		.bind('click', work_row_del);

	workItem.children().each(function (i) {

		var id = $(this).children().attr("id");

		$(this).children().attr("id", id + "_" + work_row);
	});

	work_sn = $(".work_row").size();

	$(workItem).find('p').text(work_sn);

	var dtS = $(workItem).find('.dateS');
	var dtS_tag = $(dtS).attr("id");
	$(dtS).parent().html(
		'<input name="work_startDt" type="text" id="' + dtS_tag + '"  value="' + CurrentDate + '"  maxlength="10"  class="Normal" FormatType="DateTime" DateType="YYYYMMDD" DateSeparator="/" ButtonIconUrl="" OnClickMore="" FocusinColor="" style="width:100px;background-color:#F0F0F0;behavior:url(/lib/htc/inputbox.htc);FILTER:progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff);" />');
	//'<input name="work_startDt" type="text" id="' + dtS_tag + '"  value="' + CurrentDate + '"  maxlength="10"  class="Normal" FormatType="DateTime" DateType="YYYYMMDD" DateSeparator="/" ButtonIconUrl="" OnClickMore="" FocusinColor="" style="width:100px;background-color:#F0F0F0;behavior:url(/lib/htc/inputbox.htc);FILTER:progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff);" />');

	$(dtS).remove();

	var dtE = $(workItem).find('.dateE');
	var dtE_tag = $(dtE).attr("id");
	$(dtE).parent().html('<input name="work_endDt" type="text" id="' + dtE_tag + '"  value="' + CurrentDate + '"  maxlength="10"  class="Normal" FormatType="DateTime" DateType="YYYYMMDD" DateSeparator="/" ButtonIconUrl="" OnClickMore="" FocusinColor="" style="width:100px;background-color:#F0F0F0;behavior:url(/lib/htc/inputbox.htc);FILTER:progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff);" />');
	$(dtE).remove();

	if (work_sn > 0) {
		$("#work_default").hide();
	}

	workItem.show();

	workItem.attr("id", "work_row_" + work_row);

	$("#work_body").append(workItem);

}

function work_row_del() {
	row_count--;

	var Item = $(this).attr("work_sn");

	$("#work_row_" + Item).remove();

	$(".work_row").each(function (index) {

		$(this).text(index);
		work_sn = index;
	});

	if (work_sn == 0) {
		$("#work_default").show();
	}
}

function orm_row_add() {

	row_count++;
	orm_row++;
	var copyItem = $("#orm_detail").clone();

	$(copyItem).find(".orm").each(function () {
		var id = $(this).attr("id");
		var nid = id + "_" + orm_row;
		$(this).attr("id", nid);
	});

	$("input[type=checkbox]", copyItem).bind("click", setChk);

	$("#orm_del", copyItem)
		.attr("orm_sn", orm_row)
		.bind("click", orm_row_del);

	orm_sn = $(".orm_item").size();

	if (orm_sn > 0) {
		$("#orm_default").hide();
	}

	$(copyItem).find("p").text(orm_sn);

	copyItem.show();

	copyItem.attr("id", "orm_row_" + orm_row);

	$("#orm_body").append(copyItem);

}

function orm_row_del() {
	var Item = $(this).attr("orm_sn");

	row_count--;
	$("#orm_row_" + Item).remove();

	$(".orm_item").each(function (index) {

		$(this).text(index);
		orm_sn = index;
	});

	if (orm_sn == 0) {
		$("#orm_default").show();
	}
}

function bcode_row_add() {
	row_count++;
	bcode_row++;

	var bcodetemp = $("#bcode_detail");
	var bcodeItem = bcodetemp.clone();

	$(bcodeItem).find(".Bcode").each(function () {
		var id = $(this).attr("id");
		var nid = id + "_" + bcode_row;
		$(this).attr("id", nid);
	});

	bcode_sn = $(".bcode_item").size();
	$(bcodeItem).find("p").text(bcode_sn);

	$("#bcode_img", bcodeItem)
		.attr("bcode_sn", bcode_sn)
		.bind("click", input_BARCODE);

	$("#bcode_del", bcodeItem)
		.attr("bcode_sn", bcode_row)
		.bind("click", bcode_row_del);

	if (bcode_sn > 0) {
		$("#bcode_default").hide();
	}

	bcodeItem.show();
	bcodeItem.attr("id", "bcode_row_" + bcode_row);

	$("#bcode_body").append(bcodeItem);

}

function bcode_row_del() {
	row_count--;
	var row = $(this).attr("bcode_sn");
	$("#bcode_row_" + row).remove();

	$(".bcode_item").each(function (index) {

		$(this).text(index);
		bcode_sn = index;
	});

	if (bcode_sn == 0) {
		$("#bcode_default").show();
	}
}
/**********************************************/

function addfileA() {

	if (allowed_attachments <= 0) {
		return false;
	}
	else {

		count_attachments1 = count_attachments1 + 1;

		var attid = 'attach_A_' + count_attachments1;
		//   alert(attid);
		str = '<SmoothEnterpriseWebControl:InputFile width="120px" runat="server" onchange="addfileA()" BackColor="#F0F0F0" CssClass="Normal"> <Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputFile>';
		document.getElementById('uploadfilesA').insertAdjacentHTML("beforeEnd", str)//
		allowed_attachments = allowed_attachments - 1;
		return false;
	}
}

function addfileB(id) {
	// alert(allowed_attachments);
	if (allowed_attachments <= 0) {
		return false;
	}
	else {
		//var size = $($("#" + id)).filesize;
		//if(size > 1024 * 512){
		// alert('您選擇上傳的檔案大小大於500K，請重新選擇！');
		// return false;
		//}
		count_attachments2 = count_attachments2 + 1;

		var attid = 'attach_B_' + count_attachments2;
		// alert(attid);
		//str = '<SmoothEnterpriseWebControl:InputFile width="120px" runat="server" onchange="addfileB()" BackColor="#F0F0F0" CssClass="Normal"> <Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputFile>';
		//document.getElementById('uploadfilesB').insertAdjacentHTML("beforeEnd", str);//

		$('#uploadfilesB').append('<input type="file" name="ctl00$ContentPlaceHolder1$' + attid + '" id="ctl00_ContentPlaceHolder1_' + attid + '" class="Normal" onchange="addfileB()" style="background-color:#F0F0F0;FILTER:progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff);">');
		allowed_attachments = allowed_attachments - 1;
		return false;
	}
}


function setChk() {

	var tag = $(this).attr("id");

	if ($(this).prop("checked")) {
		$("#chk_" + tag).val("true");
	} else {
		$("#chk_" + tag).val("false");
	}

}

function Rick_OpenShowModalDialog(nm, strValue) {

	var thisobj = document.getElementById('aspnetForm');
	var item = "oqc_user" + nm

	showModalDialog('/Security/PopupUser.aspx?$$authtype=&$$queryvalue=' + strValue + '&txt_' + item + '=id&txt_' + item + '_formatvalue=logonid&txt_' + item + '_display=name', thisobj, 'dialogWidth: 506px; dialogHeight: 480px; resizable: no; help: no; status: no; scroll: no;');
}

