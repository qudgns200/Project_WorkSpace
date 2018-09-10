<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>팔로워 목록</title>
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

<script type="text/javascript">
function getList() {
	$.ajax({
		type : 'get',
		url : 'followerList.do',
		data : {'page' : $('#page').val(), 'follower' : $('#follower').val()},
		dataType : 'json',
		success : function(data) {
			$('#tbody').html('');
			$('#memberPaging').html('');
			$.each(data.follower.followerList, function(i, follower) {
				if(follower != null) {
					$('#tbody').append("<tr>"
									+ "<td><a href='#' id='all'>" + follower + "</a></td>"
									+ "</tr>");
				}
			});
			var htmlStr = '';
			htmlStr += '<ul>';
				if(data.follower.start != 1) {
					htmlStr += '<li><a href="javascript:goPage(1);">처음</a>'
								+ '<a href="javascript:goPage('+ (data.follower.start - 10) +');">이전</a></li>';
				}
				for(i = data.follower.start; i <= data.follower.end; i++) {
					if(i == data.follower.current) {
						htmlStr += '<li class="active"><a>' + i + '</a></li>';
					} else if(i != data.follower.current && i <= data.follower.last) {
						htmlStr += '<li><a href="javascript:goPage('+ i +');">' + i + '</a></li>';
					}
				}
				if((data.follower.end) < (data.follower.last)) {
					htmlStr += '<li><a href="javascript:goPage('+ (data.follower.end + 1) +');">다음</a>'
					+ '<a href="javascript:goPage('+ data.follower.last +');">끝</a></li>';
				}
			htmlStr += '</ul>'
			$('#memberPaging').append(htmlStr);
		},
		error : function(status, error) {
			alert("조회 실패");
		}
	});
}

function goPage(pageNum) {
	$('#page').val(pageNum);
	getList();
}

$(document).ready(function() {
	getList();
});
</script>
</head>
<body>
<div class="color-bar-1"></div>
	<div class="color-bar-2 color-bg"></div>

	<div class="container main-container">

		<!-- 	header section -->
		<%@include file="header.jsp"%>

		<div class="row">

			<div class="span12">
				<h2 class="title-bg">팔로워 목록</h2>
			</div>


			<!-- Table Items ================================================== -->
			<div class="span12">

				<div class="row the-grid" id="memberList">
					<div class="span12 contact">
						<!--Begin page content column-->
						<div class="container">
							<!--                             <div class="row the-grid">-->
							<div class="col-md-12">
								<h3>팔로워 목록</h3>
								<div class="table-responsive">
									<form class="form-inline">
										<div class="input-prepend">
											<input class="span3" id="keyword" size="16" type="text">&nbsp; 
											<input type="button" class="btn" onclick="goSearchPage(1);" value="검색">
										</div>
									</form>
									<hr>

									<div class="fixed-table-container">
										<div class="fixed-table-body">
											<!-- <div class="table-responsive">-->
											<table id="mytable" class="table table-bordred table-striped">
												<thead align="center">
													<th>ID</th>
												</thead>
												<tbody id="tbody" align="center"></tbody>
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

			</div>
			<!-- End container row -->

		</div>
		<!-- End Container -->

		<!-- 	Footer section -->
		<%@include file="footer.jsp"%>

		<form>
			<input type="hidden" id="page" value="1">
			<input type="hidden" id="follower" value="${follower }">
		</form>
</body>
</html>