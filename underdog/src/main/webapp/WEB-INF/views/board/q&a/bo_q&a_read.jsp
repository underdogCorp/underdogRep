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

<input type="button" value="목록으로" onclick="location='/board/slist?page=${cri.page }&perPageNum=${cri.perPageNum }&bo_bbsid=${cri.bo_bbsid}&bo_idx=${cri.bo_idx }&keyword=${cri.keyword }&searchType=${cri.searchType }'">
<br/>
<c:if test="${sessionScope.MEMBER.me_email == board.bo_me_email}">
<input type="button" value="수정폼으로" onclick="location='/board/board_cont?page=${cri.page }&perPageNum=${cri.perPageNum }&bo_bbsid=${cri.bo_bbsid}&bo_idx=${cri.bo_idx }&keyword=${cri.keyword }&searchType=${cri.searchType }&state=modify'"/>
<input type="button" value="삭제하기" onclick="location='/board/delProc?page=${cri.page }&perPageNum=${cri.perPageNum }&bo_idx=${cri.bo_idx }&bo_bbsid=${cri.bo_bbsid}&keyword=${cri.keyword }&searchType=${cri.searchType }'"/>
</c:if>
<br/>

댓글==========================================================<br/>

 <%-- 댓글 입력폼 --%>
 <form id="replySmitFrm">
 <input type="text" name="page" value="${cri.page }"/><br/>
 <input type="text" name="perPageNum" value="${cri.perPageNum }"/><br/>
 <input type="text" name="bo_idx" value="${cri.bo_idx }"/><br/>
 <input type="text" name="bo_bbsid" value="${cri.bo_bbsid }"/><br/>
 <input type="text" name="keyword" value="${cri.keyword }"/><br/>
 <input type="text" name="searchType" value="${cri.searchType }"/><br/>
 <input type="text" name="state" value="${cri.state }"/><br/>  

작성자 이메일(히든으로 할것)<input type="text" name="re_me_email" value="${sessionScope.MEMBER.me_email }"/>
게시글 번호(히든으로 할것)  <input type="text" name="re_bo_idx" value="${cri.bo_idx }"/>
  
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
<c:forEach var="rList" items="${rList } ">
  <table border="1" width="550">
   <tr>
    <td colspan="2">댓글(댓글수: ) 작성자 : ${rList.re_me_email }</td>
   </tr>  
   <tr>
    <th>
     <td>${rList.re_content }</td>
    </th>
    <th>
     <input type="button" id="replySmitBtn" value="댓글달기" />
    </th>
   </tr>
  </table>
</c:forEach>







<%@ include file="/WEB-INF/views/include/footer.jsp"%>
