<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/include/nav.jsp"%>

<script>
$(function(){
		 
		 $("#btnCommentEntry").click(function(){
				tryCommentEntry();
			});
		 
		 
		 
		 
	// 댓글 submit
/* 	$('#replySmitBtn').click(function(){
		
		var f = $('#replySmitFrm');
		f.attr('method', 'POST');
		f.attr('action', "/reply/registerProc");
		f.submit();
		
	}) */
	
});



 function callCommentList(){
	 		
				$.post("/reply/reply_cont",
				{
					re_bo_idx : '${cri.bo_idx}'
				},
				function(data){
					alert("리스트나와라");
					$("#commentWrap").html(data);
					
					$("#btnCommentEntry").click(function(){
						tryCommentEntry();
					});
				});
			}

function tryCommentEntry(){
		if($("#comment_content").val()==""){
					alert("댓글 내용을 기입하여 주십시오.");
					$("#comment_content").focus();
					return;
				}
				
			$.post("/reply/registerProc",
				{
					 re_bo_idx : '${cri.bo_idx}'
					, re_me_email : '${board.bo_me_email}'
					, comment_content : $("#comment_content").val()
				},
				function(data){
					
					callCommentList();
				});
			}


			function callCommentReplyForm(idx){
			<c:choose>
				<c:when test="${sessionScope.SS_USER_ID == null}">
				alert("먼저 로그인 후, 댓글 등록이 가능합니다.");
				
				return;
				</c:when>
				<c:otherwise>
				$.post("/bbsCommentReplyForm.sj",
				{
					comment_idx : idx
				},
				function(data){
					if(data){
						cancelModifyComment();
						cancelReplyComment();
						
						$("#comment_reply_" + idx).html(data);
						$("#comment_reply_" + idx).show();
						$("#comment_re_content").focus();
					}
					else{
						returnToLogin();
					}
				});
				</c:otherwise>
			</c:choose>
			}

			function cancelReplyComment(){
				$("[id^=comment_reply_]").html("");
				$("[id^=comment_reply_]").hide();
			}

			function tryReplyComment(){
				if($("#comment_re_content").val()==""){
					alert("답글 내용을 작성해주세요.");
					$("#comment_re_content").focus();
					return;
				}

				$.post("/bbsCommentReplyExec.sj",
				{
					comment_idx : $("#comment_idx").val()
					, comment_content : $("#comment_re_content").val()
				},
				function(data){
					callCommentList();
				});
			}

			function callCommentModifyForm(idx){
				$.post("/bbsCommentModifyForm.sj",
				{
					bbsid : '${post.BB_BBSID}'
					, comment_idx : idx
				},
				function(data){
					cancelModifyComment();
					cancelReplyComment();
					
					$("#comment_" + idx).hide();
					$("#comment_modify_" + idx).html(data);
					$("#comment_modify_" + idx).show();
				});
			}

			function cancelModifyComment(){
				$("[id^=comment_modify_]").html("");
				$("[id^=comment_modify_]").hide();
				$(".commentItem").show();
			}

			function tryModifyComment(){
				if($("#comment_mod_content").val()==""){
					alert("댓글 내용을 작성해주세요.");
					$("#comment_mod_content").focus();
					return;
				}

				$.post("/bbsCommentModifyExec.sj",
				{
					bbsid : '${post.BB_BBSID}'
					, comment_idx : $("#comment_idx").val()
					, comment_content : $("#comment_mod_content").val()
				},
				function(data){
					callCommentList();
				});
			}

			function tryDeleteComment(cidx, bidx){
				var ask = confirm("이 댓글을 정말 삭제하시겠습니까?");

				if(ask){
					$.post("/bbsCommentDeleteExec.sj",
					{
						bbsid : '${post.BB_BBSID}'
						, comment_idx : cidx
						, bbs_idx : bidx
					},
					function(data){
						if(data=="LOGOUT"){
							alert("로그인이 해제되어 정상적으로 삭제되지 않았습니다.");
							returnToLogin();
						}
						else{
							callCommentList();
						}
					});
				}
			}


</script>
<br />
게시판 번호 : ${board.bo_idx }
<br />
회원 이메일 : ${board.bo_me_email }
<br />
게시판 아이디 : ${board.bo_bbsid}
<br />
회원 닉네임 : ${board.bo_me_nick }
<br />
제목 : ${board.bo_title }
<br />
본문 : ${board.bo_content }
<br />
조회수 : ${board.bo_hit }
<br />
게시일자: ${board.bo_regdate }
<br />
아이피 : ${board.bo_regip }
<br />






<input type="button" value="목록으로"
	onclick="location='/board/slist?page=${cri.page }&perPageNum=${cri.perPageNum }&bo_bbsid=${cri.bo_bbsid}&bo_idx=${cri.bo_idx }&keyword=${cri.keyword }&searchType=${cri.searchType }'">
