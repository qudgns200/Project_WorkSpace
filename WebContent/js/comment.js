
//변수 설정
var init = {
	skip : 10,
	max : 0,
	cCnt : 0,
	startComment : 0,
	temp : 0,
	groupNoTemp : 0,
	pageText : "",
	listText : "",
	insertText : "",
	id : ""
}
var writer = new Array();

//무한 스크롤
$(window).scroll(function () {
	if($(window).scrollTop() == $(document).height() - $(window).height()) {
		getCommentList(1, init.pageText);
	}
});

/**
 * 댓글 불러오기(Ajax)
 */
function getCommentList(num, text, id){
	init.id = id;
		
	if(text=='art') {
		init.pageText = text;
		init.listText = "selectArtComment.do";
		init.insertText = "artComment.do";
	}
	
	else if(text=='lecture') {
		init.pageText = text;
		init.listText = "selectLectureComment.do";
		init.insertText = "lectureComment.do";
	}
	
	else if(text=='board') {
		init.pageText = text;
		init.listText = "selectBoardComment.do";
		init.insertText = "boardComment.do";
	}
	
	else if(text=='qna') {
		init.pageText = text;
		init.listText = "selectQnaComment.do";
		init.insertText = "qnaComment.do";
	}
	
	if(num!=0)  {
		init.startComment = init.skip;
		init.skip=init.skip+10;
		var aId = "#divMore" + num;
		$(aId).remove();
	}
	
    $.ajax({
        type:'GET',
        url : init.listText,
        dataType : "json",
        data:{
        	"no" : $("#no").val(),
        	"startComment" : init.startComment,
        	"skip" : init.skip
        },
        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        success : function(data){
        	
            var html = "";
            
            init.cCnt = data.length;
            init.max = data.length;
            
            if(init.skip>init.max)
            	init.skip=(init.max+init.startComment);
            
            if(data.length > 0){
                for(i=init.startComment; i<init.skip; i++){
                	var sendData = data[i]; //해당 객체를 넘겨주기 위해 생성
                	writer[i] = data[i].id;
                	
                	//시간 출력 위한 Date 정리///////////////////////////////////////////////////////////////////////////////////
                	var writeDate = (data[i].time.year+1900) + "." + (data[i].time.month+1) + "." + (data[i].time.date) + " " + 
                						data[i].time.hours + ":" + data[i].time.minutes + ":" + data[i].time.seconds;
                	
                	if(data[i].childNode==0) {
                		groupNoTemp=data[i].groupNo;
                		html +="<li id=comment" + data[i].commentNo + ">";
                		html += "<span class='comment-name'>"+ data[i].id + "</span>" +
                				"<span> / </span>" +
                				"<span class='comment-date'>" + writeDate + "</span>" + 
                				"<span> / </span>";
                		html += commentInput(sendData, i);
                		html += "<ul id='groupNo" + data[i].groupNo + "'></ul></li>";
                		$("#commentList").append(html);
                	}
                	else {
                		html +="<li id=comment" + data[i].commentNo + ">";
                		html += "<span class='comment-name'>"+ data[i].writer + "에 대한 답글" + "</span>" +
                				"<span> / </span>" +
                				"<span class='comment-name'>" + data[i].id + "</span>" +
                				"<span> / </span>" +
                				"<span class='comment-date'>" + writeDate + "</span>" +
                				"<span> / </span>";
                		html += commentInput(sendData, i);
                		html += "</li>";
                		var ulLoc = "#groupNo" + groupNoTemp;
                		$(ulLoc).append(html);
                	}
                	html = "";

                    temp = data[i].commentNo;      
                }
            }
            
            $("#cCnt").html(cCnt);
            
        },
        error:function(request,status,error){
            
       }
        
    });
}

/*
 * 댓글 등록하기(Ajax)
 */
