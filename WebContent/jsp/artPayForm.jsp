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

<!-- For Form -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,700" rel="stylesheet"/>
<link rel="stylesheet" href="css/payment/css/font-awesome.css"/>
<link rel="stylesheet" href="css/payment/css/lineicons.css"/>
<link rel="stylesheet" href="css/payment/css/weather-icons.css"/>
<link rel="stylesheet" href="css/payment/css/bootstrap.css"/>
<link rel="stylesheet" href="css/payment/css/styles.css"/>

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
    <div class="row">
    <%@include file="header.jsp"%>
<!--                             구매 시 필요한 정보들(hidden) -->
<input type="hidden" id="no" value='${art.no }'/>
<input type="hidden" id="merchant_uid" value='${orderNumber }'/>
<input type="hidden" id="title" value='${art.title }'/>
<input type="hidden" id="artist" value='${art.id }'/>
<input type="hidden" id="price" value='${art.price }'/>
<input type="hidden" id="customer_uid" value='${member.id }'/>
<input type="hidden" id="buyer_email" value='${member.email }'/>
<input type="hidden" id="buyer_name" value='${member.name }'/>
<input type="hidden" id="buyer_tel" value='${member.phone }'/>
<input type="hidden" id="buyer_addr" value='${member.addr }'/>

 <div class="theme-page-section theme-page-section-lg">
      <div class="container">
        <div class="row row-col-static row-col-mob-gap" id="sticky-parent" data-gutter="60">
          <div class="col-md-8 ">
            <div class="theme-payment-page-sections">
              <div class="theme-payment-page-sections-item">
              <div class="theme-search-results-item theme-payment-page-item-thumb">
                  <h3 class="theme-search-results-item-title">주문자 정보</h3>
                  <div class="row" data-gutter="20">
                    <div class="col-md-9 ">
                      <div class="row" data-gutter="20">
                        <div class="col-md-6 ">
                          <ul class="theme-search-results-item-hotel-room-features">
                            <li>
                              <i class="fa fa-bed"></i>이름 : ${member.name }
                            </li>
                            <li>
                              <i class="fa fa-arrows-h"></i>주소 : ${member.addr }
                            </li>
                            <li>
                              <i class="fa fa-shower"></i>전화번호 : ${member.phone }
                            </li>
                            <li>
                              <i class="fa fa-wifi"></i>이메일 : ${member.email }
                            </li>
                          </ul>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-3 ">
                      <div class="theme-search-results-item-img-wrap">
                        <img class="theme-search-results-item-img" src="./img/350x232.png" alt="Image Alternative text" title="Image Title"/>
                      </div>
                    </div>
                  </div>
                  </div>
                </div>

              <div class="theme-payment-page-sections-item">
                <div class="theme-search-results-item theme-payment-page-item-thumb">
              <h3 class="theme-payment-page-sections-item-title">주문내역</h3>
                <div class="col-md-2">
                  <div class="theme-payment-page-form-item form-group">
                    <h3 class="theme-payment-page-form-title">주문번호 : </h3>
                  </div>
                </div>
                <div class="col-md-10">
                  <div class="theme-payment-page-form-item form-group">
                    <input class="form-control" type="text" value='${orderNumber}'/>
                  </div>
                </div>

                <div class="col-md-2">
                  <div class="theme-payment-page-form-item form-group">
                    <h3 class="theme-payment-page-form-title">상품명 : </h3>
                  </div>
                </div>
                <div class="col-md-10">
                  <div class="theme-payment-page-form-item form-group">
                    <input class="form-control" type="text" value='${art.title}'/>
                  </div>
                </div>

                <div class="col-md-2">
                  <div class="theme-payment-page-form-item form-group">
                    <h3 class="theme-payment-page-form-title">가격 : </h3>
                  </div>
                </div>
                <div class="col-md-10">
                  <div class="theme-payment-page-form-item form-group">
                    <input class="form-control" type="text" value='${art.price}'/>
                  </div>
                </div>
            </div>

              <br /><br /><br /><br /><br /><br />  <br /><br />

              <div class="theme-payment-page-sections-item">
                <div class="theme-payment-page-booking">
                  <div class="theme-payment-page-booking-header">
                    <h3 class="theme-payment-page-booking-title">Total Price for 6 nights</h3>
                    <p class="theme-payment-page-booking-subtitle">By clicking book now button you agree with terms and conditionals and money back gurantee. Thank you for trusting our service.</p>
                    <p class="theme-payment-page-booking-price">$739.00</p>
                  </div>
                	
                	<a class="btn _tt-uc btn-primary-inverse btn-lg btn-block" id="payment">카드결제</a>
					<a class="btn _tt-uc btn-primary-inverse btn-lg btn-block" id="kakaoPayment">카카오페이</a>
					
                </div>
              </div>
            </div>
          </div>
          </div>


          <div class="col-md-4 ">
            <div class="sticky-col">
              <div class="theme-sidebar-section _mb-10">
                <h5 class="theme-sidebar-section-title">${lecture.title}</h5>
                <img class="theme-sidebar-section-hotel-thumbnail-img" src="./img/50x50.png" alt="Image Alternative text" title="Image Title"/>
                <div class="theme-sidebar-section-hotel-thumbnail-caption">
                  <p class="theme-sidebar-section-hotel-thumbnail-rating">
                    <b>8.5 exellent</b>(2889 reviews)
                  </p>
                  <p class="theme-sidebar-section-hotel-thumbnail-address">401 7th Avenue, Chelsea, New York, NY 10001, USA</p>
                </div>
              </div>
              <!-- <div class="theme-sidebar-section _mb-10">
                <h5 class="theme-sidebar-section-title">Booking Summary</h5>
                <ul class="theme-sidebar-section-summary-list">
                  <li>1 room, 2 adults, 6 nights</li>
                  <li>Check-in: Wed, Jun 27, 2018</li>
                  <li>Check-out: Tue, Jul 03, 2018</li>
                </ul>
              </div> -->
              <div class="theme-sidebar-section _mb-10">
                <h5 class="theme-sidebar-section-title">Charges</h5>
                <div class="theme-sidebar-section-charges">
                  <ul class="theme-sidebar-section-charges-list">
                    <li class="theme-sidebar-section-charges-item">
                      <h5 class="theme-sidebar-section-charges-item-title">6 nights</h5>
                      <p class="theme-sidebar-section-charges-item-subtitle">2 Guests</p>
                      <p class="theme-sidebar-section-charges-item-price">$570.00</p>
                    </li>
                    <li class="theme-sidebar-section-charges-item">
                      <h5 class="theme-sidebar-section-charges-item-title">Taxes, Fees & Surcharges</h5>
                      <p class="theme-sidebar-section-charges-item-subtitle"></p>
                      <p class="theme-sidebar-section-charges-item-price">$115.00</p>
                    </li>
                    <li class="theme-sidebar-section-charges-item">
                      <h5 class="theme-sidebar-section-charges-item-title">Resort fee</h5>
                      <p class="theme-sidebar-section-charges-item-subtitle">Payable at hotel</p>
                      <p class="theme-sidebar-section-charges-item-price">$54.00</p>
                    </li>
                  </ul>
                  <p class="theme-sidebar-section-charges-total">Total
                    <span>$739.00</span>
                  </p>
                </div>
              </div>
              <div class="theme-sidebar-section _mb-10">
                <ul class="theme-sidebar-section-features-list">
                  <li>
                    <h5 class="theme-sidebar-section-features-list-title">Manage your bookings!</h5>
                    <p class="theme-sidebar-section-features-list-body">You're in control of your booking - no registration required.</p>
                  </li>
                  <li>
                    <h5 class="theme-sidebar-section-features-list-title">Customer support available 24/7 worldwide!</h5>
                    <p class="theme-sidebar-section-features-list-body">Website and customer support in English and 41 other languages.</p>
                  </li>
                </ul>
              </div>
            </div>
          </div>
      </div>
    </div>
  </div>




