<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>작업실 - 아티스트 웹갤러리</title>
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
        
       <div class="row headline"><!-- Begin Headline -->
     	<!-- Slider Carousel
        ================================================== -->
        <div class="span8">
            <div class="flexslider">
              <ul class="slides">
                <li><a href="gallery-single.htm"><img src="img/gallery/slider-img-3.jpg" alt="slider" /></a></li>
                <li><a href="gallery-single.htm"><img src="img/gallery/slider-img-4.jpg" alt="slider" /></a></li>
                <li><a href="gallery-single.htm"><img src="img/gallery/slider-img-5.jpg" alt="slider" /></a></li>
                <li><a href="gallery-single.htm"><img src="img/gallery/slider-img-1.jpg" alt="slider" /></a></li>
                <li><a href="gallery-single.htm"><img src="img/gallery/slider-img-2.jpg" alt="slider" /></a></li>
              </ul>
            </div>
        </div>
        
        <!-- Headline Text
        ================================================== -->
        <div class="span4">
        	<h3> 아티스트들의 사이버 갤러리 <br />
            작업실에 오신 것을 환영합니다.</h3>
            <p class="lead">심혈을 기울여 만든 작품이 사람들에게 주목받으면 이 자리에 걸릴거야. 여기에 걸릴 때까지 포기하지 말고 빡세게 매진하라고.</p>
            <p>이 주에 소개될 테마는 'Love Violet'입니다. 2018 올해의 컬러로 지정된 'Ultra Violet'처럼 바이올렛 색으로 이루어진 작품 중 선정된 작품들입니다. 작가의 페이지에 축하메세지 남겨주세요. </p>
        	
            <a href="#"><i class="icon-plus-sign"></i>Read More</a> 
        </div>
    </div><!-- End Headline -->
    
    <div class="row gallery-row"><!-- Begin Gallery Row --> 
      
    	<div class="span12"><!-- First Container Gallery Row -->
            <h5 class="title-bg">Popular Artist
                <small>인기 작가</small>
                <button class="btn btn-mini btn-inverse hidden-phone" type="button">View Portfolio</button>
            </h5>
    	
        <!-- Gallery Thumbnails
        ================================================== -->

            <div class="row clearfix no-margin">
            <ul class="gallery-post-grid holder">
				<c:forEach var="O" items="${One }">
                    <!-- Gallery Item 1 -->
                    <li  class="span3 gallery-item" data-id="id-1" data-type="illustration">
                        <span class="gallery-hover-4col hidden-phone hidden-tablet">
                            <span class="gallery-icons">
                            <c:if test="${id == O.id }">
                                <a href="artistMyPage.do" class="item-zoom-link lightbox" title="Custom Illustration" data-rel="prettyPhoto"></a>
                            </c:if>
                            <c:if test="${id != O.id }">
                            	<a href="artistPage.do?id=${O.id }" class="item-zoom-link lightbox" title="Custom Illustration" data-rel="prettyPhoto"></a>
                            </c:if>
                            </span>
                        </span>
                        <img src="download.do?id=${O.id }&profile=a" style="width: 300px; height: 220px;"></a>
                        <c:if test="${id == O.id }">
                        <span class="project-details"><a href="artistMyPage.do">${O.nickname }</a></span>
                        </c:if>
                        <c:if test="${id != O.id }">
                        <span class="project-details"><a href="artistPage.do?id=${O.id }">${O.nickname }</a></span>
                        </c:if>
                    </li>
				</c:forEach>    
                </ul>
                </div>
            </div>
            
            
            
            <div class="span12"><!-- Second Container Gallery Row -->
            <h5 class="title-bg">New ARTIST 
                <small>신예 작가</small>
                <button class="btn btn-mini btn-inverse hidden-phone" type="button">View Portfolio</button>
            </h5>
    	
        <!-- Gallery Thumbnails
        ================================================== -->

            <div class="row clearfix no-margin">
            <ul class="gallery-post-grid holder">
            	<c:forEach var="T" items="${Two }">
                    <!-- Gallery Item 5 -->
                    <li class="span3 gallery-item" data-id="id-5" data-type="web illustration">
                        <span class="gallery-hover-4col hidden-phone hidden-tablet">
                            <span class="gallery-icons">
                            <c:if test="${id == T.id }">
                                <a href="artistMyPage.do" class="item-zoom-link lightbox" title="Custom Illustration" data-rel="prettyPhoto"></a>
                            </c:if>
                            <c:if test="${id != T.id }">
                            	<a href="artistPage.do?id=${T.id }" class="item-zoom-link lightbox" title="Custom Illustration" data-rel="prettyPhoto"></a>
                            </c:if>
                            </span>
                        </span>
                        <img src="download.do?id=${T.id }&profile=a" alt="Gallery" style="width: 300px; height: 220px;"></a>
                        <c:if test="${id == T.id }">
                        <span class="project-details"><a href="artistMyPage.do">${T.nickname }</a></span>
                        </c:if>
                        <c:if test="${id != T.id }">
                        <span class="project-details"><a href="artistPage.do?id=${T.id }">${T.nickname }</a></span>
                        </c:if>
                    </li>
				</c:forEach>                 
                </ul>
                </div>
            </div>
            
            <div class="span12"><!-- Third Container Gallery Row -->
            <h5 class="title-bg">Popular art
                <small>인기 작품</small>
                <button class="btn btn-mini btn-inverse hidden-phone" type="button">View Portfolio</button>
            </h5>
    	
        <!-- Gallery Thumbnails
        ================================================== -->

            <div class="row clearfix no-margin">
            <ul class="gallery-post-grid holder">
            	<c:forEach var="Th" items="${Three }">     
                    <!-- Gallery Item 9 -->
                    <li class="span3 gallery-item" data-id="id-9" data-type="design">
                        <span class="gallery-hover-4col hidden-phone hidden-tablet">
                            <span class="gallery-icons">
                            	<a href="selectOneArt.do?no=${Th.no }" class="item-zoom-link lightbox" title="Custom Illustration" data-rel="prettyPhoto"></a>
                            </span>
                        </span>
                        <img src="download.do?no=${Th.no }" alt="Gallery" style="width: 300px; height: 220px;"></a>
                        <span class="project-details"><a href="selectOneArt.do?no=${Th.no }">${Th.title }</a>${Th.nickname }</span>
                    </li>
                </c:forEach>
                </ul>
                </div>
            </div>
            
            <div class="span12"><!-- Third Container Gallery Row -->
            <h5 class="title-bg">New art
                <small>신규 작품</small>
                <button class="btn btn-mini btn-inverse hidden-phone" type="button">View Portfolio</button>
            </h5>
    	
        <!-- Gallery Thumbnails
        ================================================== -->

            <div class="row clearfix no-margin">
            <ul class="gallery-post-grid holder">
            	<c:forEach var="F" items="${Four }">     
                    <!-- Gallery Item 9 -->
                    <li class="span3 gallery-item" data-id="id-9" data-type="design">
                        <span class="gallery-hover-4col hidden-phone hidden-tablet">
                            <span class="gallery-icons">
                                <a href="selectOneArt.do?no=${F.no }" class="item-zoom-link lightbox" title="Custom Illustration" data-rel="prettyPhoto"></a>
                            </span>
                        </span>
                        <img src="download.do?no=${F.no }" alt="Gallery" style="width: 300px; height: 220px;"></a>
                        <span class="project-details"><a href="selectOneArt.do?no=${F.no }">${F.title }</a>${F.nickname }</span>
                    </li>
                </c:forEach>
                </ul>
                </div>
            </div>
             
    </div><!-- End Gallery Row -->
    
    <div class="row"><!-- Begin Bottom Section -->
    
    	<!-- Blog Preview
        ================================================== -->
    	<div class="span6">

            <h5 class="title-bg">Popular Artist this week 
                <small>이번주 인기작가 인터뷰</small>
                <button id="btn-blog-next" class="btn btn-inverse btn-mini" type="button">&raquo;</button>
                <button id="btn-blog-prev" class="btn btn-inverse btn-mini" type="button">&laquo;</button>
            </h5>

        <div id="blogCarousel" class="carousel slide ">

            <!-- Carousel items -->
            <div class="carousel-inner">

                 <!-- Blog Item 1 -->
                <div class="active item">
                    <a href="blog-single.htm"><img src="img/gallery/blog-med-img-데이비드호크니.png" alt="" class="align-left blog-thumb-preview" /></a>
                    <div class="post-info clearfix">
                        <h4><a href="blog-single.htm">Davin Hockney(데이비드 호크니)</a></h4>
                        <ul class="blog-details-preview">
                            <li><i class="icon-calendar"></i><strong>Posted on:</strong> Sept 4, 2015<li>
                            <li><i class="icon-user"></i><strong>Posted by:</strong> <a href="#" title="Link">Admin</a><li>
                            <li><i class="icon-comment"></i><strong>Comments:</strong> <a href="#" title="Link">12</a><li>
                            <li><i class="icon-tags"></i><a href="#">photoshop</a>, <a href="#">tutorials</a>, <a href="#">illustration</a>
                        </ul>
                    </div>
                    <p class="blog-summary">영국 브랫포드에서 1937년 태어난 데이비드 호크니는 현재 가장 유명한 화가이며 20세기 미술에 엄청난 영향을 끼친 화가 중 한 명이다. 어릴 때부터 청력이 좋지 않았던 데이비드 호크니는 40세 무렵부터 거의 듣지 못하게 되었다. 그러나 그에게는 선천적으로 타고난 공감각(Synesthesia)이 있었다. 공감각이란 글자나 숫자에서 색채를 느끼는 능력. 보통 사람은 흑백으로 된 글씨를 보면 그냥 흑백으로 인지하지만, 공감각 능력을 가진 사람은 그 글씨에 색채가 있는 것으로 인지한다고 한다. 이러한 능력이 화가라는 직업에 도움이 되었음은 말할 필요도 없을 것이다. 
