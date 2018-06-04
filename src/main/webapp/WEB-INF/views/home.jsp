<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!-- Start: Slides  -->
<div class="container">
<div class="slides_wrapper">
	<div class="slides__preload_wrapper">
		<div class="spinner"></div>
	</div>
	<div class="slider_home">
		<!-- Start: Slider 1  -->
		<div class="single_slider slide_bg_2">
			<div class="slider_item_tb"></div>
		</div>	<!-- End: Slider 1  -->
		<!-- Start: Slider 2  -->
		<div class="single_slider slide_bg_1">
			<div class="slider_item_tb"></div>
		</div>	<!-- End: Slider 2  -->
		<!-- Start: Slider 3  -->
		<div class="single_slider slide_bg_3">
			<div class="slider_item_tb"></div>
		</div>	<!-- End: Slider 3  -->
	</div>
</div> <!-- End:  slider ==================================================-->

<!--Start: Video Section ==================================================-->
<section class="video-section" id="video">
	<div class="overlay"></div>
	<div class="container">
		<div class="col-sm-12 col-xs-12">
			<div class="video-container">
				<a data-backdrop="true" data-target="#video-modal" data-toggle="modal">
					<span class="play-video wow fadeInUp" data-wow-duration="3000ms" data-wow-delay="100ms"> 
						<span class="fa fa-play"></span>
					</span>
				</a>
			</div>
			<!-- VIDEO SOCIALS -->
			<div class="video-content">
				<h2 class="wow zoomIn" data-wow-duration="1000ms" data-wow-delay="100ms">캘리그라피 동영상을 감상하세요!</h2>
			</div>
			<!-- END VIDEO SOCIALS -->
		</div>
	</div>
	<!--/ container -->
</section>
<!-- VIDEO POPUP -->
<div class="modal fade video-modal" id="video-modal" role="dialog">
	<div class="modal-content">
		<div class="row">
			<iframe height="500" src="https://www.youtube.com/embed/Sj3rBmtPA4U" width="700"></iframe>
		</div>
	</div>
</div> <!-- End: VIDEO Section ==================================================-->

<!-- Start:Our Work Section ==================================================-->
<section class="work-section work_section_v2">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<!-- Start: Heading -->
				<div class="col-md-6">
					<div class="base-header base_header_v2" style="margin-top: 10%;">
						<small>work showcase</small>
						<h3>PORTFOLIO</h3>						
					</div>
					<!-- End: Heading -->
					<div class="text-left">
						
					</div>
				</div>

				<div class="col-md-6">
					<!-- Start: Work filter -->
					<ul class="projects-titles">
						<li class="active" data-filter="*">ALL</li>
						<li data-filter=".PROJECT">PROJECT</li>
						<li data-filter=".ACADEMY">ACADEMY</li>
						<li data-filter=".EXHIBIT">EXHIBIT</li>
						<li data-filter=".ARTSHOP">ARTSHOP</li>						
					</ul> <!-- End: Work filter -->
				</div>
			</div>

			<div class="col-md-12">
				<!-- Start: Work Item -->
				<div class="row projects-list">
					<div class="col-sm-4 col-xs-12 PROJECT">
						<div class="single-project-item"></div>
					</div>
					<!-- End: Work Item 1 -->
					<div class="col-sm-4 col-xs-12 ACADEMY">
						<div class="single-project-item project-bg-2"></div>
					</div>
					<!-- End: Work Item 2 -->
					<div class="col-sm-4 col-xs-12 PROJECT">
						<div class="single-project-item project-bg-3"></div>
					</div>
					<!-- End: Work Item 3 -->
					<div class="col-sm-4 col-xs-12 ACADEMY">
						<div class="single-project-item project-bg-4"></div>
					</div>
					<!-- End: Work Item 4 -->
					<div class="col-sm-4 col-xs-12 ACADEMY">
						<div class="single-project-item project-bg-5"></div>
					</div>
					<!-- End: Work Item 5 -->
					<div class="col-sm-4 col-xs-12 ACADEMY">
						<div class="single-project-item project-bg-6"></div>
					</div>
					<!-- End: Work Item 6 -->
					<div class="col-sm-4 col-xs-12 EXHIBIT">
						<div class="single-project-item project-bg-7"></div>
					</div>
					<!-- End: Work Item 7 -->
					<div class="col-sm-4 col-xs-12 EXHIBIT">
						<div class="single-project-item project-bg-8"></div>
					</div>
					<!-- End: Work Item 8 -->
					<div class="col-sm-4 col-xs-12 ARTSHOP">
						<div class="single-project-item project-bg-9"></div>
					</div>
					<!-- End: Work Item 9 -->
				</div>
				<!-- End: Work Item -->
			</div>
		</div>
	</div>
