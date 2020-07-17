<%@page import="airfaqVO.AirFAQVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="airfaqDAO.AirFAQDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>

body{
	background-image: url("./imgs/bg.jpg");
}
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
.allfaqTable{
	width: 45%;
	margin-left: auto;
	margin-right: auto;
	text-align: left;
}
</style>
<script>
	/* bada�� document.getElementById('somenu1')�� ���� */
	function kaja(bada) { /* toggle����� �׻� �̷� ������� �ۼ� */
		if (bada.style.display == "none") {//�����վ�
			bada.style.display = "block"//show��
		} else { //�ȼ����ִٰ�!!!
			bada.style.display = "none"//�׷�����
		}
	}
	window.onload=function(){
		showSlides();
	}
</script>
</head>
<body>
		<%
			request.setCharacterEncoding("EUC-KR");
			AirFAQDAO afdao = new AirFAQDAO();
			
			int start = 1;
			int total =0;
			if (request.getParameter("start") != null) {
			   start = Integer.parseInt(request.getParameter("start"));
			}
			int startRow = (start - 1) * 10 + 1;
			int endRow = start * 10;
			
			total = afdao.getCount();
			ArrayList<AirFAQVO> aFAQArray = afdao.getAllFAQ(startRow, endRow);
		%>
	<header><jsp:include page="header.jsp" /></header>
	<section id="sectionId">
	<form action="SearchFAQ.customerdo">
	
		<h1 style="text-align: center;">���� ã�� ����</h1>
		<hr>
		<br> <br>
		<table class="allfaqTable" border=0 >
			<tr>
				<td colspan="2">
					<select name="Kategorie1" style="font-size: 12pt;width: 25%;height: 30px;">
						<option value="ȸ������">ȸ������</option>
						<option value="�װ���">�װ���</option>
						<option value="�⳻">�⳻</option>
						<option value="�ݷ�����">�ݷ�����</option>
						<option value="���Ϲ�">���Ϲ�</option>
					</select>
				</td>
				<td style="text-align: right;"><input style="width: 30%;font-size: 12pt;" type="submit" value="�˻�" /></td>
		
			</tr>
		</table>
		<table class="allfaqTable" border="1">
			<%
				for (AirFAQVO imsi : aFAQArray) {
			%>
			<tr>
				<td>
					<div class="menu1" id="bigmenu1"
						onclick="kaja(document.getElementById('<%=imsi.getqId() %>'))">
						<span><img src="icon/question.png" width="20" id="question" /></span>
						<%=imsi.getqQuestion()%>
						<img src="icon/down_arrow.png" width="20" id=arrow align="right" />
						<!-- <hr> -->
					</div>
					<div class="menu2" id=<%=imsi.getqId() %> style="display: none">
						<ul>
							<%=imsi.getqAnswer()%>
						</ul>
						<hr>
					</div>
				</td>
				<%
					}
				%>
			</tr>
			<tr>
				<td align="center">
					<%
						if (total > 0) {
							int pageCount = total / 10 + (total % 10 == 0 ? 0 : 1);
							System.out.println(total);
							int pageBlock = 5;
							int startPage = ((start - 1) / pageBlock) * pageBlock + 1;
							int endPage = startPage + pageBlock - 1;
							if (endPage > pageCount) {
								endPage = pageCount;
							}
							if (startPage > pageBlock) {
					%>
						<a href="AllFAQ.jsp?start=<%=startPage - 10%>">[����]</a> 
					<%
							}
							for (int i = startPage; i <= endPage; i++) {
								if (i == start) {
					%>
						[<%=i%>]
					<%
								} else {
					%>
						<a href="AllFAQ.jsp?start=<%=i%>">[<%=i%>]</a>
					<%
								}
							}
							if (endPage < pageCount) {
					%> 
						<a href="AllFAQ.jsp?start=<%=startPage + 10%>">[����]</a>
					<%
							}
						}
					%>
				</td>
			</tr>
		</table>
	</form>
	</section>
	<footer><jsp:include page="footer.jsp" /></footer>
</body>
</html>