<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Piccolo Theme</title>
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
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.custom.js"></script>

<script type="text/javascript">

$(document).ready(function(){
    
    
}) // document의 끝

var attendPagingLog;
var gatherPagingLog;
var requestPagingLog;
var approvePagingLog;

var myLectureFormA = function(){ // 강의 내역 페이지 요청 함수
    $.ajax({
        type: "get",
        url: "myLectureFormA.do",
        data: {"pageG" : gatherPagingLog, "pageA" : attendPagingLog, "pageR" : requestPagingLog, 
        "pageAp" : approvePagingLog, "id" : "test" },
        dataType: "json",
        success: function(data){
            $('#attendList').empty(); // 출력결과 누적 방지
            $('#gatherList').empty();
            $('#requestList').empty(); 
            $('#approveList').empty();
            $('#attendPaging').empty();
            $('#gatherPaging').empty();
            $('#requestPaging').empty();
            $('#approvePaging').empty();
            
            var str1 = "<tr>";
            $.each(data.attendList, function(index, attendList){    // 강의신청 목록
                str1 += '<td>' + attendList.genre + '</td><td>' + attendList.title + '</td><td>' +
                        attendList.artistID + '</td><td>' + attendList.startDate + '</td><td>' +
                        attendList.place + '</td>';
                str1 += '</tr>';
            }); // each
            $('#attendList').append(str1); // 강의신청 목록- 테이블에 붙이기

            var str1Paging = "";
            if(data.startA != 1){
                var startA = data.startA - 1;
                str1Paging += '<button onclick= "attendPagingLog = 1; myLectureFormA();">첫 페이지</button>' +
                              '<button onclick= "attendPagingLog =' + startA + '; myLectureFormA();">이전</button>';
            } // 처음, 이전 페이지 버튼
            if(data.endA < data.lastA){
            for(var i = data.startA; i <= data.endA; i++){
                if(i==data.currentA){
                    str1Paging += '[ '+i+' ]';
                }else{
                    str1Paging += '<button onclick= "attendPagingLog =' + i + '; myLectureFormA();">' + i + '</button>';
                }
            } 
            var endA = data.endA + 1;
            str1Paging += '<button onclick= "attendPagingLog =' + endA + '; myLectureFormA();">다음</button>' +
                          '<button onclick= "attendPagingLog ='+ data.lastA +'; myLectureFormA();">끝 페이지</button>';  // 다음, 끝 페이지 버튼
            } // if(data.endA < data.lastA) 끝
            else{
            for(var i = data.startA; i <= data.lastA; i++){
                if(i==data.currentA){
                    str1Paging += ' [ '+i+' ] ';
                }else{
                    str1Paging += '<button onclick= "attendPagingLog =' + i + '; myLectureFormA();">' + i + '</button>';
                }   
            }
            } // else 끝
            
            $('#attendPaging').append(str1Paging); // 강의신청 목록 페이징 처리- 테이블에 붙이기
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            var str2 = "<tr>";
            $.each(data.gatherList, function(index, gatherList){        // 모집 중인 강의 목록
                str2 += '<td>' + gatherList.genre + '</td><td>' + gatherList.title + '</td><td>' +
                        gatherList.artistID + '</td><td>' + gatherList.startGDate + '</td><td>' +
                        gatherList.place + '</td><td>' + gatherList.state + '</td>';
                str2 += '</tr>';
            }); // each
            $('#gatherList').append(str2); // 모집 중인 강의- 테이블에 붙이기

            var str2Paging = "";
            if(data.startG != 1){
                var startG = data.startG - 1;
                str2Paging += '<button onclick= "gatherPagingLog = 1; myLectureFormA();">첫 페이지</button>' +
                              '<button onclick= "gatherPagingLog =' + startG + '; myLectureFormA();">이전</button>';
            } // 처음, 이전 페이지 버튼
            if(data.endG < data.lastG){
            for(var j = data.startG; j <= data.endG; j++){
                if(j==data.currentG){
                    str2Paging += '[ '+j+' ]';
                }else{
                    str2Paging += '<button onclick= "gatherPagingLog =' + j + '; myLectureFormA();">' + j + '</button>';
                }
            } 
            var endG = data.endG + 1;
            str2Paging += '<button onclick= "gatherPagingLog =' + endG + '; myLectureFormA();">다음</button>' +
                          '<button onclick= "gatherPagingLog ='+ data.lastG +'; myLectureFormA();">끝 페이지</button>';  // 다음, 끝 페이지 버튼
            } // if(data.endG < data.lastG) 끝
            else{
            for(var j = data.startG; j <= data.lastG; j++){
                if(j==data.currentG){
                    str2Paging += ' [ '+j+' ] ';
                }else{
                    str2Paging += '<button onclick= "gatherPagingLog =' + j + '; myLectureFormA();">' + j + '</button>';
                }   
            }
            } // else 끝
            
            $('#gatherPaging').append(str2Paging); // 모집 중인 강의 페이징 처리- 테이블에 붙이기
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////            
            
            var str3 = "<tr>";
            $.each(data.requestList, function(index, requestList){  // 요청 받은 강의목록
                str3 += '<td>' + requestList.genre + '</td><td>' + requestList.title + '</td><td>' +
                        requestList.startDate + '</td><td>' + requestList.place + '</td><td>' +
                        requestList.maxPeople + '</td><td>' + requestList.guestID + '</td>';
                str3 += '</tr>';
            }); // each
            $('#requestList').append(str3); // 요청 받은 강의목록- 테이블에 붙이기

            var str3Paging = "";
            if(data.startR != 1){
                var startR = data.startR - 1;
                str3Paging += '<button onclick= "requestPagingLog = 1; myLectureFormA();">첫 페이지</button>' +
                              '<button onclick= "requestPagingLog =' + startR + '; myLectureFormA();">이전</button>';
            } // 처음, 이전 페이지 버튼
            if(data.endR < data.lastR){
            for(var i = data.startR; i <= data.endR; i++){
                if(i==data.currentR){
                    str3Paging += '[ '+i+' ]';
                }else{
                    str3Paging += '<button onclick= "requestPagingLog =' + i + '; myLectureFormA();">' + i + '</button>';
                }
            } 
            var endR = data.endR + 1;
            str3Paging += '<button onclick= "requestPagingLog =' + endR + '; myLectureFormA();">다음</button>' +
                          '<button onclick= "requestPagingLog ='+ data.lastR +'; myLectureFormA();">끝 페이지</button>';  // 다음, 끝 페이지 버튼
            } // if(data.endR < data.lastR) 끝
            else{
            for(var i = data.startR; i <= data.lastR; i++){
                if(i==data.currentR){
                    str3Paging += ' [ '+i+' ] ';
                }else{
                    str3Paging += '<button onclick= "requestPagingLog =' + i + '; myLectureFormA();">' + i + '</button>';
                }   
            }
            } // else 끝
            $('#requestPaging').append(str3Paging); // 요청 받은 강의목록 페이징 처리- 테이블에 붙이기
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            var str4 = "<tr>";
            $.each(data.approveList, function(index, approveList){  // 요청 수락한 강의목록
                str4 += '<td>' + approveList.genre + '</td><td>' + approveList.title + '</td><td>' +
                        approveList.startDate + '</td><td>' + approveList.place + '</td><td>' +
                        approveList.numberPeople + '</td><td>' +
                        approveList.maxPeople + '</td><td>' + approveList.guestID + '</td>';
                str4 += '</tr>';
            }); // each
            $('#approveList').append(str4); // 요청 수락한 강의목록- 테이블에 붙이기

            var str4Paging = "";
            if(data.startAp != 1){
                var startAp = data.startAp - 1;
                str4Paging += '<button onclick= "approvePagingLog = 1; myLectureFormA();">첫 페이지</button>' +
                              '<button onclick= "approvePagingLog =' + startAp + '; myLectureFormA();">이전</button>';
            } // 처음, 이전 페이지 버튼
            if(data.endAp < data.lastAp){
            for(var i = data.startAp; i <= data.endAp; i++){
                if(i==data.currentAp){
                    str4Paging += '[ '+i+' ]';
                }else{
                    str4Paging += '<button onclick= "approvePagingLog =' + i + '; myLectureFormA();">' + i + '</button>';
                }
            } 
            var endAp = data.endAp + 1;
            str4Paging += '<button onclick= "approvePagingLog =' + endAp + '; myLectureFormA();">다음</button>' +
                          '<button onclick= "approvePagingLog ='+ data.lastAp +'; myLectureFormA();">끝 페이지</button>';  // 다음, 끝 페이지 버튼
            } // if(data.endAp < data.lastAp) 끝
            else{
            for(var i = data.startAp; i <= data.lastAp; i++){
                if(i==data.currentAp){
                    str4Paging += ' [ '+i+' ] ';
                }else{
                    str4Paging += '<button onclick= "approvePagingLog =' + i + '; myLectureFormA();">' + i + '</button>';
                }   
            }
            } // else 끝
            $('#approvePaging').append(str4Paging); // 요청 수락한 강의목록 페이징 처리- 테이블에 붙이기
            
            } // success
        }) // ajax
} // myLectureFormA 함수의 끝





