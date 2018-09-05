<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$(".isFrom").click(function() {
		var width=800, height=500;
		var left = (screen.availWidth - width)/2;
		var top = (screen.availHeight - height)/2;
		var specs = "width=" + width;
		specs += ",height=" + height;
		specs += ",left=" + left;
		specs += ",top=" + top;
		
		window.open("logMessage.do?isFrom=" + $(this).text(), "팝업", specs);
	});
	
	$(".delete").click(function() {
		var index = $('.delete').index(this);
		$.ajax({
			type : 'get',
			url : 'deleteMessage.do',
			data : {'isFrom' : $('.isFrom').text()},
			dataType : 'json',
			success : function(data) {
				if(data.result) {
					$(".tr").eq(index).remove();
				}
			},
			error : function(xhr, status, error) {
				alert("삭제오류");
			}
		});
	});
});
</script>
</head>
<body>
<table>
<c:forEach var="message" items="${messageList }">
<tr class="tr">
<td><a href="#" class="isFrom">${message.isFrom}</a> <button class="delete">메시지 삭제</button></td><br>
</tr>
</c:forEach>
</table>
</body>
</html>