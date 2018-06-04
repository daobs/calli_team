<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<link href="${root}/css/style.css" rel="stylesheet">

<style type="text/css">
legend {
	font-family: "휴먼편지체";
	font-weight: bold;	
	font-size: 300%;
}

th {
	font-family: "휴먼편지체";
	font-size: :"120%";
	font-weight: bold;
}
</style>

<header id="page-top" class="blog-banner" style="background-image: url(${root}/images/portfolio/headimg.jpg);">
   <!-- Start: Header Content -->
   <div class="container" id="blog">
       <div class="row blog-header text-center wow fadeInUp" data-wow-delay="0.5s">
           <div class="col-sm-12">
               <!-- Headline Goes Here -->
               <h4 style="font-family: '휴먼편지체';"> Project / Request </h4>
               <h3 style="font-family: '휴먼편지체';"> 작업 의뢰 </h3> 
           </div>
       </div>
       <!-- End: .row -->
   </div>  <!-- End: Header Content -->
</header>

<div align="center">
<br><br><br><br>
<c:if test="${param.flag eq true}">
<h1>작업의뢰서가 정상적으로 발송되었습니다.</h1>
<h1>빠른 기일 내에 연락 드리겠습니다. 감사합니다.</h1>
</c:if>

<c:if test="${param.flag ne true}">
<h1>작업의뢰서 발송 중 에러가 발생했습니다.</h1>
<h1>다시한번 제출 부탁드리겠습니다. 감사합니다.</h1>
</c:if>
<br><br><br><br><br>	
</div>