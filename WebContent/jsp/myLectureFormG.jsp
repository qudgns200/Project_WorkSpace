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

<style type="text/css">
h4{
color: 	#2E8B57;
font-weight: bold;
/* background-color: grey; */
}
.table {
border: 1px solid;
}
.table tr, th, td {
border: 1px solid;
}
.table th > div {
 	text-align: center;
}
.table td > div {
	text-align: center;
    overflow:hidden;
/* 	width: auto; */
/* 	height: 50px; */
/* 	text-overflow: ellipsis; */
/* 	white-space: nowrap; */
}
</style>

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

function moveUrl(num) {
	var payMethod = $("input[name=payMethod]:checked").val();
	
	location.href="lecturePayForm.do?no=" + num + "&payMethod=" + payMethod;
}
$(document).ready(function(){
myLectureFormG();	
});

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
				
				var imageUrl =  '<img src="download.do?no=' + attendList.no + '&lecture=a" width=50 height=50>';
				var aTag = '<a href="selectOneLecture.do?no=' + attendList.no + '">';
				var pay = '인원 모집 중<br>(결제전)';
				if(attendList.state==6){pay = '결제완료';}
				if(attendList.state==2){
					pay = "<div id='modalButton'><a href='#myModal' role='button' class='btn btn-inverse' data-toggle='modal'>결제</a></div>" + 
			          "<div class='modal hide fade' id='myModal' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true' style='display: none;'>" + 
		        	  "<div class='modal-header'>" +
		              "<button type='button' class='결제하기' data-dismiss='modal' aria-hidden='true'>×</button>" +
		              "<h5 id='myModalLabel'>결제방법을 선택하세요.</h5>" +
		        	  "</div>" +
		       	 	  "<div class='modal-body'>" +
		              "<input type='radio' name='payMethod' value='1'>카드결제" + 
		              "<input type='radio' name='payMethod' value='2'>카카오페이" +
		              "<div class='modal-footer'><button class='btn'" +
		              "data-dismiss='modal' aria-hidden='true' onclick='moveUrl(" + attendList.no + ")'>결제하기</button></div></div>";
				}
				
				str1 += '<td><div>' + attendList.genre + 
						'</div></td><td><div><span>' + aTag + imageUrl + '</a></span> &nbsp; <span>' +
						aTag + attendList.title + '</a></span></div></td><td><div>' +
						attendList.artistID + '</div></td><td><div>' + attendList.startDate + ' ~ ' + attendList.endDate + '</div></td><td><div>' +
						attendList.place + '</div></td><td><div>' + pay + '</div></td>';
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
// =====================================================================================================================
	
			var str2 = "<tr>";
			$.each(data.gatherList, function(index, gatherList){ 		// 모집 중인 강의 목록
				
				var imageUrl =  '<img src="download.do?no=' + gatherList.no + '&lecture=a" width=50 height=50>';
				var aTag = '<a href="selectOneLecture.do?no=' + gatherList.no + '">';
				var state;
				if(gatherList.state==1){state = '인원 모집 중';}
				if(gatherList.state==2){state = '모집완료';}
				if(gatherList.state==3){state = '승인전';}
				if(gatherList.state==4){state = '승인완료';}
				if(gatherList.state==5){state = '승인거절';}
				if(gatherList.state==6){state = '결제완료';}
				
				str2 += '<td><div>' + gatherList.genre +
						'</div></td><td><div><span>' + aTag + imageUrl + '</a></span> &nbsp; <span>' +
						aTag + gatherList.title + '</a></span></div></td><td><div>' +
						gatherList.artistID + '</div></td><td><div>' +gatherList.startDate + ' ~ ' + gatherList.endDate+ '</div></td><td><div>' +
						gatherList.place + '</div></td><td><div>' + state + '</div></td>';
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

			<h3 class="title-bg" style="margin-top: 0px;">강의 내역 조회</h3>
				<h4>신청한 강의</h4>
				<hr style="display: block; margin-top: 0.5em; margin-bottom: 0.5em; border-style: inset; border-width: 1px;">
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col"><div style="width: 50px;">장르</div></th>
							<th scope="col"><div style="width: 200px;">강의명</div></th>
							<th scope="col"><div style="width: 50px;">아티스트</div></th>
							<th scope="col"><div style="width: 150px;">강의기간</div></th>
							<th scope="col"><div style="width: 150px;">장소</div></th>
							<th scope="col"><div style="width: 100px;">결제</div></th>
						</tr>
					</thead>
					<tbody id="attendList">
					</tbody>
					<tr>
						<td id="attendPaging" colspan="5"></td>
					</tr>
				</table>

				<h4>인원 모집 중인 강의</h4>
				<hr style="display: block; margin-top: 0.5em; margin-bottom: 0.5em; border-style: inset; border-width: 1px;">
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col"><div style="width: 50px;">장르</div></th>
							<th scope="col"><div style="width: 200px;">강의명</div></th>
							<th scope="col"><div style="width: 50px;">아티스트</div></th>
							<th scope="col"><div style="width: 150px;">강의기간</div></th>
							<th scope="col"><div style="width: 150px;">장소</div></th>
							<th scope="col"><div style="width: 100px;">상태</div></th>
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

