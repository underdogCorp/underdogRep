<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/nav.jsp"%>

<script>
	$(function(){
		$('#pdtSubmitBtn').click(function(){
			var f = $('#pdtSubmitFrm');
			
			f.attr('method', 'POST');
			f.attr('action', "/product/registerProc");
			f.submit();
		})
	});
	
	$(".highcode").selected(function(){
		alert("zzz");
		$('#lowcodeTag').attr('display', 'block');
	});
</script>
<div class="container" style="padding-bottom: 50px; padding-top: 110px;">
<h2>상품등록</h2><br/>

<form id="pdtSubmitFrm">
회원이메일 (hidden으로 처리, 임시): <input type="text" name="pr_me_email" value="${sessionScope.MEMBER.me_email}"><br/> <br/>
회원닉네임 (hidden으로 처리, 임시): <input type="text" name="bo_me_nick" value="${sessionScope.MEMBER.me_nick}"><br/><br/>


상품등록자 : ${sessionScope.MEMBER.me_name}(${sessionScope.MEMBER.me_email})<br/>

 <label for="sel1">상품대분류 : :</label>
      <select class="form-control" id="highcodeTag">
          <%@ include file="../product/highcode.jsp" %>
    <c:forEach var="h" items="${highcode }">
    	<option name="pr_highcode" value="${h }" title="${h }" class="highcode"/>${h }</option>
    </c:forEach>
 </select>
 
 <label for="sel2">상품소분류 :</label>
 <select class="form-control" id="lowcodeTag" display="none">
         <%@ include file="../product/lowcode.jsp" %>
  	  <c:forEach var="l" items="${day }">
    	<option name="pr_lowcode" value="${l }" title="${l }"/>${l }</option>
   	  </c:forEach>
 </select>
 
제목(상품명) :<input type="text" name="pr_title"><br/>
본문 : <input type="text" name="pr_content"><br/>
검색키워드 : <input type="text" name="pr_keyword"><br/>
업무가능지역 : <input type="text" name="pr_region"><br/>
희망급여종류 : <input type="text" ><br/>
시급 : <input type="text" name="pr_pay_h"><br/>
일급 : <input type="text" name="pr_pay_d"><br/>
월급 : <input type="text" name="pr_pay_m"><br/>
업무가능 시작일 : <input type="text" name="pr_startday"><br/>
업무가능 종료일 : <input type="text" name="pr_endday"><br/>


<input type="button" id="pdtSubmitBtn" value="제출">
</form>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>