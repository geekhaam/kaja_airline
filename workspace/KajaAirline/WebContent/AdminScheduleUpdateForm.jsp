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
<title>������ ����</title>

<script type="text/javascript">
window.onload=function setSign() {
	showSlides();
}
</script>
</head>
<body>
<header>
<jsp:include page="header.jsp"></jsp:include>
</header>
<section id="sectionId">
<h1>�װ� ������ ���� </h1>

<form action="AdminScheduleUpdate.do?pid=${pid2 }&departure1=${pdeparture2}&arrive1=${parrive2 }" >
									<!-- ������ �����ٹ�ȣ -->
<table border=2>	
	<tr>
	<td>������iD</td>
	<td>��� �ð�</td>
	<td>���� �ð�</td>
	<td>�����</td>
	<td>������</td>
	<td>���ΰ���</td>
	<td>���ΰ���</td>
	<td>���ư���</td>
	</tr>
	<tr>
	
	<td>${pid2}</td>
	<td><input type= "text" name = "dtime" value =${tv2.pDTime } onfocus="this.select()"></td>
	<td><input type= "text" name = "atime" value =${tv2.pATime } onfocus="this.select()"></td>
	<td><input type= "text" name = "departure" value =${tv2.pDeparture } onfocus="this.select()"></td>
	<td><input type= "text" name = "arrive" value =${tv2.pArrive } onfocus="this.select()"></td>
	<td><input type= "text" name = "aprice" value =${tv2.pAdultPrice } onfocus="this.select()"></td>
	<td><input type= "text" name = "cprice" value =${tv2.pChildPrice } onfocus="this.select()"></td>
	<td><input type= "text" name = "bprice" value =${tv2.pBabyPrice } onfocus="this.select()"></td>
	<input type ="hidden" name = "pid" value = "${pid2 }" >
	<input type ="hidden" name = "departure1" value = "${pdeparture2}" >
	<input type ="hidden" name = "arrive1" value = "${parrive2 }" >

	</tr>
	<tr>
		<td colspan=8>
		<input type="submit" style="width: 6%;" value="����">
		
		</td>
	</tr>

	</table>
</form>

	<a href="getAllSchedule.jsp">[����ȭ������ ]</a>
	<a href="AdminScheduleDelete.do?pid=${pid2 }&departure1=${pdeparture2}&arrive1=${parrive2 }">[����]</a>
	${pDeparture}
	${pArrive }
</section>
<footer>
<jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
</html>