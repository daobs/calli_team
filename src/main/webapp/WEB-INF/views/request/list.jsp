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
	function read(requestno) {
		var url = "./read";
		url += "?requestno=" + requestno;
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
				<h4 style="font-family: '휴먼편지체';">관리자</h4>
				<h3 style="font-family: '휴먼편지체';">작업의뢰 리스트</h3>
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
		<c:if test="${sessionScope.grade eq 'A' }">
			
			
				<table class="table">
		<tr>
			<th width="5%">NO</th>
			<th>담당자명</th>
			<th>의뢰로고명</th>
			<th>연락처</th>
			<th>등록일</th>
			
			
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
				<c:forEach var="dto" items="${list }">
					<tr>
						<td>${dto.requestno}</td>
						<td><a href="javascript:read('${dto.requestno}')">
								${dto.name}</a></td>
						<td><a href="javascript:read('${dto.requestno}')">
								${dto.logo_name} </a></td>	
						<td><a href="javascript:read('${dto.requestno}')">${dto.phone}</a></td>
						<td>${dto.wdate}</td>

					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</div>
<hr>
<DIV>${paging}</DIV>
<br>


			
			</c:if>
		</div>
		
	</div>



