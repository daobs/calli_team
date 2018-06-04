
/* =======================================
id Check
======================================*/
$(document).ready(function(){
	$('#id').focusout(function(){    
        $.ajax({ // ajax실행부분
            type: "post",
            url : "id_proc",
            data : {
                id : $('#id').val()
            },
            success : function s(a){
            	var regId = /^[A-Za-z0-9]{4,12}$/;
            	
            	if (!regId.test($("#id").val())) {
            		$('#idch').html("<font color = 'red'>영문자,숫자 4~12 자리입니다</font>");
    				$("#id").val('');
    			}else if(a.trim().indexOf("중복된") > -1){
            		$("#idCheckValue").val('C');
            		$('#idch').html(a); 
            	}else{
            		$("#idCheckValue").val('Y');
            		$('#idch').html(a); 
            	}
    
            },
          	 error : function error(){ 
          		 alert('아이디 중복 시스템 문제발생');
            }
        });
	});
	
	/* =======================================
	email Check
	======================================*/
	$('#email').focusout(function(){    
		var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		$.ajax({ // ajax실행부분
			type: "post",
			url : "email_proc",
			data : {
				email : $('#email').val(),
				email2 : $('#defaultEmail').val()
			},
			success : function s(a){
				$('#emailch').html(a); 
				if (!regEmail.test($("#email").val())) {
        		    document.getElementById('emailch').innerHTML = 
        		    	"<font color = 'red'>올바른 형식이 아닙니다.</font>";		   
				}
            	if(a.trim().indexOf("중복된") > -1){
            		$("#emailCheckValue").val('C');
            	}else{
            		$("#emailCheckValue").val('Y');
            	} 
            
			},
			error : function error(){ alert('이메일중복 시스템 문제발생');}
		});
	});
});
/* =======================================
	login Check
	======================================*/

$(document).ready(function(){
	$('#loginCheck').click(function(){    
	var regId = /^[A-Za-z0-9]{4,12}$/;
	var regPasswd = /^[A-Za-z0-9!@#$%^&*()\-_=+\\\|\[\]{};:\'",.<>\/?]{8,20}$/;
	$.ajax({ 
		type: "post",
		url : "login_proc",
		data : {
			id:$('#log_id').val(),
			passwd : $('#log_passwd').val()
		},
		success : function s(a){
			if($("#log_id").val() == null || $("#log_id").val() == ''|| $("#log_passwd").val() == null || $("#log_passwd").val() == '') {
		          alert("ID와 비밀번호 정보를 입력 후 누르세요.");
		          $("#log_id").val('');
				  $("#log_passwd").val('');
				  return false;
		    }
			else if (!regId.test($("#log_id").val())) {
				alert('ID는  4 ~12 자리입니다.');
				$("#log_id").val('');
				$("#log_passwd").val('');
			}
			else if (!regPasswd.test($("#log_passwd").val())) {
				alert('비밀번호는 8 ~20 자리입니다.');
				$("#log_id").val('');
				$("#log_passwd").val('');
			}
			else if(a.trim().indexOf("실패") > -1){
				alert("회원정보가 올바르지 않습니다.")
			}else{
				$("#loginfrm").submit();
			}
		},
		error : function error(){ alert('로그인 시스템 문제발생');}
	});
		});
	});
