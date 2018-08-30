<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/JavaScript" src="/js/jquery-1.8.3.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

<script language="javascript">
function getAddr(){
	// AJAX 주소 검색 요청
	$.ajax({
		url:"getAddrApi.do"									// 고객사 API 호출할 Controller URL
		,type:"post"
		,data:$("#form").serialize() 								// 요청 변수 설정
		,dataType:"json"											// 데이터 결과 : JSON
		,success:function(jsonStr){									// jsonStr : 주소 검색 결과 JSON 데이터
			$("#list").html("");									// 결과 출력 영역 초기화
			$("#pageApi").html("");
			var errCode = jsonStr.results.common.errorCode; 		// 응답코드
			var errDesc = jsonStr.results.common.errorMessage;		// 응답메시지
			if(errCode != "0"){ 									// 응답에러시 처리
				alert(errCode+"="+errDesc);
			}else{
				if(jsonStr!= null){
					makeListJson(jsonStr);							// 결과 JSON 데이터 파싱 및 출력
					pageMake(jsonStr);
				}
			}
		}
		,error: function(xhr,status, error){
			alert("에러발생");										// AJAX 호출 에러
		}
	});
}

function makeListJson(jsonStr){
	var htmlStr = "";
	htmlStr += "<table>";
	htmlStr += "<tr>";
	htmlStr += "<td>도로명주소</td>";
	htmlStr += "<td>지번주소</td>";
	htmlStr += "<td>우편번호</td>";
	htmlStr += "</tr>";
	// jquery를 이용한 JSON 결과 데이터 파싱
	$(jsonStr.results.juso).each(function(){
		htmlStr += "<tr>";
		htmlStr += "<td><a href='javascript:window.close()' class='roadAddr'>"+this.roadAddr+"</a></td>";
		htmlStr += "<td>"+this.jibunAddr+"</td>";
		htmlStr += "<td class='zipNo'>"+this.zipNo+"</td>";
		htmlStr += "</tr>";
	});
	htmlStr += "</table>";
	// 결과 HTML을 FORM의 결과 출력 DIV에 삽입
	$("#list").html(htmlStr);
}

function goPage(pageNum){
	document.form.currentPage.value=pageNum;
	getAddr();
}

function pageMake(jsonStr){ 
  	var total = jsonStr.results.common.totalCount; // 총건수 
  	var pageNum = document.form.currentPage.value;// 현재페이지
	var paggingStr = "";
	if(total < 1){
	}else{
		var PAGEBLOCK=parseInt(document.form.countPerPage.value); 
		var pageSize=document.form.countPerPage.value; 
		var totalPages = Math.floor((total-1)/pageSize) + 1; // 총 페이지
		var firstPage = Math.floor((pageNum-1)/PAGEBLOCK) * PAGEBLOCK + 1; // 페이지의 시작(ex)1,11,21,31...)
		if( firstPage <= 0 ) firstPage = 1;		
		var lastPage = firstPage-1 + PAGEBLOCK; // 페이지의 끝(ex)10,20,30...)
		if( lastPage > totalPages ) lastPage = totalPages;	
		var nextPage = lastPage+1 ; // 다음 페이지
		var prePage = firstPage-10 ;	// 이전 페이지
		if( firstPage > PAGEBLOCK ){
			paggingStr +=  "<a href='javascript:goPage("+prePage+");'>◁</a>  " ;
		}		
		for( i=firstPage; i<=lastPage; i++ ){
			if( pageNum == i )
				paggingStr += "<a style='font-weight:bold;color:blue;font-size:15px;' href='javascript:goPage("+i+");'>" + i + "</a>  ";
			else
				paggingStr += "<a href='javascript:goPage("+i+");'>" + i + "</a>  ";
		}		
		if( lastPage < totalPages ){
			paggingStr +=  "<a href='javascript:goPage("+nextPage+");'>▷</a>";
		}		
		$("#pageApi").html(paggingStr);
	}	
}
</script>

<script type="text/javascript">
$(document).ready(function() {
	$('#list').on('click', '.roadAddr', function() {
		if($('#check').val() == 1) {
			window.opener.top.location.href=
			"joinForm.do?roadAddr=" + $('.roadAddr').eq($('.roadAddr').index($(this))).text() 
					+ "&zipNo=" + $('.zipNo').eq($('.roadAddr').index($(this))).text();
		} else {
			window.opener.top.location.href=
				"joinForm.do?roadAddrA=" + $('.roadAddr').eq($('.roadAddr').index($(this))).text() 
						+ "&zipNoA=" + $('.zipNo').eq($('.roadAddr').index($(this))).text();
		}
	});
	$('#jibunAddr').on(click, function() {
	
	});
});
</script>
<title>주소 검색</title>
</head>
<body>
<form name="form" id="form" method="post">
  <input type="hidden" name="currentPage" value="1"/>				<!-- 요청 변수 설정 (현재 페이지. currentPage : n > 0) -->
  <input type="hidden" name="countPerPage" value="10"/>				<!-- 요청 변수 설정 (페이지당 출력 개수. countPerPage 범위 : 0 < n <= 100) -->
  <input type="hidden" name="resultType" value="json"/> 			<!-- 요청 변수 설정 (검색결과형식 설정, json) --> 
  <input type="hidden" name="confmKey" value="U01TX0FVVEgyMDE4MDgxNDE1MjI0NTEwODA3NjE="/>		<!-- 요청 변수 설정 (승인키) -->  
  <input type="text"   name="keyword" value=""/>					<!-- 요청 변수 설정 (키워드) -->
  <input type="button" onClick="goPage(1);" value="주소검색하기"/>
  <div id="list"> <!-- 검색 결과 리스트 출력 영역 --> </div>
  <div class="paginate" id="pageApi"></div>
</form>
<input type="hidden" id="check" value="${num }"/>				<!-- guest/artist 체크 -->
</body>
</html>