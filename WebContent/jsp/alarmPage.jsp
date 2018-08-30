<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>알림 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS
================================================== -->
<link href='http://fonts.googleapis.com/css?family=Oswald'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-responsive.css">
<link rel="stylesheet" href="css/jquery.lightbox-0.5.css">
<link rel="stylesheet" href="css/custom-styles.css">

<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <link rel="stylesheet" href="css/style-ie.css"/>
<![endif]-->

<!-- Favicons
================================================== -->
<link rel="shortcut icon" href="img/favicon.ico">
<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="img/apple-touch-icon-114x114.png">

<!-- JS
================================================== -->
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.custom.js"></script>
</head>
	
<body>
	<div class="color-bar-1"></div>
	<div class="color-bar-2 color-bg"></div>

	<div class="container main-container">

		<!--     Header section -->
		<%@include file="header.jsp"%>

		<!-- Page Content
    ================================================== -->

		<div class="row">
			<!--Container row-->

			<div class="span8 contact">
				<!--Begin page content column-->

				<h3>알 림</h3>

				<div class="alert alert-success">Well done! You successfully
					read this important alert message.</div>

				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col">알림 내용</th>
							<th scope="col">알림 시간</th>
							<th scope="col">읽음/안읽음</th>
						</tr>
					</thead>
					<tbody id="alarmList">
					</tbody>
					<tr>
						<td id="alarmPaging" colspan="3"></td>
					</tr>
				</table>
			</div>
			<!--End page content column-->

		</div>
		<!-- End container row -->

	</div>
	<!-- End Container -->

		<!-- Footer Area ================================================== -->
    <%@include file="footer.jsp"%>

</body>

</html>

