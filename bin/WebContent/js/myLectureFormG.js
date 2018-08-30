

var attendPagingLog;
var gatherPagingLog;

var myLectureFormG = function(){ // 강의 내역 페이지 요청 함수
	$.ajax({
		type: "get",
		url: "myLectureFormG.do",
		data: {"pageG" : gatherPagingLog, "pageA" : attendPagingLog, "id" : "test" },
		dataType: "json",
		success: function(data){
			$('#attendList').empty(); // 출력결과 누적 방지
			$('#gatherList').empty();
			$('#attendPaging').empty();
			$('#gatherPaging').empty();
			
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
				str1Paging += '<button onclick= "attendPagingLog = 1; myLectureFormG();">첫 페이지</button>' +
							  '<button onclick= "attendPagingLog =' + startA + '; myLectureFormG();">이전</button>';
			} // 처음, 이전 페이지 버튼
			if(data.endA < data.lastA){
			for(var i = data.startA; i <= data.endA; i++){
				if(i==data.currentA){
					str1Paging += '[ '+i+' ]';
				}else{
					str1Paging += '<button onclick= "attendPagingLog =' + i + '; myLectureFormG();">' + i + '</button>';
				}
			} 
			var endA = data.endA + 1;
			str1Paging += '<button onclick= "attendPagingLog =' + endA + '; myLectureFormG();">다음</button>' +
				   		  '<button onclick= "attendPagingLog ='+ data.lastA +'; myLectureFormG();">끝 페이지</button>';  // 다음, 끝 페이지 버튼
			} // if(data.endA < data.lastA) 끝
			else{
			for(var i = data.startA; i <= data.lastA; i++){
				if(i==data.currentA){
					str1Paging += ' [ '+i+' ] ';
				}else{
					str1Paging += '<button onclick= "attendPagingLog =' + i + '; myLectureFormG();">' + i + '</button>';
				}	
			}
			} // else 끝
			
			$('#attendPaging').append(str1Paging); // 강의신청 목록 페이징 처리- 테이블에 붙이기
			
			var str2 = "<tr>";
			$.each(data.gatherList, function(index, gatherList){ 		// 모집 중인 강의 목록
				str2 += '<td>' + gatherList.genre + '</td><td>' + gatherList.title + '</td><td>' +
						gatherList.artistID + '</td><td>' + gatherList.startGDate + '</td><td>' +
						gatherList.place + '</td><td>' + gatherList.state + '</td>';
				str2 += '</tr>';
			}); // each
			$('#gatherList').append(str2); // 모집 중인 강의- 테이블에 붙이기

			var str2Paging = "";
			if(data.startG != 1){
				var startG = data.startG - 1;
				str2Paging += '<button onclick= "gatherPagingLog = 1; myLectureFormG();">첫 페이지</button>' +
							  '<button onclick= "gatherPagingLog =' + startG + '; myLectureFormG();">이전</button>';
			} // 처음, 이전 페이지 버튼
			if(data.endG < data.lastG){
			for(var j = data.startG; j <= data.endG; j++){
				if(j==data.currentG){
					str2Paging += '[ '+j+' ]';
				}else{
					str2Paging += '<button onclick= "gatherPagingLog =' + j + '; myLectureFormG();">' + j + '</button>';
				}
			} 
			var endG = data.endG + 1;
			str2Paging += '<button onclick= "gatherPagingLog =' + endG + '; myLectureFormG();">다음</button>' +
				   		  '<button onclick= "gatherPagingLog ='+ data.lastG +'; myLectureFormG();">끝 페이지</button>';  // 다음, 끝 페이지 버튼
			} // if(data.endG < data.lastG) 끝
			else{
			for(var j = data.startG; j <= data.lastG; j++){
				if(j==data.currentG){
					str2Paging += ' [ '+j+' ] ';
				}else{
					str2Paging += '<button onclick= "gatherPagingLog =' + j + '; myLectureFormG();">' + j + '</button>';
				}	
			}
			} // else 끝
			
			$('#gatherPaging').append(str2Paging); // 모집 중인 강의 페이징 처리- 테이블에 붙이기
			
			
			} // success
		}) // ajax
} // myLectureFormG 함수의 끝

