<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>아티스트 글쓰기</title>
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

<!-- datePicker
================================================== -->
<!--  jQuery UI CSS파일  -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>  
<script type="text/javascript" src="js/datePicker.js"></script>
<!-- datepicker end ================================================== -->

</head>

<body>
    <div class="color-bar-1"></div>
    <div class="color-bar-2 color-bg"></div>
    
   <div class="container main-container">
    
    <%@include file="header.jsp" %>  
     
    <!-- Page Content
    ================================================== --> 
    <div class="row"><!--Container row-->
        
        <div class="span12">
				<h2 class="title-bg">강의 신청 페이지</h2>
			</div>
        
        <div class="span4 contact">
				<!--Begin page content column-->

				<p class="lead">개설을 원하는 하는 강의를 직접 신청하세요.</p>				
				<div class="alert alert-block">정확한 커리큘럼이 정해진 강의만 신청해주세요.</div>
        </div>

        <div class="span6 contact"><!--Begin page content column-->

<!-- 			강의관련 내용 입력 부분 -->
            <form action="addLecture.do" id="contact-form" enctype=multipart/form-data method="post">
               
                <div class="input-prepend">
				    <span class="add-on"><i class="icon-pencil"></i></span>
				    <input class="span6" id="prependedInput" name="title" type="text" size="16"
							placeholder="강의명을 입력하세요.">
				</div>
                  
                <div class="input-prepend">
				    <span class="add-on"><i class="icon-map-marker"></i></span>
				    <input class="span6" id="prependedInput" name="title" type="text" size="16"
							placeholder="강의장소를 입력하세요.">
				</div>                   
                
                <div class="input-prepend">
						<span class="add-on"><i class="icon-th-list"></i></span> 
						<select	class="form-control; span6" id="select" name="genre">
							<option selected="">장르를 선택하세요.</option>
                                <option value="Music">Music</option>
                                <option value="Picture">Picture</option>
                                <option value="Feature">Feature</option>
						</select>
				</div><br>
                
                <div class="input-prepend">
                    <div class="input-group date">
                        <span class="add-on"><i class="icon-calendar"></i></span>
                        <input type="text" class="form-control" id="datepicker1" name="startDate" placeholder="개강일 선택">
                        
                        <span class="add-on"><i class="icon-calendar"></i></span>
                        <input type="text" class="form-control" id="datepicker2" name="endDate" placeholder="종강일 선택">                         
                    </div>                    
                </div>                        
                                
                <div class="input-prepend">
                	<span class="add-on"><i class="icon-user"></i></span>
                    <input class="span6" id="prependedInput" name="maxPeople" size="16" type="text" placeholder="모집할 인원을 입력하세요.">
                </div>
                        
<!--                 file upload -->
<!--                 <div class="input-append"> -->
<!--                 <span class="add-on"><i class="icon-file"></i>파일업로드</span> -->
<!--                 </div> -->
<!--                 <div class="filebox preview-image">                                        -->
<!--                     <input class="upload-name" value="파일선택"  id="fileName"  name="fileName">  -->
<!--                     <label for="input-file" >업로드</label>  -->
<!--                     <input type="file" id="input-file" name="ufile" class="upload-hidden" onchange="javascript:document.getElementById('fileName').value = this.value">                     -->
<!--                 </div>                                                      -->
                
                <div class="input-prepend">
						<span class="add-on"><i class="icon-pencil"></i>작품내용</span><br>						
				</div>
                <textarea class="span7" type="text" id="content" name="content"	placeholder="작품내용을 입력하세요."></textarea>
                <div class="row">
						<div class="span7">
							<input type="button" class="btn btn-warning pull-right" value="취소">
							<input type="submit" id="savebutton" class="btn btn-success pull-right" value="전송">
						</div>					
					</div>
            </form>

        </div> <!--End page content column-->
        
    </div><!-- End container row -->
    
    </div> <!-- End Container -->

    <!-- 	Footer section -->
	<%@include file="footer.jsp" %>
	
	
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script> 
</body>

</html>
