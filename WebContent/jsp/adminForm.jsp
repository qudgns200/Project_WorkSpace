<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>관리자 회원관리페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS
================================================== -->
<link href='http://fonts.googleapis.com/css?family=Oswald'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-responsive.css">
<link rel="stylesheet" href="css/custom-styles.css">
<!--Table-->
<!--    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">-->

<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<!-- <script src="//code.jquery.com/jquery-1.11.1.min.js"></script> -->

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
<!-- <script src="http://code.jquery.com/jquery-1.8.3.min.js"></script> -->
<script src="js/bootstrap.js"></script>
<script src="js/jquery.custom.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js" -->
<!-- 	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" -->
<!-- 	crossorigin="anonymous"></script> -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- table
================================================== -->
<script>
function getSearchList() {
	$.ajax({
		type : 'get',
		url : 'searchMember.do',
		data : {'page' : $('#page').val(), 'searchType' : $('#searchType').val(), 
			'keyword' : $('#keyword').val(), 'isCheck' : $('input[name=isCheck]:checked').val()},
		dataType : 'json',
		success : function(data) {
			$('#tbody').html('');
			$('#memberPaging').html('');
			var count = 1;
			$.each(data.member.memberList, function(i, member) {
				$('#tbody').append("<tr>"
									+ "<td><input type='checkbox' class='checkthis'></td>"
									+ "<td>" + count + "</td>"
									+ "<td><a href='#' id='search'>" + member.id + "</a></td>"
									+ "<td>" + member.name + "</td>"
									+ "<td>" + member.phone + "</td>"
									+ "<td>" + member.addr + "</td>"
									+ "<td>" + member.email + "</td>"
									+ "<td>" + member.nickname + "</td>"
									+ "<td>" + member.birth + "</td>"
									+ "<td>" + member.isCheck + "</td>"
									+ "<td>" + member.joinDate + "</td>"
									+ "<td>" + member.state + "</td>"
									+ "</tr>");
				count++;
			});
			var htmlStr = '';
			htmlStr += '<ul>';
				if(data.member.start != 1) {
					htmlStr += '<li><a href="javascript:goSearchPage(1);">처음</a>'
								+ '<a href="javascript:goSearchPage('+ (data.member.start - 10) +');">이전</a></li>';
				}
				for(i = data.member.start; i <= data.member.end; i++) {
					if(i == data.member.current) {
						htmlStr += '<li class="active"><a>' + i + '</a></li>';
					} else if(i != data.member.current && i <= data.member.last) {
						htmlStr += '<li><a href="javascript:goSearchPage('+ i +');">' + i + '</a></li>';
					}
				}
				if((data.member.end) < (data.member.last)) {
					htmlStr += '<li><a href="javascript:goSearchPage('+ (data.member.end + 1) +');">다음</a>'
					+ '<a href="javascript:goSearchPage('+ data.member.last +');">끝</a></li>';
				}
			htmlStr += '</ul>'
			$('#memberPaging').append(htmlStr);
		},
		error : function(status, error) {
			alert("조회 실패");
		}
	});
}

function getList() {
	$.ajax({
		type : 'get',
		url : 'selectAllMember.do',
		data : {'page' : $('#page').val()},
		dataType : 'json',
		success : function(data) {
			$('#tbody').html('');
			$('#memberPaging').html('');
			var count = 1;
			$.each(data.member.memberList, function(i, member) {
				$('#tbody').append("<tr>"
									+ "<td><input type='checkbox' class='checkthis'></td>"
									+ "<td>" + count + "</td>"
									+ "<td><a href='#' id='all'>" + member.id + "</a></td>"
									+ "<td>" + member.name + "</td>"
									+ "<td>" + member.phone + "</td>"
									+ "<td>" + member.addr + "</td>"
									+ "<td>" + member.email + "</td>"
									+ "<td>" + member.nickname + "</td>"
									+ "<td>" + member.birth + "</td>"
									+ "<td>" + member.isCheck + "</td>"
									+ "<td>" + member.joinDate + "</td>"
									+ "<td>" + member.state + "</td>"
									+ "</tr>");
				count++;
			});
			var htmlStr = '';
			htmlStr += '<ul>';
				if(data.member.start != 1) {
					htmlStr += '<li><a href="javascript:goPage(1);">처음</a>'
								+ '<a href="javascript:goPage('+ (data.member.start - 10) +');">이전</a></li>';
				}
				for(i = data.member.start; i <= data.member.end; i++) {
					if(i == data.member.current) {
						htmlStr += '<li class="active"><a>' + i + '</a></li>';
					} else if(i != data.member.current && i <= data.member.last) {
						htmlStr += '<li><a href="javascript:goPage('+ i +');">' + i + '</a></li>';
					}
				}
				if((data.member.end) < (data.member.last)) {
					htmlStr += '<li><a href="javascript:goPage('+ (data.member.end + 1) +');">다음</a>'
					+ '<a href="javascript:goPage('+ data.member.last +');">끝</a></li>';
				}
			htmlStr += '</ul>'
			$('#memberPaging').append(htmlStr);
		},
		error : function(status, error) {
			alert("조회 실패");
		}
	});
}

