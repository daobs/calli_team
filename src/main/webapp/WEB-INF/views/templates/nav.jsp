<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- Start: header navigation -->
<script type="text/javascript">
$(document).ready(function() {
	$(".menu").children('a').removeClass('active'); // 메뉴 효과 지우는 구문 
	var pageName = "<c:out value='${param.pageName}'/>";
	$("#"+pageName).children('a').addClass('active');	// 메뉴 효과 추가
});

// $(document).ready(function() {
// 	$("#kakaologout").click(function() {
// 		Kakao.Auth.logout();
		
		
// 	});
// });
</script>
<script src="${root}/js/kakao.js"></script>

<script type="text/javascript">



</script>





<div class="navigation navigation_two">
	<div class="container">
		<div class="row">
			<div class="header_logo">
				<a href="${root}/"><img src="${root}/images/main/logo.jpg" alt=""></a>
			</div>
			<div id="navigation">
				<ul>
					<li class="has-sub menu">
						<a class="active" href="#" title="Introduce">
							INTRODUCE
						</a>
						<ul>
							<li><a href="${root}/introduce/company" title="회사 소개">회사 소개</a></li>
							<li><a href="${root}/introduce/author" title="작가 소개">작가 소개</a></li>							
						</ul>
					</li>					
					<li class="has-sub menu" id="project">
						<a href="#" title="Project">
							PROJECT
						</a>
						<ul>
							<li>
								<a href="${root}/portfolio/list?pageName=project" title="포트폴리오">포트폴리오</a>
							</li>
							<li>
								<a href="${root}/request/create?pageName=project" title="의뢰">의뢰</a>
							</li>							
						</ul>
					</li>
					<li class="has-sub menu" id="academy">
						<a href="#" title="Academy">
							ACADEMY
						</a>
						<ul>
							<li>
								<a href="${root}/student_art/list?pageName=academy" title="수강생 작품">수강생 작품</a>
							</li>
							<li>
								<a href="${root}/academy_notice/list?pageName=academy" title="수업공지">수업공지</a>
							</li>							
						</ul>
					</li>
					<li class="menu">
						<a href="${root}/exhibit/list?pageName=exhibit" title="Exhibit">
							EXHIBIT
						</a>
					</li>
					<li class="menu">
						<a href="${root}/art/list" title="Artshop">
							Artshop
						</a>
					</li>
					<li class="has-sub menu">
						<a href="#" title="Board">
							Board
						</a>
						<ul>
							<li><a href="${root}/notice/list?pageName=list" title="공지사항">공지사항</a></li>
							<li><a href="${root}/bbs/list?pageName=list" title="자유게시판">자유게시판</a></li>
						</ul>
						
							
						
					</li>
					<c:if test="${sessionScope.grade eq 'A' }">
							<li class="has-sub menu">
						<a href="#" title="관리자페이지">
							관리자페이지
						</a>
						<ul>
							<li><a href="${root}/member/list" title="회원목록">회원목록</a></li>
							<li><a href="${root}/request/list" title="작업의뢰 목록">작업의뢰 목록</a></li>
						</ul>
						</li>
						</c:if>
					
				</ul>
			</div>
			<div class="header-right">
				<ul>
					<c:choose>
						<c:when test="${empty sessionScope.id }">
						<li class="menu">
							<a href="${root}/member/agreement" title="Sign Up">
								Sign Up
							</a>
						</li>
						<li class="menu">
							<a href="${root}/member/login" title="Login">
								LOGIN
							</a>
						</li>
						</c:when>
						<c:when test="${ sessionScope.kakao eq true}">
							<li class="menu">
							
							<a href="${root}/member/logout" id="kakaologout" title="Logout">
								<img alt="footer-5" src="${root}/images/kaka3.JPG">LogOut
							</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="menu">
							<a href="${root}/member/logout" title="Logout">
								LogOut
							</a>
							</li>
							
							
							  <c:if test="${sessionScope.grade eq 'C' }">
                     <li class="menu">
                     <a href="${root}/member/update" title="정보수정">
                        My Info
                     </a>
                     </li>   
                     </c:if>
							
							
<!-- 							  <li class="menu"> -->
<%--                      <a href="${root}/member/delete" title="회원탈퇴"> --%>
<!--                         DROPOUT -->
<!--                      </a> -->
<!--                      </li> -->
							
						</c:otherwise>
					</c:choose>
				</ul>
				
		<!-- 	상단 내비바 오른쪽에 검색 / 장바구니 / 설정 =======================================-->
