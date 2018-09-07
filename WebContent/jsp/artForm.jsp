<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>작품 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS
================================================== -->
<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
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
<link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">

<!-- JS
================================================== -->
<script src="http://code.jquery.com/jquery-latest.js" type="text/javascript"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.custom.js"></script>

</head>

<body>
	<div class="color-bar-1"></div>
    <div class="color-bar-2 color-bg"></div>
    <div class="container main-container">
    
    <!--     Header section -->
        <%@include file="header.jsp" %>
    
      
<!-- Blog Content ================================================== -->  
    <div class="row">

        <!-- Blog Posts
        ================================================== --> 
        <div class="span9 blog">
            
    <c:if test="${viewChoice==1 }">
        <h5 class="title-bg">Original<small>-popular art</small></h5>
		<!-- First Container-좋아요 상위 6개==================== -->
            <div class="row clearfix">
                <ul class="blog-post-grid">
					<c:forEach items="${originalList }" var="original">
                    <li class="span3 blog-post-item">
                     <div class="blog-post-hover hidden-phone hidden-tablet">
                   <p><a href="selectOneArt.do?no=${original.no }" class="clearfix">${original.title }</a>
                   posted on <fmt:formatDate pattern="dd/MM/yyyy" value="${original.artDate}"/>
                   <br> genre : ${original.genre } <br> 
                   <c:choose>
                   <c:when test="${original.sellCheck==1 }">available for purchase</c:when>
                   <c:otherwise>display only</c:otherwise>
                   </c:choose>
                   </p>
                   </div>
                   <a href="selectOneArt.do?no=${original.no }">
                   <img src="download.do?no=${original.no }" style="width: 270px; height: 220px;"></a>
                    </li>
					</c:forEach>
                </ul>
            </div>
        <!-- Second Container-좋아요 상위 6개=================== -->
            <h5 class="title-bg">Painting<small>-popular art</small></h5>
             <div class="row clearfix">
                <ul class="blog-post-grid">
                    <c:forEach items="${paintingList }" var="painting">
                    <li class="span3 blog-post-item">        
                    <div class="blog-post-hover hidden-phone hidden-tablet">
                   <p><a href="selectOneArt.do?no=${painting.no }" class="clearfix">${painting.title }</a>
                   posted on <fmt:formatDate pattern="dd/MM/yyyy" value="${painting.artDate}"/>
                   <br> genre : ${painting.genre } <br> 
                   <c:choose>
                   <c:when test="${painting.sellCheck==1 }">available for purchase</c:when>
                   <c:otherwise>display only</c:otherwise>
                   </c:choose>
                   </p>
                   </div>
                   <a href="selectOneArt.do?no=${painting.no }">
                   <img src="download.do?no=${painting.no }" style="width: 270px; height: 220px;"></a>
                    </li>
					</c:forEach>
                </ul>
            </div>
    	<!-- Third Container-좋아요 상위 6개=================== -->
            <h5 class="title-bg">Sculpture<small>-popular art</small></h5>
             <div class="row clearfix">
                <ul class="blog-post-grid">
                    <c:forEach items="${sculptureList }" var="sculpture">
                    <li class="span3 blog-post-item">        
                    <div class="blog-post-hover hidden-phone hidden-tablet">
                   <p><a href="selectOneArt.do?no=${sculpture.no }" class="clearfix">${sculpture.title }</a>
                   posted on <fmt:formatDate pattern="dd/MM/yyyy" value="${sculpture.artDate}"/>
                   <br> genre : ${sculpture.genre } <br> 
                   <c:choose>
                   <c:when test="${sculpture.sellCheck==1 }">available for purchase</c:when>
                   <c:otherwise>display only</c:otherwise>
                   </c:choose>
                   </p>
                   </div>
                   <a href="selectOneArt.do?no=${sculpture.no }">
                   <img src="download.do?no=${sculpture.no }" style="width: 270px; height: 220px;"></a>
                    </li>
					</c:forEach>
                </ul>
            </div>
     </c:if>
