<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문의사항 게시판</title>
</head>
<body>
<div class="color-bar-1"></div>
	<div class="color-bar-2 color-bg"></div>

	<div class="container main-container">

		<!--     Header section -->
		<%@include file="header.jsp"%>

		<!-- Page Content
    ================================================== -->
		<input type="button" class="btn btn-success pull-center" value="글쓰기" onclick="location.href='writeQnaForm.do'">
		
			<!--End page content column-->


		<!-- End container row -->

	</div>
	<!-- End Container -->

	<!-- Footer Area
    ================================================== -->
    <%@include file="footer.jsp"%>

</body>
</html>