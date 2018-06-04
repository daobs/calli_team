<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<link href="${root}/css/academy/style.css" rel="stylesheet">

<script type="text/javascript">
	function read(){
		location.href= './read?pageName=academy';
	}
</script>

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
	<!-- Start : Blog Page Content 
==================================================-->
	<div class="blog_container blog_page_three">
		<div class="container">
			<div class="row">
				<!-- Blog Area -->
				<div class="col-xs-12 blog-area">
					<div class="row">
						<div class="col-xs-12">
                            <div class="blog-warp-1 wow fadeInLeft" data-wow-delay="0.9s">
                                <div class="blog_content_warp" style="border: none;">
                                	<table>
                                		<tbody>

		                               <img src="${root}/images/academy/academynotice.jpg" >
		                               <img src="${root}/images/academy/cacao.jpg" >				

                                		</tbody> 
                                	</table>
                                </div>
                            </div>
                        </div>

						
					</div>

				</div>
				<!--/ Blog Area -->

			</div>
		</div>
		<!-- Container /- -->
	</div>
	<!--  End : Blog Page Content
==================================================-->