</section> <!-- End:Our Work Section ==================================================-->



<!-- Start: Our Services Section ==================================================-->
<section class="service_section service_section_v2">
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<!-- Start: Heading -->
				<div class="base-header base_header_v2" style="margin-top: 40%;">
					<small>What we do</small>
					<h3>PROJECT</h3>					
				</div>
				<!-- End: Heading -->
				<div class="text-left">
					<a href="${root}/portfolio/list" class="more-link">GO TO PAGE</a>
				</div>
			</div>

			<div class="col-md-8">
				<div class="owl-carousel owl-theme" id="service_carousel">
					<!-- Start: Testimonial 1 -->
					<div class="item">
						<!-- service 1-->
						<div class="service_list">
							<div class="whoffer-img">
								<img alt="team" class="img-responsive" src="${root}/images/main/project1.jpg">
							</div>
							<div class="whoffer-mask">
								<a href="services.html"><i class="icon_link"></i></a>
							</div>
							<div class="service_info">
								<h6>NH개성인삼농협 6년근 한송정 홍삼시리즈ㄴㄴㄴㄴ</h6>
								<p>
									Client : 이드디자인 <br />
									Calligraphy : 왕은실
								</p>
							</div>
						</div>
					</div>	<!-- end service 1-->
					<!-- service 2-->
					<div class="item">
						<div class="service_list">
							<div class="whoffer-img">
								<img alt="team" class="img-responsive" src="${root}/images/main/project2.jpg">
							</div>
							<div class="whoffer-mask">
								<a href="services.html"><i class="icon_link"></i></a>
							</div>
							<div class="service_info">
								<h6>샤니 막걸리로 발효시킨 정통 빵 시리즈</h6>
								<p>
									Client : 삼립식품 <br />
									Calligraphy : 오문석
								</p>
							</div>
						</div>
					</div>	<!-- end service 2-->
					<%-- <!-- service 3-->
					<div class="item">
						<div class="service_list">
							<div class="whoffer-img">
								<img alt="team" class="img-responsive" src="${root}/images/service3.jpg">
							</div>
							<div class="whoffer-mask">
								<a href="services.html"><i class="icon_link"></i></a>
							</div>
							<div class="service_info">
								<h6>Security Protection</h6>
								<p>Loren ipsum dolor sit amet adipiscing elit eiusmod sed do
									amethLoren ipsum dolor sit amet adipiscing elit eiusmod sed do
									ameth dolor sit
								</p>
							</div>
						</div>
					</div>
					<!-- end service 3 -->
					<!-- service 4 -->
					<div class="item">
						<div class="service_list">
							<div class="whoffer-img">
								<img alt="team" class="img-responsive" src="${root}/images/service2.jpg">
							</div>
							<div class="whoffer-mask">
								<a href="services.html"><i class="icon_link"></i></a>
							</div>
							<div class="service_info">
								<h6>Security Protection</h6>
								<p>Loren ipsum dolor sit amet adipiscing elit eiusmod sed do
									amethLoren ipsum dolor sit amet adipiscing elit eiusmod sed do
									ameth dolor sit
								</p>
							</div>
						</div>
					</div>	<!-- end service 4 --> --%>
				</div>	<!---/.owl-carousel -->
			</div>
		</div>	<!---/.row -->
	</div>	<!--/.container -->
</section> <!-- End:Our Services Section ==================================================-->


