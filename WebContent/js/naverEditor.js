

$(function(){
    //전역변수선언
    var obj = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: obj,
        elPlaceHolder: "content",
        sSkinURI: "resources/editor/SmartEditor2Skin.html",
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,            
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,    
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true,
        }
    });
     
    //전송버튼 클릭이벤트
    $("#savebutton").click(function(){
        //id가 content인 textarea에 에디터에서 대입
        obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []); 
        //폼 submit
       
        $("#contact-form").submit();
    })
})