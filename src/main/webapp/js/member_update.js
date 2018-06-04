/* =======================================
email Check
======================================*/
$(document).ready(function(){
	$("#email").focusout(function () {
		var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		$.ajax({ // ajax실행부분
			type: "post",
			url : "email_proc",
			data : {
				email : $('#email').val(),
				id : $('#id').val()
				
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