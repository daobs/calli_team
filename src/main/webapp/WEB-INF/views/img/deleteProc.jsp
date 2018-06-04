<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	font-size: 20px;
}
</style>
<link href="${root}/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function tlist(){
	var url = "./list";
	url += "?col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href=url;
}
</script>
</head>
<body>
	<div class="content">
		<c:choose>
			<c:when test="${flag}">
			팀 정보가 삭제되었습니다.
			</c:when>
			<c:otherwise>
			팀 정보삭제가 실패되었습니다.
			</c:otherwise>
		</c:choose>
		<div class="bottom">
			<br>
			<br>
			<button type="button" onclick="location.href='./create'">계속
				등록</button>
			<button type="button" onclick="tlist()">목록</button>
		</div>
	</div>	
</body>
</html>