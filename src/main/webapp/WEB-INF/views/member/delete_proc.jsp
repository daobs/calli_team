<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


 <c:choose>
 	<c:when test="${flag }">
 		 <span style="color: red">회원 탈퇴되었습니다.</span>
 	</c:when>
 	<c:otherwise>
		 <span style="color: green">비밀번호가 일치하지 않습니다.</span>
 	</c:otherwise>
 </c:choose>
 