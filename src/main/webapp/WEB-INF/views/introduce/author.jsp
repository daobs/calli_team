<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link href="${root}/css/nh/style.css" rel="stylesheet">


<header id="page-top" class="blog-banner" style="background-image: url(${root}/images/academy/ac_bg.jpg);" >
       <!-- Start: Header Content -->
       <div class="container" id="blog">
           <div class="row blog-header text-center wow fadeInUp" data-wow-delay="0.5s">
               <div class="col-sm-12">
                   <!-- Headline Goes Here -->
                   <h4 style="font-family: '휴먼편지체';"> 왕은실 Caligraphy </h4>
                   <h3 style="font-family: '휴먼편지체';">Author</h3> 
               </div>
           </div>
           <!-- End: .row -->
       </div>

       <!-- End: Header Content -->
</header>



<div class="blog_container blog_page_three">
		<div class="container">
			<div class="row">
			<br>
			                   <!-- Start: Work filter -->
                    <ul class="projects-titles">
                    	
                        <li data-filter=".wang" style="font-size: 20px; font-family: '휴먼편지체'; ">왕은실</li>
                        <li data-filter=".oh" style="font-size: 20px; font-family: '휴먼편지체';">오문석</li>
<!--                         <li data-filter=".graphics">graphics</li> -->
<!--                         <li data-filter=".development">development</li> -->
<!--                         <li data-filter=".photoshop">photoshop</li> -->
					
                    </ul>
                    <!-- End: Work filter -->
				<!-- Blog Area -->
				
				<div class="row projects-list">
                        <div class="col-xs-12 wang" style="display: none">
                             <img src="${root}/images/intro/작가소개.jpg" >
                        </div>
                        <div class="col-xs-12 oh" style="display: none">
                             <img src="${root}/images/intro/작가소개2.jpg" >
                        </div>
				</div>
				<!--/ Blog Area -->

			</div>
		</div>
		<!-- Container /- -->
	</div>
	<!--  End : Blog Page Content
==================================================-->
<script>
    /*로딩시 첫번째 작가소개 활성화*/
    $('.projects-list div').eq(0).show();

    $('.projects-titles li').click(function () {
        /*작가 클릭시 모든 작가 hide 후 해당 작가만 show*/
        $('.projects-list div').hide();
        $('.projects-list div').eq($(this).index()).show();

        /*오문석 작가 선택시 */
        if($('.projects-list div').eq(1).css('display')=="block"){
            $('.projects-list div').eq($(this).index()).css('top','auto');
            $('.projects-list').css('height','3200px');
        }else{
            $('.projects-list').css('height','5788px');
        }
    })
    
</script>


