<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아티스트 상세정보 페이지</title>
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
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery.custom.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#approve").click(function() {
		$.ajax({
			type : 'get',
			url : 'updateApproveArtist.do',
			data : {'id' : $('#artistID').val()},
			dataType : 'json',
			success : function(data) {
				if(data.result) {
					self.close();
					
					$(opener.document).find("#artistTbody tr").eq($("#index").val()).remove();
				}
			},
			error : function(xhr, status, error) {
				alert("승인 오류");
			}
		});
	});
	$("#refuse").click(function() {
		$.ajax({
			type : 'get',
			url : 'updateRefuseArtist.do',
			data : {'id' : $('#artistID').val()},
			dataType : 'json',
			success : function(data) {
				if(data.result) {
					self.close();
					
					$(opener.document).find("#artistTbody tr").eq($("#index").val()).remove();
				}
			},
			error : function(xhr, status, error) {
				alert("승인 오류");
			}
		});
	});
});
</script>
</head>
<body>

<div class="color-bar-1"></div>
    <div class="color-bar-2 color-bg"></div>

    <div class="container main-container">

        <!-- 	header section -->
        <%@include file="header.jsp"%>


            <!-- Page Content
    ================================================== -->
            <div class="row">
                <!--Container row-->

                <div class="span12">
                    <h2 class="title-bg">아티스트 상세정보 페이지</h2>
                </div>

                <div class="span3 sidebar page-left-sidebar">
                    <!-- Begin sidebar column -->

                    <!--Navigation-->

                    <ul class="post-category-list">                        
                        <li><a href="applyArtist.jsp"><i class="icon-plus-sign"></i>아티스트 상세정보</a></li>
                    </ul>
                    <br>
                    <div class="alert alert-block">아티스트 상세정보 페이지입니다.</div>

                </div>

                <div class="span4 contact">
                    <!--Begin page content column-->

                    <!-- 			강의관련 내용 입력 부분 -->
                    <div class="span8 container">
                            <div class="input-prepend">
                                <span class="add-on"><i class="icon-pencil"></i></span>
                                <input class="span6" id="artistID" name="id" value="${member.id }" type="text" readonly="readonly" size="16">
                            </div>

                            <div class="input-prepend">
                                <span class="add-on"><i class="icon-pencil"></i></span>
                                <input class="span6" id="name" name="name" value="${member.name }" type="text" readonly="readonly" size="16">
                            </div>

                            <div class="input-prepend">
                                <span class="add-on"><i class="icon-signal"></i></span>
                                <input class="span6" id="phone" name="phone" value="${member.phone }" type="text" readonly="readonly" size="16">
                            </div>

                            <div class="input-prepend">
                                <span class="add-on"><i class="icon-home"></i></span> 
                                <input class="span6" id="state" name="state" value="${member.state }" type="text" readonly="readonly" size="16" >
                            </div>

                            <div class="input-prepend">
                                <span class="add-on"><i class="icon-envelope"></i></span> 
                                <input class="span6" id="email" name="email" value="${member.email }" type="email" readonly="readonly" size="16"> 
                            </div>

                            <div class="input-prepend">
                                <div class="input-group date">
                                    <span class="add-on"><i class="icon-calendar"></i></span> 
                                    <input class="span6" id="birth" name="birth" value="${member.birth }" type="text" readonly="readonly" size="16">
                                </div>
                            </div>

                            <div class="input-prepend">
                                <span class="add-on"><i class="icon-user"></i></span> 
                                <input class="span6" id="prependedInput" name="nickname" value="${member.nickname }" type="text" readonly="readonly" size="16" >
                            </div>

                            <div class="input-append">
                                <span class="add-on"><i class="icon-upload"></i>포트폴리오</span>
                            </div>
                            <div class="filebox preview-image">
								<span><a href="download.do?id=${member.id }">${member.file }</a></span>
                            </div>
                            <br>
                           
                            <div class="input-prepend">
                                <span class="add-on"><i class=" icon-edit"></i>소개글</span><br>
                            </div>
                            <textarea class="span7" id="content" name="${member.content }" type="text" readonly="readonly"></textarea>
                            <div class="row">
                                <div class="span7">
                                    <input type="button" id="refuse" class="btn btn-warning pull-right" value="아티스트 거절"> 
                                    <input type="button" id="approve" class="btn btn-success pull-right" value="아티스트 승인">
                                </div>
                            </div>
                    </div>
                    <!--End page content column-->
                </div>
                <!-- End container row -->
			</div>
            </div>
            <!-- End Container -->

            <!-- 	Footer section -->
            <%@include file="footer.jsp"%>
			<input type="hidden" id="index" value="${index }">
</body>
</html>