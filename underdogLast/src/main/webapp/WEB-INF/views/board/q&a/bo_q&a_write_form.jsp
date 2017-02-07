<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/nav.jsp"%>

<script>
	$(function(){
		$('#qnaWriteSubmitBtn').click(function(){
			var f = $('#qnaWriteSubmitFrm');
			
			f.attr('method', 'POST');
			f.attr('action', "/board/registerProc");
			f.submit();
		})
	})
	
* {
	padding: 0;
	margin: 0;
}

.textarea_fixed {
	resize: none !important;
}

.bbsWriteForm {
	width: 800px;
	margin: 50px auto;
}

.mar_t20 {
	margin-top: 20px;
}

.bbsWriteForm {
	font-size: 12px !important;
}	
</script>

<script type="text/javascript" src="/resources/ckeditor_full/ckeditor.js"></script>



<div class="container" style="padding-bottom: 50px;">
	<div>
		<div class="bbsWriteForm" >
			<form id="qnaWriteSubmitFrm">
			
<input type="hidden" name="bo_bbsid" value="04"><br/>
<input type="hidden" name="bo_me_email" value="${sessionScope.MEMBER.me_email}">
<input type="hidden" name="bo_me_nick" value="${sessionScope.MEMBER.me_nick}">
			
			<h2>Q & A 글쓰기</h2>
			</br>
					<div class="container-fluid">
					<div class="row">
						<div class="col-md-2 text-center">이름</div>
						<div class="col-md-3">
							${sessionScope.MEMBER.me_name}(${sessionScope.MEMBER.me_email})
						</div>
					</div>
					</br>
					<div class="row ">
						<div class="col-md-2 text-center">제 목</div>
						<div class="col-md-6">
							<input type="text" class="form-control" id="bo_title"
								name="bo_title">
						</div>
					</div>
				</div>
				</br>
				<div class="row mar_t20">
					<textarea id="bo_content" class="textarea_fixed" name="bo_content"
						rows="10" cols="60"></textarea>
				 	<script type="text/javascript">
						CKEDITOR.replace('bo_content');
					</script> 
				</div>
				<div class="row mar_t20">
					<div class="col-md-offset-4 col-md-1">
						<button type="submit" class="btn btn-default" id="qnaWriteSubmitBtn">글 등록</button>
					</div>
					<div class="col-md-offset-2 col-md-1">
						<button type="reset" class="btn btn-default"
							onclick="location='/board/slist?page=${cri.page }&perPageNum=${cri.perPageNum }&bo_bbsid=${cri.bo_bbsid}&bo_idx=${cri.bo_idx }&keyword=${cri.keyword }&searchType=${cri.searchType }'">목록으로</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>



<%@ include file="/WEB-INF/views/include/footer.jsp"%>