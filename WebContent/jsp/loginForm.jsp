<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
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
<script src="http://code.jquery.com/jquery-latest.js" type="text/javascript"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.custom.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container main-container">
		<div class="span5 logo">
			<a href="main.do"> <img src="img/piccolo-logo.png" alt></a>
		</div>
		
		<div class="span3 sidebar page-right-sidebar" id="guestDetail">
			<h5 class="title-bg" style="margin-top: 0px;">로그인</h5>
			<form action="login.do" method="post">
			<div class="input-prepend">
				<span class="add-on"> <i class="icon-user"></i>
				</span> <input class="id" name="id" size="16" type="text"
					placeholder="ID">
			</div>
			<div class="input-prepend">
				<span class="add-on"> <i class="icon-lock"></i>
				</span> <input class="pw" name="pw" size="16" type="password"
					placeholder="Password">
			</div>
			<input class="btn btn-small btn-inverse" type="submit" value="로그인">
			<input class="btn btn-small btn-inverse" type="reset" value="취소">
			</form>
		</div>
	</div>
</body>
</html>