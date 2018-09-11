<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>아티스트 글 수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS
================================================== -->
<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-responsive.css">
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

<!-- For NaverEditor
================================================== --> 
<script src="resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="js/naverEditor.js"></script>

<!-- Thumbnail 
================================================== -->
<link rel="stylesheet" href="css/fileImage.css?ver=0.1">

<script type="text/javascript">

	$(document).ready(function (){
		
		$("#freeBoard").hide();
		
		$("#artSpan").click(function(){
			$("#artBoard").show();
			$("#freeBoard").hide();
			$("#artSell").show();
			$("#artOption").show();
			$("#isCheck").val("1");
		});
		
		$("#freeSpan").click(function(){
			$("#artBoard").hide();
			$("#freeBoard").show();
			$("#artSell").hide();
			$("#artOption").hide();
			$("#isCheck").val("0");
		});
	})
</script>

<script type="text/javascript">
	$(document).ready(function (){
		$("#priceDiv").hide();
		$("#countDiv").hide();
		
		$("#option1").click(function(){
			$("#priceDiv").show();
			$("#countDiv").show();
		});
		
		$("#option2").click(function(){
			$("#priceDiv").hide();
			$("#countDiv").hide();
		});
	})
</script>

<script type="text/javascript">
// 	function nullCheck() {
// 		if(writeArt.title.value == "") {
// 			alert("제목을 입력해주세요.");
// 			writeArt.title.focus();
// 			return false;
// 		}
// 		else if(writeArt.genre.value == "") {
// 			alert("장르를 선택해주세요.");
// 			writeArt.genre.focus();
// 			return false;
// 		}
// 		else if(writeArt.isCheck.value == "") {
// 			alert("판매여부를 선택해주세요.");
// 			writeArt.isCheck.focus();
// 			return false;
// 		}
// 		else if($("#option1").val() != "") {
// 			if(writeArt.totalCount.value == "" || writeArt.price.value == "") {
// 				alert("가격정보 및 개수 등록이 필요합니다.")
// 				return false;	
// 			}
// 		}
// 		else if(writeArt.content.value == "") {
// 			alert("작품 설명을 작성해주세요.");
// 			writeArt.content.focus();
// 			return false;
// 		}
// 		else if(writeArt.ufile.value == "") {
// 			alert("썸네일 등록이 필요합니다.");
// 			writeArt.ufile.focus();
// 			return false;
// 		}
// 		else return true;
// 	}
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
				<span class="alert alert-success" id="artSpan">작품 등록</span>
				<span class="alert alert-info" id="freeSpan">자유게시글</span>
			</div>
			
			<br><br>

			<div class="span8 contact">
				<!--Begin page form column-->
				<form action="writeArt.do" name="writeArt" id="contact-form" enctype=multipart/form-data method="post">


<!-- 					작품 등록 시작 부분 -->
					<div class="input-prepend" id="artBoard">
						<span class="add-on"><i class="icon-picture"></i></span> 
						<input class="span6" id="focusedInput" name="title" type="text" size="16" placeholder="작품명을 입력하세요." value="${art.title }">
					</div>

					<div class="input-prepend" id="artOption">
						<span class="add-on"><i class="icon-picture"></i></span> 
						<select	class="form-control; span6" id="genre" name="genre">
							<option ${art.genre == 'original' ? 'selected="selected"' : '' }>original</option>
                    		<option ${art.genre == 'painting' ? 'selected="selected"' : '' }>painting</option>
                     		<option ${art.genre == 'sculpture' ? 'selected="selected"' : '' }>sculpture</option>
						</select>
					</div>

					<div id="artSell" class="btn-group" data-toggle="buttons" style="text-align: center; margin: 0 auto;">
						<label class="btn btn-warning active"> 
						<input type="radio" value="1" name="sellCheck" id="option1" autocomplete="off"
						${art.sellCheck == '1' ? 'checked' : '' }>판매요청
						</label> 
						<label class="btn btn-inverse"> 
						<input type="radio" value="0" name="sellCheck" id="option2" autocomplete="off"
						${art.sellCheck == '0' ? 'checked' : '' }>판매거부
						</label>
					</div>
					
					<br>

					<div class="input-prepend" id="priceDiv">
						<span class="add-on"><i class="fab fa-monero"></i></span> 
						<input class="span6" id="focusedInput" type="text" size="16" 
						value="${art.price }" name="price" placeholder="판매가를 입력하세요.">
					</div>

					<div class="input-prepend" id="countDiv">
						<span class="add-on"><i class="fab fa-monero"></i></span> 
						<input class="span6" id="focusedInput" type="text" size="16" 
						value="${art.totalCount }" name="totalCount" placeholder="판매개수를 입력하세요.">
					</div>
<!-- 					작품 등록 부분 끝 -->

<!-- 					자유게시판 시작 부분 -->

					<div class="input-prepend" id="freeBoard">
						<span class="add-on"><i class="icon-picture"></i></span> 
						<input class="span6" id="focusedInput" name="title" type="text" size="16" placeholder="제목을 입력하세요.">
					</div>

<!-- 					자유게시판 부분 끝 -->


					<div class="input-prepend"  class="span8">
						<span class="add-on"><i class="icon-pencil"></i>작품내용</span><br>
						<textarea id="content" name="content" placeholder="작품내용을 입력하세요." style="width: 400px; height: 400px;">
						${art.content }</textarea>
					</div>
				

					<div class="row">
						<div class="span7">
						
						<!-- 썸네일 이미지 업로드 부분 -->
						<div class="filebox bs3-primary preview-image">
						<div id="originalThumb" 
						style="display: inline-block; width: 54px; padding: 2px; vertical-align: middle;
    					border: 1px solid #ddd; border-radius: 5px; background-color: #fff;">
						<img src="download.do?no=${art.no }" 
						style="display: block; max-width: 100%; width: 100%/9; height: auto;">
						</div>

                            <input class="upload-name" value="${art.file }" disabled="disabled" style="width: 200px;">
                            <label for="input_file">업로드</label> 
                          <input type="file" id="input_file" class="upload-hidden" name="ufile"> 
                        </div>
						<!-- ====================================================== -->

							<input type="button" class="btn btn-warning pull-right" value="취소">
							<input type="hidden" id="isCheck" name="isCheck" value="1">
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
<script src="js/fileImage.js?ver=0.4"></script>
</body>
</html>

