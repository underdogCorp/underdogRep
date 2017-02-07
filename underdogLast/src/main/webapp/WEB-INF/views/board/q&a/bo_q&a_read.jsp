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
					, re_content : $("#comment_content").val()
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

<script type="text/javascript" src="/resources/ckeditor_full/ckeditor.js"></script>

<div class="container" style="padding-bottom: 50px;">

		<div class="bbsWriteForm" >
			<form id="qnaWriteSubmitFrm">
			
<input type="hidden" name="bo_bbsid" value="04"><br/>
<input type="hidden" name="bo_me_email" value="${sessionScope.MEMBER.me_email}">
<input type="hidden" name="bo_me_nick" value="${sessionScope.MEMBER.me_nick}">
			
			<h2>Q & A 글쓰기</h2>
			</br>
					<div class="container-fluid">
					<div class="row">
						<div class="col-md-2 text-center">게시판번호</div>
						<div class="col-md-3">
							${board.bo_idx }
						</div>
					</div>
					</br>

										<div class="row">
						<div class="col-md-2 text-center">게시판아이디</div>
						<div class="col-md-3">
							${board.bo_bbsid}
						</div>
					</div>
					</br>
					
										<div class="row">
						<div class="col-md-2 text-center">조회수</div>
						<div class="col-md-3">
							${board.bo_hit }
						</div>
					</div>
					</br>
					
										<div class="row">
						<div class="col-md-2 text-center">게시일자</div>
						<div class="col-md-3">
							${board.bo_regdate }
						</div>
					</div>
					</br>
					
										<div class="row">
						<div class="col-md-2 text-center">아이피</div>
						<div class="col-md-3">
							${board.bo_regip }
						</div>
					</div>
					</br>
					
															<div class="row">
						<div class="col-md-2 text-center">작성자</div>
						<div class="col-md-3">
							${board.bo_me_nick }(${board.bo_me_email })
						</div>
					</div>
					</br>
					
					<div class="row ">
						<div class="col-md-2 text-center">제 목</div>
						<div class="col-md-6">
							${board.bo_title }
						</div>
					</div>
				</div>
				</br>
				<div class="row mar_t20">
					<textarea id="bo_content" class="textarea_fixed" name="bo_content" readonly
						rows="10" cols="60">${board.bo_content }</textarea>
				 	<script type="text/javascript">
						CKEDITOR.replace('bo_content');
					</script> 
				</div>
				<div class="row mar_t20">
					<div class="col-md-offset-4" >
						<button type="submit" class="btn btn-default" id="qnaWriteSubmitBtn">글 등록</button>
						
					<c:if test="${sessionScope.MEMBER.me_email == board.bo_me_email}">
						<input type="button" value="수정폼으로" class="btn btn-default"
						onclick="location='/board/board_cont?page=${cri.page }&perPageNum=${cri.perPageNum }&bo_bbsid=${cri.bo_bbsid}&bo_idx=${cri.bo_idx }&keyword=${cri.keyword }&searchType=${cri.searchType }&state=modify'" />

					<input type="button" value="삭제하기" class="btn btn-default"
						onclick="location='/board/delProc?page=${cri.page }&perPageNum=${cri.perPageNum }&bo_idx=${cri.bo_idx }&bo_bbsid=${cri.bo_bbsid}&keyword=${cri.keyword }&searchType=${cri.searchType }'" />
					</c:if>
						<button type="reset" class="btn btn-default"
							onclick="location='/board/slist?page=${cri.page }&perPageNum=${cri.perPageNum }&bo_bbsid=${cri.bo_bbsid}&bo_idx=${cri.bo_idx }&keyword=${cri.keyword }&searchType=${cri.searchType }'">목록으로</button>
					</div>
					</div>
				</div>
			</form>
			</div>
		</div>



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
			<button type="button" id="btnCommentEntry" class="btn btn-default">댓글등록</button>
		</div>
		<div style="clear: both;"></div>
	</div>
</form>








		<%@ include file="/WEB-INF/views/include/footer.jsp"%>