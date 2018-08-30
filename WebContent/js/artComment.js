
/*
 * 댓글 등록하기(Ajax)
 */
function fn_comment(childNode, groupNo, commentNo){
	
	if(childNode==1)
		var content = $("#reComment").val();
	else
		var content = $("#comment").val();
	
	var divId = "#recomment" + commentNo
	
	$(divId).html("");
	
	if(groupNo==null)
		var groupNum = 0;
	else
		var groupNum = groupNo
		
    $.ajax({
        type:'POST',
        url : "artComment.do",
        data: {
        	"no" : $("#no").val(),
        	"content" : content,
        	"childNode" : childNode,
        	"groupNo" : groupNum
        },
        success : function(){
                getCommentList();
                $("#comment").val("");
        },
        error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
        
    });
}
 
/**
 * 초기 페이지 로딩시 댓글 불러오기
 */
$(function(){
    
    getCommentList();
    
});
 
/**
 * 댓글 불러오기(Ajax)
 */
function getCommentList(){
	
	var skip = 10;
	var max = 0;
    $.ajax({
        type:'GET',
        url : "selectArtComment.do",
        dataType : "json",
        data:$("#commentForm").serialize(),
        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        success : function(data){
            
            var html = "";
            var cCnt = data.length;
            max = data.length;
            
            if(data.length > 0){
                
                for(i=0; i<skip; i++){
                	
                	if(data[i].childNode==0) {
                		html+="<div id=comment" + data[i].commentNo + ">";
                	} else {
                		html+="<div id=comment" + data[i].commentNo + " style='margin-left:30px;'>";
                	}

                    html += "<div><strong>"+data[i].id+ "/" + data[i].groupNo + "</strong>&nbsp";
                    html += "<a onclick='commentAorC(1, " + data[i].commentNo + ")'><font size='2px'><strong>답글</strong></font></a>&nbsp";
                    
                    //댓글 취소///////////////
                    html += "<a id='cancel' onclick='commentAorC(" + data[i].commentNo  + "'><font size='2px'><strong>취소</strong></font></a>&nbsp";
                    /////////////////////////
                    html += "<a onclick='modifyCommentForm(" + data[i].commentNo + ")'><font size='2px'><strong>수정</strong></font></a>&nbsp";
                    html += "<a onclick='deleteComment(" + data[i].commentNo + ")'><font size='2px'><strong>삭제</strong></font></a>&nbsp";
                    html += "<h6>" + data[i].content + "</h6>";
                    html += "<input type='hidden' id='" + data[i].commentNo + "' value='" + data[i].content +"'>";
                    html += "</div>";      
                    //답글 입력 폼////////////
                    html +="<div id=recomment" + data[i].commentNo + ">" +
                	html+="<textarea style='width: 500px' rows='3' cols='10' id='reComment' name='reComment' placeholder='댓글을 입력하세요'></textarea><br>";
                	html+="<div><a href='#' onClick='fn_comment(1, " + data[i].groupNo + ")' class='btn pull-left btn-success'>답글 쓰기</a></div>"
                    html+="</div></div>";
                    /////////////////////////
                    html += "</div>";
                    
                    
                    
                }
                html += "<div><button id='more' onclick='moreComment()'>댓글 더보기</button></a></div>"
                	
                	
                
            } else {
                
                html += "<div>";
                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>";
                
            }
            
            $("#cCnt").html(cCnt);
            $("#commentList").html(html);
            
        },
        error:function(request,status,error){
            
       }
        
    });
}

function moreComment() {
	skip = skip + 10;
	
	if(skip > max) {
		skip=max;
	}
	getCommentList();
}


/**
 * 답글 클릭 시 입력 폼 생성 요청
 */

function commentAorC(commentNo) {
	
}


function reComment(childNode, commentNo, groupNo) {

	var preCommentNo = "#recomment" + commentNo;
	
	var html="";
	
	html+="<table class='table'>";
	html+="<tr><td>";
	html+="<textarea style='width: 500px' rows='3' cols='10' id='reComment' name='reComment' placeholder='댓글을 입력하세요'></textarea><br>";
	html+="<div><a href='#' onClick='fn_comment(1, " + groupNo + ", " + commentNo +")' class='btn pull-left btn-success'>답글 쓰기</a></div>"
    html+="</td></tr></table></div>";
    
	$(preCommentNo).html(html);
}

/**
 * 댓글 수정 폼 요청
 */
function modifyCommentForm(commentNo) {
	
	var commentNoText = "#" + commentNo;
	var updateCommentNo = "#comment" + commentNo;

	var html="";
	
	html+="<div><table class='table'>";
	html+="<tr><td>";
	html+="<textarea style='width: 500px' rows='3' cols='10' id='updateComment' name='updateComment'>" + $(commentNoText).val() + "</textarea><br>";
	html+="<div><a href='#' onClick='fn_commentUpdate(" + commentNo + ")' class='btn pull-left btn-success'>답글 쓰기</a></div>"
    html+="</td></tr></table></div>";
    $(updateCommentNo).html("");
	$(updateCommentNo).html(html);
}
 
/**
 * 댓글 삭제
 */
function deleteComment(commentNo) {

	   $.ajax({
	        type:'GET',
	        url : "deleteComment.do",
	        data: {
	        	"commentNo" : commentNo,
	        	"no" : $("#no").val()
	        },
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	        success : function(data){
	        	getCommentList();
	        }
	   });
}

/**
 * 댓글 수정
 */
function fn_commentUpdate(commentNo) {

	   $.ajax({
	        type:'GET',
	        url : "modifyComment.do",
	        data: {
	        	"commentNo" : commentNo,
	        	"no" : $("#no").val(),
	        	"content" : $("#updateComment").val()
	        },
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	        success : function(data){
	        	getCommentList();
	        }
	   });
}
 