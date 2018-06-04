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

<title>비밀번호 찾기</title>

<style>
legend{
font-family: "휴먼편지체";
font-weight: bold;
font-size: 300%;
}


</style>
</head>
<body>
<div class="container" align="center" style="margin-top: 20px">
<fieldset>
<legend>비밀번호 조회</legend>
<FORM name='findPwfrm' id = "findPwfrm" method='POST' action='findPwProc'>
 	<TABLE  class="table text-center" style="width: 70%">
 		<tr>
 			<th>아이디</th>
 			<td>
 				<input class = "form-control"type = "text" name = "id" id = "id" required="required">
 			</td>
 		</tr>
 		<tr>
 			<th>Email</th>
 			<td>
 				<input class = "form-control"type = "text" name = "email" id = "email" required="required">
 			</td>
 		</tr>
 	</TABLE>
	<input type="submit" class="btn-primary btn-sm" value="찾기">
	<input type = "button" class="btn-primary btn-sm" onclick="window.close()" value="취소">
</FORM>
</fieldset>
</div>
</body>
</html>