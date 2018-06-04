<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]> <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]> <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]> <!-->
<html lang="zxx">
<head>
	<tiles:insertAttribute name="header"></tiles:insertAttribute>
</head>
<body>
	<tiles:insertAttribute name="nav"></tiles:insertAttribute>
	<tiles:insertAttribute name="body"></tiles:insertAttribute>
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>	
	
	<!-- plugins -->
	<script src="${root}/js/plugins.js"></script>
	<!-- Bootstrap -->
	<script src="${root}/js/bootstrap.min.js"></script>
	
	<!-- Custom Scripts ========================================-->
	<script src="${root}/js/main.js"></script>
</body>
</html>
