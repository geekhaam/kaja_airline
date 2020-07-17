<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>�Խ��� - �۾���</title>

<style type="text/css">
#title3 {
	height: 16;
	font-family: '����';
	font-size: 12;
	text-align: center;
}
body{
	background-image: url("./imgs/bg.jpg");
}
.writeInquireTable{
	margin-left: auto;
	margin-right: auto;
	width: 45%;
	text-align: left;
}

</style>
<script type="text/javascript">
	window.onload=function(){
		
		showSlides();
	}
</script>
</head>
	<body>
	<%
		String name="null";
		String iId = (String)session.getAttribute("id");
	%>
		<header><jsp:include page="header.jsp" /></header>
		<section id="sectionId">
		
		
		<h2 style="text-align: center;">�� �� ��</h2>
		<br>

		<form method="post" action="write_Inquire.customerdo"
			enctype="multipart/form-data">
			<input type="hidden" name="iId" value=<%=iId %> /> 
			<input type="hidden" name="iId" value=<%=name %> />
			<%-- <input type="hidden" name="board_id" value="${sessionScope.sessionID}"> --%>
			<table class="writeInquireTable" border="3">
				<tr>
					<td id="title3">�ۼ���</td>
					<td><%= iId %> <%-- <td>${sessionScope.sessionID}</td> --%>
				</tr>
				<tr>
					<td id="title3">�� ��</td>
					<td>
						<input name="iTitle" type="text" size="70" maxlength="100" style="width: 100%;" value="" />
					</td>
				</tr>
				<tr>
					<td id="title3">�� ��</td>
					<td><textarea name="iContent" cols="72" rows="20" style="width: 100%;"></textarea>
					</td>
				</tr>
				<tr>
					<td id="title3">����÷��</td>
					<td><input type="file" name="iFile" /></td>
				</tr>
				<tr align="center" valign="middle">
					<td colspan="5">
						<input type="submit" value="���">
						<input type="reset" value="���"> 
						<input type="button" value="�ڷ� ����" onclick="location.href='index.jsp'">
					</td>
				</tr>
			</table>
		</form>
</section>
<footer><jsp:include page="footer.jsp" /></footer>
</body>
</html>