<!-- 			 <div class="header-right"> -->
<!-- 				<ul> -->
<!-- 					<li> -->
<!-- 						Search Bar -->
<!-- 						<div class="search-option float-right"> -->
<!-- 							<button class="search tran3s dropdown-toggle" id="searchDropdown" -->
<!-- 								data-toggle="dropdown" aria-haspopup="true" -->
<!-- 								aria-expanded="false"> -->
<!-- 								<i class="fa fa-search" aria-hidden="true"></i> -->
<!-- 							</button> -->
<%-- 							<form action="#" class="p-color-bg dropdown-menu tran3s" --%>
<%-- 								aria-labelledby="searchDropdown"> --%>
<!-- 								<input type="text" placeholder="Search...."> -->
<!-- 								<button class="p-color-bg"> -->
<!-- 									<i class="fa fa-search" aria-hidden="true"></i> -->
<!-- 								</button> -->
<%-- 							</form> --%>
<!-- 						</div> /.search-option -->
<!-- 					</li> -->
<!-- 					<li class="header-cart"><a href="#"> <span><i -->
<!-- 								class="fa fa-shopping-cart"></i></span> <span class="cart-inner">4</span> -->
<!-- 					</a> -->
<!-- 						<div class="headr_btom_cart"> -->
<!-- 							<ul> -->
<!-- 								<li class="single-cart"> -->
<!-- 									<div class="cartt_img"> -->
<%-- 										<a href="${root }/art/artread"> <img src="${root }/css/ksa/images/0.jpg" alt=""> --%>
<!-- 										</a> -->
<!-- 									</div> -->
<!-- 									<div class="cart-content"> -->
<!-- 										<a href="#" class="cart-title">꽃 엽서</a> -->
<!-- 										<p class="qty"> -->
<!-- 											수량 : 1 <br> -->
<!-- 											<span>15000 원</span> -->
<!-- 										</p> -->
<!-- 									</div> -->
<!-- 									<div class="cart-remove"> -->
<!-- 										<a href="#" class="action"><i class="fa fa-close"></i></a> -->
<!-- 									</div> -->
<!-- 								</li> -->
<!-- 								<li class="single-cart"> -->
<!-- 									<div class="cartt_img"> -->
<%-- 										<a href="${root }/art/artread"> <img src="${root }/css/ksa/images/0.jpg" alt=""> --%>
<!-- 										</a> -->
<!-- 									</div> -->
<!-- 									<div class="cart-content"> -->
<!-- 										<a href="#" class="cart-title">꽃 엽서</a> -->
<!-- 										<p class="qty"> -->
<!-- 											수량 : 1 <br> -->
<!-- 											<span>15000 원</span> -->
<!-- 										</p> -->
<!-- 									</div> -->
<!-- 									<div class="cart-remove"> -->
<!-- 										<a href="#" class="action"><i class="fa fa-close"></i></a> -->
<!-- 									</div> -->
<!-- 								</li> -->
<!-- 							</ul> -->
<!-- 							<div class="cart-pricing"> -->
<!-- 								<p class="shipping"> -->
<!-- 									배송료 :<span class="s-price">2500 원</span> -->
<!-- 								</p> -->
<!-- 								<p class="total"> -->
<!-- 									총금액 :<span class="p-total">35000원</span> -->
<!-- 								</p> -->
<!-- 							</div> -->
<!-- 							<div class="cart-button"> -->
<!-- 								<ul> -->
<%-- 									<li><a href="${root }/art/cart">장바구니 <i class="fa fa-angle-right"></i></a> --%>
<!-- 									</li> -->
<%-- 									<li><a href="${root }/art/order">주문하기 <i class="fa fa-angle-right"></i></a> --%>
<!-- 									</li> -->
<!-- 								</ul> -->
<!-- 							</div> -->
<!-- 						</div></li> -->
<!-- 					<li class="language-cart"><a href="#" -->
<!-- 						class="setting-toggler shop_setting" id="srch"> <i -->
<!-- 							class="fa fa-cog"></i> -->
<!-- 					</a> -->
<!-- 						<div class="shop_setting_inr"> -->
<!-- 							<ul> -->
<!-- 								<li> -->
<!-- 									<div class="current"> -->
<!-- 										<a href="#">마이페이지</a> -->
<!-- 									</div> -->
<!-- 									<ul class="first-step"> -->
<%-- 										<li><a href="${root }/mypage/myinfo">마이페이지</a></li> --%>
<%-- 										<li><a href="${root }/mypage/recently">최근본상품</a></li> --%>
<%-- 										<li><a href="${root }/mypage/wishlist"> 위시리스트 </a></li> --%>
<!-- 									</ul> -->
<!-- 								</li> -->
<!-- 							</ul> -->
<!-- 						</div></li> -->
<!-- 				</ul> -->
			</div>
			<!-- End: social-nav -->
		</div>
		<!--/ row -->
	</div>
	<!--/ container -->
</div>
<!-- End: header navigation -->
