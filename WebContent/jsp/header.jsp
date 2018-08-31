<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<style type="text/css">
[data-tooltip-text]:hover {
	position: relative;
}
[data-tooltip-text]:hover:after {
 	background-color: #000000; 
 	background-color: rgba(0, 0, 0, 0.8); 
 	-webkit-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4); 
 	-moz-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4); 
 	box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4); 
 	-webkit-border-radius: 10px; 
 	-moz-border-radius: 10px; 
 	border-radius: 10px; 

 	color: #FFFFFF; 
 	font-size: 12px; 
	content: attr(data-tooltip-text);

 	margin-bottom: 10px;
	top: 90%;
	left: 20px;    
	padding: 7px 12px; 
	position: absolute;
	width: auto;
	min-width: 20px;
	max-width: 300px;
	word-wrap: break-word;
	z-index: 9999;
}
</style>

<!-- JS -->

<script type="text/javascript">
$(document).ready(function(){
	alarmCount();
	$('#alarm').click(function(){
		selectAlarm();
		$('#alarmList').removeAttr('data-tooltip-text');
	});
	$('#alarm').mouseleave(function(){
		$('#alarmData').remove();
		$('#alarmList').attr('data-tooltip-text','알림');
	});

});

var selectAlarm = function(){
	$.ajax({
		type: "get",
		url: "selectAlarm.do",
		dataType: "json",
		success: function(data){
			$('#alarmData').remove();
			var str = '<ul class="dropdown-menu" id="alarmData" style="height:330px; width:250px">'+
			'<div><h6 style="text-align:center; color:yellow">새로운 알림</h6></div>';
			$.each(data.alarmList, function(index, alarmList){
				var msg = '';
				if(alarmList.type=="writeArt"){msg='작품을 등록했습니다.';}
				
				if(index < 6){
				str += '<li><a>' + alarmList.to + '님이 ' + msg + 
				'&emsp;&emsp; <button onclick="updateAlarm('+ alarmList.no + ')" id="updateAlarm">check</button></a></li>';
				}
				else return false;
			}) // each의 끝
			str += '<div><a style="text-align:center; color:white" href="alarmPage.do">더 보기</a></div>'+'</ul>';
			$('#alarmList').append(str);
		}	// success의 끝
	}) // ajax의 끝
} //selectAlarm 함수의 끝 

var alarmCount = function(){
	$.ajax({
		type: "get",
		url: "alarmCount.do",
		dataType: "json",
		success: function(data){
			$('#alarmCount').html(data.alarmCount);
		} // success의 끝
	}) // ajax의 끝
} //alarmCount 함수의 끝

var updateAlarm = function(no){
	$.ajax({
		type: "get",
		url: "updateAlarm.do",
		data: {"no": no },
		success: function(){
			alarmCount();
			selectAlarm();
		} //success의 끝
	}) //ajax의 끝
}	//updateAlarm 함수의 끝

</script>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- header menu var -->
<header id="header" class="header">
    <div class="top-navigation full-w">
        <div class="inner-w clf">

            <nav class="menu">
                <c:if test="${id == null }">
                	<a href="loginForm.do" class="before">로그인</a>
                	<a href="joinForm.do" class="before">회원가입</a>
           		</c:if>
           		<c:if test="${id != null }">
                	<a href="logout.do" class="after">로그아웃</a>
                	<a href="myPage.do" class="after">마이페이지</a>
            	</c:if>

<!--                 <div class="nav-btn ui-dropdown"> -->
<!--                     <button type="button" class="btn-dropdown">고객센터</button> -->
<!--                     <ul class="menu-dropdown"> -->
<!--                         <li><a href="/w/board/notice">공지사항</a></li> -->
<!--                         <li><a href="/w/board/faq">자주 묻는 질문</a></li> -->
<!--                         <li><a href="mailto:support@idus.me">메일로 문의</a></li> -->
<!--                     </ul> -->
<!--                 </div> -->
            </nav>
        </div>
    </div>
</header>
</head>
<body>
		<div class="row header">
			<!-- Begin Header -->

			<!-- Logo
        ================================================== -->
			<div class="span5 logo">
				<a href="main.do"><img src="img/workspace-logo.png" alt="" /></a>
				<h5>ARTIST WEB GALLERY</h5>
			</div>

			<!-- Main Navigation
        ================================================== -->
			<div class="span7 navigation">
				<div class="navbar hidden-phone">

					<ul class="nav">
						<li class="dropdown active">
							<a class="dropdown-toggle" href="#" onclick="location.href='main.do'">Home</a>
						</li>
						<li class="dropdown">
			                <a class="dropdown-toggle" href="#" onclick="location.href='artistForm.do'">Artist</a>
			            </li>
						<li class="dropdown">
			                <a class="dropdown-toggle" href="#" onclick="location.href='artForm.do'">Art</a>
			            </li>
						<li class="dropdown">
			                <a class="dropdown-toggle" href="#" onclick="location.href='lectureForm.do'">Lecture</a>
			            </li>
		                <li><a href="#">Feed</a></li>
			 
			            <li class="dropdown">
			              <a class="dropdown-toggle" data-toggle="dropdown" href="#">Board <b class="caret"></b></a>
			                <ul class="dropdown-menu">
			                    <li><a href="boardForm.do">자유게시판</a></li>
			                    <li><a href="qnaForm.do">문의게시판</a></li>			                    
			                </ul>
			            </li>
			            <li class="dropdown">
			                <a class="dropdown-toggle" data-toggle="dropdown" href="#" onclick="location.href='myPage.do'">
			                MyPage <b class="caret"></b></a>
			                <ul class="dropdown-menu">
			                    <li><a href="myLectureFormA0.do">강의 내역 조회</a></li>
			               		<li><a href="mySellFormA0.do">주문 내역 조회</a></li>
			                    <li><a href="#">개인 정보 수정</a></li>
			                    <li><a href="#">회원 탈퇴</a></li>
			                </ul>
			            </li>	
						<li class="dropdown" id="alarm">
						<a href="#" data-tooltip-text="알림" id="alarmList" style="font-weight: bold">알림 
						<span id="alarmCount" style="color:Fuchsia; font-weight: bold">0</span> 개</a>
						</li>
				   </ul>
			 </div>
			
				<!-- Mobile Nav  ================================================== -->
				<form action="#" id="mobile-nav" class="visible-phone">
					<div class="mobile-nav-select">					
					<select onchange="window.open(this.options[this.selectedIndex].value,'_top')">
	                    <option value="">Navigate...</option>
	                    <option value="main.do">Home</option>
	                    <option value="main.do">- Main Page</option>
	                    <option value="artistForm.do">Artist</option>	                        	                        
	                    <option value="artistMyPage.do">- 아티스트 개인 페이지</option>
	                    <option value="artForm.do">Art</option>
	                    <option value="lectureForm.do">Lecture</option>
                        <option value="addLectureForm.do">- 강의 신청 페이지</option>
	                    <option value="boardForm.do">Board</option>
                        <option value="boardForm.do">- 자유게시판</option>
                        <option value="qnaForm.do">- 문의게시판</option>
	                    <option value="features.htm">Feed</option>
	                    <option value="myLectureFormG.jsp">MyPage</option>
	                    <option value="myLectureFormG.jsp">- 강의 내역 조회</option>
	                    <option value="mySellFormA0.do">- 주문 내역 조회</option>
	                    <option value="updateMemberForm.do">- 개인 정보 수정</option>
	                    <option value="blog-style4.htm">- 회원 탈퇴</option>
	                </select>
					</div>
				</form>

			</div>
		</div>
	<!-- End Header -->
</body>
</html>