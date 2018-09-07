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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.custom.js"></script>

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
			
<c:if test="${viewChoice==1 }">
				<div align="right">
				<button class="btn" type="button"
						onclick="location.href='addLectureForm.do'">강의개설</button>
				</div><br>
				<h4 class="title-bg">Made by Artist<small>&nbsp;&nbsp;&nbsp;from the latest 5</small></h4><br>
				<!-- 최근 아티스트가 등록한 강의 목록 5개-->
				<c:forEach items="${recentLectureA }" var="lecture">
				<article class="clearfix"> <a href="selectOneLecture.do?no=${lecture.no }">
				<img src="download.do?no=${lecture.no }&lecture=a" style="width: 270px; height: 220px;" class="align-left">
				</a>
				<h4 class="title-bg">
					<a href="selectOneLecture.do?no=${lecture.no }">${lecture.title }</a>
				</h4>
				<p style="font-size: 13px">
				genre : ${lecture.genre } <br><br>
				date : <fmt:formatDate pattern="yyyy-MM-dd" value="${lecture.startDate }"/> ~ <fmt:formatDate pattern="yyyy-MM-dd" value="${lecture.endDate }"/><br><br>
				location : ${lecture.place }
				</p>
				<div class="post-summary-footer">
					<ul class="post-data-3">
						<li><i class="icon-calendar"></i><fmt:formatDate pattern="yyyy-MM-dd" value="${lecture.writeDate }"/></li>
						<li><i class="icon-user"></i> <a href="artistPage.do?id=${lecture.artistID }">${lecture.artistID }</a></li>
						<li><i class="icon-comment"></i> <a href="#">댓글 수</a></li>
					</ul>
				</div>
				</article>
				</c:forEach>
				<h4 class="title-bg">Made by Guest<small>&nbsp;&nbsp;&nbsp;from the latest 5</small></h4><br>				
				<!-- 최근 사용자가 등록한 강의 목록 5개-->				
				<c:forEach items="${recentLectureG }" var="lecture">
				<article class="clearfix"> <a href="selectOneLecture.do?no=${lecture.no }">
				<img src="download.do?no=${lecture.no }&lecture=a" style="width: 270px; height: 220px;" class="align-left">
				</a>
				<h4 class="title-bg">
					<a href="selectOneLecture.do?no=${lecture.no }">${lecture.title }</a>
				</h4>
				<p style="font-size: 13px">
				genre : ${lecture.genre } <br><br>
				date : <fmt:formatDate pattern="yyyy-MM-dd" value="${lecture.startDate }"/> ~ <fmt:formatDate pattern="yyyy-MM-dd" value="${lecture.endDate }"/><br><br>
				location : ${lecture.place }
				</p>
				<div class="post-summary-footer">
					<ul class="post-data-3">
						<li><i class="icon-calendar"></i>${lecture.writeDate }</li>
						<li><i class="icon-user"></i> <a href="artistPage.do?id=${lecture.artistID }">${lecture.artistID }</a></li>
						<li><i class="icon-comment"></i> <a href="#">댓글 수</a></li>
					</ul>
				</div>
				</article>
				</c:forEach>
	</c:if>
