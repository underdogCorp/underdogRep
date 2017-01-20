<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/include/nav.jsp"%>

<script>

$(function(){
	$('#qnaModifySubmitBtn').click(function(){
		var f = $('#qnaModifySubmitFrm');
		f.attr('method', 'POST');
		f.atte('action', "/board/modifyProc")
	})
})

</script>
<form id="qnaModifySubmitFrm">
게시판 번호 : <input type="hidden" name="bo_idx" value="${data.bo_idx }"/> <br/>
회원 이메일 : <input type="hidden" name="bo_me_email" value="${data.bo_me_email }"/> <br/>
게시판 아이디 : <input type="hidden" name="bo_bbsid" value="${data.bo_bbsid}"/> <br/>
회원 닉네임 : <input type="hidden" name="bo_me_nick" value="${data.bo_me_nick }"/> <br/>

조회수 : <input type="hidden" name="bo_hit" value="${data.bo_hit }"/> <br/>
게시일자: <input type="hidden" name="bo_regdate" value="${data.bo_regdate }"/> <br/>
아이피 : <input type="hidden" name="bo_regip" value="${data.bo_regip }"/> <br/>

게시판 번호 : ${data.bo_idx } <br/>
회원 이메일 : ${data.bo_me_email }> <br/>
게시판 아이디 : ${data.bo_bbsid} <br/>
회원 닉네임 : ${data.bo_me_nick } <br/>
제목 : <input type="text" value="${data.bo_title }"/> <br/>
본문 : <input type="text" value="${data.bo_content }"/> <br/>
조회수 : ${data.bo_hit } <br/>
게시일자: ${data.bo_regdate } <br/>
아이피 : ${data.bo_regip } <br/>
</form>
<input type="button" id="qnaModifySubmitBtn" value="수정하기" />

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
