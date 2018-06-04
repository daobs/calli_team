<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link href="${root}/css/bs/style.css" rel="stylesheet">

<script>
	function ndelete() {
		if (confirm("정말 삭제하시겠습니까?")) {
			var url = "./delete"
			url += "?requestno=${dto.requestno}";
			url += "&col=${param.col}";
			url += "&word=${param.word}";
			url += "&nowPage=${param.nowPage}";

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
				<h4 style="font-family: '휴먼편지체';"> request</h4>
				<h3 style="font-family: '휴먼편지체';">작업의뢰 읽기</h3>
			</div>
		</div>
		<!-- End: .row -->
	</div>
	<!-- End: Header Content -->
</header>

<div class="blog_container blog_page_three">
	<div class="container">
	
		<div class="col-sm-12 col-xs-12 blog-area">
		<c:if test="${sessionScope.grade eq 'A' }">
			<fieldset
			style="border: 3; solid #808080; width: 600px; margin-bottom: 100px;">
			<legend >작업의뢰</legend>
			<table class="table">
				<tr>
					<th width="100" valign="top">의뢰로고명<span style="color: red">*</span></th>
					<td>${dto.logo_name }</td>
				</tr>

				<tr>
					<th valign="top">의뢰부분<span style="color: red">*</span></th>
					<td>
						${dto.part }
					</td>
				</tr>


				<tr>
					<th valign="top">적용분야<span style="color: red">*</span></th>
					<td>
						${dto.part2 }
					</td>
				</tr>

				<tr>
					<th valign="top">내용</th>
					<td>
						<textarea name="content" readonly="readonly"  style="width: 440px; height: 160px;">${dto.content }</textarea>
					</td>
				</tr>

				<tr>
					<th>글씨방향<span style="color: red">*</span></th>
					<td>
						${dto.part3 }
					</td>
				</tr>
				
				<tr>
                  <th>진행일정<span style="color: red">*</span></th>
                  <td>
                  	${dto.period_s } ~ ${dto.period_end }
                  </td>
                </tr>

                <tr>
                  <th>의뢰사</th>
                  <td>
                  	<table class='in_table'>
                    	<colgroup>
                        	<col width='100'>
                          	<col>
                          	<col width='80'>
                          	<col>
                        </colgroup>
                   		<tr>
                          <td>
                            	회사명 :
                          </td>
                          <td colspan=3>
                            ${dto.company_name }
                          </td>
                        </tr>     

                        <tr>
                          <td>
                            	부서명 :
                          </td>
                          <td colspan=3>
                           ${dto.grade }
                          </td>
                        </tr>                   
                                               
                        <tr>
                          <td>
                            	담당자명 :
                          </td>
                          <td>
                          	${dto.name }
                          </td>
                          <td>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;직책 :
                          </td>
                          <td>
                            ${dto.position }
                          </td>
                        </tr>

                      </table>

                  </td>
                </tr>

                <tr>
                  <th>연락처<span style="color: red">*</span></th>
                  <td>
                  	<table class='in_table'>
                     		<colgroup>
                          	<col width='85'>
                          	<col>
                        	</colgroup>
                        	<tr>
	                          	<td>
	                            	회사전화
	                          	</td>
		                       	<td >
		                        	<input type="text" readonly="readonly" value="${dto.phone }" >
		                        </td>
                        	</tr>     

	                        <tr>
	                          <td>
	                          	핸드폰번호<span style="color: red">*</span>
	                          </td>
	                          <td>
	                          	<input type="text" name="phone" value="${dto.phone }" readonly="readonly" />
	                          </td>
	                        </tr>                   
                                               
                        <tr>
                          <td>
                           	 팩스
                          </td>
                          <td>
                            <input type="text" name='fax' value="${dto.fax }"  readonly="readonly"/>
                          </td>
                        </tr>

                        <tr>
                          <td>
                            	이메일<span style="color: red">*</span>
                          </td>
                          <td>
                            <input type="text" name='email' value="${dto.email }"  readonly="readonly"/>
                          </td>
                        </tr>
                      </table>

                  </td>
                </tr>

            

                
				
			</table>
		</fieldset>
			
			
			
			
			
			
			
			
			
			
			
			
			
				<div style="margin-top: 50px">
					<button type="button" class="form-control btn-primary"
						onclick="ndelete()">삭제</button>
				</div>
			</c:if>


		</div>
	</div>
</div>