//<script type="text/javascript">
//
//<link href="images/favicon.ico" rel="shortcut icon" type="image/x-icon">

//<!-- jQuery -->
//<script src="js/jquery-2.0.0.min.js" type="text/javascript"></script>

<!-- Bootstrap4 files-->
<script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
<link href="css/bootstrap-custom.css" rel="stylesheet" type="text/css"/>

<!-- Font awesome 5 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">

<!-- custom style -->
<link href="css/uikit.css" rel="stylesheet" type="text/css"/>
<link href="css/responsive.css" rel="stylesheet" media="only screen and (max-width: 1200px)" />

<!-- custom javascript -->
<script src="js/script.js" type="text/javascript"></script>

<script type="text/javascript">
/// some script

// jquery ready start
$(document).ready(function() {
    // jQuery code

}); 
// jquery end
    
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

        <div class="span2 sidebar page-left-sidebar">
            <!-- Begin sidebar column -->

            <!--Navigation-->
            <h5 class="title-section" style="margin-center: 0px;">마이페이지</h5>
            <ul class="post-category-list">
                <li><a onclick="myLectureFormA()"><i class="icon-plus-sign"></i>강의
                        내역 조회</a></li>
                <li><a id="test2"><i class="icon-plus-sign"></i>주문 내역 조회</a></li>
                <li><a href="#"><i class="icon-plus-sign"></i>개인 정보 수정</a></li>
                <li><a href="#"><i class="icon-plus-sign"></i>회원 탈퇴</a></li>
            </ul>
            
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="gallery-4col.htm">강의내역 조회 </a>
                <ul class="dropdown-menu">
                    <li><a href="addLectureForm.jsp">신청한 강의</a></li>
                    <li><a href="gallery-4col.htm">모집 중인 강의</a></li>
                    <li><a href="gallery-6col.htm">요청 받은 강의</a></li>
                    <li><a href="gallery-4col-circle.htm">요청 수락한 강의</a></li>                    
                </ul>
             </li>

        </div>

        <div class="row">
            <!--Container row-->

            <div class="span12 contact">
            
            
            


