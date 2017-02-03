<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/include/nav.jsp"%>

<script>

$(function(){
	$('#qnaModifySubmitBtn').click(function(){
		var f = $('#qnaModifySubmitFrm');
		f.attr('method', 'POST');
		f.attr('action', "/board/modifyProc")
		f.submit();
	})
})

</script>
<div class="container" style="padding-bottom: 50px;">
<form id="qnaModifySubmitFrm">
히든으로 넘길 값들 <br/>
게시판 번호 : <input type="text" name="bo_idx" value="${cri.bo_idx }"/> <br/>
게시판 아이디 : <input type="text" name="bo_bbsid" value="${cri.bo_bbsid }"/> <br/>
페이지 : <input type="text" name="page" value="${cri.page }"/> <br/>
페이지당게시물수 : <input type="text" name="perPageNum" value="${cri.perPageNum }"/> <br/>
키워드 : <input type="text" name="keyword" value="${cri.keyword }"/> <br/>
검색타입 : <input type="text" name="searchType" value="${cri.searchType }"/> <br/>

=======================================================================
<br/>


게시판 번호 : ${board.bo_idx } <br/>
회원 이메일 : ${board.bo_me_email } <br/>
게시판 아이디 : ${board.bo_bbsid} <br/>
회원 닉네임 : ${board.bo_me_nick } <br/>
제목 : <input type="text" name="bo_title" value="${board.bo_title }"/> <br/>
본문 : <input type="text" name="bo_content" value="${board.bo_content }"/> <br/>
조회수 : ${board.bo_hit } <br/>
게시일자: ${board.bo_regdate } <br/>
아이피 : ${board.bo_regip } <br/>
</form>
<input type="button" id="qnaModifySubmitBtn" value="수정하기" />

</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
