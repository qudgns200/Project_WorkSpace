
var buyingPagingLog;

var myOrderFormG = function(){
	$.ajax({
		type: "post",
		url: "myOrderFormG.do",
		data: {"pageBuy": buyingPagingLog, "id": "test"},
		dataType: "json",
		success: function(data){
			$('#buyingList').empty();
			$('#buyingPaging').empty();
			var str1 = "<tr>";
			$.each(data.buyingList, function(index, buyingList){ 	// 구매 목록
				var isCheck;
				if (buyingList.isCheck==1) {
					isCheck = '강의';
				}else{
					isCheck = '작품';
				}
				str1 += '<td>' + isCheck + '</td><td>' + buyingList.no + '</td><td>' +
						buyingList.totalPrice + '</td><td>' + buyingList.payMethod + '</td><td>' +
						buyingList.state + '</td><td>' + buyingList.payDate + '</td>';
				str1 += '</tr>';
			}); // each
			$('#buyingList').append(str1); // 구매 목록- 테이블에 붙이기

			var str1Paging = "";
			if(data.startBuy != 1){
				var startBuy = data.startBuy - 1;
				str1Paging += '<button onclick= "buyingPagingLog = 1; myOrderFormG();">첫 페이지</button>' +
							  '<button onclick= "buyingPagingLog =' + startBuy + '; myOrderFormG();">이전</button>';
			} // 처음, 이전 페이지 버튼
			if(data.endBuy < data.lastBuy){
			for(var i = data.startBuy; i <= data.endBuy; i++){
				if(i==data.currentBuy){
					str1Paging += '[ '+i+' ]';
				}else{
					str1Paging += '<button onclick= "buyingPagingLog =' + i + '; myOrderFormG();">' + i + '</button>';
				}
			} 
			var endBuy = data.endBuy + 1;
			str1Paging += '<button onclick= "buyingPagingLog =' + endBuy + '; myOrderFormG();">다음</button>' +
				   		  '<button onclick= "buyingPagingLog ='+ data.lastBuy +'; myOrderFormG();">끝 페이지</button>';  // 다음, 끝 페이지 버튼
			} // if(data.endBuy < data.lastBuy) 끝
			else{
			for(var i = data.startBuy; i <= data.lastBuy; i++){
				if(i==data.currentBuy){
					str1Paging += ' [ '+i+' ] ';
				}else{
					str1Paging += '<button onclick= "buyingPagingLog =' + i + '; myOrderFormG();">' + i + '</button>';
				}	
			}
			} // else 끝
			
			$('#buyingPaging').append(str1Paging); // 구매 목록 페이징 처리- 테이블에 붙이기
			
		} // success 끝
		}) // ajax 끝
	}	// myOrderFormG 함수의 끝