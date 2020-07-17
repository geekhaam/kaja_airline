<%@page import="java.util.ArrayList"%>
<%@page import="com.kaja_air.admin.DAO.AdminDAO"%>
<%@page import="com.kaja_air.admin.VO.AdmimVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	.adminNoticeTable{
		/* width = "650" align="center"; */
		width: 50%;
		margin-left: auto;
		margin-right: auto;
		text-align: left;
	}

	
</style>
<script type="text/javascript">
	window.onload=function(){
		if("<%=session.getAttribute("id")%>"=="admin"){
			document.getElementById("adminwrite").style.display="block";
		}
		showSlides();
	}
</script>
</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
AdminDAO tidao = new AdminDAO(); //객체 생성
ArrayList<AdmimVO> tiArray = tidao.getNoticeList();
%>

<header>
<jsp:include page="header.jsp"></jsp:include>
</header>


<section id="sectionId" style="text-align: center;margin-left: auto;margin-right: auto;">
	<h1 style="text-align: center;font-size: 25pt;">공지사항</h1>

	<form action="NoticeWrite.jsp">
	<table border="2" class="adminNoticeTable">
		<tr>
			<td style="text-align: center;width: 10%;">글번호</td>
			<td style="text-align: center;width: 60%%;">제목</td>
			<td style="text-align: center;width: 30%;">날짜</td>
		</tr>
		
			<%
						for(AdmimVO imsi : tiArray){
					%>
			
			<tr onclick="location.href='NoticeContent.do?nNo=<%=imsi.getnNo()%>&fileName1=<%=imsi.getnFname()%>&num=<%=imsi.getnNo() %>'" style="cursor:pointer;">	
			<td><%=imsi.getnNo()%></td>
			<td><%=imsi.getnTitle() %></td>
			<td><%=imsi.getnDate()%></td>
    <%-- <input type="hidden" value="<%=imsi.getnTitle() %>"name="subject" /> --%>
    <input type="hidden" value="<%=imsi.getnFname() %>"name="fileName1" />
    <input type="hidden" value="<%=imsi.getnNo() %>" name="num"/>
    		<%}%></tr>
	</table>
	<br><hr>
	<div id="adminwrite" style="display: none;text-align: center;">
	<input  style="font-size: 17pt;padding: 5px;" type="submit" value="글쓰기">
	</div>
	
	
	

</form>
</section>
<footer>
<jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
</html>