<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>회원가입 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS
================================================== -->
<link href='http://fonts.googleapis.com/css?family=Oswald'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-responsive.css">
<link rel="stylesheet" href="css/jquery.lightbox-0.5.css">
<link rel="stylesheet" href="css/custom-styles.css">
<link rel="stylesheet" href="css/style.css">

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
<!-- // jQuery UI CSS파일  -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- // jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- // jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script src="js/bootstrap.js"></script>
<script src="js/jquery.custom.js"></script>
<!-- Thumbnail 
================================================== -->
<link rel="stylesheet" href="css/fileImage.css?ver=0.1">

<script type="text/javascript">
$( function() {
	$( "input[name=birth]" ).datepicker({
		changeMonth: true,
		changeYear: true,
		showButtonPanel: true,
		nextText: '다음 달',
		prevText: '이전 달',
// 		dateFormat: 'yy-MM-dd',
		dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
		monthNames: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		minDate: '-100Y',
		maxDate: '-7Y+3M+21D',
		closeText: '닫기'
	});
});

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
		$('.idCheck').html('');
		$('.nickname').val('');
		$('.nicknameCheck').html('');
	});
	$('#artist').click(function() { // 아티스트 회원가입 폼
		$('#guestDetail').hide();
		$('#artistDetail').show();
		$('.id').val('');
		$('.idCheck').html('');
		$('.nickname').val('');
		$('.nicknameCheck').html('');
	});
	
	$('input[name=id]').blur(function() { // ID 중복검사
		var me = this;
		$.ajax({
			type : 'get',
			url : 'check.do',
			data : {'id' : $(me).val()},
			dataType : 'json',
			success : function(data) {
				if(data.idCheck) {
					$('.idCheck').css('color', 'black');
					$('.idCheck').html('사용할 수 있는 아이디입니다.');
				} else {
					$('.idCheck').css('color', 'red');
					$('.idCheck').html('사용할 수 없는 아이디입니다.');
					$(me).focus();
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
	$('input[name=birth]').blur(function() {
		var me = this;
		$.ajax({
			type : 'get',
			url : 'check.do',
			data : {'birth' : $(me).val()},
			dataType : 'json',
			success : function(data) {
				if(!data.birthCheck) {			
					$('.birthCheck').css('color', 'red');
					$('.birthCheck').html('필수 입력 사항입니다.');
					$(me).focus();
				} else {
					$('.birthCheck').html('');
				}
			},
			error : function(status, error) {
				alert(status);
				alert(error);
				alert('생년월일 : 잘못된 접근입니다.');
			}
		});
	});
	$('input[name=birth]').change(function() {
		var me = this;
		$.ajax({
			type : 'get',
			url : 'check.do',
			data : {'birth' : $(me).val()},
			dataType : 'json',
			success : function(data) {
				if(data.birthCheck) {			
					$('.birthCheck').html('');
				}
			},
			error : function(status, error) {
				alert(status);
				alert(error);
				alert('생년월일 : 잘못된 접근입니다.');
			}
		});
	});
	$('input[name=nickname]').blur(function() {
		var me = this;
		$.ajax({
			type : 'get',
			url : 'check.do',
			data : {'nickname' : $(me).val()},
			dataType : 'json',
			success : function(data) {
				if(data.nicknameCheck) {
					$('.nicknameCheck').css('color', 'black');
					$('.nicknameCheck').html('사용할 수 있는 닉네임입니다.');
				} else {
					$('.nicknameCheck').css('color', 'red');
					$('.nicknameCheck').html('사용할 수 없는 닉네임입니다.');
					$(me).focus();
				}
			},
			error : function(status, error) {
				alert(status);
				alert(error);
				alert('닉네임 : 잘못된 접근입니다.');
			}
		});
	});
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
				<h2 class="title-bg">회원가입 페이지</h2>
			</div>

			<div class="span3 sidebar page-left-sidebar">
				<!-- Begin sidebar column -->

				<!--Navigation-->

				<ul class="post-category-list">
					<li id="guest"><i class="icon-plus-sign"></i>일반 회원가입</li>
					<li id="artist"><i class="icon-plus-sign"></i>아티스트 회원가입</li>
				</ul>
				<br>
			</div>

			<div id="guestDetail">일반 회원가입 페이지입니다..
			<form action="join.do" method="post" id="guestForm">
			<div class="span4 contact">
				<!--Begin page content column-->
				<div class="span8 container">
						<div class="input-prepend">
							<span class="add-on"><i class="icon-pencil"></i></span> 
							<input class="span5" name="id" type="text" size="16" placeholder="아이디를 입력해주세요.">
						</div> 
						<span class="idCheck"></span>

						<div class="input-prepend">
							<span class="add-on"><i class="icon-check"></i></span> 
							<input class="span6" name="pw" type="password" size="16" placeholder="비밀번호를 입력해주세요.">
						</div>

						<div class="input-prepend">
							<span class="add-on"><i class="icon-check"></i></span> 
							<input class="span6" name="pwCheck" type="password" size="16" placeholder="비밀번호를 한번 더 입력해주세요.">
						</div>

						<div class="input-prepend">
							<span class="add-on"><i class="icon-pencil"></i></span> 
							<input class="span6" name="name" type="text" size="16" placeholder="이름을 입력해주세요.">
						</div>

						<div class="input-prepend">
							<span class="add-on"><i class="icon-signal"></i></span> 
							<input class="span6" name="phone" type="text" size="16" placeholder="연락처를 입력해주세요.">
						</div>

						<!-- <div class="input-prepend">
							<span class="add-on"><i class="icon-pencil"></i></span> <input
								class="span5" id="state" name="state" type="text" size="16"
								placeholder="주소를 입력해주세요.">
							<button class="btn btn-small btn-inverse " onclick="state"
								type="button" style="text-align: center; margin: 0 auto;">주소검색</button>
						</div> -->
						
						<div class="input-prepend">
				    <span class="add-on"><i class="icon-map-marker"></i></span>					
							<input class="span5" type="text" id="sample5_address1" name="addr" style="height: 20px;" placeholder="주소를 입력하세요.">
                            <input class="btn btn-small btn-inverse" type="button" onclick="sample5_execDaumPostcode1()" value="주소 검색" style="text-align: center; margin: 0 auto;"><br>
                            <!-- <div id="map" style="width:580px;height:250px;margin-top:10px;display:none"></div> -->

                            <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
                            <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=df63ab88c6f092a4b29b7f555f1a82dc&libraries=services"></script>
                            <script>
                                var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                                    mapOption = {
                                        center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
                                        level: 5 // 지도의 확대 레벨
                                    };

                                //지도를 미리 생성
                                var map = new daum.maps.Map(mapContainer, mapOption);
                                //주소-좌표 변환 객체를 생성
                                var geocoder = new daum.maps.services.Geocoder();
                                //마커를 미리 생성
                                var marker = new daum.maps.Marker({
                                    position: new daum.maps.LatLng(37.537187, 127.005476),
                                    map: map
                                });


                                function sample5_execDaumPostcode1() {
                                    new daum.Postcode({
                                        oncomplete: function(data) {
                                            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                                            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                            var fullAddr = data.address; // 최종 주소 변수
                                            var extraAddr = ''; // 조합형 주소 변수

                                            // 기본 주소가 도로명 타입일때 조합한다.
                                            if(data.addressType === 'R'){
                                                //법정동명이 있을 경우 추가한다.
                                                if(data.bname !== ''){
                                                    extraAddr += data.bname;
                                                }
                                                // 건물명이 있을 경우 추가한다.
                                                if(data.buildingName !== ''){
                                                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                                }
                                                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                                                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                                            }

                                            // 주소 정보를 해당 필드에 넣는다.
                                            document.getElementById("sample5_address1").value = fullAddr;
                                            // 주소로 상세 정보를 검색
                                            geocoder.addressSearch(data.address, function(results, status) {
                                                // 정상적으로 검색이 완료됐으면
//                                                 if (status === daum.maps.services.Status.OK) {

//                                                     var result = results[0]; //첫번째 결과의 값을 활용

//                                                     // 해당 주소에 대한 좌표를 받아서
//                                                     var coords = new daum.maps.LatLng(result.y, result.x);
//                                                     // 지도를 보여준다.
//                                                     mapContainer.style.display = "block";
//                                                     map.relayout();
//                                                     // 지도 중심을 변경한다.
//                                                     map.setCenter(coords);
//                                                     // 마커를 결과값으로 받은 위치로 옮긴다.
//                                                     marker.setPosition(coords)
//                                                 }
                                            });
                                        }
                                    }).open();
                                }
                            </script>
				</div>

						<div class="input-prepend">
							<span class="add-on"><i class="icon-envelope"></i></span> 
							<input class="span5" name="email" type="email" size="16"	placeholder="사용 중인 이메일을 입력해주세요.">
						</div>

						<div class="input-prepend">
							<div class="input-group date">
								<span class="add-on"><i class="icon-calendar"></i></span> 
								<input type="text" name="birth" placeholder="생년월일을 입력해주세요." value=""/>
							</div>
						</div>
						<span class="birthCheck"></span>

						<div class="input-prepend">
							<span class="add-on"><i class="icon-user"></i></span> 
							<input class="span4" name="nickname" size="16" type="text" placeholder="사용할 닉네임을 입력해주세요.">
						</div>
						<span class="nicknameCheck"></span>

						<div class="row">
							<div class="span7">
								<input type="submit" class="btn btn-success pull-right" value="회원가입">
								<input type="reset" class="btn btn-warning pull-right"	value="가입취소"> 
							</div>
						</div>
				</div>

			</div>
			<!--End page content column-->
		</form>
		</div>
		<!-- End container row -->
		


			<div id="artistDetail">아티스트 회원가입 페이지입니다.
			<form action="join.do" method="post" enctype="multipart/form-data" id="artistForm">
			<div class="span4 contact">
				<!--Begin page content column-->

				<!--  내용 입력 부분 -->
				<div class="span8 container">
						<div class="input-prepend">
							<span class="add-on"><i class="icon-pencil"></i></span> 
							<input class="span5" name="id" type="text" size="16" placeholder="아이디를 입력해주세요.">
						</div>
						<span class="idCheck"></span>

						<div class="input-prepend">
							<span class="add-on"><i class="icon-check"></i></span> 
							<input class="span6" name="pw" type="password" size="16" placeholder="비밀번호를 입력해주세요.">
						</div>

						<div class="input-prepend">
							<span class="add-on"><i class="icon-check"></i></span> 
							<input class="span6" name="pwCheck" type="password" size="16" placeholder="비밀번호를 한번 더 입력해주세요.">
						</div>

						<div class="input-prepend">
							<span class="add-on"><i class="icon-pencil"></i></span> 
							<input class="span6" name="name" type="text" size="16" placeholder="이름을 입력해주세요.">
						</div>

						<div class="input-prepend">
							<span class="add-on"><i class="icon-signal"></i></span> 
							<input class="span6" name="phone" type="text" size="16" placeholder="연락처를 입력해주세요.">
						</div>

						<!-- <div class="input-prepend">
							<span class="add-on"><i class="icon-home"></i></span> <input
								class="span5" id="state" name="state" type="text" size="16"
								placeholder="주소를 입력해주세요.">
							<button class="btn btn-small btn-inverse " onclick="state"
								type="button" style="text-align: center; margin: 0 auto;">주소검색</button>
						</div> -->
						
					<div class="input-prepend">
				    <span class="add-on"><i class="icon-map-marker"></i></span>					
							<input class="span5" type="text" id="sample5_address" name="addr" style="height: 20px;" placeholder="주소를 입력하세요.">
                            <input class="btn btn-small btn-inverse" type="button" onclick="sample5_execDaumPostcode()" value="주소 검색" style="text-align: center; margin: 0 auto;"><br>
                            <div id="map" style="width:580px;height:250px;margin-top:10px;display:none"></div>

                            <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
                            <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=df63ab88c6f092a4b29b7f555f1a82dc&libraries=services"></script>
                            <script>
                                var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                                    mapOption = {
                                        center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
                                        level: 5 // 지도의 확대 레벨
                                    };

                                //지도를 미리 생성
                                var map = new daum.maps.Map(mapContainer, mapOption);
                                //주소-좌표 변환 객체를 생성
                                var geocoder = new daum.maps.services.Geocoder();
                                //마커를 미리 생성
                                var marker = new daum.maps.Marker({
                                    position: new daum.maps.LatLng(37.537187, 127.005476),
                                    map: map
                                });


                                function sample5_execDaumPostcode() {
                                    new daum.Postcode({
                                        oncomplete: function(data) {
                                            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                                            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                            var fullAddr = data.address; // 최종 주소 변수
                                            var extraAddr = ''; // 조합형 주소 변수

                                            // 기본 주소가 도로명 타입일때 조합한다.
                                            if(data.addressType === 'R'){
                                                //법정동명이 있을 경우 추가한다.
                                                if(data.bname !== ''){
                                                    extraAddr += data.bname;
                                                }
                                                // 건물명이 있을 경우 추가한다.
                                                if(data.buildingName !== ''){
                                                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                                }
                                                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                                                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                                            }

                                            // 주소 정보를 해당 필드에 넣는다.
                                            document.getElementById("sample5_address").value = fullAddr;
                                            // 주소로 상세 정보를 검색
//                                             geocoder.addressSearch(data.address, function(results, status) {
//                                                 // 정상적으로 검색이 완료됐으면
//                                                 if (status === daum.maps.services.Status.OK) {

//                                                     var result = results[0]; //첫번째 결과의 값을 활용

//                                                     // 해당 주소에 대한 좌표를 받아서
//                                                     var coords = new daum.maps.LatLng(result.y, result.x);
//                                                     // 지도를 보여준다.
//                                                     mapContainer.style.display = "block";
//                                                     map.relayout();
//                                                     // 지도 중심을 변경한다.
//                                                     map.setCenter(coords);
//                                                     // 마커를 결과값으로 받은 위치로 옮긴다.
//                                                     marker.setPosition(coords)
//                                                 }
//                                             });
                                        }
                                    }).open();
                                }
                            </script>
				</div>

						<div class="input-prepend">
							<span class="add-on"><i class="icon-envelope"></i></span> 
							<input class="span5" name="email" type="email" size="16" placeholder="사용 중인 이메일을 입력해주세요.">
						</div>

						<div class="input-prepend">
							<div class="input-group date">
								<span class="add-on"><i class="icon-calendar"></i></span> 
								<input type="text" name="birth" placeholder="생년월일을 입력해주세요."/>
							</div>
						</div>
						<span class="birthCheck"></span>

						<div class="input-prepend">
							<span class="add-on"><i class="icon-user"></i></span> 
							<input class="span4" name="nickname" size="16" type="text" placeholder="사용할 닉네임을 입력해주세요.">
						</div>
						<span class="nicknameCheck"></span>

						<!--file upload-->
<!-- 						<div class="input-prepend"> -->
<!-- 							<span class="add-on"> <i class="icon-user"></i> -->
<!-- 							</span> <input class="uProfile" name="uProfile" type="file"> -->
<!-- 						</div> -->
						<!-- 썸네일 이미지 업로드 부분 -->
						<div class="filebox bs3-primary preview-image">
                            <input class="upload-name" value="프로필사진" disabled="disabled" style="width: 200px;">

                            <label for="input_file">업로드</label> 
                          <input type="file" id="input_file" class="upload-hidden" name="uProfile"> 
                        </div>
						<!-- ====================================================== -->
						
						
						
						<div class="input-prepend">
							<span class="add-on"> <i class="icon-user"></i>
							</span> <input name="uFile" type="file">
						</div>	
							<br>

							<div class="input-prepend">
								<span class="add-on"><i class=" icon-edit"></i>소개글</span><br>
							</div>
							<textarea class="span7" name="content"	placeholder="작품내용을 입력하세요."></textarea>
							<div class="row">
								<div class="span7">
									<input type="submit" class="btn btn-success pull-right" value="회원가입">
									<input type="button" class="btn btn-warning pull-right"	value="가입취소"> 
								</div>
							</div>
					</div>
					</div>
					</form>
				</div>

			</div>
			<!--End page content column-->
			</div>
		<!-- End container row -->


	<!-- Footer Area
        ================================================== -->
	<%@include file="footer.jsp"%>
<script src="js/fileImage.js"></script>
</body>
</html>