<!--         <div class="span2 sidebar page-left-sidebar">Begin sidebar column -->

<!-- 		</div> -->

	
<!-- 		<div class="span8"> -->
<%-- 			주문번호 : <input type="text" id="merchant_uid" class="form-control" value="${orderNumber }"> <br> --%>
<%-- 			번호 : <input type="text" id="no" value="${art.no }"> <br> --%>
<%-- 			상품명 : <input type="text" id="name" value="${art.title }"><br> --%>
<%-- 			내용 : <input type="text" value="${art.content }"> <br> --%>
<%-- 			날짜 : <input type="text" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${art.artDate}"/>"> <br> --%>
<%-- 			가격 : <input type="text" id="price" value="${art.price }"> <br> --%>
<%-- 			아이디 : <input type="text" value="${art.id }"> <br> --%>
<%-- 			장르 : <input type="text" value="${art.genre }"><br> --%>
	
<!-- 			<!-- 	member hidden --> -->
<%-- 			<input type="hidden" id="customer_uid" value="${member.id }"> --%>
<%-- 			<input type="hidden" id="buyer_name" value="${member.name }"> --%>
<%-- 			<input type="hidden" id="buyer_email" value="${member.email }"> --%>
<%-- 			<input type="hidden" id="buyer_tel" value="${member.phone }"> --%>
<%-- 			<input type="hidden" id="buyer_addr" value="${member.addr }"> --%>
	
<!-- 			<button class="btn" type="button" id="payment">카드결제</button> -->
	
<!-- 			<input type="button" id="kakaoPayment" value="카카오페이"> -->
<!-- 		</div> -->

<!--         <div class="span2 sidebar page-left-sidebar">Begin sidebar column -->

<!-- 		</div> -->


<!-- Footer Area
        ================================================== -->
    <%@include file="footer.jsp"%>
    </div>
	</div>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script> 
<!-- For Form -->
    <script src="css/payment/js/jquery.js"></script>
    <script src="css/payment/js/moment.js"></script>
    <script src="css/payment/js/bootstrap.js"></script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDYeBBmgAkyAN_QKjAVOiP_kWZ_eQdadeI&callback=initMap&libraries=places"></script>
    <script src="css/payment/js/owl-carousel.js"></script>
    <script src="css/payment/js/blur-area.js"></script>
    <script src="css/payment/js/icheck.js"></script>
    <script src="css/payment/js/gmap.js"></script>
    <script src="css/payment/js/magnific-popup.js"></script>
    <script src="css/payment/js/ion-range-slider.js"></script>
    <script src="css/payment/js/sticky-kit.js"></script>
    <script src="css/payment/js/smooth-scroll.js"></script>
    <script src="css/payment/js/fotorama.js"></script>
    <script src="css/payment/js/bs-datepicker.js"></script>
    <script src="css/payment/js/typeahead.js"></script>
    <script src="css/payment/js/quantity-selector.js"></script>
    <script src="css/payment/js/countdown.js"></script>
    <script src="css/payment/js/window-scroll-action.js"></script>
    <script src="css/payment/js/fitvid.js"></script>
    <script src="css/payment/js/youtube-bg.js"></script>
    <script src="css/payment/js/custom.js"></script>
</body>
</html>