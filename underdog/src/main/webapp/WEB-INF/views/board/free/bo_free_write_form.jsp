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
			<h2>게시글 쓰기</h2>

			<form action="/registerProc" method="post">


				<div class="container-fluid">
					<div class="row">
						<div class="col-md-2 text-center">이름</div>
						<div class="col-md-3">
							<input type="text" class="form-control" id="name" name="name"
								value="">
						</div>
					</div>
					<div class="row ">
						<div class="col-md-2 text-center">제 목</div>
						<div class="col-md-6">
							<input type="text" class="form-control" id="subject"
								name="subject">
						</div>
					</div>
				</div>
				<div class="row mar_t20">
					<textarea id="contents" class="textarea_fixed" name="content"
						rows="10" cols="60"></textarea>
					<script type="text/javascript">
						CKEDITOR.replace('contents');
					</script>
				</div>
				<div class="row mar_t20">
					<div class="col-md-offset-4 col-md-1">
						<button type="submit" class="btn btn-success">글 등록</button>
					</div>
					<div class="col-md-offset-2 col-md-1">
						<button type="reset" class="btn btn-success"
							onclick="location.href='/bo_free_list'">글 취소</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>