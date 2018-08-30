<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>나의 강의정보 페이지</title>
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
window.onload = function(){
myLectureFormG();	
}

var attendPagingLog;
var gatherPagingLog;

var myLectureFormG = function(){ // 강의 내역 페이지 요청 함수
	$.ajax({
		type: "get",
		url: "myLectureFormG.do",
		data: {"pageG" : gatherPagingLog, "pageA" : attendPagingLog },
		dataType: "json",
		success: function(data){
			$('#attendList').empty(); // 출력결과 누적 방지
			$('#gatherList').empty();
			$('#attendPaging').empty();
			$('#gatherPaging').empty();
			
			var str1 = "<tr>";
			$.each(data.attendList, function(index, attendList){ 	// 강의신청 목록
				str1 += '<td>' + attendList.genre + '</td><td>' + attendList.title + '</td><td>' +
						attendList.artistID + '</td><td>' + attendList.startDate + '</td><td>' +
						attendList.place + '</td>';
				str1 += '</tr>';
			}); // each
			$('#attendList').append(str1); // 강의신청 목록- 테이블에 붙이기

			var str1Paging = "";
			if(data.startA != 1){
				var startA = data.startA - 1;
				str1Paging += '<button onclick= "attendPagingLog = 1; myLectureFormG();">첫 페이지</button>' +
							  '<button onclick= "attendPagingLog =' + startA + '; myLectureFormG();">이전</button>';
			} // 처음, 이전 페이지 버튼
			if(data.endA < data.lastA){
			for(var i = data.startA; i <= data.endA; i++){
				if(i==data.currentA){
					str1Paging += '[ '+i+' ]';
				}else{
					str1Paging += '<button onclick= "attendPagingLog =' + i + '; myLectureFormG();">' + i + '</button>';
				}
			} 
			var endA = data.endA + 1;
			str1Paging += '<button onclick= "attendPagingLog =' + endA + '; myLectureFormG();">다음</button>' +
				   		  '<button onclick= "attendPagingLog ='+ data.lastA +'; myLectureFormG();">끝 페이지</button>';  // 다음, 끝 페이지 버튼
			} // if(data.endA < data.lastA) 끝
			else{
			for(var i = data.startA; i <= data.lastA; i++){
				if(i==data.currentA){
					str1Paging += ' [ '+i+' ] ';
				}else{
					str1Paging += '<button onclick= "attendPagingLog =' + i + '; myLectureFormG();">' + i + '</button>';
				}	
			}
			} // else 끝
			
			$('#attendPaging').append(str1Paging); // 강의신청 목록 페이징 처리- 테이블에 붙이기
			
			var str2 = "<tr>";
			$.each(data.gatherList, function(index, gatherList){ 		// 모집 중인 강의 목록
				str2 += '<td>' + gatherList.genre + '</td><td>' + gatherList.title + '</td><td>' +
						gatherList.artistID + '</td><td>' + gatherList.startGDate + '</td><td>' +
						gatherList.place + '</td><td>' + gatherList.state + '</td>';
				str2 += '</tr>';
			}); // each
			$('#gatherList').append(str2); // 모집 중인 강의- 테이블에 붙이기

			var str2Paging = "";
			if(data.startG != 1){
				var startG = data.startG - 1;
				str2Paging += '<button onclick= "gatherPagingLog = 1; myLectureFormG();">첫 페이지</button>' +
							  '<button onclick= "gatherPagingLog =' + startG + '; myLectureFormG();">이전</button>';
			} // 처음, 이전 페이지 버튼
			if(data.endG < data.lastG){
			for(var j = data.startG; j <= data.endG; j++){
				if(j==data.currentG){
					str2Paging += '[ '+j+' ]';
				}else{
					str2Paging += '<button onclick= "gatherPagingLog =' + j + '; myLectureFormG();">' + j + '</button>';
				}
			} 
			var endG = data.endG + 1;
			str2Paging += '<button onclick= "gatherPagingLog =' + endG + '; myLectureFormG();">다음</button>' +
				   		  '<button onclick= "gatherPagingLog ='+ data.lastG +'; myLectureFormG();">끝 페이지</button>';  // 다음, 끝 페이지 버튼
			} // if(data.endG < data.lastG) 끝
			else{
			for(var j = data.startG; j <= data.lastG; j++){
				if(j==data.currentG){
					str2Paging += ' [ '+j+' ] ';
				}else{
					str2Paging += '<button onclick= "gatherPagingLog =' + j + '; myLectureFormG();">' + j + '</button>';
				}	
			}
			} // else 끝
			
			$('#gatherPaging').append(str2Paging); // 모집 중인 강의 페이징 처리- 테이블에 붙이기
			
			
			} // success
		}) // ajax
} // myLectureFormG 함수의 끝
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

		<div class="span3 sidebar page-left-sidebar">
			<!-- Begin sidebar column -->

			<!--Navigation-->
			<h5 class="title-bg" style="margin-top: 0px;">마이페이지</h5>
			<ul class="post-category-list">
				<li><a onclick="myLectureFormG()"><i class="icon-plus-sign"></i>강의 내역 조회</a></li>
				<li><a href="myOrderFormG0.do"><i class="icon-plus-sign"></i>주문 내역 조회</a></li>
				<li><a href="#"><i class="icon-plus-sign"></i>개인 정보 수정</a></li>
				<li><a href="#"><i class="icon-plus-sign"></i>회원 탈퇴</a></li>
			</ul>

		</div>

		<div class="row">
			<!--Container row-->

			<div class="span8 contact">
				<!--Begin page content column-->

				<h2>강의 내역 조회</h2>

				<div class="alert alert-success">Well done! You successfully
					read this important alert message.</div>

				<h4>신청한 강의</h4>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col">장르</th>
							<th scope="col">강의명</th>
							<th scope="col">아티스트</th>
							<th scope="col">강의기간</th>
							<th scope="col">장소</th>
						</tr>
					</thead>
					<tbody id="attendList">
					</tbody>
					<tr>
						<td id="attendPaging" colspan="5"></td>
					</tr>
				</table>

				<h4>모집 중인 강의</h4>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col">장르</th>
							<th scope="col">강의명</th>
							<th scope="col">아티스트</th>
							<th scope="col">강의기간</th>
							<th scope="col">장소</th>
							<th scope="col">상태</th>
						</tr>
					</thead>
					<tbody id="gatherList">
					</tbody>
					<tr>
						<td id="gatherPaging" colspan="6"></td>
					</tr>
				</table>

			</div>
			<!--End page content column-->


		</div>
		<!-- End container row -->

	</div>
	<!-- End Container -->

	<!-- Footer Area
        ================================================== -->
	<%@include file="footer.jsp"%>

</body>

</html>

