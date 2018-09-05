<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>마이페이지</title>
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
$(document).ready(function(){
	mySellFormA();	
});

var buyingPagingLog;
var sellingPagingLog;
var soldPagingLog;

var mySellFormA = function(){
	$.ajax({
		type: "post",
		url: "mySellFormA.do",
		data: {"pageBuy": buyingPagingLog, "pageSell": sellingPagingLog, "pageSold": soldPagingLog },
		dataType: "json",
		success: function(data){
			$('#buyingList').empty();
			$('#sellingList').empty();
			$('#soldList').empty();
			$('#buyingPaging').empty();
			$('#sellingPaging').empty();
			$('#soldPaging').empty();
			
			var str1 = "<tr>";
			$.each(data.buyingList, function(index, buyingList){ 	// 구매 목록
				var isCheck;
				var title;
				var artistID;
				var imageUrl;
				var aTag;
				var payMethod;
				var state;
				if(buyingList.payMethod==1){payMethod = '카드결제';}
				else{payMethod = '카카오페이';}
				if(buyingList.state==0){state = '미결제';}
				if(buyingList.state==1){state = '배송 준비중';}
				if(buyingList.state==3){state = '배송중';}
				if(buyingList.state==4){
				state = '<a href="updateDelivery.do?state=5&orderNumber='+ buyingList.orderNumber +'">구매 확정</a>';
				}
				if(buyingList.state==5){state = '구매 확정 완료';}
				if (buyingList.isCheck==1) {
					isCheck = '강의';
					title = buyingList.lecTitle;
					artistID = buyingList.lecID;
					imageUrl = '<img src="download.do?no=' + buyingList.no + '&lecture=a" width=50 height=50>';
					aTag = '<a href="selectOneLecture.do?no=' + buyingList.no + '">'; 
				}else{
					isCheck = '작품';
					title = buyingList.artTitle;
					artistID = buyingList.artID;
					imageUrl = '<img src="download.do?no=' + buyingList.no + '" width=50 height=50>';
					aTag = '<a href="selectOneArt.do?no=' + buyingList.no + '">';
				}
				
				str1 += '<td>' + buyingList.orderNumber + '</td><td>' +  isCheck + '</td><td><span>' + aTag + 
				imageUrl + '</a></span> &nbsp; <span>' + aTag + title + '</a></span></td><td>' +
				artistID + '</td><td>' +  
				buyingList.totalPrice + '</td><td>' + payMethod + '</td><td>' +
				state + '</td><td>' + buyingList.payDate.substring(0, 10) + '</td>';
				str1 += '</tr>';
				
			}); // each
			$('#buyingList').append(str1); // 구매 목록- 테이블에 붙이기

			var str1Paging = "";
			if(data.startBuy != 1){
				var startBuy = data.startBuy - 1;
				str1Paging += '<button onclick= "buyingPagingLog = 1; mySellFormA();">첫 페이지</button>' +
							  '<button onclick= "buyingPagingLog =' + startBuy + '; mySellFormA();">이전</button>';
			} // 처음, 이전 페이지 버튼
			if(data.endBuy < data.lastBuy){
			for(var i = data.startBuy; i <= data.endBuy; i++){
				if(i==data.currentBuy){
					str1Paging += '[ '+i+' ]';
				}else{
					str1Paging += '<button onclick= "buyingPagingLog =' + i + '; mySellFormA();">' + i + '</button>';
				}
			} 
			var endBuy = data.endBuy + 1;
			str1Paging += '<button onclick= "buyingPagingLog =' + endBuy + '; mySellFormA();">다음</button>' +
				   		  '<button onclick= "buyingPagingLog ='+ data.lastBuy +'; mySellFormA();">끝 페이지</button>';  // 다음, 끝 페이지 버튼
			} // if(data.endBuy < data.lastBuy) 끝
			else{
			for(var i = data.startBuy; i <= data.lastBuy; i++){
				if(i==data.currentBuy){
					str1Paging += ' [ '+i+' ] ';
				}else{
					str1Paging += '<button onclick= "buyingPagingLog =' + i + '; mySellFormA();">' + i + '</button>';
				}	
			}
			} // else 끝
			
			$('#buyingPaging').append(str1Paging); // 구매 목록 페이징 처리- 테이블에 붙이기
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				
				var str2 = "<tr>";
				$.each(data.sellingList, function(index, sellingList) { // 판매 중인 작품 목록

					var sellingImg;
					sellingImg = '<img src="download.do?no=' + sellingList.no + '" width=50 height=50>';
					var sellingTag;
					sellingTag = '<a href="selectOneArt.do?no=' + sellingList.no + '">';
					
					str2 += '<td>' + sellingList.no + '</td><td><span>' + sellingTag + 
					sellingImg + '</a></span> &nbsp; <span>' + sellingTag + sellingList.title + 
					'</a></span></td><td>' + sellingList.price + '</td><td>' + 
					sellingList.totalCount + '</td><td>' + sellingList.genre + '</td>';
					str2 += '</tr>';
				}); // each
				
				$('#sellingList').append(str2); // 판매 중인 작품- 테이블에 붙이기

				var str2Paging = "";
				if (data.startSell != 1) {
					var startSell = data.startSell - 1;
					str2Paging += '<button onclick= "sellingPagingLog = 1; mySellFormA();">첫 페이지</button>' +
						'<button onclick= "sellingPagingLog =' + startSell + '; mySellFormA();">이전</button>';
				} // 처음, 이전 페이지 버튼
				if (data.endSell < data.lastSell) {
					for (var j = data.startSell; j <= data.endSell; j++) {
						if (j == data.currentSell) {
							str2Paging += '[ ' + j + ' ]';
						} else {
							str2Paging += '<button onclick= "sellingPagingLog =' + j + '; mySellFormA();">' + j + '</button>';
						}
					}
					var endSell = data.endSell + 1;
					str2Paging += '<button onclick= "sellingPagingLog =' + endSell + '; mySellFormA();">다음</button>' +
						'<button onclick= "sellingPagingLog =' + data.lastSell + '; mySellFormA();">끝 페이지</button>'; // 다음, 끝 페이지 버튼
				} // if(data.endSell < data.lastSell) 끝
				else {
					for (var j = data.startSell; j <= data.lastSell; j++) {
						if (j == data.currentSell) {
							str2Paging += ' [ ' + j + ' ] ';
						} else {
							str2Paging += '<button onclick= "sellingPagingLog =' + j + '; mySellFormA();">' + j + '</button>';
						}
					}
				} // else 끝

				$('#sellingPaging').append(str2Paging); // 판매 중인 작품 페이징 처리- 테이블에 붙이기		
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

				var str3 = "<tr>";
				$.each(data.soldList, function(index, soldList) { // 판매된 작품목록
					
					var soldState;
					if(soldList.p_state == 0){soldState = '미결제';}
					else{soldState = '결제완료';}
					var soldImg;
					soldImg = '<img src="download.do?no=' + soldList.no + '" width=50 height=50>';
					var soldTag;
					soldTag = '<a href="selectOneArt.do?no=' + soldList.no + '">';
					var stateButton = '';
					if(soldList.p_state == 1){
			stateButton = '<a href="updateDelivery.do?state=3&orderNumber='+ soldList.orderNumber +'">배송중으로 설정</a>';
					}if(soldList.p_state == 3){
						stateButton = '배송중';
					}if(soldList.p_state == 4){
						stateButton = '배송완료';
					}if(soldList.p_state == 5){
						stateButton = '구매확정';
					}
					
					str3 += '<td>' + soldList.no + '</td><td><span>' + soldTag + 
						soldImg + '</a></span> &nbsp; <span>' + soldTag + soldList.title + 
						'</a></span></td><td>' +
						soldList.totalPrice + '</td><td>' + soldList.p_id + '</td><td>' +
						soldState + '</td><td>' + soldList.payDate.substring(0, 10) +
						'</td><td>' + stateButton + '</td>';
					str3 += '</tr>';
				}); // each
				$('#soldList').append(str3); // 판매된 작품목록- 테이블에 붙이기

				var str3Paging = "";
				if (data.startSold != 1) {
					var startSold = data.startSold - 1;
					str3Paging += '<button onclick= "soldPagingLog = 1; mySellFormA();">첫 페이지</button>' +
						'<button onclick= "soldPagingLog =' + startSold + '; mySellFormA();">이전</button>';
				} // 처음, 이전 페이지 버튼
				if (data.endSold < data.lastSold) {
					for (var i = data.startSold; i <= data.endSold; i++) {
						if (i == data.currentSold) {
							str3Paging += '[ ' + i + ' ]';
						} else {
							str3Paging += '<button onclick= "soldPagingLog =' + i + '; mySellFormA();">' + i + '</button>';
						}
					}
					var endSold = data.endSold + 1;
					str3Paging += '<button onclick= "soldPagingLog =' + endSold + '; mySellFormA();">다음</button>' +
						'<button onclick= "soldPagingLog =' + data.lastSold + '; mySellFormA();">끝 페이지</button>'; // 다음, 끝 페이지 버튼
				} // if(data.endSold < data.lastSold) 끝
				else {
					for (var i = data.startSold; i <= data.lastSold; i++) {
						if (i == data.currentSold) {
							str3Paging += ' [ ' + i + ' ] ';
						} else {
							str3Paging += '<button onclick= "soldPagingLog =' + i + '; mySellFormA();">' + i + '</button>';
						}
					}
				} // else 끝
				$('#soldPaging').append(str3Paging); // 판매된 작품 페이징 처리- 테이블에 붙이기

			} // success 끝
	}) // ajax 끝
}	// mySellFormA 함수의 끝

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
				<li><a href="myLectureFormA0.do"><i class="icon-plus-sign"></i>강의 내역 조회</a></li>
				<li><a onclick="mySellFormA()"><i class="icon-plus-sign"></i>주문 및 판매관리</a></li>
				<li><a href="#"><i class="icon-plus-sign"></i>개인 정보 수정</a></li>
				<li><a href="#"><i class="icon-plus-sign"></i>회원 탈퇴</a></li>
			</ul>

		</div>

		<div class="row">
			<!--Container row-->

			<div class="span8 contact">
				<!--Begin page content column-->

				<h3 class="title-bg" style="margin-top: 0px;">주문 및 판매관리</h3>
				
