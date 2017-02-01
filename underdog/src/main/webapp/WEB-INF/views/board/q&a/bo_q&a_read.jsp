<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/include/nav.jsp"%>

<script>
$(function(){
		callCommentList()
	
		 $("#btnCommentEntry").click(function(){
				tryCommentEntry();
			});
		 
	
});



 function callCommentList(){
	 		
				$.post("/reply/reply_cont",
				{
					re_bo_idx : '${cri.bo_idx}'
				},
				function(data){
					$("#commentWrap").html(data);
					$("#comment_content").val("");
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

==========================================================
<br />


<form method="post">
<div id="commentWrap"></div>
	<div id="commentTitle">댓글</div>
	<div id="commentWriteWrap">
		<div id="commentTextarea">
			<textarea name="comment_content" id="comment_content"></textarea>
		</div>
		<div id="commentButton">
			<button type="button" id="btnCommentEntry">댓글등록</button>
		</div>
		<div style="clear: both;"></div>
	</div>
</div>
</div>
</form>








		<%@ include file="/WEB-INF/views/include/footer.jsp"%>