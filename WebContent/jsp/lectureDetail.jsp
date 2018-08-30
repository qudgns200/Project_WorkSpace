<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>강의 상세 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS
================================================== -->
<link href='http://fonts.googleapis.com/css?family=Oswald'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-responsive.css">
<link rel="stylesheet" href="css/prettyPhoto.css" />
<link rel="stylesheet" href="css/flexslider.css" />
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
<script src="http://code.jquery.com/jquery-latest.js"
	type="text/javascript"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/jquery.flexslider.js"></script>
<script src="js/jquery.custom.js"></script>
<script type="text/javascript">
//         $(document).ready(function() {
//         });
//         $(window).load(function() {
//             $('.flexslider').flexslider({
//                 animation: "slide",
//                 slideshow: true,
//                 start: function(slider) {
//                     $('body').removeClass('loading');
//                 }
//             });
//         });
</script>

<style>
#map img {
	max-width: none;
	height: auto;
	border: 0;
	-ms-interpolation-mode: bicubic;
	!
	important
}
</style>
</head>

<body>
	<div class="color-bar-1"></div>
	<div class="color-bar-2 color-bg"></div>

	<div class="container main-container">

		<%@include file="header.jsp"%>

		<!-- Blog Content
    ================================================== -->
<!-- 		<div class="row"> -->

			<!-- Blog Posts
        ================================================== -->
			<div class="span12 blog">

		<div class="row">
                <div class="span6">
                    <img src="img/user-avatar.jpg" style="width: 550px; height: 550px;">
                </div>
                <div class="span6">
                    <h2>"${art.title }"</h2> 		
                    <p class="lead"></p>
                    <p> "${art.content }"</p>
													<!--강의 정보 출력 -->
                    <ul class="project-info">
                        <li><h6>Date :</h6> <fmt:formatDate pattern="yyyy-MM-dd" value="${art.artDate}"/></li>
                        <li><h6>Price :</h6> "${art.price }"</li>
                        <li><h6>Artist :</h6> "${art.id }"</li>
                        <li><h6>Genre :</h6> "${art.genre }"</li>
						<li><h6>Location :</h6></li>
<!-- 지도api ==================================================-->
<!-- 			<div class="row" id="map" style="width: 400px; height: 250px;"> -->
<!-- 			<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> -->
<!-- 			<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=df63ab88c6f092a4b29b7f555f1a82dc"></script> -->
<!-- 			<script> -->
<!--  					var container = document.getElementById('map'); // 지도를 표시할 div -->
<!--  					var options = { -->
<!-- 							center : new daum.maps.LatLng(37.5706073, 126.9853092), // 지도의 중심좌표 -->
<!--  							level : 5 -->
<!--  									// 지도의 확대 레벨 -->
<!--  							}; -->
<!--  						// 지도를 생성한다  -->
<!--  						var map = new daum.maps.Map(container, options); -->
<!--  						// 지도에 마커를 생성하고 표시한다 -->
<!--  						var marker = new daum.maps.Marker({ -->
<!--  						position : new daum.maps.LatLng(37.57053, 126.98531), // 마커의 좌표 -->
<!--  						map : map -->
<!--  						// 마커를 표시할 지도 객체 -->
<!--  						}); -->
<!-- 			</script> -->
<!-- 			</div> -->
	  </ul>
  	</div>
 </div>

