<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

				<table class="table">
					<thead>
						<tr>
							<th>상품 정보</th>
							<th>고용 형태</th>
							<th>고용 기간</th>
							<th>상품 가격</th>
							<th>상품 담은 날짜</th>
						</tr>
					</thead>
					<tbody>
<c:forEach items="${basket}" var="basket">
						<tr>
							<td>${basket.ba_pr_idx }</td>
<c:choose>
	<c:when test="${basket.ba_termsort == 'h'}">
							<td>시급</td>
	</c:when>
	<c:when test="${basket.ba_termsort == 'd'}">
							<td>일당</td>
	</c:when>
	<c:when test="${basket.ba_termsort == 'm'}">
							<td>월급</td>
	</c:when>
	<c:when test="${basket.ba_termsort == 'y'}">
							<td>연봉</td>
	</c:when>
	<c:otherwise>
							<td>??</td>
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${basket.ba_termsort == 'h'}">
							<td>${basket.ba_termnum } 시간</td>
	</c:when>
	<c:when test="${basket.ba_termsort == 'd'}">
							<td>${basket.ba_termnum } 일</td>
	</c:when>
	<c:when test="${basket.ba_termsort == 'm'}">
							<td>${basket.ba_termnum } 개월</td>
	</c:when>
	<c:when test="${basket.ba_termsort == 'y'}">
							<td>${basket.ba_termnum } 년</td>
	</c:when>
	<c:otherwise>
							<td>??</td>
	</c:otherwise>
</c:choose>
							
<c:choose>
	<c:when test="${basket.ba_sum >= 10000}">
		<fmt:parseNumber var="sumBasketDivide" value="${basket.ba_sum / 10000}" integerOnly="true" />
			<c:if test="${basket.ba_sum % 10000 == 0}">
				<td><c:out value="${sumBasketDivide}"/> 억원
				</td>
			</c:if>
			<c:if test="${basket.ba_sum % 10000 != 0}">
				<td><c:out value="${sumBasketDivide}"/> 억 <c:out value="${basket.ba_sum - sumBasketDivide * 10000}"/> 만원</h4>
				</td>
			</c:if>
	</c:when>
	<c:otherwise>
			<td><c:out value="${basket.ba_sum }"/> 만원
			</td>
	</c:otherwise>
</c:choose>	
							<td>${basket.ba_regdate }</td>
						</tr>
<c:set var="sumAll" value="${sumAll + basket.ba_sum }"	/>					

</c:forEach>
					</tbody>
				</table>

				<h4>합계금액 : 
<c:choose>
	<c:when test="${sumAll >= 10000}">
		<fmt:parseNumber var="sumAllDivide" value="${sumAll / 10000}" integerOnly="true" />
			<c:out value="${sumAllDivide}"/> 억 <c:out value="${sumAll - sumAllDivide * 10000}"/> 만원</h4>
	</c:when>
	<c:otherwise>
				<c:out value="${sumAll }"/> 만원</h4>
	</c:otherwise>
</c:choose>					
				<span style="float: right">
					<button type="submit" class="btn btn-danger">주문하기</button>
					<button type="submit" class="btn btn-default right">주문취소</button>
				</span> <br>
