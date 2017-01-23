<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
/* Set height of the grid so .sidenav can be 100% (adjust if needed) */
.row.content {
	height: 1500px
}

/* Set gray background color and 100% height */
.sidenav {
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}

h2 {
	margin-left: 50px;
}
</style>
<script>
	function member_view() {
		document.getElementById("memberInfo").style.display = 'block';
		document.getElementById("basketInfo").style.display = 'none';
		document.getElementById("orderInfo").style.display = 'none';
		document.getElementById("myboardInfo").style.display = 'none';
	}
	function basket_view() {
		document.getElementById("basketInfo").style.display = 'block';
		document.getElementById("memberInfo").style.display = 'none';
		document.getElementById("orderInfo").style.display = 'none';
		document.getElementById("myboardInfo").style.display = 'none';
	}
	function order_view() {
		document.getElementById("orderInfo").style.display = 'block';
		document.getElementById("memberInfo").style.display = 'none';
		document.getElementById("myboardInfo").style.display = 'none';
		document.getElementById("basketInfo").style.display = 'none';

	}
	function myboard_view() {
		document.getElementById("myboardInfo").style.display = 'block';
		document.getElementById("memberInfo").style.display = 'none';
		document.getElementById("orderInfo").style.display = 'none';
		document.getElementById("basketInfo").style.display = 'none';

	}
</script>


</head>
<body>
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-2 sidenav">
				<h4>마이 페이지</h4>
				<ul class="nav nav-pills nav-stacked">
					<li><a onclick="member_view()">회원정보</a></li>
					<li><a onclick="basket_view()">장바구니</a></li>
					<li><a onclick="order_view()">구입목록</a></li>
					<li><a onclick="myboard_view()">내가쓴글</a></li>
				</ul>
				<br>

			</div>

			<div class="col-sm-9">
				<h2>회원정보 보기</h2>

				<div id="memberInfo" style="display: none;">
					<table class="table">
						<thead>
							<tr>
								<th>이름</th>
								<th>닉네임</th>
								<th>생년월일</th>
								<th>회원가입일</th>
								<th>회원등급</th>
								<th>포인트</th>
								<th>주소</th>
								<th>상세주소</th>
							</tr>
						</thead>
						<tbody>

							<tr>
								<td>${memberInfo.me_name}</td>
								<td>${memberInfo.me_nick}</td>
								<td>${memberInfo.me_birth}</td>
								<td>${memberInfo.me_regdate}</td>
								<td>${memberInfo.me_grade}</td>
								<td>${memberInfo.me_point}</td>
								<td>${memberInfo.me_add1}</td>
								<td>${memberInfo.me_add2}</td>
							</tr>
						</tbody>
					</table>
					<span style="float: right">
						<button type="submit" class="btn btn-warning right">수정하기</button>
						<button type="submit" class="btn btn-default right">수정취소</button>
					</span> <br>
				</div>
				<hr>
				<br>

				<h2>장바구니 내역 보기</h2>

				<div id="basketInfo" style="display: none;">
					<table class="table">
						<thead>
							<tr>
								<th>상품 정보</th>
								<th>고용 형태</th>
								<th>고용 기간</th>
								<th>상품 가격</th>
								<th>상품 담은 날자</th>
							</tr>
						</thead>
						<tbody>

							<tr>
								<td>회사와 함께 성장하겠습니다</td>
								<td>연봉</td>
								<td>3년</td>
								<td>3800만원</td>
								<td>2017/2/7</td>
							</tr>

						</tbody>
					</table>



					<h3>합계금액</h3>
					<span style="float: right">
						<button type="submit" class="btn btn-danger">주문하기</button>
						<button type="submit" class="btn btn-default right">주문취소</button>
					</span> <br>
				</div>
				<hr>
				<br>

				<h2>구입 목록 보기</h2>

				<div id="orderInfo" style="display: none;">
					<table class="table">
						<thead>
							<tr>
								<th>상품 정보</th>
								<th>상품 가격</th>
								<th>상품 기간</th>
								<th>결제 날자</th>
								<th>연락처</th>
							</tr>
						</thead>
						<tbody>

							<tr>
								<td>오 현 택</td>
								<td>3500만원</td>
								<td>3년</td>
								<td>2017/3/2</td>
								<td>01033314479</td>
							</tr>

						</tbody>
					</table>
					<br>
				</div>
				<hr>
				<br>

				<h2>내가 쓴글 보기</h2>
				<div id="myboardInfo" style="display: none;">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>제목</th>
								<th>닉네임</th>
								<th>이메일</th>
								<th>날짜</th>
							</tr>
						</thead>
						<tbody>

							<tr>
								<td><a>title</a></td>
								<td>nick</td>
								<td>n@n</td>
								<td>2017</td>
							</tr>

						</tbody>
					</table>
				</div>
				<hr>
				<br>

			</div>
</body>
</html>