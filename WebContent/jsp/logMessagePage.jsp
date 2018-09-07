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
			$("#table").html('');
			$.each(data.logMessage, function(index, message) {
				$("#table").append("<tr><td>" + message.isTo + " : " + message.content + " --- " + message.time + "</td></tr>");
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
					if (data.result) {
						$.each(data.logMessage, function(index, message) {
							$("#table").append("<tr><td>" + message.isTo + " : " + message.content + " --- " + message.time + "</td></tr>");
						});
					}
				},
				error : function(xhr, status, error) {
					alert("전송오류");
				}
			});
		});
	});
</script>
</head>
<body>
	<table id="table"></table>
	<form id="form">
		<input type="hidden" value="${isFrom }" id="isFrom">
		<textarea rows="10" cols="100" id="content"></textarea>
		<input type="button" value="전송" id="btn">
	</form>
</body>
</html>