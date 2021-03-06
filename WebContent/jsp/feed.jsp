<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>피드</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!--  CSS 
 ==================================================  -->
 <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'> 
 <link rel="stylesheet" href="css/bootstrap.css"> 
 <link rel="stylesheet" href="css/bootstrap-responsive.css"> 
 <link rel="stylesheet" href="css/prettyPhoto.css" /> 
 <link rel="stylesheet" href="css/flexslider.css" /> 
 <link rel="stylesheet" href="css/custom-styles.css"> 
 
<!-- <!--[if lt IE 9]> -->
<!--     <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> -->
<!--     <link rel="stylesheet" href="css/style-ie.css"/> -->
<!-- <![endif]-->  

<!--  Favicons 
 ================================================== --> 
<link rel="shortcut icon" href="img/favicon.ico">
<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">

<!-- JS
<<<<<<< HEAD
================================================== -->
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/jquery.flexslider.js"></script>
<script src="js/jquery.custom.js"></script>

<script type="text/javascript">
$(document).ready(function () {
    $("#btn-blog-next").click(function () {
      $('#blogCarousel').carousel('next')
    });
     $("#btn-blog-prev").click(function () {
      $('#blogCarousel').carousel('prev')
    });

     $("#btn-client-next").click(function () {
      $('#clientCarousel').carousel('next')
    });
     $("#btn-client-prev").click(function () {
      $('#clientCarousel').carousel('prev')
    });
});

 $(window).load(function(){

    $('.flexslider').flexslider({
        animation: "slide",
        slideshow: true,
        start: function(slider){
          $('body').removeClass('loading');
        }
    });  
});

</script>
</head>

<body class="home">
    <!-- Color Bars (above header)-->
	<div class="color-bar-1"></div>
    <div class="color-bar-2 color-bg"></div>

    <div class="container main-container">
    <!--     Header section -->
        <%@include file="header.jsp" %>
        

    
    <div class="row gallery-row"><!-- Begin Gallery Row --> 
      
    	<div class="span12"><!-- First Container Gallery Row -->
            <h5 class="title-bg">feed
                <small>피드</small>
            </h5>
    	
        <!-- Gallery Thumbnails
        ================================================== -->

            <div class="row clearfix no-margin" id="divMore">
            	<ul class="gallery-post-grid holder">
				<c:forEach var="l" items="${list }">
                    <!-- Gallery Item 1 -->
                    <li  class="span3 gallery-item" data-id="id-1" data-type="illustration">
                        <span class="gallery-hover-4col hidden-phone hidden-tablet">
                            <span class="gallery-icons">
                                <a href="selectOneArt.do?no=${l.no }" class="item-zoom-link lightbox" title="Custom Illustration" data-rel="prettyPhoto"></a>
                            </span>
                        </span>
                        <img src="download.do?no=${l.no }" style="width: 300px; height: 220px;"></a>
                        <span class="project-details"><a href="selectOneArt.do?no=${l.no }">${l.title }</a>${l.nickname }</span>
                    </li>
				</c:forEach>    
                </ul>
                <ul id="ul"></ul>
            </div>
            <h5 class="title-bg" align="center">
                <a href="feed.do?check=1" id="more"><small>더 보기</small></a>
            </h5>
        </div>
    </div><!-- End Gallery Row -->
    
<!-- 	Footer section -->
	<%@include file="footer.jsp" %>

</body>
</html>
