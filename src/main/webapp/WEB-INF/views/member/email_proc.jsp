<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <c:choose>
 	<c:when test="${old_flag}">
 		 <span style="color: green">기존 이메일이라 사용 가능합니다.</span>
 	</c:when>
 	<c:when test="${flag }">
 		 <span style="color: red">중복된 이메일입니다.</span>
 	</c:when>
 	<c:otherwise>
		 <span style="color: green">사용 가능한 이메일입니다.</span>
 	</c:otherwise>
 </c:choose>
