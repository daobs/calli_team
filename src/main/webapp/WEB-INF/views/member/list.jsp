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

function update(id,grade) {
 	var url = "./updatemember";
 	url += "?id=" + id;
 	url += "&grade="+grade;

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
				<h4 style="font-family: '휴먼편지체';">멤버</h4>
				<h3 style="font-family: '휴먼편지체';">멤버정보</h3>
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
			
		<c:choose>
		<c:when test="${sessionScope.grade ne 'A'}">
		<h3>URL로 접속하지 마세요!!!!!!!!!!</h3>
		
		</c:when>
		<c:otherwise>
		
		
		
				<table class="table">  
 
		<tr>
			<th width="10%">id</th>
			<th>이름</th>
			<th>이메일</th>
			<th>폰 번호</th>			
			<th>주소</th>
			<th>회원등급</th>
			<th>정보수신</th>
			<th>관심분야</th>
			<th>가입일</th>
		</tr>
		<c:choose>
			<c:when test="${empty list}">
				<tbody>
					<tr>
						<td colspan="8">등록된 회원이 없습니다.</td>
					</tr>
				</tbody>
			</c:when>
			<c:otherwise>
				<c:forEach var="vo" items="${list }">



					<tr>
						<td>${vo.id }</td>						
						<td>${vo.name}</td>
						<td>${vo.email}</td>
						<td>${vo.phone}</td>
						<td>${vo.zipcode}${vo.address1}${vo.address2}</td>
						<td><select name='grade' onchange="update(${vo.id },this.value)">						
						<c:choose>
						<c:when test="${vo.grade eq 'A' }">					
							<option value='A'>A</option>
							<option value='B'>B</option>	
						</c:when>
						<c:otherwise>
							<option value='B'>B</option>
							<option value='A'>A</option>						    
						</c:otherwise>						
						</c:choose>	
						
									 				
						</select>
<%-- 						<button onclick="update('${vo.id}','${grade }')">등급변경</button> --%>
						</td>
						
						 
						
						<td>${vo.receive}</td>
						<td>${vo.interest}</td>
						<td>${vo.wdate}</td>


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
				<option value="name"
					<c:out value="${col=='name' ? 'selected' : '' }"/>>이름</option>
				<option value="email"
					<c:out value="${col=='email' ? 'selected' : '' }"/>>이메일</option>
				<option value="total">전체출력</option>
			</select> <input type="text" name="word" class="form-control" value="${word}">
			<button type="submit" class="form-control btn-primary">검색</button>
		</div>
	</form>
	
	</c:otherwise>
		</c:choose>	 

</div>



			
		</div>
	</div>
	

			