function goSearchPage(pageNum) {
	$('#page').val(pageNum);
	getSearchList();
}

function goPage(pageNum) {
	$('#page').val(pageNum);
	getList();
}

function getSearchArtistList() {
	$.ajax({
		type : 'get',
		url : 'searchApproveArtist.do',
		data : {'page' : $('#page').val(), 'searchType' : $('#searchArtistType').val(), 'keyword' : $('#artistKeyword').val()},
		dataType : 'json',
		success : function(data) {
			$('#artistTbody').html('');
			$('#artistPaging').html('');
			var count = 1;
			$.each(data.member.memberList, function(i, member) {
				$('#artistTbody').append("<tr>"
									+ "<td><input type='checkbox' class='checkthis'></td>"
									+ "<td>" + count + "</td>"
									+ "<td><a href='#' class='artist'>" + member.id + "</a></td>"
									+ "<td>" + member.name + "</td>"
									+ "<td>" + member.phone + "</td>"
									+ "<td>" + member.addr + "</td>"
									+ "<td>" + member.email + "</td>"
									+ "<td>" + member.nickname + "</td>"
									+ "<td>" + member.birth + "</td>"
									+ "<td>" + member.joinDate + "</td>"
									+ "</tr>");
				count++;
			});
			var htmlStr = '';
			htmlStr += '<ul>';
				if(data.member.start != 1) {
					htmlStr += '<li><a href="javascript:goSearchArtistPage(1);">처음</a>'
								+ '<a href="javascript:goSearchArtistPage('+ (data.member.start - 10) +');">이전</a></li>';
				}
				for(i = data.member.start; i <= data.member.end; i++) {
					if(i == data.member.current) {
						htmlStr += '<li class="active"><a>' + i + '</a></li>';
					} else if(i != data.member.current && i <= data.member.last) {
						htmlStr += '<li><a href="javascript:goSearchArtistPage('+ i +');">' + i + '</a></li>';
					}
				}
				if((data.member.end) < (data.member.last)) {
					htmlStr += '<li><a href="javascript:goSearchArtistPage('+ (data.member.end + 1) +');">다음</a>'
					+ '<a href="javascript:goSearchArtistPage('+ data.member.last +');">끝</a></li>';
				}
			htmlStr += '</ul>'
			$('#artistPaging').append(htmlStr);
		},
		error : function(status, error) {
			alert("조회 실패");
		}
	});
}

function getArtistList() {
	$.ajax({
		type : 'get',
		url : 'selectAllArtist.do',
		data : {'page' : $('#page').val()},
		dataType : 'json',
		success : function(data) {
			$('#artistTbody').html('');
			$('#artistPaging').html('');
			var count = 1;
			$.each(data.member.memberList, function(i, member) {
				$('#artistTbody').append("<tr>"
									+ "<td><input type='checkbox' class='checkthis'></td>"
									+ "<td>" + count + "</td>"
									+ "<td><a href='#' class='artist'>" + member.id + "</a></td>"
									+ "<td>" + member.name + "</td>"
									+ "<td>" + member.phone + "</td>"
									+ "<td>" + member.addr + "</td>"
									+ "<td>" + member.email + "</td>"
									+ "<td>" + member.nickname + "</td>"
									+ "<td>" + member.birth + "</td>"
									+ "<td>" + member.joinDate + "</td>"
									+ "</tr>");
				count++;
			});
			var htmlStr = '';
			htmlStr += '<ul>';
				if(data.member.start != 1) {
					htmlStr += '<li><a href="javascript:goArtistPage(1);">처음</a>'
								+ '<a href="javascript:goArtistPage('+ (data.member.start - 10) +');">이전</a></li>';
				}
				for(i = data.member.start; i <= data.member.end; i++) {
					if(i == data.member.current) {
						htmlStr += '<li class="active"><a>' + i + '</a></li>';
					} else if(i != data.member.current && i <= data.member.last) {
						htmlStr += '<li><a href="javascript:goArtistPage('+ i +');">' + i + '</a></li>';
					}
				}
				if((data.member.end) < (data.member.last)) {
					htmlStr += '<li><a href="javascript:goArtistPage('+ (data.member.end + 1) +');">다음</a>'
					+ '<a href="javascript:goArtistPage('+ data.member.last +');">끝</a></li>';
				}
			htmlStr += '</ul>'
			$('#artistPaging').append(htmlStr);
		},
		error : function(status, error) {
			alert("조회 실패");
		}
	});
}

