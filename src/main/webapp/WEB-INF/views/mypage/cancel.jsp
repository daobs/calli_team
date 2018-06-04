<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.velocity.runtime.directive.Include"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />


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


<!-- 페이지 이동 ======= -->
<script type="text/javascript">
function aread(){
	var url = "${root }/art/artread";
	location.href = url;
}
</script>
<!-- 페이지 이동 ======= -->


	
	<section class="confacts-section facts_section_v2">
        <div class="container">
            <div class="row">
                <div class="funfact_wapr">
                    <!-- col-lg-4 -->
                    <div class="col-sm-3 col-xs-12">
                        <div class="facts_wrapper">
                            <div class="icon-lay">
                                <i class="icon_gift_alt"></i>
                            </div>
                            <h3 class="stat-count count">5</h3>
                            <h5> 배송 내역 </h5>
                        </div>
                    </div>
                    <!-- col-lg-4 /- -->
                    <!-- col-lg-4 -->
                    <div class="col-sm-3 col-xs-12">
                        <div class="facts_wrapper">
                            <div class="icon-lay">
                                <i class="icon_lightbulb_alt"></i>
                            </div>
                            <h3 class="stat-count count">10</h3>
                            <h5> 취소 내역 </h5>
                        </div>
                    </div>
                    <!-- col-lg-4 /- -->
                    <!-- col-lg-4 -->
                    <div class="col-sm-3 col-xs-12">
                        <div class="facts_wrapper">
                            <div class="icon-lay">
                                <i class="icon_heart_alt"></i>
                            </div>
                            <h3 class="stat-count count">20</h3>
                            <h5> 위시 리스트 </h5>
                        </div>
                    </div>
                    <!-- col-lg-4 /- -->
                    <!-- col-lg-4 -->
                    <div class="col-sm-3 col-xs-12">
                        <div class="facts_wrapper">
                            <div class="icon-lay">
                                <i class="icon_clock_alt"></i>
                            </div>
                            <h3 class="stat-count count">30</h3>
                            <h5> 최근 본 상품 </h5>
                        </div>
                    </div>
                    <!-- col-lg-4 /- -->
                </div>
                <!-- funfact_wapr /- -->
            </div>
            <!-- row /- -->
        </div>
        <!-- container /- -->
    </section>
	
	
	<section class="team_section_v2">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="base-header base_header_v2">
                        <small>my page</small>
                        <h3> blackathena </h3>
                    </div>
                </div>
                
                <div class="col-md-8">
                
                    <div class="col-sm-4 col-xs-12">
                        <div class="member_warp">
                            <div class="member_img">
<!--                                 <img class="img-responsive" alt="team" src="images/team-1.jpg"> -->
                            </div>
                            <div class="member_info">
                                <h6> <a href = "#"> 주문 내역  </a><small> </small></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 col-xs-12">
                        <div class="member_warp">
                            <div class="member_img">
<!--                                 <img class="img-responsive" alt="team" src="images/team-1.jpg"> -->
                            </div>
                            <div class="member_info">
                                <h6> <a href = "./cancel"> 취소내역 </a><small> </small></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 col-xs-12">
                        <div class="member_warp">
                            <div class="member_img">
