<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Piccolo Theme</title>
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
myLectureFormA();	
}

var attendPagingLog;
var gatherPagingLog;
var requestPagingLog;
var approvePagingLog;

var myLectureFormA = function(){ // 강의 내역 페이지 요청 함수
	$.ajax({
		type: "get",
		url: "myLectureFormA.do",
		data: {"pageG" : gatherPagingLog, "pageA" : attendPagingLog, "pageR" : requestPagingLog, 
		"pageAp" : approvePagingLog },
		dataType: "json",
		success: function(data){
			$('#attendList').empty(); // 출력결과 누적 방지
			$('#gatherList').empty();
			$('#requestList').empty(); 
			$('#approveList').empty();
			$('#attendPaging').empty();
			$('#gatherPaging').empty();
			$('#requestPaging').empty();
			$('#approvePaging').empty();
			
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
				str1Paging += '<button onclick= "attendPagingLog = 1; myLectureFormA();">첫 페이지</button>' +
							  '<button onclick= "attendPagingLog =' + startA + '; myLectureFormA();">이전</button>';
			} // 처음, 이전 페이지 버튼
			if(data.endA < data.lastA){
			for(var i = data.startA; i <= data.endA; i++){
				if(i==data.currentA){
					str1Paging += '[ '+i+' ]';
				}else{
					str1Paging += '<button onclick= "attendPagingLog =' + i + '; myLectureFormA();">' + i + '</button>';
				}
			} 
			var endA = data.endA + 1;
			str1Paging += '<button onclick= "attendPagingLog =' + endA + '; myLectureFormA();">다음</button>' +
				   		  '<button onclick= "attendPagingLog ='+ data.lastA +'; myLectureFormA();">끝 페이지</button>';  // 다음, 끝 페이지 버튼
			} // if(data.endA < data.lastA) 끝
			else{
			for(var i = data.startA; i <= data.lastA; i++){
				if(i==data.currentA){
					str1Paging += ' [ '+i+' ] ';
				}else{
					str1Paging += '<button onclick= "attendPagingLog =' + i + '; myLectureFormA();">' + i + '</button>';
				}	
			}
			} // else 끝
			
			$('#attendPaging').append(str1Paging); // 강의신청 목록 페이징 처리- 테이블에 붙이기
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			var str2 = "<tr>";
			$.each(data.gatherList, function(index, gatherList){ 		// 모집 중인 강의 목록
				str2 += '<td>' + gatherList.genre + '</td><td>' + gatherList.title + '</td><td>' +
						gatherList.artistID + '</td><td>' + gatherList.startDate + '</td><td>' +
						gatherList.place + '</td><td>' + gatherList.state + '</td>';
				str2 += '</tr>';
			}); // each
			$('#gatherList').append(str2); // 모집 중인 강의- 테이블에 붙이기

			var str2Paging = "";
			if(data.startG != 1){
				var startG = data.startG - 1;
				str2Paging += '<button onclick= "gatherPagingLog = 1; myLectureFormA();">첫 페이지</button>' +
							  '<button onclick= "gatherPagingLog =' + startG + '; myLectureFormA();">이전</button>';
			} // 처음, 이전 페이지 버튼
			if(data.endG < data.lastG){
			for(var j = data.startG; j <= data.endG; j++){
				if(j==data.currentG){
					str2Paging += '[ '+j+' ]';
				}else{
					str2Paging += '<button onclick= "gatherPagingLog =' + j + '; myLectureFormA();">' + j + '</button>';
				}
			} 
			var endG = data.endG + 1;
			str2Paging += '<button onclick= "gatherPagingLog =' + endG + '; myLectureFormA();">다음</button>' +
				   		  '<button onclick= "gatherPagingLog ='+ data.lastG +'; myLectureFormA();">끝 페이지</button>';  // 다음, 끝 페이지 버튼
			} // if(data.endG < data.lastG) 끝
			else{
			for(var j = data.startG; j <= data.lastG; j++){
				if(j==data.currentG){
					str2Paging += ' [ '+j+' ] ';
				}else{
					str2Paging += '<button onclick= "gatherPagingLog =' + j + '; myLectureFormA();">' + j + '</button>';
				}	
			}
			} // else 끝
			
			$('#gatherPaging').append(str2Paging); // 모집 중인 강의 페이징 처리- 테이블에 붙이기
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////			
			
			var str3 = "<tr>";
			$.each(data.requestList, function(index, requestList){ 	// 요청 받은 강의목록
				str3 += '<td>' + requestList.genre + '</td><td>' + requestList.title + '</td><td>' +
						requestList.startDate + '</td><td>' + requestList.place + '</td><td>' +
						requestList.maxPeople + '</td><td>' + requestList.guestID + '</td>';
				str3 += '</tr>';
			}); // each
			$('#requestList').append(str3); // 요청 받은 강의목록- 테이블에 붙이기

			var str3Paging = "";
			if(data.startR != 1){
				var startR = data.startR - 1;
				str3Paging += '<button onclick= "requestPagingLog = 1; myLectureFormA();">첫 페이지</button>' +
							  '<button onclick= "requestPagingLog =' + startR + '; myLectureFormA();">이전</button>';
			} // 처음, 이전 페이지 버튼
			if(data.endR < data.lastR){
			for(var i = data.startR; i <= data.endR; i++){
				if(i==data.currentR){
					str3Paging += '[ '+i+' ]';
				}else{
					str3Paging += '<button onclick= "requestPagingLog =' + i + '; myLectureFormA();">' + i + '</button>';
				}
			} 
			var endR = data.endR + 1;
			str3Paging += '<button onclick= "requestPagingLog =' + endR + '; myLectureFormA();">다음</button>' +
				   		  '<button onclick= "requestPagingLog ='+ data.lastR +'; myLectureFormA();">끝 페이지</button>';  // 다음, 끝 페이지 버튼
			} // if(data.endR < data.lastR) 끝
			else{
			for(var i = data.startR; i <= data.lastR; i++){
				if(i==data.currentR){
					str3Paging += ' [ '+i+' ] ';
				}else{
					str3Paging += '<button onclick= "requestPagingLog =' + i + '; myLectureFormA();">' + i + '</button>';
				}	
			}
			} // else 끝
			$('#requestPaging').append(str3Paging); // 요청 받은 강의목록 페이징 처리- 테이블에 붙이기
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			var str4 = "<tr>";
			$.each(data.approveList, function(index, approveList){ 	// 요청 수락한 강의목록
				str4 += '<td>' + approveList.genre + '</td><td>' + approveList.title + '</td><td>' +
						approveList.startDate + '</td><td>' + approveList.place + '</td><td>' +
						approveList.numberPeople + '</td><td>' +
						approveList.maxPeople + '</td><td>' + approveList.guestID + '</td>';
				str4 += '</tr>';
			}); // each
			$('#approveList').append(str4); // 요청 수락한 강의목록- 테이블에 붙이기

			var str4Paging = "";
			if(data.startAp != 1){
				var startAp = data.startAp - 1;
				str4Paging += '<button onclick= "approvePagingLog = 1; myLectureFormA();">첫 페이지</button>' +
							  '<button onclick= "approvePagingLog =' + startAp + '; myLectureFormA();">이전</button>';
			} // 처음, 이전 페이지 버튼
			if(data.endAp < data.lastAp){
			for(var i = data.startAp; i <= data.endAp; i++){
				if(i==data.currentAp){
					str4Paging += '[ '+i+' ]';
				}else{
					str4Paging += '<button onclick= "approvePagingLog =' + i + '; myLectureFormA();">' + i + '</button>';
				}
			} 
			var endAp = data.endAp + 1;
			str4Paging += '<button onclick= "approvePagingLog =' + endAp + '; myLectureFormA();">다음</button>' +
				   		  '<button onclick= "approvePagingLog ='+ data.lastAp +'; myLectureFormA();">끝 페이지</button>';  // 다음, 끝 페이지 버튼
			} // if(data.endAp < data.lastAp) 끝
			else{
			for(var i = data.startAp; i <= data.lastAp; i++){
				if(i==data.currentAp){
					str4Paging += ' [ '+i+' ] ';
				}else{
					str4Paging += '<button onclick= "approvePagingLog =' + i + '; myLectureFormA();">' + i + '</button>';
				}	
			}
			} // else 끝
			$('#approvePaging').append(str4Paging); // 요청 수락한 강의목록 페이징 처리- 테이블에 붙이기
			
			} // success
		}) // ajax
} // myLectureFormA 함수의 끝

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
				<li><a onclick="myLectureFormA()"><i class="icon-plus-sign"></i>강의 내역 조회</a></li>
				<li><a href="mySellFormA0.do"><i class="icon-plus-sign"></i>주문 및 판매관리</a></li>
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

				<h4>요청 받은 강의</h4>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col">장르</th>
							<th scope="col">강의명</th>
							<th scope="col">강의기간</th>
							<th scope="col">장소</th>
							<th scope="col">최대 인원</th>
							<th scope="col">강의 요청자</th>
						</tr>
					</thead>
					<tbody id="requestList">
					</tbody>
					<tr>
						<td id="requestPaging" colspan="6"></td>
					</tr>
				</table>

				<h4>요청 수락한 강의</h4>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col">장르</th>
							<th scope="col">강의명</th>
							<th scope="col">강의기간</th>
							<th scope="col">장소</th>
							<th scope="col">현재 모집 인원</th>
							<th scope="col">최대 인원</th>
							<th scope="col">강의 요청자</th>
						</tr>
					</thead>
					<tbody id="approveList">
					</tbody>
					<tr>
						<td id="approvePaging" colspan="7"></td>
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

