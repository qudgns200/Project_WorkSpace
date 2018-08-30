<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Header</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- header menu var -->
<header id="header" class="header">
    <div class="top-navigation full-w">
        <div class="inner-w clf">

            <nav class="menu">
                
                <a href="/w/login" class="nav-btn">로그인</a>
                <a href="/w/join" class="nav-btn">회원가입</a>

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
				<h5>WorkSpace</h5>
			</div>

			<!-- Main Navigation
        ================================================== -->
			<div class="span7 navigation">
				<div class="navbar hidden-phone">

					<ul class="nav">
						<li class="dropdown active"><a class="dropdown-toggle"
							data-toggle="dropdown" href="main.do">Home <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="main.do">Full Page</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="page-full-width.htm">Pages <b
								class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="artistMyPage.do">아티스트 개인 페이지</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="blog-style1.htm">Board <b
								class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="lectureForm.do">강의게시판</a></li>
								<li><a href="boardForm.do">자유게시판</a></li>
								<li><a href="qnaForm.do">문의게시판</a></li>
								<li><a href="blog-style2.htm">주문 내역 조회</a></li>
                    			<li><a href="blog-style3.htm">개인 정보 수정</a></li>
                    			<li><a href="blog-style4.htm">회원 탈퇴</a></li>
							</ul></li>
					</ul>
				</div>

				<!-- Mobile Nav
            ================================================== -->
				<form action="#" id="mobile-nav" class="visible-phone">
					<div class="mobile-nav-select">
						<select
							onchange="window.open(this.options[this.selectedIndex].value,'_top')">
							<option value="">Navigate...</option>
							<option value="main.do">Home</option>
							<option value="main.do">- Full Page</option>
							<option value="page-full-width.htm">Pages</option>
							<option value="artistMyPage.do">- 아티스트 개인 페이지</option>
							<option value="blog-style1.htm">Board</option>
							<option value="lectureForm.do">- 강의게시판</option>
						</select>
					</div>
				</form>

			</div>
		</div>
	<!-- End Header -->
</body>
</html>