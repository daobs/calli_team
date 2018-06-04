<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link href="${root}/css/bs/style.css" rel="stylesheet">
<script src="${root}/js/member_update.js"></script> 

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




<script>
var regPasswd = /^[A-Za-z0-9!@#$%^&*()\-_=+\\\|\[\]{};:\'",.<>\/?]{8,20}$/;
var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
var regName = /^[가-힣a-zA-Z]{2,10}$/;
var regPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;

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
$(document).ready(function(){
	$("#name").focusout(function () {
 	var regName = /^[가-힣a-zA-Z]{2,10}$/;
		if (!regName.test($("#name").val())) {
		    document.getElementById('namech').innerHTML = 
		    	"<font color = 'red'>한글 또는 영문자로 2-10자리로 입력하세요.</font>";		   
		} 
	});
});
$(document).ready(function(){
	$("#name").focusout(function () {
		var regName = /^[가-힣a-zA-Z]{2,10}$/;
		if (regName.test($("#name").val())) {
		    document.getElementById('namech').innerHTML = 
		    	"<font color = 'green'>정상적으로 입력되었습니다.</font>";
		   
		} 
	});
});
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

</script>
<script type="text/javascript">
function deleteFn() {
	location = "delete";
	
}
function submitFn() {
	var regPasswd = /^[A-Za-z0-9!@#$%^&*()\-_=+\\\|\[\]{};:\'",.<>\/?]{8,20}$/;
	var regName = /^[가-힣a-zA-Z]{2,10}$/;
	var regPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	
	 if($("#passwd").val() == null || $("#passwd").val() == '') {
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
          document.getElementById('passwdch').innerHTML = "";
          document.getElementById('repasswdch').innerHTML = "";
          return false;
	 }else if($("#email").val() == null || $("#email").val() == '') {
			alert("이메일을 입력하세요");
			$("#email").focus();
			return false;
	}else if($("#emailCheckValue").val() == 'C'){
	 		$("#email").focus();
	 		alert("이메일 중복확인을 다시 하세요");
	 		return false;
    }else if($("#name").val() == null || $("#name").val() == '') {
       		alert("이름을 입력하세요!");
  	 		$("#name").focus();
       		return false;
    }else if (!regName.test($("#name").val())) {
    	    $("#name").focus();
		    alert("이름 형식을 확인하세요.")
	}else if($("#name").val() == null || $("#name").val() == '') {
   		alert("이름을 입력하세요!");
	 		$("#name").focus();
   		return false;
	}else if (!regName.test($("#name").val())) {
	    $("#name").focus();
	    alert("이름 형식을 확인하세요.")
	} 
	 else{
 		alert("정보 수정되었습니다.");
 		$("#updateFrm").submit();
	 }
}
</script>
 <div align="center">
 <form id = "updateFrm" name = "updateFrm" method="post" action="./update">
 <input type="hidden" id="emailCheckValue" name="emailCheckValue" value="N" />
 
 
 <fieldset style="border:3; solid #808080; width:700px; margin-bottom: 40px;  margin-top: 20px;">
 <legend>회원 정보</legend>
 <table class = "table" style="width: 70%">
 <tr>
 	<th >ID</th>
 	<td >
 		<input class = "form-control"type = "text" name = "id" id = "id" value = "${vo.id }"placeholder="아이디 입력" required="required" readonly>
 	</td>
 </tr>
 <tr>
 	<th>비밀번호</th>
 	<td>
 		<input class = "form-control"type = "password"  name = "passwd" id = "passwd"  required="required">
 		<div id="passwdch">
        	<input type="hidden" value="0" name="use"/>
      	</div>
 	</td >
 </tr>
 <tr>
 	<th>비밀번호 확인</th>
 	<td>
 		<input class = "form-control"type = "password"  name = "repasswd" id = "repasswd" required="required">
 		<div id="repasswdch">
        	<input type="hidden" value="0" name="use"/>
   		</div>
 	</td>
 </tr>
 <tr>
 	<th>Email</th>
 	<td>
 		<input class = "form-control"type = "text"value = "${vo.email}" name = "email" id = "email" placeholder="이메일" required="required" >
 		<div id="emailch">
        	<input type="hidden" value="0" name="use"/>
        </div>
 	</td>
 </tr>

 <tr>
 	<th>이름</th>
 	<td>
 		<input class = "form-control"type = "text" value = "${vo.name}" name = "name" id = "name" placeholder="이름" required="required">
 		<div id="namech">
        	<input type="hidden" value="0" name="use"/>
        </div>
 	</td>
 </tr>
 <tr>
 	<th>전화번호</th>
 	<td>
 		<input class = "form-control"type = "text" value = "${vo.phone}" name = "phone" id = "phone" placeholder="전화번호(000-0000-0000)" required="required">
	    <div id="phonech">
        	<input type="hidden" value="0" name="use"/>
        </div>
 	</td>
 </tr>
 </table>
 <table class = "table" style="width: 70%">
 <tr>
  <th width="15%">주소</th>
 	<td>
 		<input type="button" value="우편번호찾기" id = "memberAddresscheck" onclick="sample6_execDaumPostcode()" class="btn btn-primary btn-xs btn-fill">
 		<input class = "form-control" type = "text" value = "${vo.zipcode}" name = "zipcode" placeholder="우편 번호" id="sample6_postcode" readonly>
 		<input class = "form-control"type = "text" value = "${vo.address1}" name = "address1" placeholder="기본 주소" id="sample6_address" readonly >
 		<input class = "form-control"type = "text" value = "${vo.address2}" name = "address2" placeholder="상세 주소" id="sample6_address2" >
 	</td>
 </tr>
 </table>
  <table class = "table" style="width: 70%">
 <tr>
 	<td style="font-size: 20px; font-weight: bold;">정보수신<br>
 	 		<span style="font-size: 15px">
 	 	<c:choose>
 	 		<c:when test="${fn:indexOf(vo.receive, 'rc_email,rc_sms') > -1}">
				<input type = "checkbox" name = "receive" value = "rc_email" checked="checked">email
		 		<input type = "checkbox" name = "receive" value = "rc_sms" checked="checked">문자
 	 		</c:when>
 	 		<c:when test="${fn:indexOf(vo.receive, 'rc_email') > -1}">
				<input type = "checkbox" name = "receive" value = "rc_email" checked="checked" >email
		 		<input type = "checkbox" name = "receive" value = "rc_sms">문자
 	 		</c:when>
 	 		<c:when test="${fn:indexOf(vo.receive, 'rc_sms') > -1}">
				<input type = "checkbox" name = "receive" value = "rc_email">email
		 		<input type = "checkbox" name = "receive" value = "rc_sms" checked="checked"  >문자
 	 		</c:when>
 	 		<c:otherwise>
 	 			<input type = "checkbox" name = "receive" value = "rc_email">email
		 		<input type = "checkbox" name = "receive" value = "rc_sms">문자
 	 		</c:otherwise>
 	 	</c:choose>
 		<br>
 			</span>
 			<span style="font-size: 9px; color: red;">
 				※위 항목에 대한 정보수신에 동의합니다.
 			</span>
 			<div class="slider_btn" style="margin-bottom: 20px;text-align: center;">
 			<a class="btn-primary" onclick = "javacsript:submitFn();">정보 수정</a>
 			<a class="btn-primary" onclick="history.back()">취소</a>
 			</div>
 	</td>
 </tr>
 </table>
 </fieldset>
 </form>
	<div class="slider_btn" style="margin-bottom: 20px;">
		
		<a class="btn-primary" onclick = "javacsript:deleteFn();">회원 탈퇴</a>		
		
	</div>
 </div>