<!-- ========================= SECTION CONTENT ========================= -->
<section class="section-content bg padding-y border-top">
<div class="container">

<div class="row">
    <main class="col-sm-9">

<div class="card">
<table class="table table-hover shopping-cart-wrap">
<thead class="text-muted">
<tr>
  <th scope="col">구매할 작품</th>
  <th scope="col" width="120">수량</th>
  <th scope="col" width="180">가격</th>
  <th scope="col" class="text-right" width="180">Action</th>
</tr>
</thead>
<tbody>
<tr>
    <td>
<figure class="media">
    <div class="img-wrap"><img src="images/items/1.jpg" class="img-thumbnail img-sm"></div>
    <figcaption class="media-body">
        <h6 class="title text-truncate">오베르의 교회 </h6>
        <dl class="dlist-inline small">
          <dt>크기: 74.5 x 94cm </dt>
          <dd>유화</dd>
        </dl>
        <dl class="dlist-inline small">
          <dt>Color: </dt>
          <dd>Orange color</dd>
        </dl>
    </figcaption>
</figure> 
    </td>
    <td> 
        <select class="form-control">
            <option>1</option>
            <option>2</option>  
            <option>3</option>  
            <option>4</option>  
        </select> 
    </td>
    <td> 
        <div class="price-wrap"> 
            <var class="price">130,000,000,000원</var> 
            <small class="text-muted">(수수료 5% 미포함가)</small>
        </div> <!-- price-wrap .// -->
    </td>
    <td class="text-right"> 
    <a data-original-title="Save to Wishlist" title="" href="" class="btn btn-outline-success" data-toggle="tooltip"> <i class="fas fa-heart"></i></a> 
    <a href="" class="btn btn-outline-danger"> × Remove</a>
    </td>
