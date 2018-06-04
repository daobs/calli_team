<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<style>
hr {
	border-width: 1px 0;
	border-color: #cac3c3;
	margin: 18px 0;
}
</style>

<script>
	function read(bbsno) {
		var url = "./read";
		url += "?bbsno=" + bbsno;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}
	

</script>

<header id="page-top" class="blog-banner "
	style="background-image: url(${root}/images/portfolio/headimg.jpg);">
	<!-- Start: Header Content -->
	<div class="container" id="blog">
		<div class="row blog-header text-center wow fadeInUp"
			data-wow-delay="0.5s">
			<div class="col-sm-12">
				<!-- Headline Goes Here -->
				<h4 style="font-family: '휴먼편지체';">board / Free Board</h4>
				<h3 style="font-family: '휴먼편지체';">자유게시판</h3>
			</div>
		</div>
		<!-- End: .row -->
	</div>
	<!-- End: Header Content -->
</header>

<!-- Start : Blog Page Content 
==================================================-->


<div class="blog_container blog_page_three">
	<div class="container">
		<div class="col-sm-12 col-xs-12 blog-area">
			
			
				<table class="table">
		<tr>
			<th width="5%">NO</th>
			<th width="15%">작성자</th>
			<th width="60%">제목</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:choose>
			<c:when test="${empty list}">
				<tbody>
					<tr>
						<td colspan="8">등록된 글이 없습니다.</td>
					</tr>
				</tbody>
			</c:when>
			<c:otherwise>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td>${vo.bbsno}</td>
						<c:choose>
						<c:when test="${fn:substring(vo.id,fn:length(vo.id)-7,fn:length(vo.id)) eq '(kakao)'}">
						<td><img src="${root}/images/kaka3.JPG"> ${fn:substring(vo.id,0,fn:length(vo.id)-7)}</td>
						</c:when>
						<c:otherwise>
						<td>${vo.id }</td>
						</c:otherwise>
						
						</c:choose>
						
						<td><a href="javascript:read('${vo.bbsno}')">
								${vo.title} </a></td>
						<td>${vo.wdate}</td>
						<td>${vo.viewcnt}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</div>
<hr>
<DIV>${paging}</DIV>
<br>
<div align="center" class="row">
	<form method="post" action="./list" class="form-inline">
		<div class="col-md-16">
			<select name="col" class="form-control">
				<option value="id"
					<c:out value="${col=='id' ? 'selected' : '' }"/>>아이디</option>
				<option value="title"
					<c:out value="${col=='title' ? 'selected' : '' }"/>>제목</option>
				<option value="content"
					<c:out value="${col=='content' ? 'selected' : '' }"/>>내용</option>
				<option value="total">전체출력</option>
			</select> <input type="text" name="word" class="form-control" value="${word}">
			<button type="submit" class="form-control btn-primary">검색</button>
		</div>
	</form>
</div>
<c:if test="${not empty sessionScope.id}">
	<div style="margin-top: 50px">
		<button type="button" class="form-control btn-primary"
			onclick="location.href='create'">등록</button>
	</div>
</c:if>
			
			
		</div>
	</div>