<!--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
	<c:if test="${viewChoice==2 }">
     <h5 class="title-bg">강의 검색 결과</h5>
                <ul class="blog-post-grid">
                	<c:if test="${empty lectureList }">
                	<h4 align="center">검색 결과 없음</h4>
                	</c:if>
				<c:forEach items="${lectureList }" var="lecture">
					<article class="clearfix"> <a href="selectOneLecture.do?no=${lecture.no }">
					<img src="download.do?no=${lecture.no }&lecture=a" style="width: 270px; height: 220px;" class="align-left">
					</a>
				<h4 class="title-bg">
					<a href="selectOneLecture.do?no=${lecture.no }">${lecture.title }</a>
				</h4>
				<p style="font-size: 13px">
				genre : ${lecture.genre } <br><br>
				date : <fmt:formatDate pattern="yyyy-MM-dd" value="${lecture.startDate }"/> ~ <fmt:formatDate pattern="yyyy-MM-dd" value="${lecture.endDate }"/><br><br>
				location : ${lecture.place }
				</p>
				<div class="post-summary-footer">
					<ul class="post-data-3">
						<li><i class="icon-calendar"></i>${lecture.writeDate }</li>
						<li><i class="icon-user"></i> <a href="artistPage.do?id=${lecture.artistID }">${lecture.artistID }</a></li>
						<li><i class="icon-comment"></i> <a href="#">댓글 수</a></li>
					</ul>
				</div>
				</article>
			</c:forEach>
                </ul>
        <div class="pagination">
                <ul>
                <c:if test="${start != 1 }">
                <c:if test="${type == 0 }">
                <li class="active"><a href="searchLecture.do?page=${start-1 }">Prev</a></li>
                <li class="active"><a href="searchLecture.do?page=1">1</a></li>
                </c:if>
                <c:if test="${type != 0 }">
<li class="active"><a href="searchLecture.do?page=${start-1 }&type=${type }&searchWord=${searchWord }&genre=${genre}">Prev</a></li>
<li class="active"><a href="searchLecture.do?page=1&type=${type }&searchWord=${searchWord }&genre=${genre}">1</a></li>
                </c:if>
                </c:if>
                
                <c:forEach begin="${start }" end="${end < last ? end : last }" var="i">
                <c:choose>
				<c:when test="${i == current }">
                <li><a>${i }</a></li>
				</c:when>                
                <c:otherwise>
                <c:if test="${type == 0 }">
                <li><a href="searchLecture.do?page=${i }">${i }</a></li>
                </c:if>
                <c:if test="${type != 0 }">
			    <li><a href="searchLecture.do?page=${i }&type=${type }&searchWord=${searchWord }&genre=${genre}">${i }</a></li>
                </c:if>
                </c:otherwise>
                </c:choose>
                </c:forEach>
                
                <c:if test="${end < last }">
					<c:if test="${type == 0 }">
	                <li><a href="searchLecture.do?page=${end+1 }">Next</a></li>
	                <li><a href="searchLecture.do?page=${last }">Last</a></li>
					</c:if>                
					<c:if test="${type != 0 }">
	                <li><a href="searchLecture.do?page=${end+1 }&type=${type }&searchWord=${searchWord }&genre=${genre}">Next</a></li>
	                <li><a href="searchLecture.do?page=${last }&type=${type }&searchWord=${searchWord }&genre=${genre}">Last</a></li>
					</c:if>                
                </c:if>
            </ul>
        </div>
     </c:if>
