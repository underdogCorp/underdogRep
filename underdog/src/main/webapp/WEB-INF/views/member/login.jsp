<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/resources/js/member.js"></script>

</head>
<body>
<br>
<br>
<br>
<br>

	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title" style="text-align:center">로그인 하세요</h3>
			            <p class="form-control-static" style="color:red; display:none" id="txt_loginResult"></p>
					</div>
					<div class="panel-body">
						<form id="formLoginData">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="e-mail을 입력하세요" name="me_email" type="text">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Password를 입력 하세요" name="me_pw" type="password">
								</div>
								<div class="checkbox">
									<label><input name="remember" type="checkbox">암호를 저장합니다</label>
								</div>
								<input class="btn btn-lg btn-success btn-block" id="btn_login" type="button" value="로그인">
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>