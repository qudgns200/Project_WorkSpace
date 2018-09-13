<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>강의게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS
================================================== -->
<link href='http://fonts.googleapis.com/css?family=Oswald'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-responsive.css">
<link rel="stylesheet" href="css/jquery.lightbox-0.5.css">
<link rel="stylesheet" href="css/custom-styles.css">

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.custom.js"></script>
<script type="text/javascript">
var result = ${pay.totalPrice } / ${art.price }
$(document).ready(function(){
	$('#quan').text(result);
});

</script>
</head>

<body>
	<div class="color-bar-1"></div>
	<div class="color-bar-2 color-bg"></div>

	<div class="container main-container">

		<!--     Header section -->
		<%@include file="header.jsp"%>

		<!-- Blog Content
    ================================================== -->
		<div class="row">

			<!-- Blog Posts
        ================================================== -->
			<div class="span8 blog">
				
			<h4 class="title-bg">주문/결제 정보</h4><br>
		<!-- 강의정보 출력 -->
				<c:if test="${dif==2 }">  			
				<article class="clearfix"> <a href="selectOneLecture.do?no=${lecture.no }">
				<img src="download.do?no=${lecture.no }&lecture=a" style="width: 150px; height: 150px;" class="align-left">
				</a>
				<h5><a href="selectOneLecture.do?no=${lecture.no }">${lecture.title } </a> (강의)</h5>
				<p>
				장 르 : ${lecture.genre } <br>
				금 액 : ${pay.totalPrice }
				</p>
				<div class="post-summary-footer">
					<ul class="post-data-3">
						<li><i class="icon-calendar"></i><fmt:formatDate pattern="yyyy-MM-dd" value="${pay.payDate }"/></li>
						<li><i class="icon-user"></i> <a href="artistPage.do?id=${lecture.artistID }">${lecture.artistID }</a></li>
					</ul>
				</div>
				</article>
				</c:if>
		<!-- 작품정보 출력 -->
				<c:if test="${dif==1 }">
				<article class="clearfix"> <a href="selectOneArt.do?no=${art.no }">
				<img src="download.do?no=${art.no }" style="width: 150px; height: 150px;" class="align-left">
				</a>
				<h5><a href="selectOneArt.do?no=${art.no }">${art.title } </a> (작품)</h5>
				<p>
				장 르 : ${art.genre } <br>
				수 량 : <span id="quan"></span><br>
				총 금액 : ${pay.totalPrice }
				</p>
				<div class="post-summary-footer">
					<ul class="post-data-3">
						<li><i class="icon-calendar"></i><fmt:formatDate pattern="yyyy-MM-dd" value="${pay.payDate }"/></li>
						<li><i class="icon-user"></i> <a href="artistPage.do?id=${art.id }">${art.id }</a></li>
					</ul>
				</div>
				</article>
				</c:if>
<!--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
	
	<h4 class="title-bg">배송지 정보</h4><br>
		<table class="table table-striped">
		<tr>
		<td>이 름</td>
		<td>${pay.name }</td>
	    </tr>
	    <tr>
		<td>연락처</td>
		<td>${pay.phone }</td>
	    </tr>
	    <tr>
		<td>배송지</td>
		<td>${pay.addr }</td>
	    </tr>
		</table>
	
</div>
</div>
</div>

	</div>
	<!-- End Container -->

	<!-- Footer Area
        ================================================== -->
	<%@include file="footer.jsp"%>

</body>
</html>