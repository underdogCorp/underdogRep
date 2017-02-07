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


<script type="text/javascript" src="/resources/ckeditor_full/ckeditor.js"></script>

<div class="container" style="padding-bottom: 50px;"><div>
		<div class="bbsWriteForm" >
			<form id="qnaModifySubmitFrm">
			

<input type="hidden" name="bo_idx" value="${cri.bo_idx }"/>
<input type="hidden" name="bo_bbsid" value="${cri.bo_bbsid }"/> 
<input type="hidden" name="page" value="${cri.page }"/> 
<input type="hidden" name="perPageNum" value="${cri.perPageNum }"/>
<input type="hidden" name="keyword" value="${cri.keyword }"/>
<input type="hidden" name="searchType" value="${cri.searchType }"/>
			
			<h2>Q & A 수정</h2>
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
							<input type="text" name="bo_title" value="${board.bo_title }"/>
						</div>
					</div>
				</div>
				</br>
				<div class="row mar_t20">
					<textarea id="bo_content" class="textarea_fixed" name="bo_content" 
						rows="10" cols="60">${board.bo_content }</textarea>
				 	<script type="text/javascript">
						CKEDITOR.replace('bo_content');
					</script> 
				</div>
				<div class="row mar_t20">
					<div class="col-md-offset-6" >
						</br><input type="button" class="btn btn-default" id="qnaModifySubmitBtn" value="수정하기" />
					</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
























<%@ include file="/WEB-INF/views/include/footer.jsp"%>
