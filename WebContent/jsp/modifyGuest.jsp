<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>일반회원 제재페이지</title>
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


    <!-- datepicker
================================================== -->
    <!-- // jQuery UI CSS파일  -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <!-- // jQuery 기본 js파일 -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <!-- // jQuery UI 라이브러리 js파일 -->
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    <script src="js/jquery.datepicker.js"></script>

</head>

<body>
    <div class="color-bar-1"></div>
    <div class="color-bar-2 color-bg"></div>

    <div class="container main-container">
        <!--     Header section -->
        <%@include file="header.jsp"%>



            <!-- Page Content
    ================================================== -->
            <div class="row">
                <!--Container row-->

                <div class="span12">
                    <h2 class="title-bg">게스트 상세정보 페이지</h2>
                </div>

                <div class="span3 sidebar page-left-sidebar">
                    <!-- Begin sidebar column -->

                    <!--Navigation-->

                    <ul class="post-category-list">
                        <li><a href="modifyGuest.jsp"><i class="icon-plus-sign"></i>일반회원 상세정보</a></li>
                        <li><a href="applyArtist.jsp"><i class="icon-plus-sign"></i>아티스트 상세정보</a></li>
                    </ul>
                    <br>
                    <div class="alert alert-block">제재할 일반회원 상세정보 페이지입니다.</div>

                </div>

                <div class="span4 contact">
                    <!--Begin page content column-->

                    <!--            강의관련 내용 입력 부분 -->
                    <div class="span8 container">
                        <form action="addLecture.do" id="contact-form">

                            <div class="input-prepend">
                                <span class="add-on"><i class="icon-pencil"></i></span>
                                <input class="span6" id="id" name="id" value="${member.id }" type="text" readonly="readonly" size="16">
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
                                <input class="span6" id="state" name="state" value="${member.state }" type="text" readonly="readonly" size="16">
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
                                <input class="span6" id="prependedInput" name="nickname" value="${member.nickname }" type="text" readonly="readonly" size="16">
                            </div>

                            <div class="row">
                                <div class="span7">
                                    <input type="button" class="btn btn-warning pull-right" value="목록으로"> 
                                    <input type="submit" class="btn btn-success pull-right" value="제재승인">
                                </div>
                            </div>
                        </form>
                    </div>

                </div>
                <!--End page content column-->

            </div>
            <!-- End container row -->

    </div>
    <!-- End Container -->

    <!-- Footer Area
        ================================================== -->
    <%@include file="footer.jsp"%>

</body>

</html>