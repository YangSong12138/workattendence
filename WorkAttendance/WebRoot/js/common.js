$(function() {
	$("#btn-signin").click(function() {
		var username = $.trim($("#username").val());
		var password = $.trim($("#password").val());

		if (username == "") {
			$('#error').css('display', 'block');
			$('#error').html('请输入您的用户名');
			$("#username").focus();
			return;
		}
		if (password == "") {
			$('#error').css('display', 'block');
			$('#error').html('请输入密码');
			$("#password").focus();
			return;
		}

		var json_message = {
			username: username,
			password: password,
		};

		var url = '/mobile/signin';

		$.ajax({
			type: "POST",
			url: url,
			data: JSON.stringify(json_message),
			success: function(data) {
				if (data.result === '0') {
					alert(data.message);
				} else {
					var next = QueryGET('next');
					if (next) {
						window.location = next;
					} else {
						window.location = '/';
					}
				}
			},
			dataType: "json",
			contentType: "application/json",
			processData: false,
		});
	});
	$("#btn_updateArticleCategory").click(function() {
		var url = '/mobile/category/article/update';

		$.ajax({
			type: "POST",
			url: url,
			data: JSON.stringify({}),
			success: function(data) {
				if (data.result != '1') {
					alert(data.message);
				} else {
					window.location.reload();
				}
			},
			dataType: "json",
			contentType: "application/json",
			processData: false,
		});

	});
	$(".btn_updateCategoryName").click(function() {

		var json_message = {
			id: $(this).attr('data-id'),
		};
		$(this).parent().parent().find('input.to-change').each(function(index, o) {
			json_message[$(this).attr('name')] = $(this).val();
		});

		var url = '/mobile/category/article/updateMobieName';

		$.ajax({
			type: "POST",
			url: url,
			data: JSON.stringify(json_message),
			success: function(data) {
				if (data.result != '1') {
					alert(data.message);
				} else {
					window.location.reload();
				}
			},
			dataType: "json",
			contentType: "application/json",
			processData: false,
		});
	});

	$(".btn_updateComment").click(function() {

		var url = '/mobile/comments/article/updateComment';
		var json_message = {
			cid: $(this).attr('data-id'),
			status: $(this).attr('data-value'),
		};
		$.ajax({
			type: "POST",
			url: url,
			data: JSON.stringify(json_message),
			success: function(data) {
				if (data.result != '1') {
					alert(data.message);
				} else {
					window.location.reload();
				}
			},
			dataType: "json",
			contentType: "application/json",
			processData: false,
		});
	});

	$(".btn_updateSubjectComment").click(function() {

		var url = '/mobile/comments/subject/updateComment';
		var json_message = {
			rid: $(this).attr('data-id'),
			status: $(this).attr('data-value'),
		};
		$.ajax({
			type: "POST",
			url: url,
			data: JSON.stringify(json_message),
			success: function(data) {
				if (data.result != '1') {
					alert(data.message);
				} else {
					window.location.reload();
				}
			},
			dataType: "json",
			contentType: "application/json",
			processData: false,
		});
	});

	$(".btn_updateArticle").click(function() {

		var url = '/mobile/article/article/updateArticle';
		var json_message = {
			articleid: $(this).attr('data-id'),
			status: $(this).attr('data-value'),
		};
		$.ajax({
			type: "POST",
			url: url,
			data: JSON.stringify(json_message),
			success: function(data) {
				if (data.result != '1') {
					alert(data.message);
				} else {
					window.location.reload();
				}
			},
			dataType: "json",
			contentType: "application/json",
			processData: false,
		});
	});

	$(".btn_deleteAd").click(function() {

		var url = '/mobile/ad/article/deleteAd';
		var json_message = {
			id: $(this).attr('data-id'),
		};
		$.ajax({
			type: "POST",
			url: url,
			data: JSON.stringify(json_message),
			success: function(data) {
				if (data.result != '1') {
					alert(data.message);
				} else {
					alert('删除成功');
					window.location.reload();
				}
			},
			dataType: "json",
			contentType: "application/json",
			processData: false,
		});
	});

	$('#pCategory').on('change', function() {
		var json_message = {
			catid: this.value,
		};
		getCCategory(json_message, function(data) {
			$('#cCategory').html('<option value="0">全部</option>');
			$.each(data, function(indes, value) {
				var option = '<option value="' + value.catid + '">' + value.name + '</option>';
				$('#cCategory').append(option);
			});
		});
	});

	// var json_message = {
	// 	catid: $('#pCategory').val(),
	// };
	// getCCategory(json_message, function(data) {
	// 	$('#cCategory').html('<option value="0">全部</option>');
	// 	$.each(data, function(indes, value) {
	// 		var option = '<option value="' + value.catid + '">' + value.name + '</option>';
	// 		$('#cCategory').append(option);
	// 	});
	// });
});


function QueryGET(TheName) {
	var urlt = window.location.href.split("?");
	var gets = urlt[1].split("&");
	for (var i = 0; i < gets.length; i++) {
		var get = gets[i].split("=");
		if (get[0] == TheName) {
			var TheValue = get[1];
			break;
		}
	}
	return TheValue;
}

//时间格式化

function formatTime(date, fmt) {
	var o = {
		"M+": date.getMonth() + 1, //月份
		"d+": date.getDate(), //日
		"h+": date.getHours() % 12 == 0 ? 12 : date.getHours() % 12, //小时
		"H+": date.getHours(), //小时
		"m+": date.getMinutes(), //分
		"s+": date.getSeconds(), //秒
		"q+": Math.floor((date.getMonth() + 3) / 3), //季度
		"S": date.getMilliseconds() //毫秒
	};
	var week = {
		"0": "\u65e5",
		"1": "\u4e00",
		"2": "\u4e8c",
		"3": "\u4e09",
		"4": "\u56db",
		"5": "\u4e94",
		"6": "\u516d"
	};
	if (/(y+)/.test(fmt)) {
		fmt = fmt.replace(RegExp.$1, (date.getFullYear() + "").substr(4 - RegExp.$1.length));
	}
	if (/(E+)/.test(fmt)) {
		fmt = fmt.replace(RegExp.$1, ((RegExp.$1.length > 1) ? (RegExp.$1.length > 2 ? "\u661f\u671f" : "\u5468") : "") + week[date.getDay() + ""]);
	}
	for (var k in o) {
		if (new RegExp("(" + k + ")").test(fmt)) {
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
		}
	}
	return fmt;
}

function getCCategory(json_message, callback) {
	var url = '/mobile/ad/article/getCCategory';

	$.ajax({
		type: "POST",
		url: url,
		data: JSON.stringify(json_message),
		success: function(data) {
			if (data.result != '1') {
				alert(data.message);
			} else {
				callback(data.results);
			}
		},
		dataType: "json",
		contentType: "application/json",
		processData: false,
	});
}