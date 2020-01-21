function fn_login(){
	var userData = {
		"ID"	: $("#user_id").val(),
		"PASSWORD"	: $("#user_pwd").val(),
		"isUseCookie"	: $("#chk_cookie").prop("checked") == true ? "Y" : "N"
		//fn_login()에서 서버로 로그인에 필요한 아이디와 패스워드 정보를 넘겨줄때 체크박스 값도 함께 넘겨줌
	};

	$.ajax({
		type : "POST",
		url : "",
		data : userData,
		dataType : "json",
		error : function(request, status, error){
			alert("서버가 응답하지 않습니다." + "/n" + "다시 시도해주시기 바랍니다." + "/n"
					+ "code : " + request.status + "/n"
					+ "message : " + status + "/n"
					+ "error : " + error);
		},
		success : function(result){
			if(result.status == 0)
			{
				alert(result.msg);
				window.location.href=""//메인 페이지로 이동
			}
			else if(result.status == 1)
			{
				alert(result.msg);
			}
		}
	});
}