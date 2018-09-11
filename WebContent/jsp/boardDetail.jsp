<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>자유글쓰기</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS
================================================== -->
<link href='http://fonts.googleapis.com/css?family=Oswald'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-responsive.css">
<!-- <link rel="stylesheet" href="css/jquery.lightbox-0.5.css"> -->
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
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.custom.js"></script>

<script src="js/comment.js?ver=0.30"></script>
<script type="text/javascript">
/**
 * 초기 페이지 로딩시 댓글 불러오기
 */
$(function(){
    getCommentList(0, 'board', $('#currentId').val());
});
</script>


<!-- 모달 사용하기 -->
<!-- 1. 수정일 때 modalCheck 값 1 -->
<!-- 2. 삭제일 때 modalCheck 값 2 -->
<script>
$(document).ready(function(){
	
	var modalHeader="";
	var modalBody="";
	var modalButton="";
	
	if($("#currentId").val()=='${board.id }' || $("#currentId").val()=='admin') {
		 $("#modifyBoard").show();
		 $("#deleteBoard").show();
	} else {
		 $("#modifyBoard").hide();
		 $("#deleteBoard").hide();
	}
    
    $("#deleteBoard").click(function(){
    	$("#modalHeader").text("삭제 여부 확인");
    	$("#modalBody").text("삭제하시겠습니까?");
    	$("#modalButton").text("삭제");
        $("#myModal").modal();
    });
});
</script>

</head>

<body>
<input type="hidden" id="currentId" value="${currentId }">
	<div class="color-bar-1"></div>
	<div class="color-bar-2 color-bg"></div>

	<div class="container main-container">

		<%@include file="header.jsp"%>

		<!-- Menu
    ================================================== -->
		<div class="row">
			<!--Container row-->

			<!-- Page Left Sidebar
        ================================================== -->
			<div class="span3 sidebar page-left-sidebar">
				<!-- Begin sidebar column -->

				<!--Navigation-->
				<h5 class="title-bg" style="margin-top: 0px;">게시판 목록</h5>
				<ul class="post-category-list">
					<li><a href="boardForm.do"><i class="icon-plus-sign"></i>자유게시판</a></li>
					<li><a href="qnaForm.do"><i class="icon-plus-sign"></i>문의게시판</a></li>
				</ul>


			</div>
			<!-- End sidebar column -->

			<!-- Page Content
        ================================================== -->
			<div class="row">
				<!--Container row-->

				<!-- Page Content
        ================================================== -->
				<div class="row">
					<!--Container row-->

					<!-- /.row -->
					<div class="row">
						<div class="span9">
							<div>
								<h5 class="title-bg">${board.title }</h5>
							</div>
							<ul class="project-info">
								<li><h6>${board.id }</h6> <h6><fmt:formatDate pattern="yyyy-MM-dd" value="${board.writeDate }"/></h6>
								<h6><a id="modifyBoard">수정</a></h6>
								<h6><a id="deleteBoard">삭제</a></h6></li>
							</ul>
							<br>
							<p class="lead">
								${board.content }
							</p>
							
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
       						 	 <button type="button" id="modalButton" class="btn btn-default" onclick="location.href='deleteBoard.do?no=${board.no}'"></button>
         						 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
       						 </div>
      						 </div>
      
    						 </div>
  							 </div>
  						<!--  모달 종료 -->
  						
  						
		<!-- comment Area
        ================================================== -->
				<section class="comments">
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
						<input type="hidden" id="no" name="no" value="${board.no }" />
					</form>
					<div>
						<form id="commentListForm" name="commentListForm" method="post">
							<ul id="commentList">
							</ul>
						</form>
					</div>
				</section>
				</div>

				<!-- /.col-lg-9 -->
				</div>
			</div>
		</div>
		</div>
		<!-- /.row -->
	</div>
<!-- End Container -->

		<!-- Footer Area
        ================================================== -->
		<%@include file="footer.jsp"%>

</body>
</html>