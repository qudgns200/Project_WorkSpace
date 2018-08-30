<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>문의사항 게시판</title>
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

</head>

<body>
    <div class="color-bar-1"></div>
    <div class="color-bar-2 color-bg"></div>
    
    <div class="container main-container">
    
    <%@include file="header.jsp"%>  
    <!-- Page Content
    ================================================== --> 
    <div class="row">
			<!--Container row-->

			<div class="span12">
				<h2 class="title-bg">문의글 쓰기</h2>
			</div>

			<div class="span4 contact">
				<!--Begin page content column-->

				<p>자유롭게 글쓰세요.</p>

				<div class="alert alert-success">Well done! You successfully
					read this important alert message.</div>
			</div>

			<div class="span4 contact">
				<!--Begin page form column-->
				<form action="writeQna.do" id="contact-form" enctype=multipart/form-data method="post">
			
					<div class="input-prepend">
						<span class="add-on"><i class="icon-picture"></i></span> <input
							class="span6" id="focusedInput" name="title" type="text" size="16"
							placeholder="글 제목을 입력하세요." >
					</div>

		
				 <!--file upload-->
<!-- 	            <section> -->
<!-- 	                <div class="input-append"> -->
<!-- 	                    	<span class="add-on"><i class="icon-facetime-video"></i></span> -->
<!-- 	                        <input class="span6" id="appendedInputButton" name="ufile" size="16" type="file" placeholder="업로드할 사진 및 동영상을 선택하세요."> -->
<!-- <!-- 								<button class="btn" type="button"> --> -->
<!-- <!-- 									<i class="icon-search"></i> --> -->
<!-- <!-- 								</button> --> -->
<!-- 	                </div> -->
<!-- 	            </section> -->
								
				<div class="input-prepend">
						<span class="add-on"><i class="icon-pencil"></i>작품내용</span><br>
							<textarea class="span8" type="text" id="writeArt-form" name="content"
								placeholder="작품내용을 입력하세요."></textarea>
					</div>
					
				<div class="input-prepend">
						<span class="add-on"><i class="icon-picture"></i></span> <input
							class="span6" id="focusedInput" name="pw" type="password" size="16"
							placeholder="비밀번호 입력" >
					</div>	
				
				<div class="row">
					<div class="span8">
						<input type="button" class="btn btn-warning pull-right" value="취소">
						<input type="submit" id="savebutton" class="btn btn-success pull-right" value="전송">
					</div>					
				</div>
			</form>
		</div> <!--End page content column-->
        
    </div><!-- End container row -->
    
    </div> <!-- End Container -->

    <!-- Footer Area
        ================================================== -->
    <%@include file="footer.jsp"%>
    
    
</body>
</html>
