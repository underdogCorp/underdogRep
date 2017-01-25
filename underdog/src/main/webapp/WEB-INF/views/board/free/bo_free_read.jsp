<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta charset="utf-8">

</head>
<body>
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<!-- 좌우측의 공간 확보 -->
	<div class="container">
		<hr />
		<div class="row">
			<div class="col-md-10">
				<table class="table table-condensed">
					<thead>
						<tr align="center">
							<th width="10%">제목</th>
							<th width="60%">${board.bo_title}</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>작성일</td>
							<td>${board.bo_regdate}</td>
						</tr>
						<tr>
							<td>글쓴이</td>
							<td>${board.bo_me_nick}<span style='float: right'>조회
									: ${board.bo_hit} </span>
							</td>
						</tr>
						<tr>
							<td colspan="2">${board.bo_content}</td>
						</tr>
					</tbody>
				</table>

				bo_idx의 (현제 게시글) 이메일 값:${board.bo_me_email} <br> <br>
				쎄션에있는 이메일 값:${sessionScope.MEMBER.me_email}

				<table class="table table-condensed">
					<thead>
						<tr>
							<td><span style='float: right'>
									<button type="button" id="list" class="btn btn-default"
										onclick="location='/board/list?page=${data.page}&perPageNum=${data.perPageNum}&bo_bbsid=${data.bo_bbsid}&bo_idx=${data.bo_idx}'">목록</button>
									<c:if
										test="${sessionScope.MEMBER.me_email eq board.bo_me_email}">
										<button type="button" class="btn btn-default"
											onclick="location.href='/board/delProc?bo_idx=${board.bo_idx}&bo_bbsid=${board.bo_bbsid}'">삭제</button>
										<button type="button" id="modify" class="btn btn-default"
											onclick="location='/board/board_cont?page=${data.page}&perPageNum=${data.perPageNum }&bo_bbsid=${data.bo_bbsid}&bo_idx=${data.bo_idx }&keyword=${data.keyword }&searchType=${data.searchType }&state=modify'"/>수정</button>


									</c:if>
							</span></td>
						</tr>
					</thead>
				</table>




				<%-- 	<c:forEach var="b" items="${list}" varStatus="status">

					<table class="table table-condensed">
						<tr>
							<td><span class="form-inline" role="form">
									<p>
									<div class="form-group">
										<input type="text" name="reply_name"
											id="reply_name_${status.index}" class="form-control col-lg-2"
											data-rule-required="true" maxlength="10"
											value="${b.comment_name}" readonly>&nbsp;&nbsp; <a
											onclick="addreply(${status.index})">답글달기</a>
										&nbsp;&nbsp;&nbsp;&nbsp; <a
											onclick="reply_modified(${status.index})">수정하기</a>
										&nbsp;&nbsp;&nbsp;&nbsp;
										<form action="/First_Project1/comment_delete.do" method="post"
											id="reply_del">
											<input type="hidden" name="comment_num"
												value="${b.comment_num}"> <a
												onclick="reply_delete();">삭제하기</a>
										</form>
									</div>

									</p> <textarea class="form-control col-lg-12" name="reply_content"
										id="reply_content_${status.index}" style="width: 100%"
										rows="4" readonly>${b.comment_content}</textarea>
							</span></td>
						</tr>
						<form action="/First_Project1/reply_add.do" method="post"
							id="reply_add">
							<tr id="reply_display_${status.index}" style="display: none">
								<td><span class="form-inline" role="form">
										<p>
										<div class="form-group">
											<input tupe="text" name="reply_hidden"
												id="reply_hidden_${status.index}"
												class="form-control col-lg-2" maxlength="10"
												value="${MEMBERID}" readonly>&nbsp;&nbsp;<a
												onclick="formsubmit();">답글등록</a>&nbsp;&nbsp;<a
												onclick="reply_cancel(${status.index})">답글취소</a>
										</div>

										</p> <textarea class="form-control col-lg-12"
											name="reply_hidden_content"
											id="reply_hidden_content_${status.index}" style="width: 100%"
											rows="4"></textarea>

								</span></td>
							</tr>
						</form>
					</table>
				</c:forEach> --%>
</body>
</html>