</tr>
<tr>
    <td>
<figure class="media">
    <div class="img-wrap"><img src="images/items/2.png" class="img-thumbnail img-sm"></div>
    <figcaption class="media-body">
        <h6 class="title text-truncate">수영장 </h6>
        <dl class="dlist-inline small">
          <dt>Size: 214 x 304.8 cm</dt>
          <dd>XXL</dd>
        </dl>
        <dl class="dlist-inline small">
          <dt>Color: </dt>
          <dd>Orange color</dd>
        </dl>
    </figcaption>
</figure> 
    </td>
    <td> 
        <select class="form-control">
            <option>1</option>
            <option>2</option>  
            <option>3</option>  
            <option>4</option>  
        </select> 
    </td>
    <td> 
        <div class="price-wrap"> 
            <var class="price">6,000,000,000원</var> 
            <small class="text-muted">(수수료 5% 미포함가)</small> 
        </div> <!-- price-wrap .// -->
    </td>
    <td class="text-right"> 
    <a data-original-title="Save to Wishlist" title="" href="" class="btn btn-outline-success" data-toggle="tooltip"> <i class="fas fa-heart"></i></a> 
    <a href="" class="btn btn-outline-danger btn-round"> × Remove</a>
    </td>
</tr>
<tr>
    <td>
<figure class="media">
    <div class="img-wrap"><img src="images/items/3.jpg" class="img-thumbnail img-sm"></div>
    <figcaption class="media-body">
        <h6 class="title text-truncate">Village on the Banks of the Seine </h6>
        <dl class="dlist-inline small">
          <dt>Size: 59 x 80.5 cm</dt>
          <dd>유화</dd>
        </dl>
        <dl class="dlist-inline small">
          <dt>Color: </dt>
          <dd>Orange color</dd>
        </dl>
    </figcaption>
</figure> 
    </td>
    <td> 
        <select class="form-control">
            <option>1</option>
            <option>2</option>  
            <option>3</option>  
            <option>4</option>  
        </select> 
    </td>
    <td> 
        <div class="price-wrap"> 
            <var class="price">1,000,000,000원</var> 
            <small class="text-muted">(수수료 5% 미포함가)</small> 
        </div> <!-- price-wrap .// -->
    </td>
    <td class="text-right"> 
        <a data-original-title="Save to Wishlist" title="" href="" class="btn btn-outline-success" data-toggle="tooltip"> <i class="fas fa-heart"></i></a>
        <a href="" class="btn btn-outline-danger btn-round"> × Remove</a>
    </td>
</tr>
</tbody>
</table>
</div> <!-- card.// -->

    </main> <!-- col.// -->
    <aside class="col-sm-3">
<p class="alert alert-success">5백만원 이상의 고가작품은 무진동 차량 무료배송을 원칙으로 합니다. </p>
<dl class="dlist-align">
  <dt>Total price: </dt>
  <dd class="text-right">137,000,000,000원</dd>
