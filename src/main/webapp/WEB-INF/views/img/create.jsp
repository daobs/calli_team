<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script type="text/JavaScript">
   window.onload=function(){
     CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  };
 </script>
<script type="text/javascript">
function inputCheck(f) {
	if (f.title.value == "") {
		alert("제목을 입력하세요");
		f.title.focus();
		return false;
	}
	if (f.subtitle.value == "") {

		alert("소제목을 입력하세요");
		f.subtitle.focus();
		return false;
	}

	if(f.classes.selectedIndex==0){
		alert("분류를 선택하세요");
		f.classes.focus();
		return false;
	}
	

	if(f.types.selectedIndex==0){
		alert("세부 분류를 선택하세요");
		f.types.focus();
		return false;
	}
	   if (CKEDITOR.instances['content'].getData() == '') {
	         window.alert('내용을 입력해 주세요.');
	         CKEDITOR.instances['content'].focus();
	         return false;
	   }
	

}


function doChange(srcE, targetId){
    var val = srcE.options[srcE.selectedIndex].value;
    var targetE = document.getElementById(targetId);
    removeAll(targetE);

    if(val == 'portfolio'){
        addOption('logo','로고', targetE);
        addOption('adv','광고', targetE);
        addOption('edit','편집', targetE);
        addOption('art','아트상품', targetE);
        addOption('event','행사', targetE);
        
        //로고  광고  편집  아트상품  행사
    }
    else if(val == 'exhibit'){
        addOption('work','작품', targetE);
        addOption('exhibiting','진행전시', targetE);
        addOption('exhibited','이전전시', targetE);
        
        //작품','진행전시','이전전시
    }
    else if(val == 'academy'){
    	
        addOption('personal','개인지도', targetE);
        addOption('intensive','심화과정', targetE);
        addOption('expert','작가과정', targetE);
        addOption('hand','손글씨', targetE);
        addOption('meok','먹그림', targetE);
        addOption('watercolor','수체화', targetE);
        
       //  개인지도  심화과정  작가과정  손글씨  먹그림  수채화 
    }
}

function addOption(value, name, e){	
    var o = new Option(name);
    o.value =value;
    try{
        e.add(o);
    }catch(ee){
        e.add(o, null);
    }
}

function removeAll(e){
    for(var i = 0, limit = e.options.length; i < limit - 1; ++i){
        e.remove(1);
    }
}
</script>

<header id="page-top" class="blog-banner">
	<!-- Start: Header Content -->
	<div class="container" id="blog">
		<div class="row blog-header text-center wow fadeInUp"
			data-wow-delay="0.5s">
			<div class="col-sm-12">
				<!-- Headline Goes Here -->
				<h4 style="font-family: '휴먼편지체';">Project / Portfolio</h4>
				<h3 style="font-family: '휴먼편지체';">포트폴리오 작품</h3>
			</div>
		</div>
		<!-- End: .row -->
	</div>
	<!-- End: Header Content -->
</header>

<div class="blog_container blog_page_one">
	<div class="container">
		<div class="row">
			<!-- Blog Area -->



			<div class="col-sm-18 col-xs-14 blog-area">

				<div class="row">
					<form action="./create" method="post" enctype="multipart/form-data"
						onsubmit="return inputCheck(this)">

						<div class="col-xs-12">
							<div class="blog-warp-1 wow fadeInLeft" data-wow-delay="0.9s">

								<div class="blog_content_warp">


									<h4>
										썸네일 파일을 선택하세요. <input type='file' name='filenameMF' />
									</h4>
									<h4>
										제목 :<input type="text" name="title" />
									</h4>
									<h4>
										소제목 : <input type="text" name="subtitle" />
									</h4>
									<h4>

										<select name="classes" id="classes"
											onchange="doChange(this, 'types')">
											<option value="">--분류을 선택하세요--</option>
											<option value="portfolio">포트폴리오</option>
											<option value="exhibit"> 전시</option>
											<option value="academy"> 아카데미</option>
										</select> <select name="types" id="types">
											<option value="">--세부 분류을 선택하세요--</option>
										</select>
									</h4>




									<tr>
										<th valign="top"></th>
										<td><textarea name="content"></textarea></td>
									</tr>


								</div>
							</div>
						</div>
						<div class="col-xs-12">


							<c:if test="${sessionScope.grade eq 'A'}">
								<div class="slider_btn text-center"
									style="margin-bottom: 20px; margin-left: 30px;">
									<button type="submit" class="btn-primary">제출</button>
									<a href="javascript:history.back()" class="btn-primary">취소</a>
								</div>
							</c:if>

						</div>

					</form>
					<!--/ Blog Item 1 -->

				</div>



			</div>

			<!--/ Blog Area -->

		</div>
	</div>
	<!-- Container /- -->
</div>
