$(document).ready(function(){
	$('#deleteBtn').click(function(){    
	var regPasswd = /^[A-Za-z0-9!@#$%^&*()\-_=+\\\|\[\]{};:\'",.<>\/?]{8,20}$/;
	$.ajax({ 
		type: "post",
		url : "delete_proc",
		data : {
			id:$('#id').val(),
			passwd : $('#passwd').val()
		},
		success : function s(a){
			if($("#passwd").val() == null || $("#passwd").val() == '') {
		          alert("비밀번호가 입력 되지 않았습니다.");
		  		$("#passwd").focus();
				  return false;
		    }
			else if (!regPasswd.test($("#passwd").val())) {
				alert('비밀번호는 8 ~20 자리입니다.');
				$("#passwd").val('');
			}
			else if(a.trim().indexOf("비밀") > -1){
				alert("비밀번호가 일치하지 않습니다.")
				$("#passwd").val('');
			}else{
				alert("회원탈퇴 되었습니다.")
				$("#deleteFrm").submit();
			}
		},
		error : function error(){ alert('회원탈퇴 시스템 문제발생');}
	});
		});
	});
