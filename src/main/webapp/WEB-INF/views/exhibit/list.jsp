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
function create(){
	var url = "../img/create";
	url += "?col=${param.col}";
	url += "&nowPage=${param.nowPage}";
	location.href=url;
}
function list(col){
	var url = "./list";
	url += "?col="+col;
	url += "&nowPage=${nowPage}";
	location.href = url;
	}
	
function test(t){
	types = t;
}
	
$(document).ready(function() {
	

	$("#b").click(function() {
		
		
		var url = 'json?col='+types;

		$.ajax({
//  			type : "POST", //"POST", "GET",
			url : url,
			dataType : "json", // 데이터 타입을 제이슨 꼭해야함, 다른방법도 2가지있음
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			cache : false, // 이걸 안쓰거나 true하면 수정해도 값반영이 잘안댐
			success : function(data) {
				
				$("#ajax").empty();
				$("#list").hide();				
				//alert(data[0].imgno);
 				$("#ajax").append('<div class="row" id = "con"></div>');
				for(var i=0;i<data.length;i++){
// 					$("#ajax").append("<p>"+data[i].imgno+"</p><br>");
// 					$("#ajax").append("<p>"+data[i].title+"</p><br>");

					$("#con").append('<div class="col-md-4 col-sm-6 col-xs-12" name ="1"><div>');
					$('[name="1"]').eq(i).append('<div class="blog-warp-1 wow fadeInLeft" data-wow-delay="0.5s" name="2"></div>');
					$('[name="2"]').eq(i).append('<a href="javascript:read('+data[i].imgno+')" name="3"></a>');
					$('[name="3"]').eq(i).append('<div class="blog_imgg" name ="4"></div>');
					$('[name="4"]').eq(i).append('<img src="${root}/images/img/storage/'+data[i].nail_img+'" />');
					$('[name="2"]').eq(i).append('<div class="blog_content_warp" style="width: 300px; height: 100px;" name="5"></div>');
					$('[name="5"]').eq(i).append('<h5 style="text-align: center; font-size: 20px; ">'+data[i].title+'</h5>');
// 					$("#6").append('<a href="javascript:read("'+data[i].imgno+'")">'+ data[i].title+' </a>');
					$('[name="5"]').eq(i).append('<p style="text-align: center;">'+data[i].subtitle+'</p>');
					

				}
  				$("#ajax").append('<div class="bottom">${paging}</div>');



			
			}, error : function(msg){
				$("#ajax").empty();
				$("#list").hide();
				$("#ajax").append('<div class="row" id = "con">데이터가 없습니다.</div>');
				//alert( "조회에 실패하였습니다. \n 확인후 다시 시도하세요.");

			}
		});
		
			
		
	
	});
});
</script>

<header id="page-top" class="blog-banner "
	style="background-image: url(${root}/images/portfolio/headimg.jpg);">
	<!-- Start: Header Content -->
	<div class="container" id="blog">
		<div class="row blog-header text-center wow fadeInUp"
			data-wow-delay="0.5s">
			<div class="col-sm-12">
				<!-- Headline Goes Here -->
				<h4 style="font-family: '휴먼편지체';">Exhibit / 전시</h4>
				<h3 style="font-family: '휴먼편지체';">전시</h3>
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
			<!-- 		등록-->
			<c:if test="${sessionScope.grade eq 'A' }">
				<div style="text-align: center;">
					<ul class="list-inline social-icons">
						<li>
							<p>
								<button class="w3-button w3-deep-purple" onclick="create()">등록</button>
							</p>
						</li>
					
					</ul>
				</div>
			</c:if>
			<!-- 				등록-->




<!-- 			<div style="text-align: center;"> -->
<!-- 				<h4 style="size: 150%; font-family: '휴먼편지체';"> -->
<!-- 					<a href="javascript:list('')">전체 </a> <a -->
<!-- 						href="javascript:list('work')">작품 </a> <a -->
<!-- 						href="javascript:list('exhibiting')">진행전시 </a> <a -->
<!-- 						href="javascript:list('exhibited')">이전전시 </a> -->
<!-- 				</h4> -->

<!-- 			</div> -->
			
			

			<!-- 	서치 -->
			<br><br>
						<div style="text-align: center;">

				
				  <ul class="projects-titles2" id="b">                	
                        <li style="font-size: 18px; font-family: '휴먼편지체';" onclick="test('')" >전체</li>
                        <li style="font-size: 18px; font-family: '휴먼편지체';" onclick="test('work')" >작품</li>
                        <li style="font-size: 18px; font-family: '휴먼편지체';" onclick="test('exhibiting')">진행전시</li>
                        <li style="font-size: 18px; font-family: '휴먼편지체';" onclick="test('exhibited')">이전전시</li>

<!--                         <li data-filter=".graphics">graphics</li> -->
<!--                         <li data-filter=".development">development</li> -->
<!--                         <li data-filter=".photoshop">photoshop</li> -->
					
                    </ul>

			</div>
			<div class="col-sm-12 col-xs-12 blog-area" id="ajax"></div>



			<div class="col-sm-12 col-xs-12 blog-area" id="list">
				<div class="row">

					<c:forEach var="dto" items="${list}">
						<div class="col-md-4 col-sm-6 col-xs-12">
							<div class="blog-warp-1 wow fadeInLeft" data-wow-delay="0.5s">
								<a href="javascript:read('${dto.imgno}')">
									<div class="blog_imgg">
										<img src="${root}/images/img/storage/${dto.nail_img}" />

									</div>
								</a>
								<div class="blog_content_warp"
									style="width: 300px; height: 100px;">
									<h5 style="text-align: center;">
										<a href="javascript:read('${dto.imgno}')">${dto.title }</a>
									</h5>
									<p style="text-align: center;">${dto.subtitle }</p>
								</div>
							</div>
						</div>


					</c:forEach>


				</div>

				<div class="bottom">${paging}</div>






				<!--/ Blog Area -->

			</div>
		</div>
	</div>
	<!-- Container /- -->
</div>
<!--  End : Blog Page Content
==================================================-->