<!--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
     <c:if test="${viewChoice==2 }">
     <h5 class="title-bg">작품 검색 결과</h5>
            <div class="row clearfix">
                <ul class="blog-post-grid">
                	<c:if test="${empty artList }">
                	<h4 align="center">검색 결과 없음</h4>
                	</c:if>
					<c:forEach items="${artList }" var="art">
                    <li class="span3 blog-post-item">          
                    <div class="blog-post-hover hidden-phone hidden-tablet">
                   <p><a href="selectOneArt.do?no=${art.no }" class="clearfix">${art.title }</a>
                   posted on <fmt:formatDate pattern="dd/MM/yyyy" value="${art.artDate}"/>
                   <br> genre : ${art.genre } <br> 
                   <c:choose>
                   <c:when test="${art.sellCheck==1 }">available for purchase</c:when>
                   <c:otherwise>display only</c:otherwise>
                   </c:choose>
                   </p>
                   </div>
                   <a href="selectOneArt.do?no=${art.no }">
                   <img src="download.do?no=${art.no }" style="width: 270px; height: 220px;"></a>
                    </li>
					</c:forEach>
                </ul>
            </div>
        <div class="pagination">
                <ul>
                <c:if test="${start != 1 }">
                <c:if test="${type == 0 }">
                <li class="active"><a href="searchArt.do?page=${start-1 }">Prev</a></li>
                <li class="active"><a href="searchArt.do?page=1">1</a></li>
                </c:if>
                <c:if test="${type != 0 }">
<li class="active"><a href="searchArt.do?page=${start-1 }&type=${type }&searchWord=${searchWord }&genre=${genre}">Prev</a></li>
<li class="active"><a href="searchArt.do?page=1&type=${type }&searchWord=${searchWord }&genre=${genre}">1</a></li>
                </c:if>
                </c:if>
                
                <c:forEach begin="${start }" end="${end < last ? end : last }" var="i">
                <c:choose>
				<c:when test="${i == current }">
                <li><a>${i }</a></li>
				</c:when>                
                <c:otherwise>
                <c:if test="${type == 0 }">
                <li><a href="searchArt.do?page=${i }">${i }</a></li>
                </c:if>
                <c:if test="${type != 0 }">
			    <li><a href="searchArt.do?page=${i }&type=${type }&searchWord=${searchWord }&genre=${genre}">${i }</a></li>
                </c:if>
                </c:otherwise>
                </c:choose>
                </c:forEach>
                
                <c:if test="${end < last }">
					<c:if test="${type == 0 }">
	                <li><a href="searchArt.do?page=${end+1 }">Next</a></li>
	                <li><a href="searchArt.do?page=${last }">Last</a></li>
					</c:if>                
					<c:if test="${type != 0 }">
	                <li><a href="searchArt.do?page=${end+1 }&type=${type }&searchWord=${searchWord }&genre=${genre}">Next</a></li>
	                <li><a href="searchArt.do?page=${last }&type=${type }&searchWord=${searchWord }&genre=${genre}">Last</a></li>
					</c:if>                
                </c:if>
                
                </ul>
        </div>
     </c:if>
