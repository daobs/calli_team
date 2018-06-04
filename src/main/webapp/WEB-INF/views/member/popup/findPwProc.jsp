<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>아이디 찾기 결과</title>

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
</head>
<body>
<div class="container" align="center" style="margin-top: 20px">
<fieldset>
<legend>비밀번호 조회 결과</legend>
<div style="margin-top: 30px">
<c:choose>
	<c:when test="${flag }">
	귀하의 비밀번호가 입력한 이메일 주소({${ email})로 전송되었습니다. 변경 후 사용하시길 바랍니다.
	</c:when>
	<c:otherwise>
	<span style="font-size: 20px;">일치하는 회원정보가 없습니다.</span>
	</c:otherwise>
</c:choose>
</div>
<div style="margin-top: 60px">
<input type = "button" class="btn-primary btn-sm" onclick="history.back()" value="다시 시도">
<input type = "button" class="btn-primary btn-sm" onclick="window.close()" value="취소">
</div>
</fieldset>
</div>
</body>
</html>