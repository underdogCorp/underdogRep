<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/resources/js/member.js"></script>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/member.css">

<!--제이쿼리 폼  -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<!-- 우편번호 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<title>회원가입 폼</title>
<style> 
/* date spin 삭제 */
input[type=date]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    display: none;
}
</style>
</head>
<body>
	<div style="width:700px; margin:auto">
	    <div id="mem_step01">
	        <div class="row">
	            <img src="/resources/images/mem_step01.jpg" class="" style="">
	        </div>
	        <div class="row">
	            <p class="form-control-static font_16px glyphicon glyphicon-asterisk" >회원약관확인</p>
	        </div>
	        <div class="row">
	            <p class="form-control-static" style="">홈페이지 이용약관</p>
	            <!-- <textarea class="form-control font_12px" rows="5" id="comment" style="resize:none; background-color:white" readonly></textarea> -->
	             <div id="agreement1" style="height: 100px; overflow:auto; border: 1px solid lightgray"></div>
	            <span class="form-control-static" style=""><strong>(필수약관)</strong> 이용약관에 동의 하십니까?</span>
	            <label class="radio-inline float_r"><input type="radio" name="accept01" value="f">동의하지않음</label>
	            <label class="radio-inline float_r"><input type="radio" name="accept01" value="t">동의 &nbsp; &nbsp; </label>
	        </div>
	        <hr style="margin: 10px">
	        <div class="row">
	            <p class="form-control-static" style="">개인정보 수집,이용 동의</p>
	             <div id="agreement2" style="height: 100px; overflow:auto; border: 1px solid lightgray"></div>
	            <span class="form-control-static" style=""><strong>(필수약관)</strong>이용약관에 동의 하십니까?</span>
	            <label class="radio-inline float_r"><input type="radio" name="accept02" value="f">동의하지않음</label>
	            <label class="radio-inline float_r"><input type="radio" name="accept02" value="t">동의 &nbsp; &nbsp; </label>
	        </div>
	        <hr style="margin: 10px">
	        <div class="row">
	            <p class="form-control-static" style="">수집한 개인정보의 제3자 제공 및 취급 위탁 동의</p>
	             <div id="agreement3" style="height: 100px; overflow:auto; border: 1px solid lightgray"></div>
	            <span class="form-control-static" style=""><strong>(선택약관)</strong>이용약관에 동의 하십니까?</span>
	            <label class="radio-inline float_r"><input type="radio" name="accept03" value="f">동의하지않음</label>
	            <label class="radio-inline float_r"><input type="radio" name="accept03" value="t">동의 &nbsp; &nbsp; </label>
	        </div>
	        <hr style="margin: 10px">
	        <div class="row">
	            <p class="form-control-static" style="">민감정보 및 고유식별정보 처리 동의</p>
	             <div id="agreement4" style="height: 100px; overflow:auto; border: 1px solid lightgray"></div>
	            <span class="form-control-static" style=""><strong>(선택약관)</strong>이용약관에 동의 하십니까?</span>
	            <label class="radio-inline float_r"><input type="radio" name="accept04" value="f">동의하지않음</label>
	            <label class="radio-inline float_r"><input type="radio" name="accept04" value="t">동의 &nbsp; &nbsp; </label>
	        </div>
	        <div class="row">
	            <div class="checkbox ta_c">
	                <input class="w3-check" type="checkbox" id="check_all">
	                <label class="w3-validate" for="check_all">전체 동의</label>
	            </div>
	        </div>
	        <div class="row ta_c">
	            <p class="form-control-static" style="">위의 이용약관 및 개인정보 취급방침에 동의 하십니까?</p>
	        </div>
	        <div class="row ta_c">
	            <button type="button" class="btn btn-success" id="btn_step01">동 의</button>
	        </div>
	    </div>
	
	    <div id="mem_step02" style="display:none">
	        <div class="row">
	            <img src="/resources/images/mem_step02.jpg" class="" style="">
	        </div>
	        <div class="row">
	            <p class="form-control-static font_16px glyphicon glyphicon-asterisk" style="">이메일 인증</p>
	        </div>
	        <hr/>
	        <div class="form-group">
	            <p class="form-control-static">사용하실 이메일(사이트의 아이디가 됩니다.)을 입력하세요</p>
	            <input type="email" class="form-control float_l" id="me_emailStep02" style="width:250px" maxlength="30">
	            <button type="button" class="btn btn-success" id="btn_emailSend">전 송</button>
	            <p class="form-control-static"></p>
	            <input type="hidden" value="" />
	            <hr/>
	            <input type="text" class="form-control" id="inp_authNo" style="width:250px" placeholder="인증번호 입력" >
	            <div>
	                <!-- <span id="time-hour"></span> -->
	                <span id="time_min" style="color:blue"></span>
	                <span id="time_sec" style="color:blue"></span>
	            </div>
	        </div>
	        <div class="row ta_c">
	            <button type="button" class="btn btn-success" id="btn_step02">다음 단계</button>
	        </div>
	    </div>
	
	    <div id="mem_step03"  style="display:none">
	        <div class="row">
	            <img src="/resources/images/mem_step03.jpg" class="" >
	        </div>
	        <div class="row">
	            <p class="form-control-static font_16px glyphicon glyphicon-asterisk">회원 정보 입력</p>
	        </div>
	        <hr/>
	        <form id="formMemberData" method="post">
	        	<input type="hidden" id="accept01" name="me_accept01">
		        <input type="hidden" id="accept02" name="me_accept02">
		        <input type="hidden" id="accept03" name="me_accept03">
		        <input type="hidden" id="accept04" name="me_accept04">
		        <input type="hidden" id="me_email" name="me_email">
		        <div class="row">
		            <div class="col-sm-2"><p class="form-control-static">이메일(아이디)</p></div>
		            <div class="col-sm-4"><p class="form-control-static" id="txt_email"></p></div>
		        </div>
		        <div class="row">
		            <div class="col-sm-2"><p class="form-control-static">비밀번호</p></div>
		            <div class="col-sm-4"><input type="password" class="form-control" id="me_pw" name="me_pw"
		            	placeholder="영문,숫자,특수문자 혼합 8~20"></div>
		            <div class="col-sm-6"><p class="form-control-static" id="txt_pw"></p></div>
		        </div>
		        <div class="row">
		            <div class="col-sm-2"><p class="form-control-static" >비밀번호확인</p></div>
		            <div class="col-sm-4"><input type="password" class="form-control" id="me_pw2" name="me_pw2" disabled></div>
		        	<div class="col-sm-6"><p class="form-control-static" id="txt_pw2"></p></div>
		        </div>
		        <div class="row">
		            <div class="col-sm-2"><p class="form-control-static" style="">이름</p></div>
		            <div class="col-sm-4"><input type="text" class="form-control" id="me_name" name="me_name"
		            	placeholder="한글2~5"></div>
		        	<div class="col-sm-6"><p class="form-control-static" id="txt_name"></p></div>
		        </div>
		        <div class="row">
		            <div class="col-sm-2"><p class="form-control-static" style="">닉네임</p></div>
		            <div class="col-sm-4"><input type="text" class="form-control" id="me_nick" name="me_nick"
		            	placeholder="한글2~10"></div>
		        	<div class="col-sm-6"><p class="form-control-static" id="txt_nick"></p></div>
		        </div>
		        <div class="row">
		            <div class="col-sm-2"><p class="form-control-static" style="">성별</p></div>
		            <div class="col-sm-4">
		                <input class="w3-radio" type="radio" name="me_gender" value="male">
		                <label class="w3-validate">남</label>
		                <input class="w3-radio" type="radio" name="me_gender" value="female">
		                <label class="w3-validate">여</label>
		            </div>
		        </div>
		        <div class="row">
		            <div class="col-sm-2"><p class="form-control-static" style="">생일</p></div>
		            <div class="col-sm-4"><input type="date" id="me_birth" class="form-control" name="me_birth"></div>
		        </div>
		        <div class="row">
		            <div class="col-sm-2"><p class="form-control-static" style="">우편번호</p></div>
		            <div class="col-sm-3"><input type="text" class="form-control" id="sample4_postcode" name="me_zipcode"
		                onclick="openDaumPostcode()" readonly placeholder="클릭하세요"></div>
		        </div>
		        <div class="row">
		            <div class="col-sm-offset-2 col-sm-8"><input type="text" class="form-control" name="me_add1"
		                id="sample4_roadAddress" onclick="openDaumPostcode()" placeholder="클릭하세요" readonly></div>
		        </div>
		        <div class="row">
		            <div class="col-sm-offset-2 col-sm-8"><input type="text" class="form-control" id="me_add2" name="me_add2"
		            	placeholder="상세주소 입력"></div>
		        </div>
		       <!--  <div class="row" style="height:100px">
		            <div class="col-sm-2"><p class="form-control-static" style="">사진</p></div>
		            <div class="col-sm-10">
		                <input type="file" />
		            </div>
		        </div> -->
		        <hr/>
		        <div class="row">
		            <div class="col-sm-2"><p class="form-control-static" style="">검색어</p></div>
		            <div class="col-sm-2">
		                <input class="w3-check" type="checkbox"><label class="w3-validate">운동</label>
		            </div>
		            <div class="col-sm-2">
		                <input class="w3-check" type="checkbox"><label class="w3-validate">음식</label>
		            </div>
		            <div class="col-sm-2">
		                <input class="w3-check" type="checkbox"><label class="w3-validate">프로그래밍</label>
		            </div>
		            <div class="col-sm-2">
		                <input class="w3-check" type="checkbox"><label class="w3-validate">영어</label>
		            </div>
		        </div>
		        <br/><br/>
		        <div class="row ta_c">
		            <button type="button" class="btn btn-success" id="btn_step03">회원정보등록</button>
		        </div>
	        </form>
	    </div>
	
	    <div id="mem_step04" style="display:none">
	        <div class="row">
	            <img src="/resources/images/mem_step04.jpg" class="" >
	        </div>
	        <div class="row">
	            <p class="form-control-static font_16px glyphicon glyphicon-asterisk" >가입완료되었습니다.</p>
	        </div>
	        <hr/>
	        <br/><br/><br/>
	        <div class="row ta_c">
	            <p class="form-control-static" style="">로그인 하시기 바랍니다.</p>
	            <p class="form-control-static" style="color:red" id="txt_loginResult"></p>
	        </div>
	        <form id="formLoginData">
		        <div class="row">
		            <div class="col-sm-offset-4 col-sm-4"><input type="text" class="form-control" name="me_email" placeholder="이메일"></div>
		        </div>
		        <div class="row">
		            <div class="col-sm-offset-4 col-sm-4"><input type="password" class="form-control" name="me_pw" placeholder="비밀번호"></div>
		        </div>
		        <br/>
		        <div class="row">
		            <div class="col-sm-offset-4 col-sm-4"><input type="button" class="btn btn-success" id="btn_login" 
		                value="로그인" style="width:100%"></div>
		        </div>
	        </form>
	    </div>
	    <br/><br/>
	</div>
</body>
</html>