<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<link href="${root}/css/nh/style.css" rel="stylesheet">
<script>
	$(document).ready(function() {
		$(".star_rating a").click(function() {
			$(this).parent().children("a").removeClass("on");
			$(this).addClass("on").prevAll("a").addClass("on");
			return false;
		});
	});
</script>

<!-- header -->
<header id="page-top" class="blog-banner">
	<!-- Start: Header Content -->
	<div class="container" id="blog">
		<div class="row blog-header text-center wow fadeInUp"
			data-wow-delay="0.5s">
			<div class="col-sm-12">
				<!-- Headline Goes Here -->
				<h4 style="font-family: '휴먼편지체';">Artshop / 왕은실 오문석</h4>
				<h3 style="font-family: '휴먼편지체';">아트샵</h3>
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
			<div class="col-sm-8 col-xs-12">
				<div class="portfolioitem col-sm-12">
					<div class="carousel slide" data-ride="carousel"
						id="blog-post-slider">
						<img alt="blog" src="${root}/images/photofolio/headimg.jpg">
						<!-- Controls -->
					</div>
				</div>
				<div class="portfoliodesc">
					<div class="col-sm-12">
						<div class="project-details">
							<h4>PROJECT OVERVIEW</h4>
							<hr>
	
							<c:forEach begin="0" end="1">
								<img src="${root}/images/photofolio/headimg.jpg">
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





							</c:forEach>
<!-- 									상품후기		 -->
<br><br><br>

	
	
	<table class="table">	
		<h4 style="text-align: center;"> 배송 및 교환/환불 AS안내</h4>
		<colgroup>
			<col width="145" /> <col width="*" />
		</colgroup>
		<tbody>
		<tr>
			<th>배송정보</th>
			<td>
				<ul>
					<li>배송기간은 주문일(무통장입금은 결제완료일)로부터 1일(24시간) ~ 5일정도 걸립니다.</li>
					<li>단, 지정일 배송이 가능한 플라워 상품이나, 제작기간이 별도로 소요되는 상품의 경우에는 상품설명에 있는 제작기간과 배송시기를 숙지해 주시기 바랍니다.</li>
					<li>업체조건배송 상품은 해당 브랜드 배송기준으로 배송비가 부여됩니다. 업체착불배송 상품은 해당 브랜드 배송기준 및 배송지에 따라 배송비가 착불로 부과됩니다.</li>
					<li>가구 및 플라워 등의 상품의 경우에는 지역에 따라 추가 배송비용이 발생할 수 있음을 알려드립니다.</li>
					<li>해외배송 표시가 되어 있는 상품은 해외 주소로 배송이 가능합니다. (배송방법 : EMS)</li>
				</ul>
			</td>
		</tr>
		<tr>
			<th scope="row">교환/환불/AS안내</th>
			<td>
				<ul>
					<li>교환/반품 신청은 배송완료 후 7일 이내 가능합니다.</li>
					<li>변심 반품의 경우 왕복배송비를 차감한 금액이 환불되며, 제품 및 포장 상태가 재판매 가능하여야 합니다.</li>
					<li>상품 불량인 경우는 배송비를 포함한 전액이 환불됩니다.</li>
					<li>출고 이후 환불요청 시 상품 회수 후 처리됩니다.</li>
					<li>쥬얼리를 포함한 주문제작 상품/카메라/밀봉포장상품/플라워 등은 변심으로 인한 반품/환불이 불가합니다.</li>
					<li>완제품으로 수입된 상품의 경우 A/S가 불가합니다.</li>
					<li>상품페이지에 교환/환불/AS에 대한 브랜드 개별기준이 있는 경우에는  해당 내용이 우선 적용 됩니다.</li>
				</ul>
			</td>
		</tr>
		<tr>
			<th>기타 기준 사항</th>
			<td>
				<ul>
					<li>구매자가 미성년자인 경우에는 상품 구입시 법정대리인이 동의하지 아니하면 미성년자 본인 또는 법정대리인이 구매취소 할 수 있습니다.</li>
				</ul>
			</td>
		</tr>
		</tbody>
	
	</table>

<!-- 상품후기 -->
							<!--comments list -->
							<div class="list-comments">
								<div class="comments-section-title">
									<h4>상품 후기</h4>
								</div>
								<!-- .section-title -->
								<ul class="comments">
									<li><c:forEach begin="0" end="2">
											<div class="comment">
												<img src="images/comment.jpg" alt="" class="comment-avatar">
												<strong class="commenter-title"><a href="#">John
														Doe</a></strong> <span class="comment-date">27 Jan 2015</span>
																									<!-- 											별점 -->
											<p class="star_rating" style="margin-left: 100px">
												<a href="#" class="on">★</a> <a href="#" class="on">★</a> <a
													href="#" class="on">★</a> <a href="#" class="">★</a> <a
													href="#" class="">★</a>
											</p>
											<!-- 											별점 -->
												<p>상품 너무 좋아요~~많이 많이 구매할게요 너무 좋습니다!! 강추 여러분들 꼭 사세요  너무 좋습니다!! 강추 여러분들 꼭 사세요</p>
											</div>


										</c:forEach></li>
								</ul>
								<!--/ .comments -->
							</div>
							<!--/comments list -->

							<!-- comment box   -->
							<div class="contact">
								<div class="contact-form-warper blog-contact">
									<div class="col-lg-12 col-sm-12 col-xs-12 contact-warper">
										<!--  Contact Form  -->
										<div class="contact-form">
										<h4 style="text-align: center;"> 상품 후기 남기기</h4>
											<form action="mailer.php" id="contactForm" method="post"
												name="contactForm">
												<div class="form-group">
													<textarea class="form-control" id="Message" name="Message"
														placeholder="Message :"></textarea>
												</div>

																							<!-- 											별점 -->
											<p class="star_rating" style="margin-left: 50px">
												<a href="#" class="on">★</a> <a href="#" class="on">★</a> <a
													href="#" class="on">★</a> <a href="#" class="">★</a> <a
													href="#" class="">★</a>
											</p>
											<!-- 											별점 -->

												<div style="text-align: center;"><input class="submit-button btn btn-chos"  name="submit"
													value="등록" type="submit"> </div>
											</form>
										</div>
										<!-- End:Contact Form  -->
									</div>
								</div>
							</div>
							<!--/.comment box-->
												<!-- (8/9) 배송/교환/환불 -------------------------->




							
						</div>
					</div>
				</div>
			</div>

			<div class="col-sm-4 col-xs-12">
				<div class="portfolio-single-detail">
					<h4>손으로 쓴 엽서</h4>
					<hr>
					<ul class="list-unstyled project-detail-list margin-bottom-50">
						<li><strong>가격</strong> 16000원</li>

						<li><strong>분류</strong> 패키지</li>
					</ul>
					<hr>
					<ul class="list-inline social-icons">
						<li><strong>수량</strong> <input type="number" value="1"
							min="1"
							style="width: 30%; margin-left: 60px; text-align: center;"></li>
						<br>
						<li><strong>총 금액</strong> <span style="margin-left: 50px">15000</span></li>
					</ul>

					<ul class="list-inline social-icons">
						<li>
							<p>
								<button class="w3-button w3-blue">주문하기</button>
							</p>
						</li>
						<li>
							<p>
								<button class="w3-button w3-indigo">장바구니</button>
							</p>
						</li>

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
