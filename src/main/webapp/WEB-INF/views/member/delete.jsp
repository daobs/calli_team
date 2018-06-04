<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<script src="${root}/js/member_delete.js"></script> 

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

<div align="center">
	<fieldset style="border:3; solid #808080; width:600px; margin-bottom: 30px;  margin-top: 50px;">
	<legend>비밀번호 재확인</legend>
	<form id="deleteFrm" method="POST"></form>
	<table class = "table" style="width: 50%">
	<tr>
		<th width="40%">ID</th>
		<td width="50%">
			<input class = "form-control"type = "text" name = "id" id = "id" value = "${id }"placeholder="아이디 입력" required="required" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>
			<input class = "form-control"type = "password"  name = "passwd" id = "passwd"  required="required">
		</td>
	</tr>
	</table>
	</fieldset>
	<div class="slider_btn" style="margin-bottom: 20px;text-align: center;">
		<a class="btn-primary" id = "deleteBtn">탈퇴</a>
		<a class="btn-primary" onclick="history.back()">취소</a>
	</div>
	<br>
</div>