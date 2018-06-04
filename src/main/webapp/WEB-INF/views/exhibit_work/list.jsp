<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<link href="${root }/css/style.css" rel="stylesheet">
<script type="text/javascript">
function read(imgno){
	var url = "./read";
	url += "?imgno="+imgno;
	url += "&col=${col}";
	url += "&nowPage=${nowPage}";
	location.href=url;
}
function list(){
	var url = "./list";

	url += "?col=${col}";
	url += "&nowPage=${nowPage}";
	location.href = url;
	}
	
function list(col){
	var url = "./list";
	url += "?col="+col;
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
				<h4 style="font-family: '휴먼편지체';">Project / Portfolio</h4>
				<h3 style="font-family: '휴먼편지체';">포트폴리오 작품</h3>
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
		<div class="row">
			<div style="text-align: center;">
			<h4 style="size: 150%; font-family: '휴먼편지체';">				
					<a href="javascript:list('')">전체　</a>
					<a href="javascript:list('logo')">로고　</a>
					<a href="javascript:list('adv')">광고　</a>
					<a href="javascript:list('edit')">편집　</a>
					<a href="javascript:list('art')">아트상품　</a>
					<a href="javascript:list('event')">행사</a>
					
			</h4>
				
			</div>

			<!-- 	서치 -->



			<div class="col-sm-12 col-xs-12 blog-area">
				<div class="row">

					<c:forEach var="dto" items="${list}">
						<div class="col-md-4 col-sm-6 col-xs-12">
							<div class="blog-warp-1 wow fadeInLeft" data-wow-delay="0.5s">
								<a href="javascript:read('${dto.imgno}')">
									<div class="blog_imgg">
										<img src="${root}/images/img/storage/${dto.nail_img}" />

									</div>
								</a>
								<div class="blog_content_warp" style="width : 300px;height: 100px; ">
									<h5 style="text-align: center;">
									<a href="javascript:read('${dto.imgno}')"> ${dto.imgno }. ${dto.title }</a>
									</h5>
									<p style="text-align: center;">${dto.subtitle }</p>
								</div>
							</div>
						</div>


					</c:forEach>


				</div>
				
					<div class="bottom">
		${paging}
	</div>
	
	
				
				


				<!--/ Blog Area -->

			</div>
		</div>
	</div>
	<!-- Container /- -->
</div>
<!--  End : Blog Page Content
==================================================-->