<!-- 				<div class="alert alert-success">Well done! You successfully -->
<!-- 					read this important alert message.</div> -->

				<h4>주문 내역</h4>
	<hr style="display: block; margin-top: 0.5em; margin-bottom: 0.5em; border-style: inset; border-width: 1px;">
				<table class="table table-striped">
					<thead class="thead-dark">
						<tr>
							<th scope="col">주문번호</th>
							<th scope="col">구분</th>
							<th scope="col">강의/작품명</th>
							<th scope="col">아티스트</th>
							<th scope="col">가격</th>
							<th scope="col">결제방식</th>
							<th scope="col">진행상태</th>
							<th scope="col">결제일</th>
						</tr>
					</thead>
					<tbody id="buyingList">
					</tbody>
					<tr>
						<td id="buyingPaging" colspan="8"></td>
					</tr>
				</table>
				<h4>판매 중인 작품</h4>
	<hr style="display: block; margin-top: 0.5em; margin-bottom: 0.5em; border-style: inset; border-width: 1px;">			
				<table class="table table-striped">
					<thead class="thead-dark">
						<tr>
							<th scope="col">작품번호</th>
							<th scope="col">작품명</th>
							<th scope="col">가격</th>
							<th scope="col">총 수량</th>
							<th scope="col">장르</th>
						</tr>
					</thead>
					<tbody id="sellingList" align="center">
					</tbody>
					<tr>
						<td id="sellingPaging" colspan="5" align="center"></td>
					</tr>
				</table>
				<h4>판매된 작품</h4>
	<hr style="display: block; margin-top: 0.5em; margin-bottom: 0.5em; border-style: inset; border-width: 1px;">			
				<table class="table table-striped">
					<thead class="thead-dark">
						<tr>
						    <th scope="col">작품번호</th>
							<th scope="col">작품명</th>
							<th scope="col">가격</th>
							<th scope="col">구매자</th>
							<th scope="col">결제상태</th>
							<th scope="col">결제일</th>
							<th scope="col">배송상태 및 설정</th>
						</tr>
					</thead>
					<tbody id="soldList" align="center">
					</tbody>
					<tr>
						<td id="soldPaging" colspan="5" align="center"></td>
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

