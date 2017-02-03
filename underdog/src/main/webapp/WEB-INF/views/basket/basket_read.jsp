<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>

<div class="container" style="padding-bottom: 50px; padding-top: 110px;">

<div class="container-fluid">
	<div class="row content">
		<div class="col-sm-9">
			<br>
			<h2>장바구니 내역 보기</h2>
			<div id="basketInfo">
			
<%@ include file="/WEB-INF/views/basket/basket_include.jsp"%>

			</div>
		</div>
	</div>
</div>

</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>