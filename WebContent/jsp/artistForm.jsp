<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>아티스트</title>
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
      
    <!-- Blog Content
    ================================================== --> 
    <div class="row">
        <!-- Blog Posts ================================================== --> 
        <div class="span9 blog">
        
       <c:if test="${viewChoice==1 }">
        <h5 class="title-bg">Original<small>-popular artist</small></h5>
		<!-- First Container-좋아요 상위 6개==================== -->
           <div class="row clearfix">
               <ul class="blog-post-grid">
				<c:forEach items="${originalList }" var="original">
                   <li class="span3 blog-post-item">
                   <div class="blog-post-hover hidden-phone hidden-tablet">
                   <p><a href="artistPage.do?id=${original.id }" class="clearfix">${original.nickname }</a></p>
                   </div>
                   <a href="artistPage.do?id=${original.id }">
                   <img src="download.do?id=${original.id }&profile=a" style="width: 270px; height: 220px;"></a>
                   </li>
				</c:forEach>
                </ul>
            </div>
        <!-- Second Container-좋아요 상위 6개=================== -->
            <h5 class="title-bg">Painting<small>-popular artist</small></h5>
             <div class="row clearfix">
                <ul class="blog-post-grid">
                    <c:forEach items="${paintingList }" var="painting">
                    <li class="span3 blog-post-item">
                    <div class="blog-post-hover hidden-phone hidden-tablet">
                   <p><a href="artistPage.do?id=${painting.id }" class="clearfix">${painting.nickname }</a></p>
                   </div>
                   <a href="artistPage.do?id=${painting.id }">
                   <img src="download.do?id=${painting.id }&profile=a" style="width: 270px; height: 220px;"></a>
                    </li>
					</c:forEach>
                </ul>
            </div>
        <!-- Third Container-좋아요 상위 6개=================== -->
            <h5 class="title-bg">Sculpture<small>-popular artist</small></h5>
             <div class="row clearfix">
                <ul class="blog-post-grid">
                    <c:forEach items="${sculptureList }" var="sculpture">
                    <li class="span3 blog-post-item">                        
                      <div class="blog-post-hover hidden-phone hidden-tablet">
                   <p><a href="artistPage.do?id=${sculpture.id }" class="clearfix">${sculpture.nickname }</a></p>
                   </div>
                   <a href="artistPage.do?id=${sculpture.id }">
                   <img src="download.do?id=${sculpture.id }&profile=a" style="width: 270px; height: 220px;"></a>
                    </li>
					</c:forEach>
                </ul>
            </div>
     </c:if> 
