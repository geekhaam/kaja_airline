<%@page import="airfaqVO.AirFAQVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="airfaqDAO.AirFAQDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.menu1 {
	cursor: pointer;
	color: black;
	background-color: white;
	font-size: 15pt;
}

.menu2 {
	color: black;
	background-color: silver;
	font-size: 10pt;
}

body{
	background-image: url("./imgs/bg.jpg");
}
</style>
<script>

	function kaja(bada) {
		if (bada.style.display == "none") {
			bada.style.display = "block"
		} else {
			bada.style.display = "none"
		}
	}
	window.onload=function(){
		showSlides();
	}
</script>
</head>
<body>
	<header><jsp:include page="header.jsp" /></header>
	<section id="sectionId">
	<center>
		<form action="AllFAQ.jsp" method="get">
				<%
					request.setCharacterEncoding("EUC-KR");
				%>
				
				<h1>${sKategorie1}</h1>
				<table border="0" width=800>
					<c:forEach var="afVO3" items="${afVO3}">
						<tr>
							<td>
								<div class="menu1" id="bigmenu1" onclick="kaja(document.getElementById('${afVO3.qId}'))">
									<span><img src="icon/question.png" width="20" id="question" /></span> 
									${afVO3.qQuestion}
									<img src="icon/down_arrow.png" width="20" id=arrow align="right" />
									<hr>
								</div>
								<div class="menu2" id="${afVO3.qId}" style="display: none">
									<ul>
										${afVO3.qAnswer}
									</ul>
									<hr>
								</div>
							</td>
						</tr>
					</c:forEach>
					<tr><td><input type="submit" value="돌아가기" /></td></tr>
				</table>
		</center>
	</section>
	<footer><jsp:include page="footer.jsp" /></footer>
</body>
</html>