데이비드 호크니는 한때 포토콜라주라는 기법으로 사진에도 잠깐 관심을 보였으나 그는 기본적으로 사진이 드로잉의 한 형태라고 생각하며, 회화가 사진보다 공간에 대해 더 자세히 관찰하고 알게 해준다고 말했다. <a href="#">Read more</a><p>
                </div>

                <!-- Blog Item 2 -->
                 <div class="item">
                    <a href="blog-single.htm"><img src="img/gallery/blog-med-img-2.jpg" alt="" class="align-left blog-thumb-preview" /></a>
                    <div class="post-info clearfix">
                        <h4><a href="blog-single.htm">A great artist is always before his time</a></h4>
                        <ul class="blog-details-preview">
                            <li><i class="icon-calendar"></i><strong>Posted on:</strong> Sept 4, 2015<li>
                            <li><i class="icon-user"></i><strong>Posted by:</strong> <a href="#" title="Link">Admin</a><li>
                            <li><i class="icon-comment"></i><strong>Comments:</strong> <a href="#" title="Link">12</a><li>
                            <li><i class="icon-tags"></i> <a href="#">photoshop</a>, <a href="#">tutorials</a>, <a href="#">illustration</a>
                        </ul>
                    </div>
                    <p class="blog-summary">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum. Vestibulum lectus tellus, aliquet et iaculis sed, volutpat vel erat. <a href="#">Read more</a><p>
                </div>

                 <!-- Blog Item 3 -->
                 <div class="item">
                    <a href="blog-single.htm"><img src="img/gallery/blog-med-img-3.jpg" alt="" class="align-left blog-thumb-preview" /></a>
                    <div class="post-info clearfix">
                        <h4><a href="blog-single.htm">Is art everything to anybody?</a></h4>
                        <ul class="blog-details-preview">
                            <li><i class="icon-calendar"></i><strong>Posted on:</strong> Sept 4, 2015<li>
                            <li><i class="icon-user"></i><strong>Posted by:</strong> <a href="#" title="Link">Admin</a><li>
                            <li><i class="icon-comment"></i><strong>Comments:</strong> <a href="#" title="Link">12</a><li>
                            <li><i class="icon-tags"></i> <a href="#">photoshop</a>, <a href="#">tutorials</a>, <a href="#">illustration</a>
                        </ul>
                    </div>
                    <p class="blog-summary">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum. Vestibulum lectus tellus, aliquet et iaculis sed, volutpat vel erat. <a href="#">Read more</a><p>
                </div>
                
            </div>
            </div> 	
        </div>
        
        
        <!-- Blog Preview 2
        ================================================== -->
    	<div class="span6">

            <h5 class="title-bg">Curator's Art Story 
                <small>큐레이터의 명화소개</small>
                <button id="btn-blog-next" class="btn btn-inverse btn-mini" type="button">&raquo;</button>
                <button id="btn-blog-prev" class="btn btn-inverse btn-mini" type="button">&laquo;</button>
            </h5>

        <div id="blogCarousel" class="carousel slide ">

            <!-- Carousel items -->
            <div class="carousel-inner">

                 <!-- Blog Item 1 -->
                <div class="active item">
                    <a href="blog-single.htm"><img src="http://cdn.artmight.com/albums/public-domain-art-images/normal_Vincent-Willem-van-Gogh-122.jpg" alt="" class="align-left blog-thumb-preview" /></a>
                    <div class="post-info clearfix">
                        <h4><a href="blog-single.htm">빈센트 반 고흐</a></h4>                        
                    </div>
                    
                    <p class="blog-summary">빈센트 빌럼 반 고흐(네덜란드어: Vincent Willem van Gogh 핀센트 빌럼 판 호흐[*], 1853년 3월 30일 ~ 1890년 7월 29일)는 네덜란드 화가로 일반적으로 서양 미술사상 가장 위대한 화가 중 한 사람으로 여겨진다. 그는 그의 작품 전부(900여 점의 그림들과 1100여 점의 습작들)를 정신질환(측두엽 기능장애로 추측됨)을 앓고 자살을 감행하기 전의 단지 10년 동안에 만들어냈다. 그는 생존기간 동안 거의 성공을 거두지 못하고 사후에 비로소 알려졌는데, 특히 1901년 3월 17일 (그가 죽은 지 11년 후) 파리에서 71점의 반 고흐의 그림을 전시한 이후 그의 명성은 급속도로 커졌다. <a href="#">Read more</a><p>
                </div>
            </div>
            </div> 	
        </div>
        
        <!-- Client Area
        ================================================== -->
        <div class="span6">

            <h5 class="title-bg">The words of the artist 
                <small>작가의 말,말,말</small>
                <button id="btn-client-next" class="btn btn-inverse btn-mini" type="button">&raquo;</button>
                <button id="btn-client-prev" class="btn btn-inverse btn-mini" type="button">&laquo;</button>
            </h5>

            <!-- Client Testimonial Slider-->
            <div id="clientCarousel" class="carousel slide no-margin">
            <!-- Carousel items -->
            <div class="carousel-inner">

                <div class="active item">                    
                    <p class="quote-text">"Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum. Morbi blandit ultricies ultrices. Vivamus nec lectus sed orci molestie molestie."<cite>- Client Name, Big Company</cite></p>
                </div>

                <div class="item">
                    <p class="quote-text">"Adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum. Morbi blandit ultricies ultrices. Vivamus nec lectus sed orci molestie molestie."<cite>- Another Client Name, Company Name</cite></p>
                </div>

                <div class="item">
                    <p class="quote-text">"Mauris eget tellus sem. Cras sollicitudin sem eu elit aliquam quis condimentum nulla suscipit. Nam sed magna ante. Ut eget suscipit mauris."<cite>- On More Client, The Company</cite></p>
                </div>
                
            </div>
            

        </div>
        
    </div><!-- End Bottom Section -->
    
     <!-- Client Area
        ================================================== -->
        <div class="span6">

            <h5 class="title-bg">예술계 동향 
                <small>예술관련 기사링크</small>                
            </h5>
            
            <div id="mk-root" style="width:600px;text-align: left; clear: both; font-size: 15px; line-height: 28px; margin: 0; padding: 5px; border: 1px solid #CCC;color: #333; display: block;"> <h2 style="margin: 0; border: 0; text-align: left;background: #ff7800;font-family: Arial, Helvetica, sans-serif;font-weight: bold;font-size: 20px;padding: 8px 0;margin-bottom: 15px;color: #FFF;width: 100%;text-align: center;"> MK NEWS </h2> <h3 style="font-size: 24px;line-height: 29px;letter-spacing: -1px; margin: 0;padding: 0; border: 0;text-align: left;"><a href="http://news.mk.co.kr/newsRead.php?year=2017&no=476953">미술시장 키우는 게 젊은 작가 살리는 길</a></h3><br> <div id="mk-left" style="width:299px;float: left;margin: 0;padding: 0;border: 0;font-size: 100%;display: block;padding-right: 15px;max-height: 120px;overflow: hidden;"> <img id="mk-img" src=http://file.mk.co.kr/meet/neds/2017/07/image_readtop_2017_476953_15001935642958512.jpg style="width:299px;border: 0;"> </div> <div style="overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 4; -webkit-box-orient: vertical; word-wrap:break-word;margin: 0;padding: 0; border: 0;font-size: 100%;"> <a href="http://news.mk.co.kr/newsRead.php?year=2017&no=476953"> ■ 이화익 화랑협회장 인터뷰 작가의 신작을 전시·판매하는 화랑업이 어렵다는 말은 어제오늘의 얘기는 아니지만 점차 피부에 와 닿고 있다. 시장을 받쳐주던 단색화 열풍이 사그라들 조짐이 보이는 데다 기업 심리 위축과 중국 한한령 여 </a> </div> <br><span class="box_pop1_by" style=" margin: 0;padding: 0;border: 0;font-size: 100%;"><a href="http://news.mk.co.kr/newsRead.php?year=2017&no=476953">news.mk.co.kr</a></span> </div>                        
    
    </div> <!-- End Container -->

    

<!-- 	Footer section -->
	<%@include file="footer.jsp" %>
</div>
</div>
</body>
</html>
