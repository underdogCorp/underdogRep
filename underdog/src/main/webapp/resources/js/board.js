
//-------------------Q&A 유효성 검사(임시)-------------------------


function board_check() {

	if ($.trim($("#bo_title").val()) == "") {
		alert("글제목을 입력하세요!");
		$("#bo_title").val("").focus();
		return false;
	}
	if ($.trim($("#bo_content").val()) == "") {
		alert("글내용을 입력하세요!");
		$("#bo_content").val("").focus();
		return false;
	}
	
}
//-------------------Q&A 유효성 검사(임시) end-------------------------
	
	
	
	