<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>자유글쓰기</title>
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
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.custom.js"></script>

<!-- For NaverEditor
================================================== -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<!-- 네이버 에디터 사용
================================================== -->
<script type="text/javascript" src="js/naverEditor.js"></script>

<!-- dataTables
================================================== -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<link href="//cdn.datatables.net/plug-ins/f2c75b7247b/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet" type="text/css">
  

<script>
    $(document).ready( function () {
    $('#Tables').DataTable({
		responsive: true,
		searching: true,
		bAutoWidth: true,
		bPaginate: true
    });
    } );
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
                            <table width="100%" class="table table-striped table-bordered table-hover" id="Tables">
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
                                			<td><a onclick="selectOneQna.do?no='${list.no}'">${list.title }</a></td>
                                			<td>${list.id }</td>
                                			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.writeDate }"/></td>
                                		</tr>
                                	</c:forEach>                                                             
                                </tbody>
                            </table>
                            <!-- /.table-responsive -->
                            <a href="location.href='writeBoardForm.do" class="btn btn-primary pull-right">글쓰기</a>                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
    </div>

    </div> <!-- End Container -->
	</div>
    <!-- Footer Area
        ================================================== -->
    <%@include file="footer.jsp"%>
    </div>

    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="//cdn.datatables.net/plug-ins/f2c75b7247b/integration/bootstrap/3/dataTables.bootstrap.js" ></script>
    
</body>
</html>