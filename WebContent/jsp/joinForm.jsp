<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
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
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/datePicker.js"></script>

<script type="text/javascript">
$(document).ready(function() {
// 	if($('.guestAddr').val() == '' && $('.artistAddr').val() == '') {
		$('#guestDetail').hide();
		$('#artistDetail').hide();
// 	} 
// 	else if($('.guestAddr').val() != '') {
// 		$('#artistDetail').hide();
// 		$('#guestForm'.find('.id').val($(winOpen.document).find('#id').val()));
// 	} else if($('.artistAddr').val() != '') {
// 		$('#guestDetail').hide();
// 	}
	$('#guest').click(function() { // 사용자 회원가입 폼
		$('#guestDetail').show();
		$('#artistDetail').hide();
		$('.id').val('');
		$('.idCheck').html('중복결과여부');
		$('.nickname').val('');
		$('.nicknameCheck').html('중복결과여부');
	});
	$('#artist').click(function() { // 아티스트 회원가입 폼
		$('#guestDetail').hide();
		$('#artistDetail').show();
		$('.id').val('');
		$('.idCheck').html('중복결과여부');
		$('.nickname').val('');
		$('.nicknameCheck').html('중복결과여부');
	});
	
	$('.id').blur(function() { // ID 중복검사
		$.ajax({
			type : 'get',
			url : 'check.do',
			data : {'id' : $(this).val()},
			dataType : 'json',
			success : function(data) {
				if(data.idCheck) {
					$('.idCheck').html('사용할 수 있는 아이디입니다.');
				} else {
					$('.idCheck').html('사용할 수 없는 아이디입니다.');
				}
			},
			error : function(status, error) {
				alert(status);
				alert(error);
				alert('아이디 : 잘못된 접근입니다.');
			}
		});
	});
	$('.pw').blur(function() {
		
	});
// 	$('#name').blur(function() {
		
// 	});
// 	$('#phone').blur(function() {
		
// 	});
// 	$('#addr').blur(function() {
		
// 	});
// 	$('#email').blur(function() {
		
// 	});
	$('.nickname').blur(function() {
		$.ajax({
			type : 'get',
			url : 'check.do',
			data : {'nickname' : $(this).val()},
			dataType : 'json',
			success : function(data) {
				if(data.nicknameCheck) {
					$('.nicknameCheck').html('사용할 수 있는 닉네임입니다.');
				} else {
					$('.nicknameCheck').html('사용할 수 없는 닉네임입니다.');
				}
			},
			error : function(status, error) {
				alert(status);
				alert(error);
				alert('닉네임 : 잘못된 접근입니다.');
			}
		});
	});
// 	$('#birth').blur(function() {
		
// 	});
	$('#guestBtn').click(function() {
		var width=800, height=500;
		var left = (screen.availWidth - width)/2;
		var top = (screen.availHeight - height)/2;
		var specs = "width=" + width;
		specs += ",height=" + height;
		specs += ",left=" + left;
		specs += ",top=" + top;
		
		window.open("address.do?num=1", "팝업", specs);
	});
	$('#artistBtn').click(function() {
		var width=800, height=500;
		var left = (screen.availWidth - width)/2;
		var top = (screen.availHeight - height)/2;
		var specs = "width=" + width;
		specs += ",height=" + height;
		specs += ",left=" + left;
		specs += ",top=" + top;

		window.open("address.do?num=2", "팝업", specs);
	});
});
</script>

