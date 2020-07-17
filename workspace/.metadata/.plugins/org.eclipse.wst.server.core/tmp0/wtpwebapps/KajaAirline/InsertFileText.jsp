<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="com.kaja_air.admin.VO.AdmimVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kaja_air.admin.DAO.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="java.io.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	.insertTable{
		margin-left: auto;
		margin-right: auto;
	}
	
body{
	background-image: url("./imgs/bg.jpg");
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
	request.setCharacterEncoding("euc-kr");
AdminDAO tidao = new AdminDAO(); //객체 생성
ArrayList<AdmimVO> tiArray = tidao.getSchedule();

String file = request.getParameter("file"); //file = txt파일 경로명
String kara = "D:\\pj3test\\"; //새로운 컴퓨터에서는 파일 경로명 새로 적어줘야됨 

		
//텍스트 파일 내용을 한줄씩 읽어서 list배열에 저장
 	BufferedReader in =null;
	ArrayList<String[]> list = new ArrayList<String[]>();
try{

	in = new BufferedReader(new FileReader(kara+file));
	String data;
	while((data= in.readLine()) != null){
	list.add(data.split("/"));	

	}

} catch (FileNotFoundException e){
	out.println("파일이 존재하지 않습니다.");
} catch (IOException e1){
	out.println("파일을 읽을수 없습니다");
} 
finally{
	try{
		in.close();//파일 닫기
	} catch (Exception e){
		
	}
}
%>
<header>
<jsp:include page="header.jsp"></jsp:include>
</header>

<section id="sectionId">
<h1 style="text-align: center;font-size: 25pt;">추가된 스케줄</h1>


<table class="insertTable" border=1>
<tr>
<td>스케줄 ID</td><td>출발시간</td><td>도착시간</td><td>출발지</td><td>도착지</td><td>성인가격</td><td>소인가격</td><td>유아가격</td>
</tr>
<% for(int i=0; i<list.size(); i++){ %>	
<tr>
	<%
	for(int ii=0; ii<8; ii++){ %>
		<td><%= list.get(i)[ii] %></td>
		<%} %>
		
	
	</tr>
	<%} %>
	
</table>
	 <% if(tidao.InsertSchedule(list) == true){%>
	<h2 style="color: green;font-weight: bold;text-align: center;font-size: 20pt;">스케줄 삽입 성공!</h2>
	 <% } else { %>
	 <h2 style="color: green;font-weight: bold;text-align: center;font-size: 20pt;">스케줄 삽입 실패!</h2> 
	<% } %>
	

 
 	<!-- 표현하는법을 모르겠음 controller 
 	
	<h1>삽입된 스케줄 목록</h1>
	<table border=1>
	<c:forEach var="vo1" items="${list}">
	<tr>
	<td>${vo1.list}<td>
	</tr>	
	</c:forEach>
	</table>
 	
 	-->

	<div style="text-align: center;text-decoration: none;"><a href="getAllSchedule.jsp">[스케줄 메인 화면으로]</a></div>
</section>
<footer>
<jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
</html>