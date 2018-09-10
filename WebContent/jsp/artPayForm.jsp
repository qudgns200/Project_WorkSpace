<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS
================================================== -->
<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-responsive.css">
<!-- <link rel="stylesheet" href="css/jquery.lightbox-0.5.css"> -->
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
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.custom.js"></script>


<script type="text/javascript">
    $(document).ready(function() {

        var payMethod = ${payMethod };
    	
        if(payMethod==1) {  
            $("#payment").show(); 
            $("#kakaoPayment").hide();
        }
            else {
                $("#kakaoPayment").show(); 
                $("#payment").hide();
            }
    });
</script>

<!-- 아임포트 라이브러리 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.7.js" type="text/javascript"></script>
<!-- 아임포트 구현 라이브러리 호출 -->
<script type="text/javascript" src="js/iamport_payment.js?ver=0.3"></script>
<!-- 카카오페이 라이브러리 호출 -->
<script type="text/javascript" src="js/kakao_payment.js?ver=0.2"></script>


</head>

<body>
	<div class="color-bar-1"></div>
    <div class="color-bar-2 color-bg"></div>
    
    <div class="container main-container">
      
    <!-- Page Content
    ================================================== --> 
    <div class="row"><!--Container row-->
        <%@include file="header.jsp"%>

        <div class="span7 contact"><!--Begin page content column-->

            <h2>lecture 결제</h2>

            <div class="alert alert-success">
                Well done! You successfully read this important alert message. 
            </div>

           <h5 class="title-bg">주문자 정보</h5>
            <form action="#" id="contact-form">
                <div class="input-prepend">
                    <span class="add-on"><i class="icon-user" ></i></span>
                    <input class="span4" id="customer_uid"  size="20px" type="text" value="${member.id}" style="height: 20px;">
                </div>
                <div class="input-prepend">
                    <span class="add-on"><i class="icon-home"></i></span>
                    <input class="span4" id="buyer_addr"  size="20px" type="text" value="${member.addr}" style="height: 20px;">
                </div>
                <div class="input-prepend">
                    <span class="add-on"><i class="icon-headphones"></i></span>
                    <input class="span4" id="buyer_tel" size="20px" type="text" value="${member.phone}" style="height: 20px;">
                </div>
                <div class="input-prepend">
                    <span class="add-on"><i class="icon-envelope"></i></span>
                    <input class="span4" id="buyer_email" size="20px" type="text" value="${member.email}" style="height: 20px;">
                </div>                
            </form>

           <h5 class="title-bg">주문 내역</h5>
                <div class="input-prepend">
                    <span class="add-on">주문번호</span>
                    <input class="span4" id="merchant_uid" size="20px" type="text" value="${orderNumber}" style="height: 20px;">
                </div>
                <div class="input-prepend">
                    <span class="add-on">상&nbsp&nbsp품&nbsp&nbsp명</span>
                    <input class="span4" id="title" size="20px" type="text" value="${art.title}" style="height: 20px;">
                </div> 
                <div class="input-prepend">
                    <span class="add-on">가&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp격</span>
                    <input class="span4" id="price" size="20px" type="text" value="${art.price}" style="height: 20px;">
                </div>
                <input type="hidden" id="buyer_name" value='${member.name }'/>
                <input type="hidden" id="no" value='${art.no }'/>
                <input type="hidden" id="artist" value='${art.id }'/>
                <input type="hidden" id="isCheck" value='0'/>
                <input type="hidden" id="thisIt" value='art'/>
                <a class="btn _tt-uc btn-primary-inverse btn-lg btn-block" id="payment">카드결제</a>
                <a class="btn _tt-uc btn-primary-inverse btn-lg btn-block" id="kakaoPayment">카카오페이</a>
                
        </div> <!--End page content column-->

        <!-- Sidebar
        ================================================== --> 
        <div class="span4 sidebar page-sidebar"><!-- Begin sidebar column -->
            <h5 class="title-bg">작품 간단 소개</h5>
            <address>
            <strong>${art.title}</strong><br>
            제작자 : ${art.id}<br>
            장르 : ${art.genre}<br>
            <abbr title="Phone">P:</abbr> (123) 456-7890
            </address>

            <h5 class="title-bg">작품 보기</h5>
            <a href="selectOneArt.do?no=${art.no }"><img src="download.do?no=${art.no}"></a>

        </div><!-- End sidebar column -->
       </div><!-- End container row -->
      </div> <!-- End Container -->
                
    <!-- Footer Area
        ================================================== -->
    <%@include file="footer.jsp"%>


</body>
</html>