</head>
<body>

	<div class="container main-container">
		<div class="span5 logo">
			<a href="main.do"> <img src="img/piccolo-logo.png" alt></a><br>
			<h5 class="title-bg" id="guest" style="margin-top: 0px;">사용자 회원가입</h5><br>
			<h5 class="title-bg" id="artist" style="margin-top: 0px;">아티스트 회원가입</h5>
		</div>
		
		<div class="span3 sidebar page-right-sidebar" id="guestDetail">
			<h5 class="title-bg" style="margin-top: 0px;">사용자 회원가입</h5>
			<form action="join.do" method="post" id="guestForm">
			<div class="input-prepend">
				<span class="add-on"> <i class="icon-user"></i>
				</span> <input class="id" name="id" size="16" type="text" placeholder="ID">
			</div>
			<span class="idCheck">중복결과여부</span>
			<div class="input-prepend">
				<span class="add-on"> <i class="icon-lock"></i>
				</span> <input class="pw" name="pw" size="16" type="password" placeholder="Password">
			</div>
			<div class="input-prepend">
				<span class="add-on"> <i class="icon-lock"></i>
				</span> <input class="pwCheck" name="pwCheck" size="16" type="password" placeholder="PasswordCheck">
			</div>
			<div class="input-prepend">
				<span class="add-on"> <i class="icon-user"></i>
				</span> <input class="name" name="name" size="16" type="text" placeholder="Name">
			</div>
			<div class="input-prepend">
				<span class="add-on"> <i class="icon-user"></i>
				</span> <input class="phone" name="phone" size="16" type="text" placeholder="Phone">
			</div>
			<div class="input-prepend" id="guest">
				<span class="add-on"> <i class="icon-user"></i>
				</span> <input class="zipNo" name="addr" size="16" type="text" placeholder="우편번호" readonly="readonly">
				<input type="button" id="guestBtn" value="주소 검색"><br>
					<input class="roadAddr" name="addr" size="16" type="text" placeholder="도로명주소" readonly="readonly"><br>
					<input class="guestAddr" name="addr" size="16" type="text" placeholder="나머지주소">
			</div>
			<div class="input-prepend">
				<span class="add-on"> <i class="icon-user"></i>
				</span> <input class="email" name="email" size="16" type="text" placeholder=Email>
			</div>
			<div class="input-prepend">
				<span class="add-on"> <i class="icon-user"></i>
				</span> <input class="nickname" name="nickname" size="16" type="text" placeholder="Nickname">
			</div>
			<span class="nicknameCheck">중복결과여부</span>
			<div class="input-prepend">
				<span class="add-on"> <i class="icon-user"></i>
				</span> 
				<input id="datepicker1" name="datepicker1" size="16" type="text" placeholder="Birth">
			</div>
			<input class="btn btn-small btn-inverse" type="submit" value="가입">
			<input class="btn btn-small btn-inverse" type="reset" value="취소">
			</form>
		</div>
		
		
		
		
		
	<!----------------------------- 아티스트 회원가입 ---------------------------------------->
		<div class="span3 sidebar page-right-sidebar" id="artistDetail">
			<h5 class="title-bg" style="margin-top: 0px;">아티스트 회원가입</h5>
			<form action="join.do" method="post" enctype="multipart/form-data" id="artistForm">
			<div class="input-prepend">
				<span class="add-on"> <i class="icon-user"></i>
				</span> <input class="uProfile" name="uProfile" type="file">
			</div>
			<div class="input-prepend">
				<span class="add-on"> <i class="icon-user"></i>
				</span> <input class="id" name="id" size="16" type="text" placeholder="ID">
			</div>
			<span class="idCheck">중복결과여부</span>
			<div class="input-prepend">
				<span class="add-on"> <i class="icon-lock"></i>
				</span> <input class="pw" name="pw" size="16" type="password" placeholder="Password">
			</div>
			<div class="input-prepend">
				<span class="add-on"> <i class="icon-lock"></i>
				</span> <input class="pwCheck" name="pwCheck" size="16" type="password" placeholder="PasswordCheck">
			</div>
			<div class="input-prepend">
				<span class="add-on"> <i class="icon-user"></i>
				</span> <input class="name" name="name" size="16" type="text" placeholder="Name">
			</div>
			<div class="input-prepend">
				<span class="add-on"> <i class="icon-user"></i>
				</span> <input class="phone" name="phone" size="16" type="text" placeholder="Phone">
			</div>
			<div class="input-prepend" id="artist">
				<span class="add-on"> <i class="icon-user"></i>
				</span> <input class="zipNo" name="addr" size="16" type="text" placeholder="우편번호" readonly="readonly">
				<input type="button" id="artistBtn" value="주소 검색"><br>
					<input class="roadAddr" name="addr" size="16" type="text" placeholder="도로명주소" readonly="readonly"><br>
					<input class="artistAddr" name="addr" size="16" type="text" placeholder="나머지주소">
			</div>
			<div class="input-prepend">
				<span class="add-on"> <i class="icon-user"></i>
				</span> <input class="email" name="email" size="16" type="text" placeholder=Email>
			</div>
			<div class="input-prepend">
				<span class="add-on"> <i class="icon-user"></i>
				</span> <input class="nickname" name="nickname" size="16" type="text" placeholder="Nickname">
			</div>
			<span class="nicknameCheck">중복결과여부</span>
			<div class="input-prepend">
				<span class="add-on"> <i class="icon-user"></i>
				</span> 
				<input id="datepicker2" name="datepicker2" size="16" type="text" placeholder="Birth">
			</div>
			<div class="input-prepend">
				<span class="add-on"> <i class="icon-user"></i>
				</span> <textarea class="content" name="content" rows="15" cols="15" placeholder="content"></textarea>
			</div>
			<div class="input-prepend">
				<span class="add-on"> <i class="icon-user"></i>
				</span> <input class="uFile" name="uFile" type="file">
			</div>
			<input class="btn btn-small btn-inverse" id="submit" type="submit" value="가입">
			<input class="btn btn-small btn-inverse" id="reset" type="reset" value="취소">
			</form>
		</div>
	</div>
</body>
</html>