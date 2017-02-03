<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/nav.jsp"%>

<script>
/* $(function(){
	$("#btnSearch").click(function(){
		$("#formSearch").submit();
	});
	
	$("#searchKeyword").keydown(function(){
		if(event.keyCode==13){
			$("#formSearch").submit();
		}
	});
}); */


function callContent(bo_idx){
	$.post("/board/listFaq",	// post 방식으로 /bbsViewFaq.dh 페이지로...
	{
		bo_bbsid : "03" // bbsid 값과,
		, bo_idx : bo_idx // bIdx 값을 전송한다.
	},
	function(data){				// /bbsViewFaq.dh에서 처리된 결과가 data라는 변수로 반환된다.
		$(".bbsContent").html("");	// bbsContent라는 class 명을 갖고 있는 것들의 내용을 지우고,
		$(".bbsContent").hide();	// 감춘다.
		$(".bbsTitle").css("font-size", "14px").css("font-weight", "normal").css("margin-top", "0px");
		
		$("#bbsTitle_" + bo_idx).css("font-size", "30px").css("font-weight", "bold").css("margin-top", "20px");
		$("#bbsContent_" + bo_idx).html(data); // 클릭한 글에 해당하는 내용 영역에 내용을 넣은 후,
		$("#bbsContent_" + bo_idx).show();		// 보여준다.
	});
}
</script>


<div class="container" style="padding-bottom: 50px;">
		<h2>F A Q</h2>
		<p>자주하는 질문</p>
		<table class="table table-hover">
			<!-- <thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>게시일</th>
					<th>아이피</th>
				</tr>
			</thead> -->	
			

<c:choose>
	<c:when test="${postCount == 0}">
					<tr>
						<td style="text-align:center;">등록된 게시물이 없습니다.</td>
					</tr>
	</c:when>
	<c:otherwise>
		<c:forEach items="${list}" var="post" varStatus="status">
					<tr>
						<td>
							<div class="bbsTitle fNG" id="bbsTitle_${post.bo_idx}">
								<a href="javascript:callContent(${post.bo_idx});"><c:out value="${post.bo_title}" /></a>
							</div>
							<div class="bbsContent" id="bbsContent_${post.bo_idx}">
							
							</div>
						</td>
					</tr>
		</c:forEach>
	</c:otherwise>
</c:choose>			
			
			
			<%-- <tbody>
				<c:forEach items="${list}" var="list">
					<tr>
						<td>${list.bo_idx }</td>
						<td><a href="/board/board_cont?bo_bbsid=${list.bo_bbsid}&bo_idx=${list.bo_idx }&page=&lpp=&keyword=&sel=&state=read">
							<c:out value="${list.bo_title }"/></a></td>
						<td>${list.bo_me_nick }(${list.bo_me_email })</td>
						<td>${list.bo_hit }</td>
						<td>${list.bo_regdate }</td>
						<td>${list.bo_regip }</td>
					</tr>
				</c:forEach>
			</tbody> --%>
		</table>
	</div>
<c:if test="${sessionScope.MEMBER != null }">
	<button type="button" class="btn btn-default"
		onclick="location.href='/board/registerForm?bo_bbsid=03'">글쓰기</button>
</c:if>




<%@ include file="/WEB-INF/views/include/footer.jsp"%>