<!--                                 <img class="img-responsive" alt="team" src="images/team-1.jpg"> -->
                            </div>
                            <div class="member_info">
                                <h6> <a href = "./recently"> 최근본상품 </a><small> </small></h6>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
    </section>
	
					<!-- 왕은실의 캘리그라피 ====================================-->
										<DIV class="container" align="center" style="width:80%;">
										  <div class="slider_btn" style="margin-bottom: 20px; text-align: center;">
										      <form name="frm" method="post" action="list">
										         <select name="col">
										            <option value="title"
										               <c:out value="${col eq 'title' ? 'selected' : '' }" />>상품</option>
										            <option value="total"
										               <c:out value="${col eq 'total' ? 'selected' : '' }" />>전체</option>
										         </select> <input type="text" name="word" value="${word}" style = "width:20%;">
										         <input type ="button" class="btn btn-default" onclick="#" style = "color:black;" value = "조회">
										      </form>
										         </div>
										         
										   <TABLE class="table table-hover">
										      <colgroup>
						                            <col width="15%">
						                            <col width="10%">
						                            <col width="40%">
						                            <col width="10%">
						                            <col width="10%">
						                            <col width="10%">
						                        </colgroup>
										      <TR>
										         <TH>취소 날짜</TH>
										         <TH>주문 번호</TH>
										         <TH>주문 상품</TH>
										         <TH>주문 금액</TH>
										         <TH>주문 상태</TH>
										      </TR>
										   		
										   	 <tbody>
	                         			   <tr>
				                                <td>2017년 09월 11일</td>
				                                <td><a href = "${root }/mypage/detail">20170000123</a> </td>
				                                <td>
						      						   <table>
															<tbody>
															<tr>
																<td width="80">
																	<img src="${root }/css/ksa/images/0.jpg" width="60" onclick = "javascript:aread()">
																</td>
																<td>
																	<a href="${root }/art/artread" title="캘리그라피 엽서" style = "text-decoration: none;">캘리그라피 엽서</a>
																</td>
															</tr>
															</tbody>
														</table>
				                                </td>
				                                <td><b>17,500원</b></td>
												<td><a href = "./">배송대기</a></td>
				                            </tr>
				                        </tbody>	
										   
										   
										   
<%-- 										      <c:choose> --%>
<%-- 										         <c:when test="${empty list }"> --%>
<!-- 										            <tbody> -->
<!-- 										               <tr> -->
<!-- 										                  <td colspan="8">등록된 글이 없습니다.</td> -->
<!-- 										               </tr> -->
<!-- 										            </tbody> -->
<%-- 										         </c:when> --%>
<%-- 										         <c:otherwise> --%>
<%-- 										            <c:forEach var="dto" items="${list }"> --%>
<!-- 										               <tr> -->
<%-- 										                  <td>${dto.qnano }</td> --%>
<%-- 										                  <td><c:forEach begin="1" end="${dto.indent }" step="1" --%>
<%-- 										                        var="int"> --%>
<!-- 										                        &nbsp;&nbsp;&nbsp; -->
<%-- 										                     </c:forEach> <c:if test="${dto.indent>0 }"> --%>
<%-- 										                        <img src="${root }/images/qna_re.jpg"> --%>
<%-- 										                     </c:if> <a href="javascript:read('${dto.qnano }')"> <img --%>
<%-- 										                        src="${root }/images/qna_lock.jpg" --%>
<%-- 										                        style="width: 18px; height: 18px;">${dto.title }</a> <c:if --%>
<%-- 										                        test="${Utility.compareDay(dto.wdate().substring(0,10))}"> --%>
<%-- 										                        <img src="${root }/images/qna_new.gif"> --%>
<%-- 										                     </c:if> ${dto.title }</td> --%>
<%-- 										                  <td>${dto.content }</td> --%>
<%-- 										                  <td>${dto.wdate }</td> --%>
<!-- 										               </tr> -->
<%-- 										            </c:forEach> --%>
<%-- 										         </c:otherwise> --%>
<%-- 										      </c:choose> --%>
										   </TABLE>
										   <br> <br>
										          
                <!-- 페이지 번호 ====================================-->
                        <div class="col-lg-12" style="text-align: center">
                            <nav class="pagination">
                                <ul class="pager">
                                    <li><a href="#">&lt;</a></li>
                                    <li><a href="#">01</a></li>
                                    <li class="pagi-big"><a href="#"> 02 </a></li>
                                    <li><a href="#">03</a></li>
                                    <li><a href="#">&gt;</a></li>
                                </ul>
                            </nav>
                        </div>
                   <!-- 페이지 번호 ====================================-->     
 
<%-- 		<DIV>${Utility.paging3(total, nowPage, recordPerPage, col, word)}</div> --%>
                                </div>
                                <!-- .comment -->
	
	
	
