<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>Artist Page</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS
================================================== -->
<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-responsive.css">
<link rel="stylesheet" href="css/flexslider.css" />
<link rel="stylesheet" href="css/custom-styles.css">

<!-- Favicons
================================================== -->
<link rel="shortcut icon" href="img/favicon.ico">
<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">

<!-- JS
================================================== -->
<script src="http://code.jquery.com/jquery-latest.js" type="text/javascript"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.flexslider.js"></script>
<script src="js/jquery.custom.js"></script>

</head>

<body>
<!-- Page Content
    ================================================== --> 
    <div class="container main-container">
    <!-- Title Header -->
    <div class="row">
    <!-- 	header section -->
	<%@include file="header.jsp" %>

        <div class="span12">
            <h2>A page of Artist </h2>
            <p class="lead">This is a your page. You can post it which you want.</p>

            <!-- Carousel
            ================================================== -->
            <div class="row">
                 <div class="span4">
                <img src="download.do?id=${artistID }&profile=a" style="width: 300px; height: 250px;">
                </div>

                <div class="span5">
                    <h5>name : ${name }</h5>
                    <h5>nickname : ${nickname }</h5>
					<br>
                    <blockquote>
                        <p>${content }</p>
                    </blockquote>
                    <h5>게시글 : ${artCount }&nbsp;&nbsp;&nbsp;팔로워 : num&nbsp;&nbsp;&nbsp;팔로잉 : num&nbsp;&nbsp;&nbsp;좋아요 :num</h5>
                </div>
            </div>

     <h3 class="title-bg"> Artist가 쓴 글</h3>
     <div class="row clearfix">
         <ul class="gallery-post-grid holder">

            <c:forEach items="${artList }" var="art" varStatus="status">
                    <li class="span4 gallery-item">
                       <a href="selectOneArt.do?no=${art.no }">
                       <img src="download.do?no=${art.no }" style="width: 370px; height: 300px;"><br>
                       </a>
                        <span class="project-details"><a href="selectOneArt.do?no=${art.no }">${art.title }</a>
                        [${art.genre }] [${art.artDate }]
                        <c:if test="${art.sellCheck==1 }">[구매가능]</c:if>
                        </span>
                    </li>
            </c:forEach>

         </ul>
     </div>
    </div> 
    </div>
    </div> <!-- End Container -->
 
   
	<!-- 	Footer section -->
	<%@include file="footer.jsp" %>
    
</body>
</html>
