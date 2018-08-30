<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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


<script type="text/javascript">
    $(document).ready(function() {
    	var payMethod = ${payMethod }
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
<script type="text/javascript" src="js/iamport_payment.js"></script>
<!-- 카카오페이 라이브러리 호출 -->
<script type="text/javascript" src="js/kakao_payment.js"></script>
</head>
<body>
<div class="color-bar-1"></div>
    <div class="color-bar-2 color-bg"></div>
    
    <div class="container main-container">
    
    <%@include file="header.jsp"%>

	주문번호 : <input type="text" id="merchant_uid" value="${orderNumber }"> <br>
	번호 : <input type="text" id="no" value="${art.no }"> <br>
	상품명 : <input type="text" id="name" value="${art.title }"><br>
	내용 : <input type="text" value="${art.content }"> <br>
	날짜 : <input type="text" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${art.artDate}"/>"> <br>
	가격 : <input type="text" id="price" value="${art.price }"> <br>
	아이디 : <input type="text" value="${art.id }"> <br>
	장르 : <input type="text" value="${art.genre }"><br>
	
	<!-- 	member hidden -->
	<input type="hidden" id="customer_uid" value="${member.id }">
	<input type="hidden" id="buyer_name" value="${member.name }">
	<input type="hidden" id="buyer_email" value="${member.email }">
	<input type="hidden" id="buyer_tel" value="${member.phone }">
	<input type="hidden" id="buyer_addr" value="${member.addr }">
	
	<button class="btn" type="button" id="payment">카드결제</button>
	
	<input type="button" id="kakaoPayment" value="카카오페이">

	</div>
<!-- Footer Area
        ================================================== -->
    <%@include file="footer.jsp"%>

<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script> 
</body>
</html>