<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<style>
legend{
font-family: "휴먼편지체";
font-weight: bold;
font-size: 300%;
}

th{
font-family: "휴먼편지체";
font-size: :"120%";
font-weight: bold;
}

</style>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${root}/js/member_login.js"></script> 
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
 
                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;
 
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }
 
                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;
 
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
                document.getElementById('addressCheckValue').value = "Y";
                
            }
        }).open();
    }
</script> 
<script>
/* 		정규식             */ 
$(document).ready(function(){
	$("#phone").focusout(function () {
 	var regPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
		if (!regPhone.test($("#phone").val())) {
		    document.getElementById('phonech').innerHTML = 
		    	"<font color = 'red'>'-'를 포함하여 010-0000-0000 형식으로 작성해주세요.</font>";		   
		} 
	});
});
$(document).ready(function(){
	$("#phone").focusout(function () {
 	var regPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
		if (regPhone.test($("#phone").val())) {
		    document.getElementById('phonech').innerHTML = 
		    	"<font color = 'green'>올바른 형식입니다.</font>";
		   
		} 
	});
});


/* 		사이즈 제한           */
var regPasswd = /^[A-Za-z0-9!@#$%^&*()\-_=+\\\|\[\]{};:\'",.<>\/?]{8,20}$/;
var regName = /^[가-힣a-zA-Z]{2,10}$/;

$(document).ready(function(){
	$("#name").focusout(function () {
		if (!regName.test($("#name").val())) {
		    document.getElementById('namech').innerHTML = 
		    	"<font color = 'red'>한글 또는 영문자로 2-10자리로 입력하세요.</font>";		   
		} 
	});
});
$(document).ready(function(){
	$("#name").focusout(function () {
		if (regName.test($("#name").val())) {
		    document.getElementById('namech').innerHTML = 
		    	"<font color = 'green'>정상적으로 입력되었습니다.</font>";
		} 
	});
});

$(document).ready(function(){
	$("#passwd").focusout(function () {
		if (!regPasswd.test($("#passwd").val())) {
		    document.getElementById('passwdch').innerHTML = 
		    	"<font color = 'red'>8-20자리로 입력하세요.</font>";		   
		} 
	});
});
$(document).ready(function(){
	$("#repasswd").focusout(function () {
		if (!regPasswd.test($("#repasswd").val())) {
		    document.getElementById('repasswdch').innerHTML = 
		    	"<font color = 'red'>8-20자리로 입력하세요.</font>";		   
		} 
	});
});
$(document).ready(function(){
	$("#passwd").focusout(function () {
		if (regPasswd.test($("#passwd").val())) {
		    document.getElementById('passwdch').innerHTML = 
		    	"<font color = 'green'>정상적으로 입력되었습니다.</font>";
		   
		} 
	});
});
$(document).ready(function(){
	$("#repasswd").focusout(function () {
		if (regPasswd.test($("#repasswd").val())) {
		    document.getElementById('repasswdch').innerHTML = 
		    	"<font color = 'green'>정상적으로 입력되었습니다.</font>";
		   
		} 
	});
});



</script>
<script type="text/javascript">
function emailCheck(email) {
    var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    if (email == "") {
        alert("이메일을 입력해 주세요");
        document.createFrm.email.focus();
	}else if($("#emailCheckValue").val() == 'C'){
		alert("중복된 이메일입니다");
		document.createFrm.email.focus();
	} else if(!regEmail.test($("#email").val())){
		alert("이메일 형식이 올바르지 않습니다");
		document.createFrm.email.focus();
	}
	else{
	var url = "./popup/mailForm";
	url += "?email="+email;
	wr = window.open(url,"이메일인증","width=400,height=450");
	wr.moveTo((window.screen.width+300),(window.screen.height-500)/2);
	}
}
function submitFn() {
	var regPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var regId = /^[A-Za-z0-9]{4,12}$/;
	var regPasswd = /^[A-Za-z0-9!@#$%^&*()\-_=+\\\|\[\]{};:\'",.<>\/?]{8,20}$/;
	var regName = /^[가-힣a-zA-Z]{2,10}$/;
	var regZipcode = /^[가-힣a-zA-Z]{2,10}$/;
	
	

	 
	if($("#id").val() == null || $("#id").val() == '') {
        alert("아이디를 입력하세요!");
		$("#id").focus();
        return false;
 	 }
	 if (!regId.test($("#id").val())) {
		 $("#id").val('');
		 $("#id").focus();
		 alert("아이디 형식이 올바르지 않습니다.");
		 return false;
	}else if($("#idCheckValue").val() == 'C'){
	 		$("#id").focus();
	 		alert("이미 존재하는 아이디 입니다.");
	 		return false;
     } else if($("#passwd").val() == null || $("#passwd").val() == '') {
         alert("비밀번호를 입력하세요");
         $("#passwd").val('');
         $("#repasswd").val('');
         $("#passwd").focus();
         return false;
         
      } else if($("#repasswd").val() == null || $("#repasswd").val() == '') {
          alert("비밀번호 확인을 입력하세요!");
          $("#passwd").val('');
          $("#repasswd").val('');
          $("#passwd").focus();
          return false;
      }else if (!regPasswd.test($("#passwd").val()) || !regPasswd.test($("#repasswd").val())) {
         $("#passwd").val('');
         $("#repasswd").val('');
         $("#passwd").focus();
		 alert("비밀번호 형식이 올바르지 않습니다.");
		 return false;
	 }else if($("#passwd").val() != $("#repasswd").val()) {
          alert("비밀번호가 일치하지 않습니다.");
          $("#passwd").val('');
          $("#repasswd").val('');
          $("#passwd").focus();
          return false;
      }else if($("#email").val() == null || $("#email").val() == '') {
			alert("이메일을 입력하세요");
			$("#email").focus();
			return false;
	 }else if($("#emailCheckValue").val() == 'C'){
	 		$("#email").focus();
	 		alert("이미 존재하는 이메일입니다.");
	 		return false;
	 }else if($("#emailCheckValue").val() == 'N'){
	 		$("#email").focus();
	 		alert("이메일 인증을 하세요.");
	 		return false;
       } else if (!regEmail.test($("#email").val())) {
   		alert("이메일 형식을 확인 하세요");
		$("#email").focus();
       }else if($("#name").val() == null || $("#name").val() == '') {
       		alert("이름을 입력하세요!");
  	 		$("#name").focus();
       		return false;
    	}else if (!regName.test($("#name").val())) {
    	    $("#name").focus();
		    alert("이름 형식을 확인하세요.")
		} 
       else if($("#phone").val() == null || $("#phone").val() == '') {
           alert("전화번호를 입력하세요");
           $("#phone").focus();
           return false;
        }else if (!regPhone.test($("#phone").val())) {
    		alert("전화번호 형식을 확인 하세요");
    		$("#phone").focus();
        } 
       else if($("#addressCheckValue").val() == 'N') {
           alert("주소를 검색 하세요");
           $("#memberAddresscheck").focus();
           return false;
        } else if (!regZipcode.test($("#zipcode").val())) {
    	    $("#zipcode").focus();
		    alert("상세주소는 10자리이내  입력가능합니다.")
		} 
   		else{
 		 alert("회원가입을 성공하였습니다.");
    	 $("#createFrm").submit();
   		}
}
</script>
 <div class="text-center" style="margin-bottom: 70px;">
	<img src="${root}/images/member/create_top.png" height="15%" width="15%">
</div>
 <div align="center">
 <form id = "createFrm" name = "createFrm" method="post" action="./create">
 
 <input type="hidden" id="idCheckValue" name="idCheckValue" value="N" />
 <input type="hidden" id="emailCheckValue" name="emailCheckValue" value="N" />
 <input type="hidden" id="addressCheckValue" name="emailCheckValue" value="N" />

 <fieldset style="border:3; solid #808080; width:650px; margin-bottom: 80px; ">
 

 <legend>기본 정보</legend>
 <table class = "table" style="width: 50%">
 <tr>
 	<td >
 		<input class = "form-control"type = "text" name = "id" id = "id" placeholder="아이디 입력" required="required" >
 		   <div id="idch">
 		       	아이디를 입력하세요.<br>
 		   		<span style="color: red; font-size: 9px;">*영문자,숫자만 입력 가능합니다.</span>
                <input type="hidden" value="0" name="use"/>
           </div>
 	</td>
 </tr>
 <tr >
 	<td>
 		<input class = "form-control"type = "password" name = "passwd" id = "passwd" placeholder="비밀번호 입력" required="required">
 		<div id="passwdch">
        	<input type="hidden" value="0" name="use"/>
        </div>
 	</td >
 </tr>
 <tr>
 	<td >
 		<input class = "form-control"type = "password" name = "repasswd" id = "repasswd" placeholder="비밀번호 확인" required="required">
 		<div id="repasswdch">
        	<input type="hidden" value="0" name="use"/>
        </div>
 	</td>
 </tr>
 <tr>
 	<td>
 		<input class = "form-control"type = "text" name = "email" id = "email" placeholder="이메일" required="required" >
	    <div id="emailch">이메일을 입력하세요.
        	<input type="hidden" value="0" name="use"/>
        </div>
    </td>
 	<td>
 		<input type="button" value="인증" class="btn btn-primary btn-xs btn-fill" onclick = "emailCheck(document.createFrm.email.value)">
 	</td>
 </tr>

 </table>
</fieldset>
 <fieldset style="border:3; solid #808080; width:650px; margin-bottom: 50px;">
 <legend>고객 정보</legend>
 <table class = "table" style="width: 50%">
 <tr>
 	<td>
 		<input class = "form-control"type = "text" name = "name" id = "name" placeholder="이름" required="required">
 		<div id="namech">
        	<input type="hidden" value="0" name="use"/>
        </div>
 	</td>
 </tr>
 <tr>
 	<td>
 		<input class = "form-control"type = "text" name = "phone" id = "phone" placeholder="전화번호(000-0000-0000)" required="required">
	    <div id="phonech">
        	<input type="hidden" value="0" name="use"/>
        </div>
 	</td>
 </tr>
 <tr>
 	<td>
 		<input type="button" value="우편번호찾기" id = "memberAddresscheck" onclick="sample6_execDaumPostcode()" class="btn btn-primary btn-xs btn-fill">
 		<input class = "form-control" type = "text" name = "zipcode" placeholder="우편 번호" id="sample6_postcode" readonly>
 		<input class = "form-control"type = "text" name = "address1" placeholder="기본 주소" id="sample6_address" readonly >
 		<input class = "form-control"type = "text" name = "address2" placeholder="상세 주소" id="sample6_address2" >
 	</td>
 </tr>
 <tr>
 	<td style="font-size: 20px; font-weight: bold;">가입경로<br>
 		<span style="font-size: 15px">
 		<input type = "radio" name = "come" value = "come_sms" >SNS
 		<input type = "radio" name = "come" value = "come_blog">블로그
 		<input type = "radio" name = "come" value = "come_person">주변지인
 		<input type = "radio" name = "come" value = "come_others">기타
 		</span>
 	</td>
 </tr>
 <tr>
 	<td style="font-size: 20px; font-weight: bold;">정보수신<br>
 	 		<span style="font-size: 15px">
		<input type = "checkbox" name = "receive" value = "rc_email">email
 		<input type = "checkbox" name = "receive" value = "rc_sms">문자
 		<br>
 			</span>
 			<span style="font-size: 9px; color: red;">
 				※위 항목에 대한 정보수신에 동의합니다.
 			</span>
 	</td>
 </tr>
 <tr>
 	<td style="font-size: 20px; font-weight: bold;">관심분야<br>
 		<span style="font-size: 15px">
	 		<input type = "checkbox" name = "interest" value = "in_calli">캘리그라피 
	 		<input type = "checkbox" name = "interest" value = "in_pen">펜글씨
	 		<input type = "checkbox" name = "interest" value = "in_ink">먹그림
	 		<input type = "checkbox" name = "interest" value = "in_watercolor">수채화
	 		<br>
	 		<input type = "checkbox" name = "interest" value = "in_ask" >프로젝트 의뢰
	 	</span>
 	</td>

 </tr>
 </table>
 </fieldset>
  <div class="slider_btn" style="margin-bottom: 20px;text-align: center;">
  <a class="btn-primary" onclick="javascript:submitFn();" >회원가입</a>
  <a class="btn-primary" onclick="history.back()">취소</a>
 </div>

 </form>
 </div>
 