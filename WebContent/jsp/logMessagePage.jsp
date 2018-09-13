<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
function logMessage() {
	$.ajax({
		type : 'get',
		url : 'logMessage.do',
		data : {'isFrom' : $('#isFrom').val()},
		dataType : 'json',
		success : function(data) {
			$("#div").html('');
			$.each(data.logMessage, function(index, message) {
				if($("#id").val() !== message.isTo) {
					$("#div").append("<div class='td' style='color : blue;'><b>" + message.isTo + " : " + message.content + "</b></div>");
				} else {
					$("#div").append("<div class='td' align='right'><b>" + message.content + "</b></div>");
				}
			});
			$.each(data.list, function(index, l) {
				if($("#id").val() !== data.logMessage.isTo) {
					$('.td').eq(index).append("<br>" + l);
				} else {
					$('.td').eq(index).append("<br>" + l);
				}
			});
		},
		error : function(xhr, status, error) {
			alert("메시지 출력 오류");
		}
	});
}

	$(document).ready(function() {
		setInterval(function() {
			logMessage();
		}, 100);
		
		$("#btn").click(function() {
			$.ajax({
				type : 'get',
				url : 'sendMessage.do',
				data : {
					'isFrom' : $('#isFrom').val(),
					'content' : $('#content').val()
				},
				dataType : 'json',
				success : function(data) {
					$('#content').val('');
				},
				error : function(xhr, status, error) {
					alert("전송오류");
				}
			});
		});
		
		$('#content').keydown(function(e) {
			if(e.keyCode == 13) {
				$("#btn").click();
			}
		})
	});
</script>
</head>
<body>
	<div id="div"></div>
	<form id="form">
	<input type="hidden" value="${id }" id="id">
		<input type="hidden" value="${isFrom }" id="isFrom">
		<div align="center"><textarea rows="5" cols="50" id="content" style="width:85%;"></textarea>
		<input type="button" value="전송" id="btn"></div>
	</form>
</body>
</html>