function goSearchArtistPage(pageNum) {
	$('#page').val(pageNum);
	getSearchArtistList();
}

function goArtistPage(pageNum) {
	$('#page').val(pageNum);
	getArtistList();
}

	$(document).ready(function() {
		$("#memberList").hide();
		$("#artistList").hide();
		
		$("#manage").click(function() {
			$("#memberList").show();
			$("#artistList").hide();
		});
		$("#approval").click(function() {
			$("#artistList").show();
			$("#memberList").hide();
		});
		
		$("#mytable #checkall").click(function() {
			if ($("#mytable #checkall").prop('checked')) {
				$("#mytable input[type=checkbox]").each(function() {
					$(this).prop("checked", true);
				});

			} else {
				$("#mytable input[type=checkbox]").each(function() {
					$(this).prop("checked", false);
				});
			}
		});

		$("[data-toggle=tooltip]").tooltip();
		
		$("#tbody").on("click", "#search", function() {
			alert("테스트");
			if(confirm("선택한 회원을 정지시키겠습니까?")) {
				$.ajax({
					type : 'get',
					url : 'blackList.do',
					data : {'id' : $(this).text()},
					dataType : 'json',
					success : function(data) {
						if(data.result) {
							alert("이용정지되었습니다.");
							getSearchList();
						}
					},
					error : function(xhr, status, error) {
						alert("수정 실패");
					}
				});
			}
		});
		
		$("#tbody").on("click", "#all", function() {
			alert("테스트");
			if(confirm("선택한 회원을 정지시키겠습니까?")) {
				$.ajax({
					type : 'get',
					url : 'blackList.do',
					data : {'id' : $(this).text()},
					dataType : 'json',
					success : function(data) {
						if(data.result) {
							alert("이용정지되었습니다.");
							getList();
						}
					},
					error : function(xhr, status, error) {
						alert("수정 실패");
					}
				});
			}
		});
		
		$("#artistTbody").on("click", ".artist", function() {
			var width=800, height=500;
			var left = (screen.availWidth - width)/2;
			var top = (screen.availHeight - height)/2;
			var specs = "width=" + width;
			specs += ",height=" + height;
			specs += ",left=" + left;
			specs += ",top=" + top;
			
			window.open("approveView.do?id=" + $(this).text() + "&index=" + $(".artist").index($(this)), "팝업", specs);
		});
	});