<!--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->			
	<c:if test="${viewChoice==3 }">
     <h5 class="title-bg">Made by ${who == 'A' ? 'Artist' : 'Guest'}</h5>
                <ul class="blog-post-grid">
			<c:forEach items="${lectureList }" var="lecture">
                    <article class="clearfix"> <a href="selectOneLecture.do?no=${lecture.no }">
                    <img src="download.do?no=${lecture.no }&lecture=a" style="width: 270px; height: 220px;" class="align-left">
                    </a>
				<h4 class="title-bg">
					<a href="selectOneLecture.do?no=${lecture.no }">${lecture.title }</a>
				</h4>
				<p style="font-size: 13px">
				genre : ${lecture.genre } <br><br>
				date : <fmt:formatDate pattern="yyyy-MM-dd" value="${lecture.startDate }"/> ~ <fmt:formatDate pattern="yyyy-MM-dd" value="${lecture.endDate }"/><br><br>
				location : ${lecture.place }
				</p>
				<div class="post-summary-footer">
					<ul class="post-data-3">
						<li><i class="icon-calendar"></i>${lecture.writeDate }</li>
						<li><i class="icon-user"></i> <a href="artistPage.do?id=${lecture.artistID }">${lecture.artistID }</a></li>
						<li><i class="icon-comment"></i> <a href="#">댓글 수</a></li>
					</ul>
				</div>
				</article>
			</c:forEach>
                </ul>
        <div class="pagination">
                <ul>
                <c:if test="${start != 1 }">
                <c:if test="${type == 0 }">
                <li class="active"><a href="allLecture${who }.do?page=${start-1 }">Prev</a></li>
                <li class="active"><a href="allLecture${who }.do?page=1">1</a></li>
                </c:if>
                <c:if test="${type != 0 }">
				<li class="active"><a href="allLecture${who }.do?page=${start-1 }">Prev</a></li>
				<li class="active"><a href="allLecture${who }.do?page=1">1</a></li>
                </c:if>
                </c:if>
                
                <c:forEach begin="${start }" end="${end < last ? end : last }" var="i">
                <c:choose>
				<c:when test="${i == current }">
                <li><a>${i }</a></li>
				</c:when>                
                <c:otherwise>
                <c:if test="${type == 0 }">
                <li><a href="allLecture${who }.do?page=${i }">${i }</a></li>
                </c:if>
                <c:if test="${type != 0 }">
			    <li><a href="allLecture${who }.do?page=${i }">${i }</a></li>
                </c:if>
                </c:otherwise>
                </c:choose>
                </c:forEach>
                
                <c:if test="${end < last }">
					<c:if test="${type == 0 }">
	                <li><a href="allLecture${who }.do?page=${end+1 }">Next</a></li>
	                <li><a href="allLecture${who }.do?page=${last }">Last</a></li>
					</c:if>                
					<c:if test="${type != 0 }">
	                <li><a href="allLecture${who }.do?page=${end+1 }">Next</a></li>
	                <li><a href="allLecture${who }.do?page=${last }">Last</a></li>
					</c:if>                
                </c:if>
             </ul>
        </div>
     </c:if>
</div>
<!--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
		<!-- Blog Sidebar
        ================================================== -->
			<div class="span4 sidebar">
 		<!--Search-->
            <section>
                 <form action="searchLecture.do">
                    <select name="genre">
                    <option value="">장르&nbsp;선택</option> 
                    <option value="original" ${genre == 'original' ? 'selected="selected"' : '' }>Original</option>
                    <option value="painting" ${genre == 'painting' ? 'selected="selected"' : '' }>Painting</option>
                    <option value="sculpture" ${genre == 'sculpture' ? 'selected="selected"' : '' }>Sculpture</option>
                    </select>
                    <select name="type">
                    <option value="1" ${type == 1 ? 'selected="selected"' : '' }>강의명</option>
                    <option value="2" ${type == 2 ? 'selected="selected"' : '' }>작가명</option>
                    <option value="3" ${type == 3 ? 'selected="selected"' : '' }>내&nbsp;&nbsp;&nbsp;&nbsp;용</option>
                    <option value="4" ${type == 4 ? 'selected="selected"' : '' }>강의명+내용</option>
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
					<li><a href="allLectureA.do"><i class="icon-plus-sign"></i>Made by Artist</a></li>
					<li><a href="allLectureG.do"><i class="icon-plus-sign"></i>Made by Guest</a></li>
				</ul>

				<!--Popular Posts-->
				<h5 class="title-bg">Popular Posts</h5>
				<ul class="popular-posts">
					<li><a href="blog-single.htm"><img
							src="img/gallery/gallery-img-2-thumb.jpg" alt="Popular Post"></a>
						<h6>
							<a href="#">Lorem ipsum dolor sit amet consectetur adipiscing
								elit</a>
						</h6> <em>Posted on 09/01/15</em></li>
					<li><a href="blog-single.htm"><img
							src="img/gallery/gallery-img-3-thumb.jpg" alt="Popular Post"></a>
						<h6>
							<a href="#">Nulla iaculis mattis lorem, quis gravida nunc
								iaculis</a>
						</h6> <em>Posted on 09/01/15</em>
					<li><a href="blog-single.htm"><img
							src="img/gallery/gallery-img-4-thumb.jpg" alt="Popular Post"></a>
						<h6>
							<a href="#">Vivamus tincidunt sem eu magna varius elementum
								maecenas felis</a>
						</h6> <em>Posted on 09/01/15</em></li>
				</ul>

