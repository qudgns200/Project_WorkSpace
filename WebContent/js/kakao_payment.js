
$(function() {
	
	var thisIt = $("#thisIt").val();
	var approval_url = "";
	var fail_url = "";
	var cancel_url= "";
	var ajaxUrl = "";
	
	
	if(thisIt=='art') {
		approval_url = "http://localhost:8080/Project/kakaoApproval.do?no=" + $('#no').val();
	    fail_url = "http://localhost:8080/Project/artPayForm.do?no=" + $('#no').val();
	    cancel_url = "http://localhost:8080/Project/artDetail.do?no=" + $('#no').val();
	    isCheck="0";
	} else {
		approval_url = "http://localhost:8080/Project/kakaoApproval.do?no=" + $('#no').val();
	    fail_url = "http://localhost:8080/Project/lecutrePayForm.do?no=" + $('#no').val();
	    cancel_url = "http://localhost:8080/Project/lectureDetail.do?no=" + $('#no').val();
	    isCheck="1";
	}
	
	
	
	$("#kakaoPayment").on("click", function() {

	var param = {
			"cid" : "TC0ONETIME",
			"no" : $('#no').val(),
			"partner_order_id" : $('#merchant_uid').val(),
			"partner_user_id" : "workSpace",
			"item_name" : $('#title').val(),
			"quantity" : "1",
		    "total_amount" : $('#price').val(), // 결제창에 표시될 금액. 실제 승인이 이뤄지지는 않습니다. (모바일에서는 가격이 표시되지 않음)
		    "vat_amount" : $('#price').val()*0.1,
		    "tax_free_amount" : "0",
		    "approval_url" : approval_url,
		    "fail_url" : fail_url,
		    "cancel_url" : cancel_url,
		    "isCheck" : isCheck
	}	

		$.ajax({
			type:"POST",
			url: 'kakaoPayment.do',	
			dataType: "json",
			data: param,
			success: function(result) {
					location.href=result.next_redirect_pc_url;
			},
			error: function(request, status, error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})
	});
});