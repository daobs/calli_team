<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<!-- Bootstrap -->
<link href='<c:url value="/css/bootstrap.min.css" />' rel="stylesheet">
<link href='<c:url value="/css/kfonts2.css" />' rel="stylesheet">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<%-- <script src='<c:url value="/jquery/jquery-1.11.3.min.js" />'></script> --%>
<script src='<c:url value="/js/jquery-1.12.4.min.js" />'></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src='<c:url value="/js/bootstrap.min.js"  />'></script>
 
<title>메일 인증</title>

<style>
legend{
font-family: "휴먼편지체";
font-weight: bold;
font-size: 300%;
}
</style>
<script>
function mailCheck() {
	if($("#result").val()==$("#code").val()){ 
		alert("인증처리 되었습니다");
		opener.$('#emailCheckValue').val('Y');
		
		window.self.close();
	}
	/*
	if( document.getElementById("result").value == document.getElementById("code").value) {
		alert("인증처리 되었습니다");
		window.self.close();
	}
	*/
	
}

</script>
</head>
<body>
<div class="container" align="center" style="margin-top: 20px">
<fieldset>
  <legend>인증코드 확인</legend>
  <form action="mailProc" method="post">
  	<input type="hidden" name = "result" id = "result" value = "<%=session.getAttribute("result")%>">
  	<input type="hidden" name = "mailResult" id = "mailResult" value = "Y">
    <div align="center" style="margin-top: 30px;">
      <input type="text" name="code" id = "code" size="120" style="width:100%" placeholder = "인증코드를 입력하세요 " class="form-control"required="required">
    </div>     
    <p>
    <p>
    <div align="center" style="margin-top: 40px;">
	      <input type="submit" value="확인" class="btn btn-primary" onclick="mailCheck()">
	      <input type="button" value="닫기" class="btn btn-primary" onclick="window.close()">
    </div>
  </form>
</fieldset>
</div>
</body>
</html> 