<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/include/nav.jsp"%>

<script>
$(function(){

	// 댓글 submit
	$('#replySmitBtn').click(function(){
		
		var f = $('#replySmitFrm');
		f.attr('method', 'POST');
		f.attr('action', "/reply/registerProc");
		f.submit();
		
	})
	
})
</script>
<br/>
게시판 번호 : ${board.bo_idx } <br/>
회원 이메일 : ${board.bo_me_email } <br/>
게시판 아이디 : ${board.bo_bbsid} <br/>
회원 닉네임 : ${board.bo_me_nick } <br/>
제목 : ${board.bo_title } <br/>
본문 : ${board.bo_content } <br/>
조회수 : ${board.bo_hit } <br/>
게시일자: ${board.bo_regdate }<br/>
아이피 : ${board.bo_regip } <br/>

<input type="button" value="목록으로" onclick="location='/board/slist?page=${data.page }&perPageNum=${data.perPageNum }&bo_bbsid=${data.bo_bbsid}&bo_idx=${data.bo_idx }&keyword=${data.keyword }&searchType=${data.searchType }'">
<br/>
<c:if test="${sessionScope.MEMBER.me_email == board.bo_me_email}">
<input type="button" value="수정폼으로" onclick="location='/board/board_cont?page=${data.page }&perPageNum=${data.perPageNum }&bo_bbsid=${data.bo_bbsid}&bo_idx=${data.bo_idx }&keyword=${data.keyword }&searchType=${data.searchType }&state=modify'"/>
<input type="button" value="삭제하기" onclick="location='/board/delProc?page=${data.page }&perPageNum=${data.perPageNum }&bo_idx=${board.bo_idx }&bo_bbsid=${board.bo_bbsid}&keyword=${data.keyword }&searchType=${data.searchType }'"/>
</c:if>
<br/>



 <%-- 댓글 입력폼 --%>
 <form id="replySmitFrm">
 <input type="text" name="page" value="${data.page }"/><br/>
 <input type="text" name="perPageNum" value="${data.perPageNum }"/><br/>
 <input type="text" name="bo_idx" value="${data.bo_idx }"/><br/>
 <input type="text" name="bo_bbsid" value="${data.bo_bbsid }"/><br/>
 <input type="text" name="keyword" value="${data.keyword }"/><br/>
 <input type="text" name="searchType" value="${data.searchType }"/><br/>
      

작성자 이메일(히든으로 할것)<input type="text" name="re_me_email" value="${sessionScope.MEMBER.me_email }"/>
게시글 번호(히든으로 할것)  <input type="text" name="re_bo_idx" value="${data.bo_idx }"/>
  
  <table border="1" width="550">
   <tr>
    <td colspan="2">댓글(댓글수: ) 작성자 : ${sessionScope.MEMBER.me_nick }(${sessionScope.MEMBER.me_email })</td>
   </tr>  
   <tr>
    <th>
     <textarea name="re_content" rows="5" cols="50"></textarea>
    </th>
    <th>
     <input type="button" id="replySmitBtn" value="댓글달기" />
    </th>
   </tr>
  </table>
 </form>
 
 
 <%--댓글 목록 --%>
<%--  <table align="center" border="0">
  <c:if test="${!empty clist}">
  <c:forEach var="c" items="${clist}">
  <tr>
   <th>${c.comment_name}</th>
   <td>${fn:substring(c.comment_date,0,16)}
   <span id="com_del">
   <a href="javascript:com_del_ok(${c.comment_no},${c.g_no});" 
   onfocus="this.blur();">삭제</a></span>
   onfocus="this.blur();" ie 웹브라우저 계열에서 하이퍼링크 걸린곳
   클릭시 생기는 사각점선을 사라지게 한다. 삭제를 클릭시 com_del_ok()함수를
   호출
   </td>
   jstl substring을 사용하여 0이상 16미만 사이의 년월일 시분 까지만
   출력한다.
  </tr>
  <tr>
   <td colspan="2">
   ${c.comment_cont}
   </td>
  </tr>
  </c:forEach>
  </c:if>
 </table> --%>









<%@ include file="/WEB-INF/views/include/footer.jsp"%>