<!--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
     <c:if test="${viewChoice==3 }">
     <h5 class="title-bg">${genre }</h5>
            <div class="row clearfix">
                <ul class="blog-post-grid">
					<c:forEach items="${artList }" var="art">
                    <li class="span3 blog-post-item">      
                    <div class="blog-post-hover hidden-phone hidden-tablet">
                   <p><a href="selectOneArt.do?no=${art.no }" class="clearfix">${art.title }</a>
                    posted on <fmt:formatDate pattern="dd/MM/yyyy" value="${art.artDate}"/>
                   <br> genre : ${art.genre } <br> 
                   <c:choose>
                   <c:when test="${art.sellCheck==1 }">available for purchase</c:when>
                   <c:otherwise>display only</c:otherwise>
                   </c:choose>
                   </p>
                   </div>
                   <a href="selectOneArt.do?no=${art.no }">
                   <img src="download.do?no=${art.no }" style="width: 270px; height: 220px;"></a>                  
                    </li>
					</c:forEach>
                </ul>
            </div>
        <div class="pagination">
                <ul>
                <c:if test="${start != 1 }">
                <c:if test="${type == 0 }">
                <li class="active"><a href="genreArt.do?page=${start-1 }">Prev</a></li>
                <li class="active"><a href="genreArt.do?page=1">1</a></li>
                </c:if>
                <c:if test="${type != 0 }">
				<li class="active"><a href="genreArt.do?page=${start-1 }&genre=${genreInt}">Prev</a></li>
				<li class="active"><a href="genreArt.do?page=1&genre=${genreInt}">1</a></li>
                </c:if>
                </c:if>
                
                <c:forEach begin="${start }" end="${end < last ? end : last }" var="i">
                <c:choose>
				<c:when test="${i == current }">
                <li><a>${i }</a></li>
				</c:when>                
                <c:otherwise>
                <c:if test="${type == 0 }">
                <li><a href="genreArt.do?page=${i }">${i }</a></li>
                </c:if>
                <c:if test="${type != 0 }">
			    <li><a href="genreArt.do?page=${i }&genre=${genreInt}">${i }</a></li>
                </c:if>
                </c:otherwise>
                </c:choose>
                </c:forEach>
                
                <c:if test="${end < last }">
					<c:if test="${type == 0 }">
	                <li><a href="genreArt.do?page=${end+1 }">Next</a></li>
	                <li><a href="genreArt.do?page=${last }">Last</a></li>
					</c:if>                
					<c:if test="${type != 0 }">
	                <li><a href="genreArt.do?page=${end+1 }&genre=${genreInt}">Next</a></li>
	                <li><a href="genreArt.do?page=${last }&genre=${genreInt}">Last</a></li>
					</c:if>                
                </c:if>
                
             </ul>
        </div>
     </c:if>
   </div>
 <!--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->  
        <!-- Blog Sidebar================================= --> 
        <div class="span3 sidebar">
            <!--Search-->
            <section>
                 <form action="searchArt.do">
                    <select name="genre">
                    <option value="">장르&nbsp;선택</option> 
                    <option value="original" ${genre == 'original' ? 'selected="selected"' : '' }>Original</option>
                    <option value="painting" ${genre == 'painting' ? 'selected="selected"' : '' }>Painting</option>
                    <option value="sculpture" ${genre == 'sculpture' ? 'selected="selected"' : '' }>Sculpture</option>
                    </select>
                    <select name="type">
                    <option value="1" ${type == 1 ? 'selected="selected"' : '' }>작품명</option>
                    <option value="2" ${type == 2 ? 'selected="selected"' : '' }>작가명</option>
                    <option value="3" ${type == 3 ? 'selected="selected"' : '' }>내&nbsp;&nbsp;&nbsp;&nbsp;용</option>
                    <option value="4" ${type == 4 ? 'selected="selected"' : '' }>작품명+내용</option>
                    </select>
              	<div class="input-append">
				<input id="appendedInputButton" size="16" type="text" placeholder="Search" name="searchWord">
				<button class="btn" type="submit"><i class="icon-search"></i></button>
                </div>
                </form>
            </section>

            <!--Categories-->
            <h5 class="title-bg">Categories</h5>
            <ul class="post-category-list">
                <li><a href="genreArt.do?genre=1"><i class="icon-plus-sign"></i>Original</a></li>
                <li><a href="genreArt.do?genre=2"><i class="icon-plus-sign"></i>Painting</a></li>
                <li><a href="genreArt.do?genre=3"><i class="icon-plus-sign"></i>Sculpture</a></li>
            </ul>
        </div>    
    </div> <!-- End Container -->
</div>
    <!-- 	Footer section -->
	<%@include file="footer.jsp" %>
	
</body>
</html>
