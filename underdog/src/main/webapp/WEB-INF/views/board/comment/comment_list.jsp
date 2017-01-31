<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="reply" items="${reply }">
작성자email : ${reply.re_me_email }<br/>
<%-- 상품번호 : ${reply.re_pr_idx }<br/> --%>
게시판번호 : ${reply.re_me_email }<br/>
<%-- 카테고리 : ${reply.re_category }<br/> --%>
ref : ${reply.re_ref }<br/>
level : ${reply.re_level }<br/>
step : ${reply.re_step }<br/>
작성일(re_regdate) : ${reply.re_regdate }<br/>
아이피 : ${reply.re_regip }<br/>
내용 : ${reply.re_content }<br/>
좋아요 : ${reply.re_good }<br/>
싫어요 : ${reply.re_bad }<br/>
</c:forEach>
</body>
</html>