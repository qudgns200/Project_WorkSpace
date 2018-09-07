<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$(".isFrom").click(function() {
		var width = 800,
		height = 500;
		var left = (screen.availWidth - width) / 2;
		var top = (screen.availHeight - height) / 2;
		var specs = "width=" + width;
		specs += ",height=" + height;
		specs += ",left=" + left;
		specs += ",top=" + top;

		window.open("logMessagePage.do?isFrom=" + $(this).text(), "팝업", specs);
	});
});
</script>
</head>
<body>

팔로잉 목록<br><br>
	<c:forEach var="list" items="${followingList }">
		<c:if test="${list != null }">
			<a href="#" class="isFrom">${list }</a><br>
		</c:if>
	</c:forEach>
</body>
</html>