<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link href="${root}/css/style.css" rel="stylesheet">


<header id="page-top" class="blog-banner"
	style="background-image: url(${root}/images/academy/ac_bg.jpg);">
	<!-- Start: Header Content -->
	<div class="container" id="blog">
		<div class="row blog-header text-center wow fadeInUp"
			data-wow-delay="0.5s">
			<div class="col-sm-12">
				<!-- Headline Goes Here -->
				<h4 style="font-family: '휴먼편지체';">왕은실 Caligraphy</h4>
				<h3 style="font-family: '휴먼편지체';">Company</h3>
			</div>
		</div>
		<!-- End: .row -->
	</div>

	<!-- End: Header Content -->
</header>

<div class="blog_container blog_page_three">
	<div class="container">
		<div class="row">
			<!-- Blog Area -->
			<div class="col-xs-12 blog-area">
				<div class="row">
					<div class="col-xs-9">
						<div class="blog-warp-1 wow fadeInLeft" data-wow-delay="0.9s">
							<div class="blog_content_warp" style="border: none;">
								<table>
									<tbody>

										<img src="${root}/images/intro/회사소개1.JPG">
										<img src="${root}/images/intro/회사소개2.JPG">

										<a
											href="http://plus.kakao.com/home/@%EC%99%95%EC%9D%80%EC%8B%A4%EC%BA%98%EB%A6%AC%EA%B7%B8%EB%9D%BC%ED%94%BC"
											target="_blank"> <img alt="footer-3"
											src="${root}/images/academy/cacao.jpg"></a>


										<br>
										<br>
										<br>

										<img src="${root}/images/intro/path.jpg">
										<div id="map" style="width: 800px; height: 600px;"></div>
										<p>서울시 마포구 망원동 386-6 두리빌딩 2층</p>
										<p>새주소 : 서울 마포구 동교로 9길 4 두리빌딩 2층</p>


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

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=12bc31d2e58c54a8560099a66b569380&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(126.91093, 37.55429), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('서울시 마포구 망원동 386-6', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new daum.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">왕은실캘리그라피</div><div style="width:150px;text-align:center;padding:6px 0;">서울시 마포구 망원동 386-6 두리빌딩 2층</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
<!--  End : Blog Page Content
==================================================-->
