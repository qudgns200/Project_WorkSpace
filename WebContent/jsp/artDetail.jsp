<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>​
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>art 상세 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS
================================================== -->
<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/bootstrap.css?ver=0.1">
<link rel="stylesheet" href="css/bootstrap-responsive.css">
<link rel="stylesheet" href="css/custom-styles.css">


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
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.custom.js"></script>
<script src="js/comment.js?ver=0.6"></script>

<script type="text/javascript">
/**
 * 초기 페이지 로딩시 댓글 불러오기
 */
$(function(){
	
	if('${deleteText}'==1)
		alert("결제 중인 정보가 있습니다. 삭제가 불가합니다.");
	
    getCommentList(0, 'art', $('#currentId').val());	
    
    if($('#sellCheck').val()==0 || $('#isCheck').val()==0 || '${art.totalCount }'==0 || $('#sameId').val()==1)
    	$('#paySpace').hide();
    else $('#paySpace').show();
    

<!-- 모달 사용하기 -->
<!-- 1. 수정일 때 modalCheck 값 1 -->
<!-- 2. 삭제일 때 modalCheck 값 2 -->
    
	if($('#sameId').val()==1) {
		 $("#deleteArt").show();
	}
	else {
		$("#deleteArt").hide();
	}
    $("#deleteArt").click(function(){
    	$("#modalHeader").text("삭제 여부 확인");
    	$("#modalBody").text("삭제하시겠습니까?");
    	$("#modalButton").text("삭제");
        $("#myModal").modal();
    });

});
</script>

<script type="text/javascript">
function moveUrl(num) {
	var payMethod = $("input[name=payMethod]:checked").val();
	
	location.href="lecturePayForm.do?no=" + num + "&payMethod=" + payMethod;
}
</script>

</head>

<body>
<input type="hidden" id="sameId" value="${sameId }">
<input type="hidden" id="currentId" value="${currentId }">
<input type="hidden" id="id" value="${art.id }">
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
		<div class="span12 blog">

		<form id="form" action="artPayForm.do" method = "post">
            <div class="row">
                <div class="span6">
				<img src="download.do?no=${art.no }">
                </div>
                <div class="span6">
                    <h2>${art.title }</h2> 		<!-- 작품 제목 출력  -->
                    <p class="lead"></p>
												<!-- 작품 정보 출력 -->
                    <ul class="project-info">
                        <li><h6>Date :</h6> <fmt:formatDate pattern="yyyy-MM-dd" value="${art.artDate}"/></li>
                        <li><h6>Price :</h6> ${art.price }</li>
                        <li><h6>Artist :</h6> ${art.id }</li>
                        <li><h6>Genre :</h6> ${art.genre }</li>
                    </ul>

                    <c:if test="${likesCheck.isEmpty() }">
                       <a class="btn" onclick="location.href='insertLikes.do?no=${art.no}&isCheck=0'">좋아요</a>
                    </c:if>
                    <c:forEach var="list" items="${likesCheck }" varStatus="status">
                    	<c:if test="${count != 1 }">
                   			<c:set var="count" value="0"></c:set>
                    	</c:if>
                    	<c:if test="${list.no == art.no }">
                    		<a class="btn" onclick="location.href='deleteLikes.do?no=${art.no}&isCheck=0'">좋아요 취소</a>
                    		<c:set var="count" value="1"></c:set>
                    	</c:if>
                    	<c:if test="${status.last }">
                    		<c:if test="${count == 0 }">
                    			<a class="btn" onclick="location.href='insertLikes.do?no=${art.no}&isCheck=0'">좋아요</a>
                    		</c:if>
                    	</c:if>
                    </c:forEach>


                    <c:if test="${art.id == id }">
                    <a class="btn" href="updateArtForm.do?no=${art.no }">수정</a>
                    </c:if>
                    

                    <a class="btn" id='deleteArt'>삭제</a>
                    	<!-- Modal -->
  							<div class="modal fade" id="myModal" role="dialog">
    						<div class="modal-dialog">
     					<!-- Modal content-->
      						<div class="modal-content">
        					<div class="modal-header">
         					 <button type="button" class="close" data-dismiss="modal">×</button>
         					 <h4 class="modal-title" id="modalHeader"></h4>
        						</div>
        						<div class="modal-body">
         						 <p id="modalBody"></p>
        						</div>
       						 <div class="modal-footer">
       						 	 <button type="button" id="modalButton" class="btn btn-default" onclick="location.href='deleteArt.do?no=${art.no}'"></button>
         						 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
       						 </div>
      						 </div>
      
    						 </div>
  							 </div>
  						<!--  모달 종료 -->
                    
					<!--  컨트롤러에서 받아 온 값을 결제 폼 페이지로 넘겨 주기 위한 히든 타입 태그 -->
					<input type="hidden" name="no" value="${art.no }">
					<input type="hidden" name="artDate" value=<fmt:formatDate pattern="yyyy-MM-dd" value="${art.artDate}"/>>
					<input type="hidden" name="price" value="${art.price }">
					<input type="hidden" name="id" value="${art.id }">
					<input type="hidden" name="genre" value="${art.genre }">
					<input type="hidden" name="title" value="${art.title }">
					<input type="hidden" name="sellCheck" value="${art.sellCheck }">
					<input type="hidden" name="isCheck" value="${art.isCheck }">	
					<!--결제 방법 선택 -->
					<div id='paySpace'>
						<h6>남은 수량 :  ${art.totalCount }</h6>
						<input type="radio" name="payMethod" value="1">카드결제
						<input type="radio" name="payMethod" value="2">카카오페이
                    	<input type="submit" id="deliveryValues" class="btn" value="결제하기">
                    </div>
                </div>
            </div>

	</form>
		<br>
		<div class="span12">
      	 <h5 class="title-bg" style="padding-bottom: 12px;">Content</h5>
				 ${art.content }
    	</div>
	<br>
  
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
						<input type="hidden" id="no" name="no" value="${art.no }" />
					</form>
					<div>
						<form id="commentListForm" name="commentListForm" method="post">
							<ul id="commentList">
							</ul>
						</form>
					</div>
				</section>

			</div>
			<!-- End gallery-single-->
		</div>
		<!-- End container row -->
	</div>
	<!-- End Container -->
	<!-- Footer Area
        ================================================== -->
	<%@include file="footer.jsp"%>

</body>
</html>
