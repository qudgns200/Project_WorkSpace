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

function addComma(num){
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return num.toString().replace(regexp, ',');
}

$(document).ready(function(){
myOrderFormG();	
});

var buyingPagingLog;

var myOrderFormG = function(){
	$.ajax({
		type: "post",
		url: "myOrderFormG.do",
		data: {"pageBuy": buyingPagingLog },
		dataType: "json",
		success: function(data){
			$('#buyingList').empty();
			$('#buyingPaging').empty();
			var str1 = "<tr>";
			$.each(data.buyingList, function(index, buyingList){ 	// 구매 목록
				var isCheck;
				var title;
				var artistID;
				var imageUrl;
				var aTag;
				var aTagPay;
				var payMethod;
				var state;
				if(buyingList.payMethod==1){payMethod = '카드결제';}
				else{payMethod = '카카오페이';}
				if(buyingList.state==0){state = '미결제';}
				if(buyingList.state==1){
					if(buyingList.isCheck==1){ state = '결제완료'; }
					else{ state = '배송 준비중'; }
					}
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
					aTagPay = '<a href="payResult.do?no=' + buyingList.no + '&orderNumber=' + buyingList.orderNumber + '&dif=2">';
				}else{
					isCheck = '작품';
					title = buyingList.artTitle;
					artistID = buyingList.artID;
					imageUrl = '<img src="download.do?no=' + buyingList.no + '" width=50 height=50>';
					aTag = '<a href="selectOneArt.do?no=' + buyingList.no + '">';
					aTagPay = '<a href="payResult.do?no=' + buyingList.no + '&orderNumber=' + buyingList.orderNumber + '&dif=1">';
				}
				str1 += '<td><div>' + aTagPay + buyingList.orderNumber + '</a></div></td><td><div>' +  isCheck + '</div></td><td><div><span>' + aTag + 
				imageUrl + '</a></span> &nbsp; <span>' + aTag + title + '</a></span></div></td><td><div>' +
				artistID + '</div></td><td><div>' +  
				addComma(buyingList.totalPrice) + '</div></td><td><div>' + payMethod + '</div></td><td><div>' +
				state + '</div></td><td><div>' + buyingList.payDate.substring(0, 10) + '</div></td>';
				str1 += '</tr>';
			}); // each
			$('#buyingList').append(str1); // 구매 목록- 테이블에 붙이기

			var str1Paging = "";
			if(data.startBuy != 1){
				var startBuy = data.startBuy - 1;
				str1Paging += '<button onclick= "buyingPagingLog = 1; myOrderFormG();">첫 페이지</button>' +
							  '<button onclick= "buyingPagingLog =' + startBuy + '; myOrderFormG();">이전</button>';
			} // 처음, 이전 페이지 버튼
			if(data.endBuy < data.lastBuy){
			for(var i = data.startBuy; i <= data.endBuy; i++){
				if(i==data.currentBuy){
					str1Paging += '[ '+i+' ]';
				}else{
					str1Paging += '<button onclick= "buyingPagingLog =' + i + '; myOrderFormG();">' + i + '</button>';
				}
			} 
			var endBuy = data.endBuy + 1;
			str1Paging += '<button onclick= "buyingPagingLog =' + endBuy + '; myOrderFormG();">다음</button>' +
				   		  '<button onclick= "buyingPagingLog ='+ data.lastBuy +'; myOrderFormG();">끝 페이지</button>';  // 다음, 끝 페이지 버튼
			} // if(data.endBuy < data.lastBuy) 끝
			else{
			for(var i = data.startBuy; i <= data.lastBuy; i++){
				if(i==data.currentBuy){
					str1Paging += ' [ '+i+' ] ';
				}else{
					str1Paging += '<button onclick= "buyingPagingLog =' + i + '; myOrderFormG();">' + i + '</button>';
				}	
			}
			} // else 끝
			
			$('#buyingPaging').append(str1Paging); // 구매 목록 페이징 처리- 테이블에 붙이기
			
		} // success 끝
		}) // ajax 끝
	}	// myOrderFormG 함수의 끝
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
				<li><a href="myLectureFormG0.do"><i class="icon-plus-sign"></i>강의 내역 조회</a></li>
				<li><a onclick="myOrderFormG()"><i class="icon-plus-sign"></i>주문 내역 조회</a></li>
				<li><a href="#"><i class="icon-plus-sign"></i>개인 정보 수정</a></li>
				<li><a href="#"><i class="icon-plus-sign"></i>회원 탈퇴</a></li>
			</ul>

		</div>

		<div class="row">
			<!--Container row-->

			<div class="span8 contact">
				<!--Begin page content column-->

				<h3 class="title-bg" style="margin-top: 0px;">주문 내역</h3>
				<table class="table table-striped">
					<thead class="thead-dark">
						<tr>
							<th scope="col"><div style="width: 80px;">주문번호</div></th>
							<th scope="col"><div style="width: 30px;">구분</div></th>
							<th scope="col"><div style="width: 200px;">강의/작품명</div></th>
							<th scope="col"><div style="width: 50px;">아티스트</div></th>
							<th scope="col"><div style="width: 70px;">가격</div></th>
							<th scope="col"><div style="width: 50px;">결제방식</div></th>
							<th scope="col"><div style="width: 100px;">진행상태</div></th>
							<th scope="col"><div style="width: 70px;">결제일</div></th>
						</tr>
					</thead>
					<tbody id="buyingList">
					</tbody>
					<tr>
						<td id="buyingPaging" colspan="8"></td>
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

