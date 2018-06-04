<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set var = "root" value="${pageContext.request.contextPath }" />
 

<!-- css 경로 지정 
======================================================= -->

<!-- Favicons -->
<link rel="icon" type="/image/png" href="${root}/css/ksa/images/favicon.png">
<link rel="apple-touch-icon" href="${root}/css/ksa/images/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72"	href="${root}/css/ksa/images/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="${root}/css/ksa/images/apple-touch-icon-114x114.png">

<!-- CSS Begins
================================================== -->
<!--Animate Effect-->
<link href="${root}/css/ksa/css/animate.css" rel="stylesheet">
<link href="${root}/css/ksa/css/hover.css" rel="stylesheet">

<!--Owl Carousel -->
<link href="${root}/css/ksa/css/owl.carousel.css" rel="stylesheet">

<!-- Slick Carousel -->
<link rel="stylesheet" type="text/css" href="${root}/css/ksa/css/slick.css" />
<link rel="stylesheet" type="text/css" href="${root}/css/ksa/css/slick-theme.css" />

<!-- For Image Preview -->
<link rel="stylesheet" href="${root}/css/ksa/css/magnific-popup.css">

<!--BootStrap -->
<link href="${root}/css/ksa/css/bootstrap.min.css" rel="stylesheet">
<link href="${root}/css/ksa/css/normalize.css" rel="stylesheet">

<!-- Main Style -->
<link href="${root}/css/ksa/css/style.css" rel="stylesheet">
<link href="${root}/css/ksa/css/responsive.css" rel="stylesheet">

<!--DEFAULT COLOR/ CURRENTLY USING , Replace Your Color-->
<link rel="stylesheet" href="${root}/css/ksa/css/colors/default-color.css">

<!-- jquery -->
<script src="${root}/css/ksa/js/jquery-1.12.4.min.js" type="text/javascript"></script>

<!-- css 경로 지정 
======================================================= -->



	<!-- 왕은실 캘리그라피 ============================== -->
    <header id="page-top" class="blog-banner">
        <div class="container" id="blog"></div>
    </header>
    <!-- 왕은실 캘리그라피 ============================== -->
    

	 <!-- Start: Our Services Section
==================================================-->
    <section class="service_section service_page">
        <div class="container">
            <!-- Start: Heading -->
            <div class="base-header">
                <h3>위시리스트</h3>
                <Br>
                <Br>
                <p>한글그리다展 틴케이스 미니엽서</p>
            </div>
            <!-- End: Heading -->

            <div class="row">
            
             <c:forEach var="i" begin="0" end="7">
                <div class="col-md-3 col-sm-4 col-xs-12">
                    <!-- service 1-->
                    <div class="service_list" style = "margin-top:3vh;">
                        <div class="whoffer-img">
                            <img alt="team" class="img-responsive" src="${root}/css/ksa/images/service01.jpg">
                            <div class="whoffer-mask">
                                <a href="${root }/art/artread"><i class="icon_heart_alt"></i></a>
                            </div>
                        </div>
                        <div class="service_info">
                            <h6><label><input type="checkbox" name="cart_option_seq[]" value="327283"> 한글그리다展 틴케이스 미니엽서</label></h6>
                        </div>
                    </div>
                </div>
                </c:forEach>
			
                <!-- end service 1-->
         
			<div style = "margin-top:5vh;">      
             <ul style="margin-left:30%;list-style-type: none;">
             	<li style="display: inline-block; float:left;margin-right:2%;">
		          	<input type="button" class="btn btn-default" onclick="location.href='${root}/art/order'" 
		          	value = "구매하기" style = "color: black;">
             	</li>
             	<li style="display: inline-block; float:left;margin-right:2%;">
					<input  type="button" class="btn btn-default" onclick = "location.href='${root}/mypage/wishlist'" 
					value = "삭제하기" style = "color: black;">
             	</li>
             	<li style="display: inline-block; float:left;margin-right:2%;">
					<input  type="button" class="btn btn-default" onclick = "location.href='${root}/mypage/wishlist'" 
					value = "더보기" style = "color: black;">
             	</li>
            	 </ul>   
              </div>   
             <br>
            
               	
            </div><!---/.row -->
        </div><!--/.container -->
    </section>
	

    <!-- End:Our Services Section
==================================================-->
