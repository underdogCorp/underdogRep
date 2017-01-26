<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니</title>

<!-- css 등 head 부분, 나중에 nav에 넣을 것. 일단은 임시로... -->
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
</head>

<!-- css 등 head 부분, 나중에 nav에 넣을 것. 일단은 임시로... -->
<!-- nav 안에서 body 태그 열었음. -->
<%@ include file="/WEB-INF/views/include/nav.jsp"%>

=== 임시 출력 확인 ===
<table align="center" border="1">
	<thead>
	<tr>
		<th>111번호</th>
		<th>구매자 회원 이메일</th>
		<th>상품 번호</th>
		<th>고용 기간</th>
		<th>기간 수</th>
		<th>단가</th>
		<th>청구 금액</th>
		<th>상품 담은 날</th>
	</tr>
	</thead>

<c:forEach items="${basket}" var="list">
	<tr>
		<td>${list.ba_idx }</td>
		<td>${list.ba_me_email }</td>
		<td>${list.ba_pr_idx }</td>
		<td>${list.ba_termsort }</td>
		<td>${list.ba_termnum }</td>
		<td>${list.ba_price }</td>
		<td>${list.ba_sum }</td>
		<td>${list.ba_regdate }</td>
	</tr>
</c:forEach>
</table>
=== 임시 출력 확인 ===


<div class="container-fluid">
	<div class="row content">
		<div class="col-sm-9">
			<br>
			<h2>장바구니 내역 보기</h2>
			<div id="basketInfo">
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
<c:forEach items="${basket}" var="basket">
						<tr>
							<td>${basket.ba_pr_idx }</td>
							<td>${basket.ba_termsort }</td>
							<td>${basket.ba_termnum }</td>
							<td>${basket.ba_sum }</td>
							<td>${basket.ba_regdate }</td>
						</tr>
</c:forEach>
					</tbody>
				</table>

<!-- if 혹은 choose/when 사용해서 한글 단위 입력해볼것. 합계금액 계산도 -->

				<h4>합계금액 : (불러온 가격 입력)</h4>
				<span style="float: right">
					<button type="submit" class="btn btn-danger">주문하기</button>
					<button type="submit" class="btn btn-default right">주문취소</button>
				</span> <br>
			</div>
			<hr>
			<br>


		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>