<!-- Post Comments================================================== -->
				<section class="comments">
					<h4 class="title-bg">
						<a name="comments"></a>5 Comments so far
					</h4>
					<ul>
						<li><img src="img/user-avatar.jpg" alt="Image" /> <span
							class="comment-name">John Doe</span> <span class="comment-date">March
								15, 2015 | <a href="#">Reply</a>
						</span>
							<div class="comment-content">Lorem ipsum dolor sit amet,
								consectetur adipiscing elit. Etiam venenatis, ligula quis
								sagittis euismod, odio ante molestie tortor, eget ullamcorper
								lacus nunc a ligula. Donec est lacus, aliquet in interdum id,
								rutrum ac tellus. Ut rutrum, justo et lobortis commodo, est
								metus ornare tortor, vitae luctus turpis leo sed magna. In leo
								dolor, suscipit non mattis in.</div> <!-- Reply -->
							<ul>
								<li><img src="img/user-avatar.jpg" alt="Image" /> <span
									class="comment-name">Jason Doe</span> <span
									class="comment-date">March 15, 2015 | <a href="#">Reply</a></span>
									<div class="comment-content">Lorem ipsum dolor sit amet,
										consectetur adipiscing elit. Etiam venenatis, ligula quis
										sagittis euismod, odio ante molestie tortor, eget ullamcorper
										lacus nunc a ligula. Donec est lacus, aliquet in interdum id,
										rutrum ac tellus. Ut rutrum, justo et lobortis commodo, est
										metus ornare tortor, vitae luctus turpis leo sed magna. In leo
										dolor, suscipit non mattis in.</div></li>
								<li><img src="img/user-avatar.jpg" alt="Image" /> <span
									class="comment-name">Jason Doe</span> <span
									class="comment-date">March 15, 2015 | <a href="#">Reply</a></span>
									<div class="comment-content">Lorem ipsum dolor sit amet,
										consectetur adipiscing elit. Etiam venenatis, ligula quis
										sagittis euismod, odio ante molestie tortor, eget ullamcorper
										lacus nunc a ligula. Donec est lacus, aliquet in interdum id,
										rutrum ac tellus. Ut rutrum, justo et lobortis commodo, est
										metus ornare tortor, vitae luctus turpis leo sed magna. In leo
										dolor, suscipit non mattis in.</div></li>
							</ul></li>
						<li><img src="img/user-avatar.jpg" alt="Image" /> <span
							class="comment-name">John Doe</span> <span class="comment-date">March
								15, 2015 | <a href="#">Reply</a>
						</span>
							<div class="comment-content">Lorem ipsum dolor sit amet,
								consectetur adipiscing elit. Etiam venenatis, ligula quis
								sagittis euismod, odio ante molestie tortor, eget ullamcorper
								lacus nunc a ligula. Donec est lacus, aliquet in interdum id,
								rutrum ac tellus. Ut rutrum, justo et lobortis commodo, est
								metus ornare tortor, vitae luctus turpis leo sed magna. In leo
								dolor, suscipit non mattis in.</div></li>
						<li><img src="img/user-avatar.jpg" alt="Image" /> <span
							class="comment-name">John Doe</span> <span class="comment-date">March
								15, 2015 | <a href="#">Reply</a>
						</span>
							<div class="comment-content">Lorem ipsum dolor sit amet,
								consectetur adipiscing elit. Etiam venenatis, ligula quis
								sagittis euismod, odio ante molestie tortor, eget ullamcorper
								lacus nunc a ligula. Donec est lacus, aliquet in interdum id,
								rutrum ac tellus. Ut rutrum, justo et lobortis commodo, est
								metus ornare tortor, vitae luctus turpis leo sed magna. In leo
								dolor, suscipit non mattis in.</div></li>

					</ul>

					<!-- Comment Form -->
					<div class="comment-form-container">
						<h6>작가에게 전하고 싶은 말</h6>
						<form action="#" id="comment-form">
							<div class="input-prepend">
								<span class="add-on"><i class="icon-user"></i></span> <input
									class="span4" id="prependedInput" size="16" type="text"
									placeholder="Name">
							</div>
							<div class="input-prepend">
								<span class="add-on"><i class="icon-envelope"></i></span> <input
									class="span4" id="prependedInput" size="16" type="text"
									placeholder="Email Address">
							</div>
							<div class="input-prepend">
								<span class="add-on"><i class="icon-globe"></i></span> <input
									class="span4" id="prependedInput" size="16" type="text"
									placeholder="Website URL">
							</div>
							<textarea class="span6"></textarea>
							<div class="row">
								<div class="span2">
									<input type="submit" class="btn btn-inverse"
										value="Post My Comment">
								</div>
							</div>
						</form>
					</div>
				</section>
				<!-- Close comments section-->


				<!-- Pagination -->
				<div class="pagination">
					<ul>
						<li class="active"><a href="#">Prev</a></li>
						<li class="active"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">Next</a></li>
					</ul>
				</div>
</div>

<!--    Footer section -->
<%@include file="footer.jsp"%>

</body>

</html>