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
<script src='<c:url value="/jquery/jquery-1.11.3.min.js" />'></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src='<c:url value="/js/bootstrap.min.js"  />'></script>
 
<title>메일 보내기</title>

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
  <legend>메일 보내기</legend>
  <form action="mailForm" method="post">
    <div align="center" style="margin-top: 30px;"><!-- 받는 사람 이메일 -->
      <input type="text" name="tomail" size="120" style="width:100%" readonly class="form-control" value = "${tomail }" required="required">
    </div>     
    <p>
    <p>
    <div align="center" style="margin-top: 40px;">
      <input type="submit" value="메일 보내기" class="btn btn-primary">
      <input type="button" value="닫기" class="btn btn-primary" onclick="window.close()">
    </div>
  </form>
</fieldset>
</div>
</body>
</html> 