<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<script src="http://dmaps.daum.net/map_js_init/postcode.js"></script>
<script type="text/javascript"
	src="/resources/ckeditor_full/ckeditor.js"></script>
<style type="text/css">
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
</style>




</head>
<body>
	<div>
		<div class="bbsWriteForm">
			<h2>자유 게시판 글쓰기</h2>
			<br>

			<form action="/board/registerProc" method="post">
			<input type="hidden" name="bo_me_email" value="${sessionScope.MEMBER.me_email}">
			<input type="hidden" name="bo_bbsid" value="2">
					<div class="container-fluid">
					<div class="row">
						<div class="col-md-2 text-center">이름</div>
						<div class="col-md-3">
							<input type="text" class="form-control" id="bo_me_nick" name="bo_me_nick" 
							value="${sessionScope.MEMBER.me_nick}">
						</div>
					</div>
					<div class="row ">
						<div class="col-md-2 text-center">제 목</div>
						<div class="col-md-6">
							<input type="text" class="form-control" id="bo_title"
								name="bo_title">
						</div>
					</div>
				</div>
				<div class="row mar_t20">
					<textarea id="bo_content" class="textarea_fixed" name="bo_content"
						rows="10" cols="60"></textarea>
				 	<script type="text/javascript">
						CKEDITOR.replace('bo_content');
					</script> 
				</div>
				<div class="row mar_t20">
					<div class="col-md-offset-4 col-md-1">
						<button type="submit" class="btn btn-default">글 등록</button>
					</div>
					<div class="col-md-offset-2 col-md-1">
						<button type="reset" class="btn btn-default"
							onclick="location.href='/board/list?bbsid=02'">글 취소</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>