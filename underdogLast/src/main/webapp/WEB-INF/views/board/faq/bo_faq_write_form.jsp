<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/nav.jsp"%>

<script>
	$(function(){
		$('#faqWriteSubmitBtn').click(function(){
			
			var f = $('#faqWriteSubmitFrm');
			f.attr('method', 'POST');
			f.attr('action', "/board/registerProc");
			f.submit();
			
		})
		
	})

</script>
<div class="container" style="padding-bottom: 50px;">px;">
<h2>F A Q 글쓰기</h2><br/>

<form id="faqWriteSubmitFrm">
게시판 id (hidden으로 처리, 임시): <input type="text" name="bo_bbsid" value="03"><br/>
회원이메일 (hidden으로 처리, 임시): <input type="text" name="bo_me_email" value="${sessionScope.MEMBER.me_email}"><br/> <br/>
회원닉네임 (hidden으로 처리, 임시): <input type="text" name="bo_me_nick" value="${sessionScope.MEMBER.me_nick}"><br/><br/>


작성자 : ${sessionScope.MEMBER.me_name}(${sessionScope.MEMBER.me_email})<br/>


제목 : <input type="text" name="bo_title"><br/>
내용 : <input type="text" name="bo_content"><br/>

<input type="button" id="faqWriteSubmitBtn" value="제출">
</form>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>