<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('content');
  };
</script>
<script>
function inCheck(f) {
	if(f.title.value == "") {
		alert("제목을 입력하세요");
		f.title.focus();
		return false;
	}
	if (CKEDITOR.instances['content'].getData() == '') {
	      window.alert('내용을 입력해 주세요.');
	      CKEDITOR.instances['content'].focus();
	      return false;
	}
}
</script>
<div align="center">
	<h3>자유게시판 글 수정</h3>
	<form name = "update" method = "post" action = "./update" onsubmit = "return inCheck(this)">
		<input type="hidden" name="col" value="${param.col}">
		<input type="hidden" name="word" value="${param.word}">
		<input type="hidden" name="nowPage" value="${param.nowPage}">
		<input type="hidden" name="bbsno" value = "${vo.bbsno }">
		<table class = "table" style="align-content: center">
			<TR>
				<TH>제목</TH>
				<TD><input type="text" name="title" value="${vo.title }"></TD>
			</TR>
			<TR>
				<th>내용</th>
				<TD colspan="2">
					<textarea rows="10" cols="45" name="content">${vo.content }</textarea>
				</TD>
			</TR>
		</table>
		<div>
			<input type = "submit" value = "등록">
			<input type = "button" value = "취소" onclick = "history.back()">
		</div>
	</form>
</div>