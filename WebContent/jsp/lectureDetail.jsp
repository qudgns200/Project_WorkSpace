<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!--     Header section -->
<%@include file="header.jsp"%>
     
    <!-- Page Content
    ================================================== --> 
    <div class="row">

        <!-- Gallery Items
        ================================================== --> 
        <div class="span12 gallery-single">
            <div class="row">
            <div class="span6">
<img src="download.do?no=${lecture.no }&lecture=a" style="width: 500px; height: 530px; margin-left: 50px; margin-top: 30px;">
            </div>
                <div class="span6">
                    <h2>${lecture.title }</h2> 		<!-- 강의 제목 출력  -->
                    <p class="lead"></p>
												<!-- 강의 정보 출력 -->
                    <ul class="project-info">
                        <li><h6>Date :</h6>
                        <fmt:formatDate pattern="yyyy-MM-dd" value="${lecture.startDate}"/> ~ 
                        <fmt:formatDate pattern="yyyy-MM-dd" value="${lecture.endDate}"/>
                        </li>
                        <li><h6>Price :</h6> ${lecture.price }</li>
                        <li><h6>artist :</h6> ${lecture.artistID }</li>
                        <li><h6>Genre :</h6> ${lecture.genre }</li>
                        <li><h6>Location :</h6> ${lecture.place }</li>
<!-- 지도 API ==================================================-->
<li>
	<div class="row" id="map" style="width: 400px; height: 250px; margin-left: auto; margin-right: auto;
	margin-bottom: auto;">
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=df63ab88c6f092a4b29b7f555f1a82dc&libraries=services"></script>
		<script>
 						var geocoder = new daum.maps.services.Geocoder();

 	  					var callback = function(result, status) {
 	  					    if (status === daum.maps.services.Status.OK) {
 	  					    	var container = document.getElementById('map'); // 지도를 표시할 div 
 	  		  					var options = { 
 	  									center : new daum.maps.LatLng(result[0].y, result[0].x), // 지도의 중심좌표 
 	  									level : 5 	// 지도의 확대 레벨 
 	  		  							}; 
 	  		 						// 지도를 생성한다 
 	  		  						var map = new daum.maps.Map(container, options); 
 	  		  						// 지도에 마커를 생성하고 표시한다 
 	  		 						var marker = new daum.maps.Marker({ 
 	  		  						position : new daum.maps.LatLng(result[0].y, result[0].x), // 마커의 좌표 
 	  		  						map : map 
 	  		  						// 마커를 표시할 지도 객체 
 	  		  						}); 
 	  					    }
 	  					};
 	  					geocoder.addressSearch('${lecture.place}', callback);
 		</script> 
	</div>
</li>
                    </ul>
                </div>
            </div>

	<br>
	<div class="span12">
       <h5 class="title-bg" style="padding-bottom: 12px;">Content</h5>
			 ${lecture.content }
    </div>
  
</div><!-- End gallery-single-->
</div><!-- End container row -->
</div> <!-- End Container -->

	 

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

<!--    Footer section -->
<%@include file="footer.jsp"%>

</body>

</html>