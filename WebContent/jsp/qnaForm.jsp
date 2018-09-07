<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>문의글 쓰기</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">



<!-- CSS
================================================== -->
<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
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
<link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">

<!-- JS
================================================== -->
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.custom.js"></script>

<!-- dataTables
================================================== -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"/>
<link href="//cdn.datatables.net/plug-ins/f2c75b7247b/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet" type="text/css">


<script>
//Korean
var lang_kor = {
    "decimal" : "",
    "emptyTable" : "데이터가 없습니다.",
    "info" : "_START_ - _END_ (총 _TOTAL_ 글)",
    "infoEmpty" : "0명",
    "infoFiltered" : "(전체 _MAX_ 명 중 검색결과)",
    "infoPostFix" : "",
    "thousands" : ",",
    "lengthMenu" : "_MENU_ 개씩 보기",
    "loadingRecords" : "로딩중...",
    "processing" : "처리중...",
    "search" : "검색 : ",
    "zeroRecords" : "검색된 데이터가 없습니다.",
    "paginate" : {
        "first" : "첫 페이지",
        "last" : "마지막 페이지",
        "next" : "다음",
        "previous" : "이전"
    },
    "aria" : {
        "sortAscending" : " :  오름차순 정렬",
        "sortDescending" : " :  내림차순 정렬"
    }
};


    $(function() {
    	$("#Tables").DataTable({
    		responsive: true,
    		searching: true,
    		bAutoWidth: true,
    		bPaginate: true,
            language : lang_kor //or lang_eng
    	});
    });
</script>

<script>
var init = {no : 0};


function checkPw() {
	
	$.ajax({
		type: "post",
		url: "searchQna.do",
		data: {"pw" : $('#pw').val(),
				"no" : init.no },
		success: function(data) {
			if(data==1) {
				location.href="selectOneQna.do?no=" + init.no;

			}
			else {
				alert("비밀번호가 다른걸요??!!!");
				$('#pw').val("");
			}
		}
	});
}

function saveValue(num) {
	init.no = num;
}

</script>

</head>

<body>
    <div class="color-bar-1"></div>
    <div class="color-bar-2 color-bg"></div>
    
    <div class="container main-container">
    
    <%@include file="header.jsp"%>
    
    <!-- Menu
    ================================================== --> 
    <div class="row"><!--Container row-->

        <!-- Page Left Sidebar
        ================================================== --> 
        <div class="span3 sidebar page-left-sidebar"><!-- Begin sidebar column -->

            <!--Navigation-->
            <h5 class="title-bg" style="margin-top: 0px;">게시판 목록</h5>
            <ul class="post-category-list">
                <li><a href="boardForm.do"><i class="icon-plus-sign"></i>자유게시판</a></li>
                <li><a href="qnaForm.do"><i class="icon-plus-sign"></i>문의게시판</a></li>                
            </ul>          
                

        </div><!-- End sidebar column -->

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
                    <div class="panel panel-default">
                        <h2 class="title-bg">문의게시판</h2>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	<table data-order='[[ 0, "desc" ]]' width="100%" class="table table-striped table-bordered table-hover" id="Tables">
                                <thead>
                                    <tr>
                                        <th style="background-color: #eeeeee; text-align: center;">글번호</th>
                                        <th style="background-color: #eeeeee; text-align: center;">제목</th>
                                        <th style="background-color: #eeeeee; text-align: center;">작성자</th>
                                        <th style="background-color: #eeeeee; text-align: center;">작성일</th>                                        
                                    </tr>
                                </thead>
                                <tbody> 
                                	<c:forEach var="list" items="${qnaList}">
                                		<tr>
                                			<td>${list.no }</td>
                                			<td><a href="#myModal" onclick='saveValue(${list.no})' data-toggle="modal">${list.title }</a></td>
                                			<td>${list.id }</td>
                                			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.writeDate }"/></td>
                                		</tr>
                                	</c:forEach>                                                             
                                </tbody>
                            </table>
                            <!-- /.table-responsive -->
                            <a href="writeQnaForm.do" class="btn btn-primary pull-right">글쓰기</a> 
                            
<!--                             모달 사용하기  -->
                            <div class="modal hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        						<div class="modal-header">
            						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            						<h5 id="myModalLabel"> 비밀번호를 입력해 주세요.</h5>
        						</div>
        					<div class="modal-body">
								<input id="pw" type="password"><a role="button" class="btn btn-inverse" onclick="checkPw()">확인</a>
       						 </div>
       						 <div class="modal-footer">
           						 <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
        					</div>
 							</div>   
<!--  							모달 사용 끗                         -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
    
    </div> <!-- End Container -->
	</div>
	</div>

    <!-- Footer Area
        ================================================== -->
    <%@include file="footer.jsp"%>
    	</div>

    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="//cdn.datatables.net/plug-ins/f2c75b7247b/integration/bootstrap/3/dataTables.bootstrap.js" ></script>
    
</body>
</html>