<br />
<c:if test="${sessionScope.MEMBER.me_email == board.bo_me_email}">
	<input type="button" value="수정폼으로"
		onclick="location='/board/board_cont?page=${cri.page }&perPageNum=${cri.perPageNum }&bo_bbsid=${cri.bo_bbsid}&bo_idx=${cri.bo_idx }&keyword=${cri.keyword }&searchType=${cri.searchType }&state=modify'" />
	<input type="button" value="삭제하기"
		onclick="location='/board/delProc?page=${cri.page }&perPageNum=${cri.perPageNum }&bo_idx=${cri.bo_idx }&bo_bbsid=${cri.bo_bbsid}&keyword=${cri.keyword }&searchType=${cri.searchType }'" />
</c:if>
<br />

댓글==========================================================
<br />





<form method="post">
<div id="commentWrap"></div>
	<div id="commentTitle">Comments</div>
	<div id="commentWriteWrap">
		<div id="commentTextarea">
			<textarea name="comment_content" id="comment_content"></textarea>
		</div>
		<div id="commentButton">
			<button type="button" id="btnCommentEntry">댓글등록</button>
		</div>
		<div style="clear: both;"></div>
	</div>
	<%-- 	<div id="commentListWrap">
		<c:if test="${comments.stream().count() == 0}">
			<div class="fGray center">등록된 댓글이 없습니다.</div>
		</c:if>
		<c:forEach items="${comments}" var="comment">
			<div class="commentItem" id="comment_${comment.BC_IDX}"
				style="padding-left:${comment.BC_LEVEL * 30}px;">
				<table>
					<tr>
						<td
							class="imgWrap<c:if test="${comment.BC_LEVEL > 0}"> replyIcon</c:if>">
						</td>
						<td class="contentWrap">
							<div class="commentName">${comment.BC_ME_NAME}
								(${comment.BC_ME_ID})</div>
							<div class="commentDate">${fn:replace(fn:substring(comment.BC_REGDATE, 0, 16), "-", ".")}</div>
							<c:if test="${comment.BC_STATUS == '0'}">
								<div class="commentContent fGray">삭제된 댓글입니다.</div>
							</c:if> <c:if test="${comment.BC_STATUS != '0'}">
								<div class="commentContent">${fn:replace(comment.BC_COMMENT, enter, '<br />')}</div>
								<div class="commentBtn">
									<button type="button" class="tBtn bBlue"
										onclick="callCommentReplyForm(${comment.BC_IDX});">답글</button>
									<c:if test="${comment.BC_ME_ID == sessionScope.SS_USER_ID}">
										<button type="button" class="tBtn bBrown"
											onclick="callCommentModifyForm(${comment.BC_IDX});">수정</button>
										<button type="button" class="tBtn bRed"
											onclick="tryDeleteComment(${comment.BC_IDX}, ${post.BB_IDX});">삭제</button>
									</c:if>
								</div>
							</c:if>
						</td>
					</tr>
				</table>
			</div>
			<div class="commentModifyItem" id="comment_modify_${comment.BC_IDX}"
				style="padding-left:${comment.BC_LEVEL * 30}px;display:none;"></div>
			<div class="commentReplyItem" id="comment_reply_${comment.BC_IDX}"
				style="padding-left:${comment.BC_LEVEL * 30}px;display:none;"></div>
		</c:forEach>
	</div> --%>
</div>
</div>
</form>

<div class="tm20">
	<div style="float: left;">
		<a
			href="/bbsList.sj?bbsid=${param.bbsid}&page=${param.page}&sKeyword=${param.sKeyword}"><button
				class="lBtn bGray" id="btnList">목록</button></a>








		<%-- 댓글 입력폼 --%>
		<form id="replySmitFrm" method="post">
			<input type="text" name="page" value="${cri.page }" /><br /> <input
				type="text" name="perPageNum" value="${cri.perPageNum }" /><br />
			<input type="text" name="bo_idx" value="${cri.bo_idx }" /><br /> <input
				type="text" name="bo_bbsid" value="${cri.bo_bbsid }" /><br /> <input
				type="text" name="keyword" value="${cri.keyword }" /><br /> <input
				type="text" name="searchType" value="${cri.searchType }" /><br />
			<input type="text" name="state" value="${cri.state }" /><br /> 작성자
			이메일(히든으로 할것)<input type="text" name="re_me_email"
				value="${sessionScope.MEMBER.me_email }" /> 게시글 번호(히든으로 할것) <input
				type="text" name="re_bo_idx" value="${cri.bo_idx }" />

			<table border="1" width="550">
				<tr>
					<td colspan="2">댓글(댓글수: ) 작성자 : ${sessionScope.MEMBER.me_nick }(${sessionScope.MEMBER.me_email })</td>
				</tr>
				<tr>
					<th><textarea name="re_content" id="re_content" rows="5"
							cols="50"></textarea></th>
					<th><input type="button" id="replySmitBtn" value="댓글달기" /></th>
				</tr>
			</table>
		</form>


		<%--댓글 목록 --%>
		<%-- <c:forEach var="rList" items="${rList } ">
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
</c:forEach>  --%>







		<%@ include file="/WEB-INF/views/include/footer.jsp"%>