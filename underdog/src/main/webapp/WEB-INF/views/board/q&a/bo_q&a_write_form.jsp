<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/nav.jsp"%>

<form id="frm">
게시판 id (hidden으로 처리, 임시): <input type="text" name="bo_bbsid" value="04">

회원이메일(session으로 처리, 임시)  : <input type="text" name="bo_me_email">
회원닉네임(session으로 처리, 임시)  : <input type="text" name="bo_me_nick">

제목 : <input type="text" name="bo_title"><br/>
내용 : <input type="text" name="bo_content"><br/>

<input type="submit" value="제출">
</form>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>