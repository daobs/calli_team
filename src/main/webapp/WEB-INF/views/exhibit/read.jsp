<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<link href="${root}/css/style.css" rel="stylesheet">

<script type="text/javascript">

function update(){
	var url = "../img/update";
	url += "?imgno="+${dto.imgno};
	url += "&col=${param.col}";
	url += "&nowPage=${param.nowPage}";
	url += "&oldFile=${dto.nail_img}";
	location.href=url;
}

function create(){
	var url = "../img/create";
	url += "?col=${param.col}";
	url += "&nowPage=${param.nowPage}";
	location.href=url;
}
function idelete(){
	if(confirm("정말 삭제하시겠습니까?")){
		var url = "../img/delete";
		url += "?imgno=${dto.imgno}";
		url += "&col=${param.col}";
		url += "&oldFile=${dto.nail_img}"
		url += "&nowPage=${param.nowPage}";
		location.href=url;
	}
}

</script>


<!-- header -->
<header id="page-top" class="blog-banner"
	style="background-image: url(${root}/images/photofolio/headimg.jpg);">
	<!-- Start: Header Content -->
	<div class="container" id="blog">
		<div class="row blog-header text-center wow fadeInUp"
			data-wow-delay="0.5s">
			<div class="col-sm-12">
				<!-- Headline Goes Here -->
				<h4 style="font-family: '휴먼편지체';">왕은실 / 오문석</h4>
				<h3 style="font-family: '휴먼편지체';">${dto.classes }</h3>
			</div>
		</div>
		<!-- End: .row -->
	</div>
	<!-- End: Header Content -->
</header>
<!--/. header -->

<!--Start: Work Section 
==================================================-->
<section class="single-work-page">
	<div class="container">
		<div class="row">
			<!-- portfolio item -->
			<div class="col-sm-10 col-xs-12">
			
							
				<c:if test="${sessionScope.grade eq 'A' }">
					<div style="text-align: center;">
					<ul class="list-inline social-icons">
						<li>
							<p>
								<button class="w3-button w3-indigo" onclick="update()">수정</button>
							</p>
						</li>
						<li>
							<p>
								<button class="w3-button w3-deep-purple" onclick="create()">등록</button>
							</p>
						</li>
						<li>
							<p>
								<button class="w3-button w3-purple" onclick="idelete()">삭제</button>
							</p>
						</li>
					</ul>
					</div>
				</c:if>
					


				<div class="portfoliodesc">
					<div class="col-sm-12">
						<div class="project-details">
							<h4>${dto.classes}: ${dto.title }</h4>
							<hr>

							${dto.content }


						</div>
					</div>
				</div>
			</div>

			<div class="col-sm-2 col-xs-12">
				<div class="portfolio-single-detail">
					<h4>${dto.classes }</h4>
					<hr>
					<ul class="list-unstyled project-detail-list margin-bottom-50">
						<li>${dto.title }</li>
						<li>${dto.subtitle }</li>
					</ul>
					<h4>Link</h4>
					<hr>
					<ul class="list-inline social-icons">
						<li>
												<a
							href="https://Cafe.naver.com/wangwangart"
							target="_blank"> <img alt="footer-1"
								src="${root}/images/template/naver_cafe.jpg">
						</a> 
						<a
							href="https://www.instagram.com/explore/tags/%EC%99%95%EC%9D%80%EC%8B%A4%EC%BA%98%EB%A6%AC%EA%B7%B8%EB%9D%BC%ED%94%BC"
							target="_blank"> <img alt="footer-1"
								src="${root}/images/template/footer-1.jpg">
						</a> 
						<a href="https://story.kakao.com/ch/wangwang" target="_blank">
								<img alt="footer-2" src="${root}/images/template/footer-2.jpg">
						</a> <a
							href="http://plus.kakao.com/home/@%EC%99%95%EC%9D%80%EC%8B%A4%EC%BA%98%EB%A6%AC%EA%B7%B8%EB%9D%BC%ED%94%BC"
							target="_blank"> <img alt="footer-3"
								src="${root}/images/template/footer-3.jpg">
						</a> <a href="https://twitter.com/wangwangon?lang=ko" target="_blank">
								<img alt="footer-4" src="${root}/images/template/footer-4.jpg">
						</a> <a href="https://ko-kr.facebook.com/ohwangart" target="_blank">
								<img alt="footer-5" src="${root}/images/template/footer-5.jpg">
						</a></li>
					</ul>

				</div>
			</div>

			<!--/ portfolio item -->
		</div>
		<!-- row /- -->
	</div>
	<!-- Container /- -->
</section>
<!-- End: Work Section 
==================================================-->
