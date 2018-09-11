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
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>	
<script src="js/bootstrap.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/jquery.flexslider.js"></script>
<script src="js/jquery.custom.js"></script>
<script src="js/comment.js?ver=0.28"></script>
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

<script type="text/javascript">
/**
 * 초기 페이지 로딩시 댓글 불러오기
 */
 $(document).ready(function(){
if('${msg}'=='1'){alert("이미 신청한 강의입니다.\n강의내역을 확인해주세요."); }
if('${msg}'=='0'){alert("강의 신청이 완료됐습니다.\n강의내역을 확인해주세요."); }
 });

$(function(){
    getCommentList(0, 'lecture', $('#currentId').val());
});

</script>

</head>

<body>
<input type="hidden" id="currentId" value="${currentId }">
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
<!-- 모집 중일 때만 신청 버튼 생성 -->
     <c:if test="${lecture.state == 1 } &&  ${currentId != lecture.artistID  }"  > 
        <div id="modalButton">
        	<a href="#myModal" role="button" class="btn btn-inverse" data-toggle="modal">강의 신청</a>
        </div>
        <div class="modal hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-body">
            <table class="display" id="Tables">
            	<thead>
            		<tr>
            			<th style="background-color: #eeeeee; text-align: center;">강의를 신청하시겠습니까?</th>
            		</tr>
            	</thead>
            </table>
        </div>
        <div class="modal-footer">
       		<button class="btn btn-inverse" onclick="location.href='lectureAttend.do?no=${lecture.no}'">신청</button>
            <button class="btn" data-dismiss="modal" aria-hidden="true">취소</button>
        </div>
 		</div>   	
     </c:if>
<!--  신청 모달 사용 끗!!! -->

<!-- 글 작성자가 수정하기 위한 버튼 -->
     <c:if test="${currentId == lecture.guestID  }"  > 
       		<button class="btn btn-inverse" onclick="location.href='updateLectureForm.do?no=${lecture.no}'">수정</button>
     </c:if>
<!--  수정 모달 사용 끗!!! --> 

<!-- 글 작성자가 강의 삭제하기 위한 모달 -->
     <c:if test="${currentId == lecture.guestID  }"  > 
        <div id="modalDeleteButton">
        	<a href="#myModalDelete" role="button" class="btn btn-inverse" data-toggle="modal">삭제</a>
        </div>
        <div class="modal hide fade" id="myModalDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-body">
            <table class="display" id="Tables">
            	<thead>
            		<tr>
            			<th style="background-color: #eeeeee; text-align: center;">삭제하시겠습니까?</th>
            		</tr>
            	</thead>
            </table>
        </div>
        <div class="modal-footer">
       		<button class="btn btn-inverse" onclick="location.href='deleteLecture.do?no=${lecture.no}'">삭제</button>
            <button class="btn" data-dismiss="modal" aria-hidden="true">취소</button>
        </div>
 		</div>   	
     </c:if>
<!--  삭제 모달 사용 끗!!! -->      
</div>
</div>

	<br>
	<div class="span12">
       <h5 class="title-bg" style="padding-bottom: 12px;">Content</h5>
			 ${lecture.content }
    </div>
  
				<!-- comment Area
        ================================================== -->
				<section class="comments span12">
					<form id="commentForm" name="commentForm" method="post">
						<br>
						<br>
						<div>
							<div>
								<span><h5 class="title-bg">Comments</h5></span> <span id="cCnt"></span>
							</div>
							<div>
								<textarea style="width: 500px" rows="3" cols="30" id="comment"	name="comment" placeholder="댓글을 입력하세요"></textarea>
								<a onClick="fn_comment(0)" class="btn btn-sq-sm btn-success">등록</a>
							</div>
						</div>
						<input type="hidden" id="no" name="no" value="${lecture.no }" />
					</form>
					<div>
						<form id="commentListForm" name="commentListForm" method="post">
							<ul id="commentList">
							</ul>
						</form>
					</div>
				</section>
			</div><!-- End gallery-single-->
		</div><!-- End container row -->
	</div> <!-- End Container -->
<!--    Footer section -->
<%@include file="footer.jsp"%>

</body>

</html>