<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.kaja_air.admin.VO.AdmimVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kaja_air.admin.DAO.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>스케줄 전체보기</title>
<style>

body{
	background-image: url("./imgs/bg.jpg");
}

 	#main{
 		float:left;
 		width: 46%;
 		
 		
 	}
 	
 	#main2{
 	float:right;
 	width:46%;
 	
 	}
 	

</style>


<script src="./js/jquery-3.1.1.js"></script>
<script type="text/javascript">
		window.onload=function setSign() {
			showSlides();
		}
</script>
</head>
<body>

<%
	request.setCharacterEncoding("EUC-KR");
AdminDAO tidao = new AdminDAO(); //객체 생성
ArrayList<AdmimVO> tiArray = tidao.getSchedule();
%>

<header>
<jsp:include page="header.jsp"></jsp:include>
</header>


<section id="sectionId">

<div style="width: 100%;">

	<table id="main" border="1">
	<tr><td colspan="8"><h1>항공 스케줄</h1></td></tr>
	<tr>
	<td>스케줄ID</td><td>출발 시각</td><td>도착 시각</td><td>출발지</td><td>도착지</td><td>성인가격</td><td>소인가격</td><td>유아가격</td>
	</tr>
	
	<%
			for(AdmimVO imsi : tiArray){
		%>
	<tr onclick="location.href='ScheduleSearchOne.do?pId=<%=imsi.getpId() %>&pDeparture=<%=imsi.getpDTime() %>&pArrive=<%=imsi.getpArrive() %>'"  style="cursor:pointer;">
	<td><%=imsi.getpId() %></td>
	<td><%=imsi.getpDTime() %></td>
	<td><%=imsi.getpATime() %></td>
	<td><%=imsi.getpDeparture() %></td>
	<td><%=imsi.getpArrive() %></td>
	<td><%=imsi.getpChildPrice() %></td>
	<td><%=imsi.getpAdultPrice() %></td>
	<td><%=imsi.getpBabyPrice() %></td>
	<%} %></tr>
	
	</table>



<fieldset id="main2">
		<div style="font-weight: bold;font-size: 20pt;">스케줄 삽입</div>
	     <legend>파일 업로드</legend>
	     <form action="InsertFileText.jsp">
	     <table>
	     <tr>
	     

	     <td><input type="file" value="파일 선택" name="file"/></td>	
	     <td><input type="submit" value="파일입력"/></td>
	     </tr>
	     </table>
	      </form>

</fieldset>
</div>
</section>
<footer>
<jsp:include page="footer.jsp"></jsp:include>
</footer>

</body>
</html>