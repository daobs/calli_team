<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%

%>
 <c:choose>
 	<c:when test="${flag }">
		<span>님 반갑습니다.</span>
 	</c:when>
 	<c:otherwise>
		 <span>로그인에 실패하였습니다.</span>
 	</c:otherwise>
 </c:choose>
