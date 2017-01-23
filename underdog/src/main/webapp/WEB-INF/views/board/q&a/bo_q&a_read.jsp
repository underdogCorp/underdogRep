<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/include/nav.jsp"%>

<script>
$(function(){
	
	$('#qnaWriteSubmitBtn').click(function(){
		
		board_check();
		
		var f = $('#qnaWriteSubmitFrm');
		f.attr('method', 'POST');
		f.attr('action', "/board/registerProc");
		f.submit();
		
	})
	
	
})
</script>
<br/>
${data.page }
${data.perPageNum }

게시판 번호 : ${board.bo_idx } <br/>
회원 이메일 : ${board.bo_me_email } <br/>
게시판 아이디 : ${board.bo_bbsid} <br/>
회원 닉네임 : ${board.bo_me_nick } <br/>
제목 : ${board.bo_title } <br/>
본문 : ${board.bo_content } <br/>
조회수 : ${board.bo_hit } <br/>
게시일자: ${board.bo_regdate }<br/>
아이피 : ${board.bo_regip } <br/>

<input type="button" value="목록으로" onclick="location='/board/listPage?page=${data.page }&perPageNum=${data.perPageNum }&bo_bbsid=${data.bo_bbsid}&bo_idx=${data.bo_idx }'">
<br/>
<c:if test="${sessionScope.MEMBER.me_email == board.bo_me_email}">
<input type="button" value="수정폼으로" onclick="location='/board/board_cont?page=${data.page }&perPageNum=${data.perPageNum }&bo_bbsid=${data.bo_bbsid}&bo_idx=${data.bo_idx }&state=modify'"/>
<input type="button" id="q&aDelBtn" value="삭제하기" onclick="location='/board/delProc?bo_idx=${board.bo_idx }&bo_bbsid=${board.bo_bbsid}'"/>
</c:if>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
