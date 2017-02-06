$(function(){
	${'#productRegister'}.click(function(){
		alert("zzz")
		if(${sessionScope.MEMBER.me_email} == null){
			alert("로그인을 해주세요");
			return false;
		}
	});
});