function fn_comment(childNode, groupNo, groupOrder, commentNo, i){
	
	var reText = "#reText" + commentNo;
	var spanText = "#span" + commentNo;
	var writer1 = writer[i];
	
	if(childNode!=0)
		var content = $(reText).val();
	else
		var content = $("#comment").val();
	
	if(groupNo==null)
		var groupNum = 0;
	else
		var groupNum = groupNo;
	
    $.ajax({
        type:'POST',
        url : init.insertText,
        data: {
        	"no" : $("#no").val(),
        	"content" : content,
        	"childNode" : childNode,
        	"groupNo" : groupNum,
        	"groupOrder" : groupOrder,
        	"writer" : writer1	
        },
        dataType:'json',
        success : function(data){
        	var html="";
            var sendData = data[0]; //해당 객체를 넘겨주기 위해 생성
            
        	var writeDate = (data[0].time.year+1900) + "." + (data[0].time.month+1) + "." + (data[0].time.date) + " " + 
			data[0].time.hours + ":" + data[0].time.minutes + ":" + data[0].time.seconds;        		
        	
            	if(data[0].childNode==0) {
                	html +="<li id=comment" + data[0].commentNo + ">";
                	html += "<span id='span" + data[0].commentNo + "' class='comment-name'>"+ data[0].id + "</span>" +
                			"<span> / </span>" +
                			"<span class='comment-date'>" + writeDate + "</span>" +
                			"<span> / </span>";
            		html += commentInput(sendData, 0);
                	html += "<ul id='groupNo" + data[0].groupNo + "'></ul></li>";
                	$("#commentList").prepend(html);
                	$("#comment").val(""); //댓글 입력창 초기화
            	} else {
            		var commentAfter = "#groupNo" + groupNo;
                	html +="<li id=comment" + data[0].commentNo + ">";
                	html += "<span id='span" + data[0].commentNo + "' class='comment-name'>"+ data[0].writer + "에 대한 답글" + "</span>" +
                			"<span> / </span>" +
                			"<span class='comment-name'>" + data[0].id + "</span>" +
                			"<span> / </span>" +
                			"<span class='comment-date'>" + writeDate + "</span>" +
                			"<span> / </span>";
                	html += commentInput(sendData, 0);
                	html += "</li>";
                	$(commentAfter).append(html);
                	$(reText).val("");
                	recommentForm(commentNo);	
            	}

        },
        error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
        
    });
}

//추가 폼 공통 양식(답글 / 수정 / 삭제)
function commentInput(data, i) {
	var html="";

    html += "<a id='aRe" + data.commentNo + "' onclick='recommentForm(" + data.commentNo + ")'>답글</a>&nbsp";
    if(init.id==data.id) {
    html += "<a id='aMo" + data.commentNo + "' onclick='modifyForm(" + data.commentNo + ")'>수정</a>&nbsp";
    html += "<a onclick='deleteComment(" + data.commentNo + ")'>삭제</a>&nbsp";
    }
    html += "<div class='comment-content' id='contentForm" + data.commentNo + "'>" + data.content + "</div>";
    html += "<input type='hidden' id='" + data.commentNo + "' value='" + data.content +"'>";
    html += "</div>";  

    //답글 입력 폼////////////
    html +="<div class='recommentDiv' id='recomment" + data.commentNo + "' style='display:none'>";
	html +="<textarea style='width:500px' rows='3' cols='10' id='reText" + data.commentNo + "' name='reText' placeholder='댓글을 입력하세요'></textarea>&nbsp";
	
	html +="<a onClick='fn_comment(" + (data.childNode+1) + ", " + data.groupNo + ", " + data.groupOrder + ", " + data.commentNo + ", " + i + ")' class='btn btn-sq-sm btn-success'>답글 쓰기</a>"
    
	html +="</div>";
    /////////////////////////

	//댓글 수정 폼////////////
    html +="<div class='modifyDiv' id='modify" + data.commentNo + "' style='display:none'>";
	html +="<textarea style='width: 500px' rows='3' cols='10' id='updateComment" + data.commentNo + "' name='updateComment'>" + data.content + "</textarea><br>";
	html +="<div><a onClick='fn_commentUpdate(" + data.commentNo + ")' class='btn pull-left btn-success'>수정하기</a></div>"
    html +="</div>";
    /////////////////////////

    return html;
}
 
/**
 * 댓글 삭제
 */
function deleteComment(commentNo) {

	var contentForm = "#contentForm" + commentNo;
	
	   $.ajax({
	        type:'GET',
	        url : "deleteComment.do",
	        data: {
	        	"commentNo" : commentNo,
	        	"no" : $("#no").val(),
	        	"text" : init.pageText
	        },
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	        success : function(data){
	        	$(contentForm).text("삭제된 댓글입니다");
	        }
	   });
}

/**
 * 댓글 수정
 */
function fn_commentUpdate(commentNo) {
	
	var contentForm = "#contentForm" + commentNo;
	var updateComment = "#updateComment" + commentNo;
	
	   $.ajax({
	        type:'GET',
	        url : "modifyComment.do",		
	        data: {
	        	"commentNo" : commentNo,
	        	"no" : $("#no").val(),
	        	"content" : $(updateComment).val(),
	        	"text" : init.pageText
	        },
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	        success : function(data){
	        	
	        	modifyForm(commentNo);
	        	$(contentForm).text($(updateComment).val());
	        }
	   });
}

/**
 * 답글 폼 요청
 * toggle 사용하여 답글 / 취소 수행
 */
function recommentForm(commentNoStr) {
	
	var no = "#recomment" + commentNoStr;
	var aNo = "#aRe" + commentNoStr
	
	$(no).toggle();
	$(aNo).text($(aNo).text()=="답글"?"취소":"답글");
}

/**
 * 수정 폼 요청
 * toggle 사용하여 수정 / 취소 수행
 */
function modifyForm(commentNo) {
	var no = "#contentForm" + commentNo;
	var aNo = "#aMo" + commentNo;
	var modify = "#modify" + commentNo;
	
	$(no).toggle();
	$(modify).toggle();
	$(aNo).text($(aNo).text()=="수정"?"취소":"수정");
	
}
 