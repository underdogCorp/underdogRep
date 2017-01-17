var interval;
var flagLimitTimer = "f";

//유효성 검사 flag
var flagEmailValidation = false; //이메일 입력시 정규식 및 중복 체크 통과 유무
var flagPwValidation = false; //비밀번호 입력시 정규식 체크 
var flagPw2Validation = false; //비밀번호 입력시 정규식 체크 
var flagNameValidation = false; //
var flagNickValidation = false; //

$(function () {
	loadData(); //이용약관 불러오기
    
    //step01 동의 유무 확인
    $("#btn_step01").on("click", function() {
        if ($("input:radio[name='accept01']:checked").val() != "t") {
            alert("이용약관에 동의하여 주세요");
            return;
        }
        if ($("input:radio[name='accept02']:checked").val() != "t") {
            alert("이용약관에 동의하여 주세요");
            return;
        }
        $("#mem_step01").hide();
        $("#mem_step02").show();
        $("#accept01").val($("input:radio[name='accept01']:checked").val());
        $("#accept02").val($("input:radio[name='accept02']:checked").val());
        $("#accept03").val($("input:radio[name='accept03']:checked").val());
        $("#accept04").val($("input:radio[name='accept04']:checked").val());
    });

    //step01 동의 항목 전부 체크/해제
    $("#check_all").click(function() {
        var flagChecked = $(this).is(":checked");
        if(flagChecked) {
            $("#mem_step01 input:radio").prop('checked', true);
        } else {
            $("#mem_step01 input:radio").prop('checked', false);
        }
    });
    
    //step02 키입력시 이메일 유효성 평가
    $("#me_emailStep02").on("keyup", function(event) {
		/*
		^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$

		^[0-9a-zA-Z] --> 첫글자는 숫자또는 영문자
		[-_.]? --> - 또는 _ 또는 . 이 0번 또는 1번 .은 특수문자 이므로 . 으로
		[0-9a-zA-Z] --> 숫자또는 영문자
		([-_.]?[0-9a-zA-Z])*@ --> @ 앞에(-,_,. 이 0~1번, 그 뒤에는 숫자,영문자)이 한번 또는 여러번

		@[0-9a-zA-Z] --> @ 뒤에는 숫자 또는 영문자
		[-_.]? --> - 또는 _ 또는 . 이 0번 또는 1번
		([-_.]?[0-9a-zA-Z])*. --> . 앞에(-,_,. 이 0~1번, 그 뒤에는 숫자,영문자)이 한번 또는 여러번
		.[a-zA-Z]{2,3}$ --> . 뒤 마지막 문자열은 영문자가 2~3개
		*/
    	var me_email = $(this);
		var pattern =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		flagEmailValidation = false;
		
		if(me_email.val().length < 6 || !pattern.test(me_email.val())) {
			$("#btn_emailSend").next().css({"color": "red"});
			$("#btn_emailSend").next().text("이메일 형식이 맞질 않습니다.");
			return false;
		} else {
			$("#btn_emailSend").next().css({"color": "blue"});
			$("#btn_emailSend").next().text("이메일 형식이 맞습니다.");
		}
		
		$.ajax({
			url : "/member/joinCheckEmail.dog",
			type : "post",
			data : { me_email : me_email.val() },
			dataType : "text",
			success : function(result) {
				if (result == 'EMPTY') {
					$("#btn_emailSend").next().css({"color": "blue"});
					$("#btn_emailSend").next().text("이메일 형식이 맞고 사용가능한 이메일(아이디)입니다.");
					flagEmailValidation = true;
				} else {
					$("#btn_emailSend").next().css({"color": "red"});
					$("#btn_emailSend").next().text("이메일 형식이 맞으나 중복된 이메일(아이디) 입니다.");
				}
			}
		});
	});
    
    //step02 이메일 유효성 평가후 사용자 이메일로 인증번호 발송
    $("#btn_emailSend").on("click", function() {
    	if(flagEmailValidation != true) {
    		return false;
    	}
    	var me_email = $("#me_emailStep02");
    	inputLimitTimer(2);	// 제한 시간 2분 , minute base
    	$("#me_emailStep02").attr("disabled", true);
    	flagLimitTimer = "t";
    	
		$.ajax({
			url : "/member/sendEmail.dog",
			type : "post",
			data : { me_email : $.trim(me_email.val()) },
			dataType : "text",
			success : function(result) {
				if (result == 'SUCCESS') {
					alert("이메일 발송 성공");
				} else {
					alert("이메일 발송 실패");
				}
			}
		});
    });

    //step02 이메일로 발송된 인증번호가 같으면 step03으로 이동
    $("#btn_step02").on("click", function() {
    	var inp_authNo = $("#inp_authNo").val();

    	if(flagLimitTimer != "t") {
    		alert("입력 시간이 초과되었습니다. ");
    		return;
    	}
    	$.ajax({
			url : "/member/checkAuthNo.dog",
			type : "post",
			data : { inp_authNo : inp_authNo },
			dataType : "text",
			success : function(result) {
				if (result == 'SUCCESS') {
					alert("인증되었습니다.");
					$("#mem_step02").hide();
					$("#mem_step03").show();
					$("#txt_email").text($("#me_emailStep02").val());
					$("#me_email").val($("#me_emailStep02").val());
					clearInterval(interval);
				} else {
					alert("인증번호가 틀리니 다시 입력하세요");
				}
			}
		});    	
    	
    });
    
    //step03 회원 정보 전송
    $("#btn_step03").on('click', function(){
    	//회원 유효성 검사
    	if(!flagPwValidation) {
    		alert("패스워드를 확인하세요");
    		return;
    	}
    	if(!flagPw2Validation) {
    		alert("패스워드 확인란에 입력한 내용확인하세요");
    		return;
    	}
    	if(!flagNameValidation) {
    		alert("이름을 다시 확인하세요");
    		return;
    	}
    	if(!flagNickValidation) {
    		alert("닉네임을 확인하세요");
    		return;
    	}
    	if ("" == $("#sample4_postcode").val()) {
    		alert("우편번호 입력");
    		return false;
    	}
    	if ("" == $("#sample4_roadAddress").val()) {
    		alert("우편번호 입력");
    		return false;
    	}
    	if ("" == $.trim($("#me_add2").val())) {
    		$("#me_Add2").focus();
    		alert("상세주소를 입력하세요");
    		return false;
    	}
    	if ($("#me_birth").val() == "") {
    		alert("생일 입력");
    		return false;
    	}
        if (undefined == $("input:radio[name='me_gender']:checked").val()) {
            alert("성별 입력");
            return false;
        }
    	
        $.ajax({
            url: '/member/joinProc.dog', // url where to submit the request
            type : "POST", // type of action POST || GET
            data : $("#formMemberData").serialize(), // post data || get data
         	success : function(result) {
            	if (result == 'SUCCESS') {
					alert("회원정보가 정상적으로 등록되었습니다.");
					$("#mem_step03").hide();
					$("#mem_step04").show();
				} else {
					alert("회원정보 등록에 실패하였습니다.");
				}
            }
        })
    });
    
    //step04 loginProc(로그인)
    $("#btn_login").on('click', function(){
        $.ajax({
            url: '/member/loginProc.dog', // url where to submit the request
            type : "POST", // type of action POST || GET
            data : $("#formLoginData").serialize(), // post data || get data
         	success : function(result) {
            	if (result == 'SUCCESS') {
					alert("로그인 되었습니다.");
					location.href = "http://www.naver.com";
				} else {
					$("#txt_loginResult").html("아이디 또는 비밀번호를 다시 확인하세요.<br/>"
								+ "등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다</p>")
				}
            }
        })
    });

    //이메일 인증번호 입력창에서 Ctrl+C , V 금지
    $("#inp_authNo").on("paste copy", function() {
    	return false;
    })

    //생일 입력창에 키보드 입력 금지
    $("#me_birth").on("keydown", function() {
        return false;
    });
    
    //달력에 오늘 날짜이후는 disabled처리
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();
    if(dd < 10) {
        dd = '0' + dd;
    }
    if(mm < 10) {
        mm = '0' + mm;
    }
    today = yyyy+'-'+mm+'-'+dd;
    $("#me_birth").attr("max", today);
    $("#me_birth").attr("min", "1900-01-01");
    
    //비밀번호 입력 유효성 검사
    //영문,숫자,특수문자 혼합하여 8자리~20자리 이내.(비밀번호 표준)
    $("#me_pw").on("keyup", function() {
    	flagPwValidation = false;
    	flagPw2Validation = false;
    	$("#me_pw2").attr("disabled", true);
		var pw = $.trim($("#me_pw").val());
		var num = pw.search(/[0-9]/g);
		var eng = pw.search(/[a-z]/ig);
		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		if(pw.length < 8 || pw.length > 20){
			$("#txt_pw").css({"color": "red"});
			$("#txt_pw").text("8자리 ~ 20자리 이내로 입력해주세요.");
			return false;
		}
		if(pw.search(/₩s/) != -1){
			$("#txt_pw").css({"color": "red"});
			$("#txt_pw").text("비밀번호는 공백업이 입력해주세요.");
			return false;
		} 
		if(num < 0 || eng < 0 || spe < 0 ){
			$("#txt_pw").css({"color": "red"});
			$("#txt_pw").text("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
			return false;
		}
		$("#txt_pw").css({"color": "blue"});
		$("#txt_pw").text("사용가능합니다.");
		
		$("#me_pw2").attr("disabled", false);
		flagPwValidation = true;
		return true;
    });
    
    //비밀번호 재입력시 비밀번호 동일한지 확인
    $("#me_pw2").on("keyup", function() {
    	flagPw2Validation = false;
    	if($("#me_pw").val() != $("#me_pw2").val()){
			$("#txt_pw2").css({"color": "red"});
			$("#txt_pw2").text("입력하신 비밀번호와 틀립니다.");
			return false;
		}
    	$("#txt_pw2").css({"color": "blue"});
		$("#txt_pw2").text("입력하신 비밀번호와 맞습니다.");
		
		flagPw2Validation = true;
		return true;
    });
    
    //이름 입력 유효성 검사
    $("#me_name").on("keyup", function() {
    	flagNameValidation = false;
		var me_name = $.trim($(this).val());
    	//var pattern = /^[가-힣]{2,5}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
    	var pattern = /^[가-힣]{2,5}$/;
    	if(!pattern.test(me_name)){
			$("#txt_name").css({"color": "red"});
			$("#txt_name").text("사용불가능한 이름입니다.");
			return false;
		}
    	$("#txt_name").css({"color": "blue"});
		$("#txt_name").text("사용가능한 이름입니다.");
		
		flagNameValidation = true;
		return true;
    });
    
    //닉네임 입력 유효성 검사
    $("#me_nick").on("keyup", function() {
    	flagNickValidation = false;
    	var me_nick = $.trim($(this).val());
    	//var pattern = /^[가-힣]{2,5}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
    	var pattern = /^[가-힣]{2,10}$/;
    	if(!pattern.test(me_nick)){
			$("#txt_nick").css({"color": "red"});
			$("#txt_nick").text("사용불가능한 이름입니다.");
			return false;
		}
    	$("#txt_nick").css({"color": "blue"});
		$("#txt_nick").text("사용가능한 이름입니다.");
		
		flagNickValidation = true;
		return true;
    });
});

function inputLimitTimer(duration) {
    //var timer = duration * 60;
    var timer = duration * 60;
    var hours, minutes, seconds;

    interval = setInterval(function() {
        //hours	= parseInt(timer / 3600, 10);
        minutes = parseInt(timer / 60 % 60, 10);
        seconds = parseInt(timer % 60, 10);

        // 	= hours < 10 ? "0" + hours : hours;
        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        //$('#time-hour').text(hours);
        $('#time_min').text(minutes);
        $('#time_sec').text(seconds);

        if (--timer < 0) {
            timer = 0;
            clearInterval(interval);
            $('#time_min').text("시간 초과, 다시 이메일 인증을 받으세요");
            $('#time_sec').text("");
            flagLimitTimer = "f";
        }
    }, 1000);
}

function loadData() {
    //$("#comment").html(getData().replace('\n', '<br>'));
	$("#agreement1").load("/resources/html/member_agreement.html #agree1");
	$("#agreement2").load("/resources/html/member_agreement.html #agree2");
	$("#agreement3").load("/resources/html/member_agreement.html #agree3");
	$("#agreement4").load("/resources/html/member_agreement.html #agree4");
}
function getData () {
    var text = 'look at this line of data oh, \n look at this line';
    return text;
}

/* 다음 지도 api*/
function openDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			// 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
			document.getElementById('sample4_postcode').value = data.zonecode;
			document.getElementById('sample4_roadAddress').value = data.address;
		}
	}).open();
}