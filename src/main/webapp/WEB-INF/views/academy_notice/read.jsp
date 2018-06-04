<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<link href="${root}/css/academy/style.css" rel="stylesheet">

<!-- header -->
	<header id="page-top" class="blog-banner"> <!-- Start: Header Content -->
	<div class="container" id="blog">
		<div class="row blog-header text-center wow fadeInUp"
			data-wow-delay="0.5s">
			<div class="col-sm-12">
				<!-- Headline Goes Here -->
				<h4 style="font-family: '휴먼편지체';">Academy / Notice</h4>
				<h3 style="font-family: '휴먼편지체';">수강 공지</h3>
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
			<div class="col-xs-12">
				
				<div class="portfolio-single-detail" style="border: 2px solid #eee; ">
					<img src="${root}/images/academy/작가8기모집.jpg" width="50%" height="300px;">
					<ul class="list-unstyled project-detail-list margin-bottom-50" style="width: 45%; float: right; margin-top: 80px;">
						<li><strong>수강과정</strong> David Jon</li>
						<li><strong>담당작가</strong> Computer Market</li>
						<li><strong>장소</strong> Jun 20, 2015</li>
						<li><strong>기간</strong> Repair, Laptop</li>
						<li><strong>모집인원</strong> Repair, Laptop</li>
						<li><strong>비고</strong> Repair, Laptop</li>
					</ul>
					
					<ul class="list-inline social-icons" style="float: right;">
						<li>
							<p>
								<button class="w3-button w3-blue">수강신청</button>
							</p>
						</li>
						<li>
							<p>
								<button class="w3-button w3-indigo">강의문의</button>
							</p>
						</li>
						<li>
							<p>
								<button class="w3-button w3-deep-purple">오시는길</button>
							</p>
						</li>
					</ul>
					
				</div>
				
				<!--  portfolio item -->
				<div class="col-xs-12">
					<div class="portfolioitem col-sm-12">
						<div class="carousel slide" data-ride="carousel" id="blog-post-slider"></div>
					</div>
					<div class="portfoliodesc" style="border-bottom: 2px solid #181717;">
						<h4 style="margin-bottom: 15px;">상세내용</h4>
						<div class="col-sm-12">
							<div class="project-details">
								<img src="../images/academy/작가8기모집.jpg">
								<h4>수 강 공 지</h4>
								<hr>
								<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr,
									sed diam nonumy eirmod tempor invidunt ut labore et dolore
									magna aliquyam erat, sed diam voluptua. At vero eos et accusam
									et justo duo dolores et ea rebum. Invidunt ut labore et dolore
									magna stet clita kasd gubergrenLorem ipsum dolor sit amet,
									consetetur sadipscing elitr</p>
								<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr,
									sed diam nonumy eirmod tempor invidunt ut labore et dolore
									magna aliquyam erat, sed diam voluptua. At vero eos et accusam
									et justo duo dolores et ea rebum. Stet clita kasd gubergren
									accusam et justo duo</p>
								<img src="../images/academy/curriculum.jpg">

							</div> 
						</div>
					</div>
				</div>

			</div>
			<!--/ portfolio item -->
				<div style="margin-bottom: 10px;">
					<h4 style="margin-bottom: 15px;">문의사항</h4>  
				</div>
				<img src="../images/academy/상담관련이미지.jpg">
            </div>
            <!-- row /- -->
        </div>
        <!-- Container /- -->
    </section>
    <!-- End: Work Section 
==================================================-->