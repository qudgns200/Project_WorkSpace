

var buyingPagingLog;
var sellingPagingLog;
var soldPagingLog;

var mySellFormA = function(){
	$.ajax({
		type: "post",
		url: "mySellFormA.do",
		data: {"pageBuy": buyingPagingLog, "pageSell": sellingPagingLog, "pageSold": soldPagingLog, "id": "test"},
		dataType: "json",
		success: function(data){
			$('#buyingList').empty();
			$('#sellingList').empty();
			$('#soldList').empty();
			$('#buyingPaging').empty();
			$('#sellingPaging').empty();
			$('#soldPaging').empty();
			
			var str1 = "<tr>";
			$.each(data.buyingList, function(index, buyingList){ 	// 구매 목록
				str1 += '<td>' + buyingList.no + '</td><td>' + buyingList.title + '</td><td>' +
						buyingList.id + '</td><td>' + buyingList.price + '</td><td>' +
						buyingList.genre + '</td>';
				str1 += '</tr>';
			}); // each
			$('#buyingList').append(str1); // 구매 목록- 테이블에 붙이기

			var str1Paging = "";
			if(data.startBuy != 1){
				var startBuy = data.startBuy - 1;
				str1Paging += '<button onclick= "buyingPagingLog = 1; mySellFormA();">첫 페이지</button>' +
							  '<button onclick= "buyingPagingLog =' + startBuy + '; mySellFormA();">이전</button>';
			} // 처음, 이전 페이지 버튼
			if(data.endBuy < data.lastBuy){
			for(var i = data.startBuy; i <= data.endBuy; i++){
				if(i==data.currentBuy){
					str1Paging += '[ '+i+' ]';
				}else{
					str1Paging += '<button onclick= "buyingPagingLog =' + i + '; mySellFormA();">' + i + '</button>';
				}
			} 
			var endBuy = data.endBuy + 1;
			str1Paging += '<button onclick= "buyingPagingLog =' + endBuy + '; mySellFormA();">다음</button>' +
				   		  '<button onclick= "buyingPagingLog ='+ data.lastBuy +'; mySellFormA();">끝 페이지</button>';  // 다음, 끝 페이지 버튼
			} // if(data.endBuy < data.lastBuy) 끝
			else{
			for(var i = data.startBuy; i <= data.lastBuy; i++){
				if(i==data.currentBuy){
					str1Paging += ' [ '+i+' ] ';
				}else{
					str1Paging += '<button onclick= "buyingPagingLog =' + i + '; mySellFormA();">' + i + '</button>';
				}	
			}
			} // else 끝
			
			$('#buyingPaging').append(str1Paging); // 구매 목록 페이징 처리- 테이블에 붙이기
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				
				var str2 = "<tr>";
				$.each(data.sellingList, function(index, sellingList) { // 판매 중인 작품 목록
					str2 += '<td>' + sellingList.no + '</td><td>' + sellingList.title + '</td><td>' +
						sellingList.price + '</td><td>' + sellingList.totalCount + '</td><td>' + sellingList.genre + '</td>';
					str2 += '</tr>';
				}); // each
				$('#sellingList').append(str2); // 판매 중인 작품- 테이블에 붙이기

				var str2Paging = "";
				if (data.startSell != 1) {
					var startSell = data.startSell - 1;
					str2Paging += '<button onclick= "sellingPagingLog = 1; mySellFormA();">첫 페이지</button>' +
						'<button onclick= "sellingPagingLog =' + startSell + '; mySellFormA();">이전</button>';
				} // 처음, 이전 페이지 버튼
				if (data.endSell < data.lastSell) {
					for (var j = data.startSell; j <= data.endSell; j++) {
						if (j == data.currentSell) {
							str2Paging += '[ ' + j + ' ]';
						} else {
							str2Paging += '<button onclick= "sellingPagingLog =' + j + '; mySellFormA();">' + j + '</button>';
						}
					}
					var endSell = data.endSell + 1;
					str2Paging += '<button onclick= "sellingPagingLog =' + endSell + '; mySellFormA();">다음</button>' +
						'<button onclick= "sellingPagingLog =' + data.lastSell + '; mySellFormA();">끝 페이지</button>'; // 다음, 끝 페이지 버튼
				} // if(data.endSell < data.lastSell) 끝
				else {
					for (var j = data.startSell; j <= data.lastSell; j++) {
						if (j == data.currentSell) {
							str2Paging += ' [ ' + j + ' ] ';
						} else {
							str2Paging += '<button onclick= "sellingPagingLog =' + j + '; mySellFormA();">' + j + '</button>';
						}
					}
				} // else 끝

				$('#sellingPaging').append(str2Paging); // 판매 중인 작품 페이징 처리- 테이블에 붙이기		
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

				var str3 = "<tr>";
				$.each(data.soldList, function(index, soldList) { // 판매된 작품목록
					str3 += '<td>' + soldList.no + '</td><td>' + soldList.title + '</td><td>' +
						soldList.totalPrice + '</td><td>' + soldList.p_id + '</td><td>' +
						soldList.genre + '</td>';
					str3 += '</tr>';
				}); // each
				$('#soldList').append(str3); // 판매된 작품목록- 테이블에 붙이기

				var str3Paging = "";
				if (data.startSold != 1) {
					var startSold = data.startSold - 1;
					str3Paging += '<button onclick= "soldPagingLog = 1; mySellFormA();">첫 페이지</button>' +
						'<button onclick= "soldPagingLog =' + startSold + '; mySellFormA();">이전</button>';
				} // 처음, 이전 페이지 버튼
				if (data.endSold < data.lastSold) {
					for (var i = data.startSold; i <= data.endSold; i++) {
						if (i == data.currentSold) {
							str3Paging += '[ ' + i + ' ]';
						} else {
							str3Paging += '<button onclick= "soldPagingLog =' + i + '; mySellFormA();">' + i + '</button>';
						}
					}
					var endSold = data.endSold + 1;
					str3Paging += '<button onclick= "soldPagingLog =' + endSold + '; mySellFormA();">다음</button>' +
						'<button onclick= "soldPagingLog =' + data.lastSold + '; mySellFormA();">끝 페이지</button>'; // 다음, 끝 페이지 버튼
				} // if(data.endSold < data.lastSold) 끝
				else {
					for (var i = data.startSold; i <= data.lastSold; i++) {
						if (i == data.currentSold) {
							str3Paging += ' [ ' + i + ' ] ';
						} else {
							str3Paging += '<button onclick= "soldPagingLog =' + i + '; mySellFormA();">' + i + '</button>';
						}
					}
				} // else 끝
				$('#soldPaging').append(str3Paging); // 판매된 작품 페이징 처리- 테이블에 붙이기


			} // success 끝
	}) // ajax 끝
}	// mySellFormA 함수의 끝