<!-- Start: Get Strted Section ==================================================-->
<section class="get_started">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3 col-sm-12">
				<div class="get_started-text text-left">
					<h4 class="wow fadeInDown" data-wow-duration="1000ms"
						data-wow-delay="300ms">We're here to help you</h4>
					<h2 class="wow zoomIn" data-wow-duration="1000ms"
						data-wow-delay="100ms">Need Any Consulting</h2>
					<div class="text-center">
						<a href="http://plus.kakao.com/home/@%EC%99%95%EC%9D%80%EC%8B%A4%EC%BA%98%EB%A6%AC%EA%B7%B8%EB%9D%BC%ED%94%BC" target="_blank" class="wow fadeInUp" data-wow-duration="3000ms" data-wow-delay="100ms">
							<img alt="kakao image" src="${root}/images/main/kakao.jpg" style="width: 25%;">						
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section> <!-- End: Get Strted Section ==================================================-->


<!-- Start : About 2 Section ==================================================-->
<section class="about_bottom_v2">
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<!-- Start: Heading -->
				<div class="base-header base_header_v2" style="margin-top: 50%;">
					<small>we are best</small>
					<h3>ACADEMY</h3>					
				</div>
				<!-- End: Heading -->
				<div class="text-left">
					<a href="${root }/academy_notice/list" class="more-link">GO TO PAGE</a>
				</div>
			</div>

			<div class="col-md-8 wow fadeInLef">
				<img style="border: 2px solid #038FD6;border-radius: 25px;" alt="academy" src="${root}/images/main/academy.jpg">				
			</div>	<!-- /.text -->
		</div>	<!-- /.row -->
	</div>	<!-- /.container -->
</section> <!-- End: About 2 Section ==================================================-->










<!--   Start: Team Section ==================================================-->
<section class="team_section_v2">
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="base-header base_header_v2" style="margin-top: 30%;">
					<small>작가</small>
					<h3>Calligraphy</h3>					
				</div>
				<!-- End: Heading -->

			</div>
			<!-- profile 1-->
			<div class="col-md-8">
				<div class="col-sm-6 col-xs-12">
					<div class="member_warp">
						<div class="member_img">
							<img alt="Calligraphy" class="img-responsive" src="${root}/images/main/왕은실.JPG">							
						</div>
						<div class="member_info">
							<h6>
								왕은실 <small>Calligraphy</small>
							</h6>
						</div>
					</div>
				</div>	<!-- end profile 1-->

				<!-- profile 2-->
				<div class="col-sm-6 col-xs-12">
					<div class="member_warp">
						<div class="member_img">
							<img alt="Calligraphy" class="img-responsive" src="${root}/images/main/오문석.JPG">							
						</div>
						<div class="member_info">
							<h6>
								오문석 <small>Calligraphy</small>
							</h6>
						</div>
					</div>
				</div>	<!-- end profile 2-->				
			</div>
		</div>	<!---/.row -->
	</div>	<!--/.container -->
</section> <!--  End: Team Section ==================================================-->





<!-- Start: Contact  Section ==================================================-->
<section class="contact-section contact_section_v2">
	<div class="container">
		<!--  Content  -->
		<div class="inner-contact">
			<div class="row">
				<div class="col-md-4">
					<!-- Start: Heading -->
					<div class="base-header base_header_v2" style="margin-top: 20%;">
						<small>Get in Touch</small>
						<h3>REQUEST<br /><br />PROJECT</h3>
						
					</div>	<!-- End: Heading -->
				</div>	<!-- End: Map  -->
				<div class="col-md-8 wow fadeInUp" data-wow-delay=".1s">
					<!--  Contact Form  -->
					<div class="contact-form">
						<form method="get" action="${root }/request/create" id="contact-form">
							<img alt="request" style="border-radius: 25px;" src="${root}/images/main/request.png"> 
							<br /><br />							
							<div class="row">
								<div class="col-md-12">									
									<div class="submit-area">
										<input type="submit" id="submit-contact" class="btn-alt" value="GO TO PAGE">
										<div id="msg" class="message"></div>
									</div>
								</div>
							</div>
						</form>
					</div>	<!-- End:Contact Form  -->
				</div>
			</div>	<!-- row /- -->
		</div> <!-- End:Content  -->
	</div>	<!-- container /- -->
</section> <!--End Contact Section ==================================================-->
</div>