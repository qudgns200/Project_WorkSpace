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
<script src="js/myOrderFormG.js"></script>
<script type="text/javascript">
$(document).ready(function(){
myOrderFormG();	
});
</script>

</head>

<body>
	<div class="color-bar-1"></div>
	<div class="color-bar-2 color-bg"></div>

	<div class="container main-container">

		<!--     Header section -->
		<%@include file="header.jsp"%>

<!-- ========================= SECTION CONTENT ========================= -->
<section class="section-content bg padding-y border-top">
<div class="container">

<div class="row">
	<main class="col-sm-9">

<div class="card">
<table class="table table-hover shopping-cart-wrap">
<thead class="text-muted">
<tr>
  <th scope="col">구매할 작품</th>
  <th scope="col" width="120">수량</th>
  <th scope="col" width="200">가격</th>
  <th scope="col" class="text-right" width="200">Action</th>
</tr>
</thead>
<tbody>
<tr>
	<td>
<figure class="media">
	<div class="img-wrap"><img src="images/items/1.jpg" class="img-thumbnail img-sm"></div>
	<figcaption class="media-body">
		<h6 class="title text-truncate">오베르의 교회 </h6>
		<dl class="dlist-inline small">
		  <dt>크기: 74.5 x 94cm </dt>
		  <dd>유화</dd>
		</dl>
		<dl class="dlist-inline small">
		  <dt>Color: </dt>
		  <dd>Orange color</dd>
		</dl>
	</figcaption>
</figure> 
	</td>
	<td> 
		<select class="form-control">
			<option>1</option>
			<option>2</option>	
			<option>3</option>	
			<option>4</option>	
		</select> 
	</td>
	<td> 
		<div class="price-wrap"> 
			<var class="price">130,000,000,000원</var> 
			<small class="text-muted">(수수료 5% 미포함가)</small>
		</div> <!-- price-wrap .// -->
	</td>
	<td class="text-right"> 
	<a data-original-title="Save to Wishlist" title="" href="" class="btn btn-outline-success" data-toggle="tooltip"> <i class="fas fa-heart"></i></a> 
	<a href="" class="btn btn-outline-danger"> × Remove</a>
	</td>
</tr>
<tr>
	<td>
<figure class="media">
	<div class="img-wrap"><img src="images/items/2.png" class="img-thumbnail img-sm"></div>
	<figcaption class="media-body">
		<h6 class="title text-truncate">수영장 </h6>
		<dl class="dlist-inline small">
		  <dt>Size: 214 x 304.8 cm</dt>
		  <dd>XXL</dd>
		</dl>
		<dl class="dlist-inline small">
		  <dt>Color: </dt>
		  <dd>Orange color</dd>
		</dl>
	</figcaption>
</figure> 
	</td>
	<td> 
		<select class="form-control">
			<option>1</option>
			<option>2</option>	
			<option>3</option>	
			<option>4</option>	
		</select> 
	</td>
	<td> 
		<div class="price-wrap"> 
			<var class="price">6,000,000,000원</var> 
			<small class="text-muted">(수수료 5% 미포함가)</small> 
		</div> <!-- price-wrap .// -->
	</td>
	<td class="text-right"> 
	<a data-original-title="Save to Wishlist" title="" href="" class="btn btn-outline-success" data-toggle="tooltip"> <i class="fas fa-heart"></i></a> 
	<a href="" class="btn btn-outline-danger btn-round"> × Remove</a>
	</td>
</tr>
<tr>
	<td>
<figure class="media">
	<div class="img-wrap"><img src="images/items/3.jpg" class="img-thumbnail img-sm"></div>
	<figcaption class="media-body">
		<h6 class="title text-truncate">Village on the Banks of the Seine </h6>
		<dl class="dlist-inline small">
		  <dt>Size: 59 x 80.5 cm</dt>
		  <dd>유화</dd>
		</dl>
		<dl class="dlist-inline small">
		  <dt>Color: </dt>
		  <dd>Orange color</dd>
		</dl>
	</figcaption>
</figure> 
	</td>
	<td> 
		<select class="form-control">
			<option>1</option>
			<option>2</option>	
			<option>3</option>	
			<option>4</option>	
		</select> 
	</td>
	<td> 
		<div class="price-wrap"> 
			<var class="price">1,000,000,000원</var> 
			<small class="text-muted">(수수료 5% 미포함가)</small> 
		</div> <!-- price-wrap .// -->
	</td>
	<td class="text-right"> 
		<a data-original-title="Save to Wishlist" title="" href="" class="btn btn-outline-success" data-toggle="tooltip"> <i class="fas fa-heart"></i></a>
		<a href="" class="btn btn-outline-danger btn-round"> × Remove</a>
	</td>
</tr>
</tbody>
</table>
</div> <!-- card.// -->

	</main> <!-- col.// -->
	<aside class="col-sm-3">
<p class="alert alert-success">5백만원 이상의 고가작품은 무진동 차량 무료배송을 원칙으로 합니다. </p>
<dl class="dlist-align">
  <dt>Total price: </dt>
  <dd class="text-right">137,000,000,000원</dd>
</dl>
<dl class="dlist-align">
  <dt>fees:</dt>
  <dd class="text-right">6,850,000,000원</dd>
</dl>
<dl class="dlist-align h4">
  <dt>Total:</dt>
  <dd class="text-right"><strong>143,850,000,000원</strong></dd>
</dl>
<hr>
<figure class="itemside mb-3">
	<aside class="aside"><img src="images/icons/pay-visa.png"></aside>
	 <div class="text-wrap small text-muted">
        10% 할인 가능한 BC 카드 
	 </div>
</figure>
<figure class="itemside mb-3">
	<aside class="aside"> <img src="images/icons/pay-mastercard.png"> </aside>
	<div class="text-wrap small text-muted">
        40% 적립 가능한 Master 카드
	</div>
</figure>

	</aside> <!-- col.// -->
</div>

</div> <!-- container .//  -->
</section>
<!-- ========================= SECTION CONTENT END// ========================= -->

<!-- ========================= SECTION  ========================= -->
<section class="section-name bg-white padding-y">
<div class="container">
<header class="section-heading">
<h2 class="title-section">Section name</h2>
</header><!-- sect-heading -->

<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
</div><!-- container // -->
</section>
<!-- ========================= SECTION  END// ========================= -->

<!-- ========================= SECTION  ========================= -->
<section class="section-name bg padding-y">
<div class="container">
<h4>Another section if needed</h4>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
</div><!-- container // -->
</section>
<!-- ========================= SECTION  END// ========================= -->







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

				<h2>주문 및 판매관리</h2>

				<div class="alert alert-success">Well done! You successfully
					read this important alert message.</div>

				<h4>주문 내역</h4>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col">구분</th>
							<th scope="col">강의/작품번호</th>
							<th scope="col">강의/작품명</th>
							<th scope="col">아티스트</th>
							<th scope="col">가격</th>
							<th scope="col">결제방식</th>
							<th scope="col">결제상태</th>
							<th scope="col">결제일</th>
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

