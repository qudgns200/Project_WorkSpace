
var attendPagingLog;
var gatherPagingLog;
var requestPagingLog;
var approvePagingLog;

var myLectureFormA = function(){ // 강의 내역 페이지 요청 함수
	$.ajax({
		type: "get",
		url: "myLectureFormA.do",
		data: {"pageG" : gatherPagingLog, "pageA" : attendPagingLog, "pageR" : requestPagingLog, 
		"pageAp" : approvePagingLog },
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
			$.each(data.attendList, function(index, attendList){ 	// 강의신청 목록
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
			$.each(data.gatherList, function(index, gatherList){ 		// 모집 중인 강의 목록
				str2 += '<td>' + gatherList.genre + '</td><td>' + gatherList.title + '</td><td>' +
						gatherList.artistID + '</td><td>' + gatherList.startDate + '</td><td>' +
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
			$.each(data.requestList, function(index, requestList){ 	// 요청 받은 강의목록
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
			$.each(data.approveList, function(index, approveList){ 	// 요청 수락한 강의목록
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

