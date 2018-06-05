<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<link href="${root }/css/style.css" rel="stylesheet">
<script type="text/javascript">

var types ="";

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
function create(){
	var url = "../img/create";
	url += "?col=${param.col}";
	url += "&nowPage=${param.nowPage}";
	location.href=url;
}
function academyList(types){
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
            $("#ajax").append('<div class="row" id = "none">작품을 준비중에 있습니다.</div>');
            //alert( "조회에 실패하였습니다. \n 확인후 다시 시도하세요.");

        }
    });

}
</script>

<header id="page-top" class="blog-banner "
	style="background-image: url(${root}/images/academy/ac_bg.jpg);">
	<!-- Start: Header Content -->
	<div class="container" id="blog">
		<div class="row blog-header text-center wow fadeInUp"
			data-wow-delay="0.5s">
			<div class="col-sm-12">
				<!-- Headline Goes Here -->
				<h4 style="font-family: '휴먼편지체';">Academy / Student art</h4>
				<h3 style="font-family: '휴먼편지체';">학생 작품</h3>
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
			<!-- 			<h4 style="size: 150%; font-family: '휴먼편지체';">				 -->
			<!-- 					<a href="javascript:list('')">전체　</a> -->
			<!-- 					<a href="javascript:list('personal')">개인지도　</a> -->
			<!-- 					<a href="javascript:list('intensive')">심화과정　</a> -->
			<!-- 					<a href="javascript:list('hand')">작가과정　</a> -->
			<!-- 					<a href="javascript:list('meok')">먹그림　</a> -->
			<!-- 					<a href="javascript:list('watercolor')">수체화</a> -->

			<!-- 			</h4> -->

			<!-- 			</div> -->
			<br><br>

			<div style="text-align: center;">


				<ul class="projects-titles2" id="b">

					<li style="font-size: 18px; font-family: '휴먼편지체';"
						onclick="academyList('')">전체</li>
					<li style="font-size: 18px; font-family: '휴먼편지체';"
						onclick="academyList('personal')">개인지도</li>
					<li style="font-size: 18px; font-family: '휴먼편지체';"
						onclick="academyList('intensive')">심화과정</li>
					<li style="font-size: 18px; font-family: '휴먼편지체';"
						onclick="academyList('hand')">작가과정</li>
					<li style="font-size: 18px; font-family: '휴먼편지체';"
						onclick="academyList('meok')">먹그림</li>
					<li style="font-size: 18px; font-family: '휴먼편지체';"
						onclick="academyList('watercolor')">수체화</li>

				</ul>

			</div>
			<!-- 	서치 -->
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
										<a href="javascript:read('${dto.imgno}')"> ${dto.title }</a>
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

