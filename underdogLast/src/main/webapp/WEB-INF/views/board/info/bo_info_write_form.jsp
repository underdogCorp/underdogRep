<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/nav.jsp"%>

<div class="container" style="padding-bottom: 50px; padding-top: 50px;">
	<!-- //이메일 입력 폼 -->

	<form>
		<div class="form-group">
			<label for="email">작성자</label> <input type="email"
				class="form-control" name="email" id="email"
				placeholder="Enter email">
		</div>

		<!-- //글제목 입력 폼 -->
		<div class="form-group">
			<label for="subject">제목</label> <input type="text"
				class="form-control" name="subject" id="subject"
				placeholder="Enter title">
		</div>

		<!-- //글내용 입력 폼  -->
		<div class="form-group">
			<label for="content">내용:</label>
			<textarea class="form-control" rows="10" name="content" id="content"></textarea>

		</div>
		<div class="row mar_t20">
			<div class="col-md-offset-4 col-md-1">
				<button type="submit" class="btn btn-default">글 등록</button>
			</div>
			<div class="col-md-offset-2 col-md-1">
				<button type="reset" class="btn btn-default"
					onclick="location.href=''">글 취소</button>
			</div>
		</div>
</div>
</form>



























<%@ include file="/WEB-INF/views/include/footer.jsp"%>