<!--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
     <c:if test="${viewChoice==2 }">
     <h5 class="title-bg">아티스트 검색 결과</h5>
            <div class="row clearfix">
                <ul class="blog-post-grid">
                	<c:if test="${empty artistList }">
                	<h4 align="center">검색 결과 없음</h4>
                	</c:if>
					<c:forEach items="${artistList }" var="artist">
                    <li class="span3 blog-post-item">        
                    <div class="blog-post-hover hidden-phone hidden-tablet">
                   <p><a href="artistPage.do?id=${artist.id }" class="clearfix">${artist.nickname }</a></p>
                   </div>
                   <a href="artistPage.do?id=${artist.id }">
                   <img src="download.do?id=${artist.id }&profile=a" style="width: 270px; height: 220px;"></a>
                    </li>
					</c:forEach>
                </ul>
            </div>
        <div class="pagination">
                <ul>
                <c:if test="${start != 1 }">
                <c:if test="${type == 0 }">
                <li class="active"><a href="searchArtist.do?page=${start-1 }">Prev</a></li>
                <li class="active"><a href="searchArtist.do?page=1">1</a></li>
                </c:if>
                <c:if test="${type != 0 }">
		<li class="active"><a href="searchArtist.do?page=${start-1 }&type=${type }&searchWord=${searchWord }">Prev</a></li>
		<li class="active"><a href="searchArtist.do?page=1&type=${type }&searchWord=${searchWord }">1</a></li>
                </c:if>
                </c:if>
                
                <c:forEach begin="${start }" end="${end < last ? end : last }" var="i">
                <c:choose>
				<c:when test="${i == current }">
                <li><a>${i }</a></li>
				</c:when>                
                <c:otherwise>
                <c:if test="${type == 0 }">
                <li><a href="searchArtist.do?page=${i }">${i }</a></li>
                </c:if>
                <c:if test="${type != 0 }">
			    <li><a href="searchArtist.do?page=${i }&type=${type }&searchWord=${searchWord }">${i }</a></li>
                </c:if>
                </c:otherwise>
                </c:choose>
                </c:forEach>
                
                <c:if test="${end < last }">
					<c:if test="${type == 0 }">
	                <li><a href="searchArtist.do?page=${end+1 }">Next</a></li>
	                <li><a href="searchArtist.do?page=${last }">Last</a></li>
					</c:if>                
					<c:if test="${type != 0 }">
	                <li><a href="searchArtist.do?page=${end+1 }&type=${type }&searchWord=${searchWord }">Next</a></li>
	                <li><a href="searchArtist.do?page=${last }&type=${type }&searchWord=${searchWord }">Last</a></li>
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
					<c:forEach items="${artistList }" var="artist">
                    <li class="span3 blog-post-item">  
                     <div class="blog-post-hover hidden-phone hidden-tablet">
                   <p><a href="artistPage.do?id=${artist.id }" class="clearfix">${artist.nickname }</a></p>
                   </div>
                   <a href="artistPage.do?id=${artist.id }">
                   <img src="download.do?id=${artist.id }&profile=a" style="width: 270px; height: 220px;"></a>
                    </li>
					</c:forEach>
                </ul>
            </div>
        <div class="pagination">
                <ul>
                <c:if test="${start != 1 }">
                <c:if test="${type == 0 }">
                <li class="active"><a href="genreArtist.do?page=${start-1 }">Prev</a></li>
                <li class="active"><a href="genreArtist.do?page=1">1</a></li>
                </c:if>
                <c:if test="${type != 0 }">
				<li class="active"><a href="genreArtist.do?page=${start-1 }&genre=${genre}">Prev</a></li>
				<li class="active"><a href="genreArtist.do?page=1&genre=${genre}">1</a></li>
                </c:if>
                </c:if>
                
                <c:forEach begin="${start }" end="${end < last ? end : last }" var="i">
                <c:choose>
				<c:when test="${i == current }">
                <li><a>${i }</a></li>
				</c:when>                
                <c:otherwise>
                <c:if test="${type == 0 }">
                <li><a href="genreArtist.do?page=${i }">${i }</a></li>
                </c:if>
                <c:if test="${type != 0 }">
			    <li><a href="genreArtist.do?page=${i }&genre=${genre}">${i }</a></li>
                </c:if>
                </c:otherwise>
                </c:choose>
                </c:forEach>
                
                <c:if test="${end < last }">
					<c:if test="${type == 0 }">
	                <li><a href="genreArtist.do?page=${end+1 }">Next</a></li>
	                <li><a href="genreArtist.do?page=${last }">Last</a></li>
					</c:if>                
					<c:if test="${type != 0 }">
	                <li><a href="genreArtist.do?page=${end+1 }&genre=${genre}">Next</a></li>
	                <li><a href="genreArtist.do?page=${last }&genre=${genre}">Last</a></li>
					</c:if>                
                </c:if>
                
             </ul>
        </div>
     </c:if>
   </div>
<!--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->   
	 <!-- Blog Sidebar==================================== --> 
        <div class="span3 sidebar">
            <!--Search-->
            <section>
                 <form action="searchArtist.do">
                    <select name="type">
                    <option value="0" ${type == 0 ? 'selected="selected"' : '' }>검색 분류</option>
                    <option value="1" ${type == 1 ? 'selected="selected"' : '' }>nickname</option>
                    <option value="2" ${type == 2 ? 'selected="selected"' : '' }>name</option>
                    <option value="3" ${type == 3 ? 'selected="selected"' : '' }>ID</option>
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
                <li><a href="genreArtist.do?genre=original"><i class="icon-plus-sign"></i>Original</a></li>
                <li><a href="genreArtist.do?genre=painting"><i class="icon-plus-sign"></i>Painting</a></li>
                <li><a href="genreArtist.do?genre=sculpture"><i class="icon-plus-sign"></i>Sculpture</a></li>
            </ul>
        </div> 
    </div> <!-- End Container -->
</div>
    <!-- 	Footer section -->
	<%@include file="footer.jsp" %>
    
</body>
</html>
