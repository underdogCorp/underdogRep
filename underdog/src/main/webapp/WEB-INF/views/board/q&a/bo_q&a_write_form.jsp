<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/nav.jsp"%>

<script>
	$(function(){
		$('#q&aSubmitBtn').click(function(){
			
			var f = $('#q&aSubmitFrm');
			f.attr('method', 'POST');
			f.attr('action', "/board/registerProc");
			f.submit();
			
		})
		
	})

</script>
<form id="q&aSubmitFrm">
게시판 id (hidden으로 처리, 임시): <input type="text" name="bo_bbsid" value="04"><br/>

회원이메일(session으로 처리, 임시)  : <input type="text" name="bo_me_email"><br/>
회원닉네임(session으로 처리, 임시)  : <input type="text" name="bo_me_nick"><br/>

제목 : <input type="text" name="bo_title"><br/>
내용 : <input type="text" name="bo_content"><br/>

<input type="button" id="q&aSubmitBtn" value="제출">
</form>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>