</script>
<!-- table end-->
</head>
<body>
	<div class="color-bar-1"></div>
	<div class="color-bar-2 color-bg"></div>

	<div class="container main-container">

		<!-- 	header section -->
		<%@include file="header.jsp"%>

		<div class="row">

			<div class="span12">
				<h2 class="title-bg">회원관리 페이지</h2>
			</div>


			<!-- Table Items ================================================== -->
			<div class="span12">

				<ul id="filterOptions" class="gallery-cats clearfix; pull-right">
					<li class="active"><a href="#" class="all" id="manage">회원 관리 페이지</a></li>
					<li><a href="#" class="design" id="approval">아티스트 승인 페이지</a></li>
				</ul>

				<div class="row the-grid" id="memberList">
					<div class="span12 contact">
						<!--Begin page content column-->
						<div class="container">
							<!--                             <div class="row the-grid">-->
							<div class="col-md-12">
								<h3>전체 회원목록</h3>
								<div class="table-responsive">

									<form class="form-inline">
										<div class="input-prepend">
											<span class="add-on"><i class="icon-th-list"></i></span> 
											<select class="form-control; span2" id="searchType" name="find">
												<option selected="" id="type">검색조건선택</option>
												<option value="id">아이디</option>
												<option value="name">이름</option>
												<option value="nickname">닉네임</option>
											</select> 
											<input class="span3" id="keyword" size="16" type="text">&nbsp; 
											<label class="radio">
												<input type="radio" name="isCheck" value="3">Guest &nbsp;
											</label> 
											<label class="radio"> 
												<input type="radio" name="isCheck" value="2">Artist &nbsp;
											</label>
											<input type="button" class="btn" onclick="goSearchPage(1);" value="검색">
											<input type="button" class="btn" onclick="goPage(1);" value="전체조회">
										</div>
									</form>
									<hr>


									<div class="fixed-table-container">
										<div class="fixed-table-body">
											<!-- <div class="table-responsive">-->
											<table id="mytable" class="table table-bordred table-striped">
												<thead>
													<th><input type="checkbox" id="checkall" /></th>
													<th>No</th>
													<th>ID</th>
													<th>이름</th>
													<th>연락처</th>
													<th>주소</th>
													<th>이메일</th>
													<th>닉네임</th>
													<th>생년월일</th>
													<th>아티스트/사용자</th>
													<th>가입날짜</th>
													<th>이용권한</th>
												</thead>
												<tbody id="tbody"></tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Pagination -->
						<div class="pagination" id="memberPaging"></div>
						<!-- End gallery list-->

					</div>
					<!-- End Container -->


				</div>
				<!--End page content column-->

				<div class="row the-grid" id="artistList">
					<div class="span12 contact">
						<div class="container">
							<!--                             <div class="row the-grid"> -->
							<div class="col-md-12">
								<h3>아티스트 목록</h3>
								<div class="table-responsive">

									<form class="form-inline">
										<div class="input-prepend">
											<span class="add-on"><i class="icon-th-list"></i></span> <select
												class="form-control; span2" id="searchArtistType" name="find">
												<option selected="">검색조건선택</option>
												<option value="id">아이디</option>
												<option value="name">이름</option>
												<option value="nickname">닉네임</option>
											</select> 
											<input class="span3" id="artistKeyword" size="16" type="text">
											<input type="button" class="btn" onclick="goSearchArtistPage(1);" value="검색">
											<input type="button" class="btn" onclick="goArtistPage(1);" value="전체조회">
										</div>
									</form>
									<hr>


									<div class="fixed-table-container">
										<div class="fixed-table-body">
											<div class="table-responsive">
												<table id="mytable"
													class="table table-bordred table-striped">
													<button class="btn btn-danger pull-right" data-title="Edit"
														data-target="#edit">
														<span class="icon-remove-circle"></span>거절
													</button>
													<button class="btn btn-primary pull-right"
														data-title="Edit" data-target="#edit">
														<span class="icon-ok-sign"></span>승인
													</button>

													<thead>
														<th><input type="checkbox" id="checkall" /></th>
														<th>No</th>
														<th>ID</th>
														<th>이름</th>
														<th>연락처</th>
														<th>주소</th>
														<th>이메일</th>
														<th>닉네임</th>
														<th>생년월일</th>
														<th>가입날짜</th>
													</thead>
													<tbody id="artistTbody"></tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>



						<div class="modal fade" id="edit" tabindex="-1" role="dialog"
							aria-labelledby="edit" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">
											<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
										</button>
										<h4 class="modal-title custom_align" id="Heading">Edit
											Your Detail</h4>
									</div>
									<div class="modal-body">
										<div class="form-group">
											<input class="form-control " type="text" placeholder="Mohsin">
										</div>
										<div class="form-group">

											<input class="form-control " type="text" placeholder="Irshad">
										</div>
										<div class="form-group">
											<textarea rows="2" class="form-control"
												placeholder="CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan"></textarea>


										</div>
									</div>
									<div class="modal-footer ">
										<button type="button" class="btn btn-warning btn-lg"
											style="width: 100%;">
											<span class="glyphicon glyphicon-ok-sign"></span> Update
										</button>
									</div>
								</div>
								/.modal-content
							</div>
							/.modal-dialog
						</div>


						<div class="modal fade" id="delete" tabindex="-1" role="dialog"
							aria-labelledby="edit" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">
											<span class="icon-remove" aria-hidden="true"></span>
										</button>
										<h4 class="modal-title custom_align" id="Heading">삭제 경고창</h4>
									</div>
									<div class="modal-body">

										<div class="alert alert-danger">
											<span class="icon-warning-sign"></span>해당 회원을 삭제하시겠습니까?
										</div>

									</div>
									<div class="modal-footer ">
										<button type="button" class="btn btn-success">
											<span class="icon-ok"></span> Yes
										</button>
										<button type="button" class="btn btn-default"
											data-dismiss="modal">
											<span class="icon-remove"></span> No
										</button>
									</div>
								</div>
								/.modal-content
							</div>
							/.modal-dialog
						</div>

						<div class="pagination" id="artistPaging"></div>

					</div>
				</div>
			</div>
			<!-- End container row -->

		</div>
		<!-- End Container -->

		<!-- 	Footer section -->
		<%@include file="footer.jsp"%>

		<form>
			<input type="hidden" id="page" value="1">
		</form>
</body>
</html>