<!-- 				Tabbed Content -->
<!-- 				<h5 class="title-bg">More Info</h5> -->
<!-- 				<ul class="nav nav-tabs"> -->
<!-- 					<li class="active"><a href="#comments" data-toggle="tab">Comments</a></li> -->
<!-- 					<li><a href="#tweets" data-toggle="tab">Tweets</a></li> -->
<!-- 					<li><a href="#about" data-toggle="tab">About</a></li> -->
<!-- 				</ul> -->

<!-- 				<div class="tab-content"> -->
<!-- 					<div class="tab-pane active" id="comments"> -->
<!-- 						<ul> -->
<!-- 							<li><i class="icon-comment"></i>admin on <a href="#">Lorem -->
<!-- 									ipsum dolor sit amet</a></li> -->
<!-- 							<li><i class="icon-comment"></i>admin on <a href="#">Consectetur -->
<!-- 									adipiscing elit</a></li> -->
<!-- 							<li><i class="icon-comment"></i>admin on <a href="#">Ipsum -->
<!-- 									dolor sit amet consectetur</a></li> -->
<!-- 							<li><i class="icon-comment"></i>admin on <a href="#">Aadipiscing -->
<!-- 									elit varius elementum</a></li> -->
<!-- 							<li><i class="icon-comment"></i>admin on <a href="#">ulla -->
<!-- 									iaculis mattis lorem</a></li> -->
<!-- 						</ul> -->
<!-- 					</div> -->
<!-- 					<div class="tab-pane" id="tweets"> -->
<!-- 						<ul> -->
<!-- 							<li><a href="#"><i class="icon-share-alt"></i>@room122</a> -->
<!-- 								Vivamus tincidunt sem eu magna varius elementum. Maecenas felis -->
<!-- 								tellus, fermentum vitae laoreet vitae, volutpat et urna.</li> -->
<!-- 							<li><a href="#"> <i class="icon-share-alt"></i>@room122 -->
<!-- 							</a> Nulla faucibus ligula eget ante varius ac euismod odio placerat.</li> -->
<!-- 							<li><a href="#"> <i class="icon-share-alt"></i>@room122 -->
<!-- 							</a> Pellentesque iaculis lacinia leo. Donec suscipit, lectus et -->
<!-- 								hendrerit posuere, dui nisi porta risus, eget adipiscing</li> -->
<!-- 							<li><a href="#"> <i class="icon-share-alt"></i>@room122 -->
<!-- 							</a> Vivamus augue nulla, vestibulum ac ultrices posuere, vehicula ac -->
<!-- 								arcu.</li> -->
<!-- 							<li><a href="#"> <i class="icon-share-alt"></i>@room122 -->
<!-- 							</a> Sed ac neque nec leo condimentum rhoncus. Nunc dapibus odio et -->
<!-- 								lacus.</li> -->
<!-- 						</ul> -->
<!-- 					</div> -->
<!-- 					<div class="tab-pane" id="about"> -->
<!-- 						<p>Enim eiusmod high life accusamus terry richardson ad squid. -->
<!-- 							3 wolf moon officia aute, non cupidatat skateboard dolor brunch. -->
<!-- 							Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon -->
<!-- 							tempor, sunt aliqua put a bird on it squid single-origin coffee -->
<!-- 							nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, -->
<!-- 							craft beer labore wes anderson cred nesciunt sapiente ea -->
<!-- 							proident. Ad vegan excepteur butcher vice lomo.</p> -->

<!-- 						Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid -->
<!-- 						single-origin coffee nulla assumenda shoreditch et. -->
<!-- 					</div> -->
<!-- 				</div> -->

<!-- 				Video Widget -->
<!-- 				<h5 class="title-bg">Video Widget</h5> -->
<!-- 				<iframe src="http://player.vimeo.com/video/24496773" width="370" -->
<!-- 					height="208"></iframe> -->
			</div>

		</div>

	</div>
	<!-- End Container -->

	<!-- Footer Area
        ================================================== -->
	<%@include file="footer.jsp"%>

</body>
</html>