</dl>
<dl class="dlist-align">
  <dt>fees:</dt>
  <dd class="text-right">6,850,000,000원</dd>
</dl>
<dl class="dlist-align h5">
  <dt>Total:</dt>
  <dd class="text-right"><strong>143,850,000,000원</strong></dd>
</dl>
<hr>
<figure class="itemside mb-3">
    <aside class="aside"><img src="images/icons/pay-visa.png"></aside>
     <div class="text-wrap small text-muted">
        10% 할인 가능한 BC 카드 
     </div>
</figure>
<figure class="itemside mb-2">
    <aside class="aside"> <img src="images/icons/pay-mastercard.png"> </aside>
    <div class="text-wrap small text-muted">
        40% 적립 가능한 Master 카드
    </div>
</figure>

    </aside> <!-- col.// -->
</div>

</div> <!-- container .//  -->
</section>
<!-- ========================= SECTION CONTENT END// ========================= -->

<!-- ========================= SECTION  ========================= -->
<section class="section-name bg-white padding-y">
<div class="container">
<header class="section-heading">
<h2 class="title-section">Section name</h2>
</header><!-- sect-heading -->

<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
</div><!-- container // -->
</section>
<!-- ========================= SECTION  END// ========================= -->

<!-- ========================= SECTION  ========================= -->
<section class="section-name bg padding-y">
<div class="container">
<h4>Another section if needed</h4>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
</div><!-- container // -->
</section>
<!-- ========================= SECTION  END// ========================= -->

<!--    Footer section -->
    <%@include file="footer.jsp" %>
<!-- ========================= FOOTER END // ========================= -->


</body>
</html>
            
            
            
            
            
            
            
            
                <!--Begin page content column-->

                <h2>강의 내역 조회</h2>

                <div class="alert alert-success">Well done! You successfully
                    read this important alert message.</div>

                <h4>신청한 강의</h4>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th scope="col">장르</th>
                            <th scope="col">강의명</th>
                            <th scope="col">아티스트</th>
                            <th scope="col">강의기간</th>
                            <th scope="col">장소</th>
                        </tr>
                    </thead>
                    <tbody id="attendList">
                    </tbody>
                    <tr>
                        <td id="attendPaging" colspan="5"></td>
                    </tr>
                </table>

                <h4>모집 중인 강의</h4>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th scope="col">장르</th>
                            <th scope="col">강의명</th>
                            <th scope="col">아티스트</th>
                            <th scope="col">강의기간</th>
                            <th scope="col">장소</th>
                            <th scope="col">상태</th>
                        </tr>
                    </thead>
                    <tbody id="gatherList">
                    </tbody>
                    <tr>
                        <td id="gatherPaging" colspan="6"></td>
                    </tr>
                </table>

                <h4>요청 받은 강의</h4>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th scope="col">장르</th>
                            <th scope="col">강의명</th>
                            <th scope="col">강의기간</th>
                            <th scope="col">장소</th>
                            <th scope="col">최대 인원</th>
                            <th scope="col">강의 요청자</th>
                        </tr>
                    </thead>
                    <tbody id="requestList">
                    </tbody>
                    <tr>
                        <td id="requestPaging" colspan="6"></td>
                    </tr>
                </table>

                <h4>요청 수락한 강의</h4>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th scope="col">장르</th>
                            <th scope="col">강의명</th>
                            <th scope="col">강의기간</th>
                            <th scope="col">장소</th>
                            <th scope="col">현재 모집 인원</th>
                            <th scope="col">최대 인원</th>
                            <th scope="col">강의 요청자</th>
                        </tr>
                    </thead>
                    <tbody id="approveList">
                    </tbody>
                    <tr>
                        <td id="approvePaging" colspan="7"></td>
                    </tr>
                </table>

            </div>
            <!--End page content column-->


        </div>
        <!-- End container row -->

    </div>
    <!-- End Container -->
        
        
        

        <!-- Footer Area
        ================================================== -->
    <%@include file="footer.jsp"%>

</body>

</html>

