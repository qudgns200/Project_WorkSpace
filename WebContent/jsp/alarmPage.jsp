<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script type="text/javascript">

var nonReadAlarm = function(){
	$.ajax({
		type: "get",
		url: "readCheckAlarm.do",
		data: {"readCheck" : 1},
		dataType: "json",
		success: function(data){
			$('#nonReadAlarm').empty(); //출력결과 누적방지
			var str = '<tr>';
			$.each(data.alarmList, function(index, alarmList){
				str += '<td>' + alarmList.type + '</td><td>' + alarmList.time + '</td><td>' +
						'<a class="btn btn-info" onclick="funUpdate('+ alarmList.no + ')">읽음</a>' +
						'<a class="btn btn-warning" onclick="funDelete(' + alarmList.no + ')">삭제</a></td>';
				str += '</tr>';
			}) // each의 끝
			$('#nonReadAlarm').append(str); // 읽지 않은 알림목록 테이블 갱신
		} // success의 끝
	}) // ajax의 끝
} // nonReadAlarm 함수의 끝

var readAlarm = function(){
	$.ajax({
		type: "get",
		url: "readCheckAlarm.do",
		data: {"readCheck": 2},
		dataType: "json",
		success: function(data){
			$('#readAlarm').empty(); //출력결과 누적방지
			var str = '<tr>';
			$.each(data.alarmList, function(index, alarmList){
				str += '<td>' + alarmList.type + '</td><td>' + alarmList.time + '</td><td>' +
						'<a class="btn btn-warning" onclick="funDelete(' + alarmList.no + ')">삭제</a></td>';
				str += '</tr>';
			}) // each의 끝
			$('#readAlarm').append(str); // 읽지 않은 알림목록 테이블 갱신
		} // success의 끝
	}) // ajax의 끝
}	// readAlarm 함수의 끝

var deleteAlarm = function(no){
	$.ajax({
		type: "get",
		url: "deleteAlarm.do",
		data: {"no":no },
		success: function(){
			alarmCount();
			selectAlarm();
		} // success의 끝
	}) // ajax의 끝
} // deleteAlarm 함수의 끝

var funUpdate = function(no){  			// 읽음 클릭시 readCheck값 바꾸고, 목록 갱신
		updateAlarm(no);
		setTimeout(function() {
		nonReadAlarm();
		readAlarm();
		}, 200);
	}

var funDelete = function(no){  			// 삭제 클릭시 데이터 지우고, 목록 갱신
	deleteAlarm(no);
	setTimeout(function() {
	nonReadAlarm();
	readAlarm();
	}, 200);
}

</script>

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

				<h4>읽지 않은 알림</h4>
				<hr style="display: block; margin-top: 0.5em; margin-bottom: 0.5em; border-style: inset; border-width: 1px;">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col">알림 내용</th>
							<th scope="col">알림 시간</th>
							<th scope="col">읽음/삭제</th>
						</tr>
					</thead>
					<tbody id="nonReadAlarm">
						<c:forEach items="${alarmList }" var="alarm">
						<c:if test="${alarm.readCheck==1 }">
							<tr>
							<td>${alarm.type }</td>
							<td>${alarm.time }</td>
							<td><a class="btn btn-info" onclick="funUpdate(${alarm.no})">읽음</a>
							<a class="btn btn-warning" onclick="funDelete(${alarm.no})">삭제</a></td>							
							</tr>
						</c:if>
							</c:forEach>
					</tbody>
				</table>
				
				<h4>읽은 알림</h4>
				<hr style="display: block; margin-top: 0.5em; margin-bottom: 0.5em; border-style: inset; border-width: 1px;">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col">알림 내용</th>
							<th scope="col">알림 시간</th>
							<th scope="col">삭제</th>
						</tr>
					</thead>
					<tbody id="readAlarm">
					<c:forEach items="${alarmList }" var="alarm">
						<c:if test="${alarm.readCheck==2 }">
							<tr>
							<td>${alarm.type }</td>
							<td>${alarm.time }</td>
							<td><a class="btn btn-warning" onclick="funDelete(${alarm.no})">삭제</a></td>
							</tr>
						</c:if>
							</c:forEach>
					</tbody>
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

