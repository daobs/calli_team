<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link href="${root}/css/style.css" rel="stylesheet">

<script>
	function ndelete() {
		if (confirm("정말 삭제하시겠습니까?")) {
			var url = "./delete"
			url += "?bbsno=${vo.bbsno}";
			url += "&col=${param.col}";
			url += "&word=${param.word}";
			url += "&nowPage=${param.nowPage}";

			location.href = url;
		}
	}
	function bupdate() {
		var url = "./update";
		url += "?bbsno=${vo.bbsno}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";

		location.href = url;
	}
	function bdelete() {
		var url = "./delete"
		url += "?bbsno=${vo.bbsno}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";

		location.href = url;
	}
	function breply() {
		var url = "./reply"
		url += "?bbsno=${vo.bbsno}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";

		location.href = url;
	}

	function rcheck(tarea) {
		if ('${sessionScope.id}' == "") {
			if (confirm("로그인후 댓글를 쓰세요")) {
				var url = "../member/login";
				url = url + "?bbsno=${vo.bbsno}";
				url = url + "&nowPage=${param.nowPage}";
				url = url + "&nPage=${nPage}";
				url = url + "&col=${param.col}";
				url = url + "&word=${param.word}";
				url = url + "&flag=../bbs/read";
				location.href = url;
			} else {
				tarea.blur();
			}
		}
	}

	function input(f) {
		if ('${sessionScope.id}' == "") {
			if (confirm("로그인후 댓글를 쓰세요")) {
				var url = "../member/login";
				url = url + "?bbsno=${vo.bbsno}";
				url = url + "&nowPage=${param.nowPage}";
				url = url + "&nPage=${nPage}";
				url = url + "&col=${param.col}";
				url = url + "&word=${param.word}";
				url = url + "&rflag=../bbs/read";
				location.href = url;
				return false;
			} else {
				return false;
			}
		} else if (f.content.value == "") {
			alert("댓글 내용을 입력하세요.");
			f.content.focus();
			return false;
		}
	}
	function rupdate(rnum, content) {
		var f = document.rform;
		f.content.value = content;
		f.rnum.value = rnum;
		f.rsubmit.value = "수정";
		f.action = "./rupdate"
	}
	function rdelete(rnum) {
		if (confirm("정말삭제 하겠습니까?")) {
			var url = "./rdelete";
			url = url + "?rnum=" + rnum;
			url = url + "&bbsno=${vo.bbsno}";
			url = url + "&nowPage=${param.nowPage}";
			url = url + "&nPage=${nPage}";
			url = url + "&col=${param.col}";
			url = url + "&word=${param.word}";
			location.href = url;
		}
	}
</script>
<header id="page-top" class="blog-banner "
	style="background-image: url(${root}/images/portfolio/headimg.jpg);">
	<!-- Start: Header Content -->
	<div class="container" id="blog">
		<div class="row blog-header text-center wow fadeInUp"
			data-wow-delay="0.5s">
			<div class="col-sm-12">
				<!-- Headline Goes Here -->
				<h4 style="font-family: '휴먼편지체';">board / free board</h4>
				<h3 style="font-family: '휴먼편지체';">자유게시판</h3>
			</div>
		</div>
		<!-- End: .row -->
	</div>
	<!-- End: Header Content -->
</header>

<div class="blog_container blog_page_three">
	<div class="container">
		<div class="col-sm-12 col-xs-12 blog-area">
			<div>
				<table class="table">
					<tr>
						<td style="font-weight: bold;"><c:choose>
								<c:when
									test="${fn:substring(vo.id,fn:length(vo.id)-7,fn:length(vo.id)) eq '(kakao)'}">
						작성자 : <img src="${root}/images/kaka3.JPG"> ${fn:substring(vo.id,0,fn:length(vo.id)-7)}
						</c:when>
								<c:otherwise>
						작성자 : ${vo.id }
						</c:otherwise>

							</c:choose>

							<div style="text-align: center;">
								<p style="font-size: 20px;">${vo.title}</p>
							</div></td>

					</tr>



					<tr>
						<td>${vo.content }</td>
					</tr>
				</table>
			</div>
			<c:if
				test="${sessionScope.grade eq 'A' || sessionScope.id eq vo.id }">


				<div class="slider_btn"
					style="margin-bottom: 20px; text-align: center;">
					<a class="btn-primary" onclick="javascript:ndelete();">삭제</a> <a
						class="btn-primary" onclick="javascript:bupdate()">수정</a>
				</div>
			</c:if>
			
			<br><br>


			<!--comments list -->
			<div style="margin-left: 170px; margin-right: 170px">

				<div class="list-comments">
					<div class="comments-section-title">
						<h4>Comments</h4>
					</div>
					<!-- .section-title -->
					<c:forEach var="rdto" items="${rlist}">
						<ul class="comments">
							<li>

								<div class="comment">
									<c:if test="${rdto.thumnail ne 'default.jpg' }">
										<strong class="commenter-title"><img
											src="${rdto.thumnail }" width="60px" height="60px"
											class="comment-avatar"></strong>
									</c:if>
									<c:choose>
										<c:when
											test="${fn:substring(rdto.id,fn:length(rdto.id)-7,fn:length(rdto.id)) eq '(kakao)'}">
											<img src="${root}/images/kaka3.JPG"> ${fn:substring(rdto.id,0,fn:length(rdto.id)-7)}
						</c:when>
										<c:otherwise>
						${rto.id }
						</c:otherwise>
									</c:choose>
									 <span class="comment-date">${rdto.regdate}</span>

									<p>${rdto.content}</p>
									<c:if test="${sessionScope.id==rdto.id }">
										<span style="float: right;"> <a
											href="javascript:rupdate('${rdto.rnum}','${rdto.content }')">
												수정</a>|<a href="javascript:rdelete('${rdto.rnum}')">삭제</a>
										</span>
									</c:if>

								</div>



							</li>
						</ul>
						<!--/ .comments -->
					</c:forEach>
				</div>
				<div class="bottom">${paging}</div>
				<br><br><br>
				<!--/comments list -->

				<!-- comment box   -->
				<div class="contact">
					<div class="contact-form-warper blog-contact">
					
							<!--  Contact Form  -->
							<div class="contact-form">
								<h4 style="text-align: center;">댓글 남기기</h4>
								<form name="rform" action="./rcreate" method="post"
									onsubmit="return input(this)">									
									<input
										type="hidden" name="bbsno" value="${vo.bbsno}"> <input
										type="hidden" name="id" value="${sessionScope.id}"> <input
										type="hidden" name="nowPage" value="${param.nowPage}">
									<input type="hidden" name="nPage" value="${nPage}"> <input
										type="hidden" name="col" value="${param.col}"> <input
										type="hidden" name="word" value="${param.word}"> <input
										type="hidden" name="thumnail" value="${sessionScope.thumnail}">
									<input type="hidden" name="rnum" value="0">
									

									<div class="form-group">
										<textarea class="form-control"  name="content" onclick="rcheck(this)"
											placeholder="Message :"></textarea>
									</div>

									<div style="text-align: center;">
										<input class="submit-button btn btn-chos" name="rsubmit"
											value="등록" type="submit">
											
									</div>
								</form>
							</div>
							<!-- End:Contact Form  -->
						</div>
					</div>
				</div>
				
				
				<!--/.comment box-->
			</div>

			
			


		</div>
	</div>




