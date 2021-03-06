<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>Artist MyPage</title>

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

<script type="text/javascript">
function followerCount() {
	$.ajax({
		type : 'get',
		url : 'followerCount.do',
		data : {'id' : $('#id').val()},
		dataType : 'json',
		success : function(data) {
			$('#followerCount').text(data.followerCount);
		},
		error : function(xhr, status, error) {
			alert("카운트 오류");
		}
	});
}

function followingCount() {
	$.ajax({
		type : 'get',
		url : 'followingCount.do',
		data : {'id' : $('#id').val()},
		dataType : 'json',
		success : function(data) {
			$('#followingCount').text(data.followingCount);
		},
		error : function(xhr, status, error) {
			alert("카운트 오류");
		}
	});
}

$(document).ready(function() {
	followerCount();
	followingCount();
})
</script>
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
                <img src="download.do?id=${id }&profile=a" style="width: 300px; height: 250px;">
                </div>

                <div class="span5">
                    <h5>name : ${name }</h5>
                    <h5>nickname : ${nickname }</h5>
					<br>
                    <blockquote>
                        <p>${content }</p>
                    </blockquote>
					
					<button class="btn btn-small btn-inverse" type="button" onclick="location.href='writeArtForm.do'">게시글 등록</button>
                    <button class="btn btn-small btn-inverse" type="button" onclick="location.href='mySellFormA0.do'">관리페이지</button><p>

                    <div style="font-size: 15pt">게시글 : ${artCount }&nbsp;&nbsp;&nbsp;
                    <a href="followerList.do?follower=${id }">팔로워</a>&nbsp;<span id="followerCount"></span>&nbsp;&nbsp;&nbsp;
                    <a href="followingList.do?following=${id }">팔로잉</a>&nbsp;<span id="followingCount"></span>&nbsp;&nbsp;&nbsp;
                    <a href="likesList.do?likesID=${id }">좋아요 목록</a></div>
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
                       posted on <fmt:formatDate pattern="dd/MM/yyyy" value="${art.artDate}"/>
                       <c:choose>
                 	   <c:when test="${art.sellCheck==1 }">,&nbsp;&nbsp;available for purchase</c:when>
                 	   <c:otherwise>,&nbsp;&nbsp;display only</c:otherwise>
                 	   </c:choose>
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
    <input type="hidden" id="id" value="${id }">
</body>
</html>
