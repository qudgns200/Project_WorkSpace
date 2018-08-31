<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

   <!-- CSS
================================================== -->
    <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap-responsive.css">
<!--     <link rel="stylesheet" href="css/jquery.lightbox-0.5.css"> -->
<link rel="stylesheet" href="css/flexslider.css" />
<link rel="stylesheet" href="css/custom-styles.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">

  

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
<script src="js/jquery.flexslider.js"></script>
<script src="js/jquery.custom.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$('.carousel').carousel({
	  	interval: 2000
	})
});
</script>

</head>

<body>
	<div class="color-bar-1"></div>
    <div class="color-bar-2 color-bg"></div>

    <div class="container main-container">
    
        <!--     Header section -->
        <%@include file="header.jsp" %>
        
        <!-- Page Content
    ================================================== -->
        <section class="login-block">
            <div class="container-fluid">
                <div class="row-fluid">
                    <div class="span4">
                        <h2 class="text-center">Login Now</h2>
                        <form class="login-form" action="login.do" method="post">
                            <div class="form-group">
                                <label for="ID" class="text-uppercase">아이디</label>
                                <input type="text" name="id" class="form-control" style="height: 30px;" placeholder="아이디를 입력하세요.">

                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1" class="text-uppercase">비밀번호</label>
                                <input type="password" name="pw" class="form-control" style="height: 30px;" placeholder="비밀번호를 입력하세요.">
                            </div>


                            <div class="form-check">
                                <label class="form-check-label">
                                  <input type="checkbox" class="form-check-input">
                                  <small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Remember Me</small>
                                </label>
                                <button type="reset" class="btn btn-inverse float-right">취소</button>
                                <button type="submit" class="btn btn-login float-right">로그인</button>
                            </div>

                        </form>
                    </div>
                        <div id="carouselExampleIndicators" class="carousel slide container span8">
                        	
                            <div class="carousel-inner" >
                                <div class="item active">
                                    <img class="d-block img-fluid" src="https://images.pexels.com/photos/33972/pexels-photo.jpg" alt="First slide">
                                    <div class="carousel-caption d-none d-md-block">
                                        <div class="banner-text">
                                            <h2>This is WorkSpace</h2>
                                            <p>아티스트들의 소통 공간이 됩니다.</p>
                                        </div>
                                    </div>
								</div>

                                <div class="item">
                                    <img class="d-block img-fluid" src="https://images.pexels.com/photos/7097/people-coffee-tea-meeting.jpg" alt="Second slide">
                                    <div class="carousel-caption d-none d-md-block">
                                        <div class="banner-text">
                                            <h2>This is Web Gellary</h2>
                                            <p>웹에서 쉽게 다가갈 수 있는 갤러리입니다.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="item">
                                    <img class="d-block img-fluid" src="https://images.pexels.com/photos/872957/pexels-photo-872957.jpeg" alt="Third slide">
                                    <div class="carousel-caption d-none d-md-block">
                                        <div class="banner-text">
                                            <h2>This is Heaven</h2>
                                            <p>아티스트와 일반 회원 모두가 행복한 웹갤러리가 됩니다.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>
                    <!--  slide show end -->
                </div>
<!-- 				container end -->
            </div>
        </section>
        </div>
        <!-- End Container -->
               <!-- Footer Area
        ================================================== -->
    <%@include file="footer.jsp"%>

</body>
</html>