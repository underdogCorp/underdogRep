<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="commentReplyTextarea">
	<input type="hidden" id="comment_idx" value="${param.comment_idx}" />
	<textarea id="comment_re_content"></textarea>
</div>
<div class="commentReplyBtn">
	<button type="button" class="mBtn bBlue" onclick="tryReplyComment(${param.comment_idx});">답글등록</button>
	<button type="button" class="mBtn bGray" onclick="cancelReplyComment();">취소</button>
</div>
