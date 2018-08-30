<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>아티스트 글쓰기</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS
================================================== -->
<link href='http://fonts.googleapis.com/css?family=Oswald'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-responsive.css">
<link rel="stylesheet" href="css/jquery.lightbox-0.5.css">
<link rel="stylesheet" href="css/custom-styles.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
	integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
	crossorigin="anonymous">

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

</head>

<body>
	<div class="color-bar-1"></div>
	<div class="color-bar-2 color-bg"></div>

	<div class="container main-container">

		<!--     Header section -->
        <%@include file="header.jsp" %>

		<!-- Page Content
    ================================================== -->
		<div class="row">
			<!--Container row-->

			<div class="span12">
				<h2 class="title-bg">작품올리기</h2>
			</div>

			<div class="span4 contact">
				<!--Begin page content column-->

				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
					Nulla iaculis mattis lorem, quis gravida nunc iaculis ac. Proin
					tristique tellus in est vulputate luctus fermentum ipsum molestie.
					Vivamus tincidunt sem eu magna varius elementum. Maecenas felis
					tellus, fermentum vitae laoreet vitae, volutpat et urna.</p>

				<div class="alert alert-success">Well done! You successfully
					read this important alert message.</div>
			</div>

			<div class="span8 contact">
				<!--Begin page form column-->
				<form action="writeArt.do" name="writeArt" id="contact-form" enctype=multipart/form-data method="post">

					<!--                      <div class="col-lg-12 col-lg-offset-1"> -->

					<div class="input-prepend">
						<span class="add-on"><i class="icon-picture"></i></span> <input
							class="span6" id="focusedInput" name="title" type="text" size="16" placeholder="작품명을 입력하세요.">
					</div>

					<div class="input-prepend">
						<span class="add-on"><i class="icon-picture"></i></span> 
						<select	class="form-control; span6" id="select">
							<option selected="">작품분류</option>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
						</select>
					</div>

					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-warning active"> <input type="radio" name="options" id="option1" autocomplete="off" checked>
							판매요청
						</label> 
						<label class="btn btn-inverse"> <input type="radio" name="options" id="option2" autocomplete="off"> 
							판매거부
						</label>
					</div>

					<br>

					<div class="input-prepend">
						<span class="add-on"><i class="fab fa-monero"></i></span> <input
							class="span6" id="focusedInput" type="text" size="16" name="price" placeholder="판매가를 입력하세요.">
					</div>

					<div class="input-prepend"  class="span7">
						<span class="add-on"><i class="icon-pencil"></i>작품내용</span><br>
						<textarea id="content" name="content" placeholder="작품내용을 입력하세요." style="width: 400px; height: 400px;">
						</textarea>
					</div>
				

					<div class="row">
						<div class="span7">
							<input type="button" class="btn btn-warning pull-right" value="취소">
							<input type="submit" id="savebutton" class="btn btn-success pull-right" value="전송">
						</div>					
					</div>
				</form>
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

