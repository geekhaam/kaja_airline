<%@page import="java.util.ArrayList"%>
<%@page import="reservationVO.ReservationVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ��ȸ/���</title>
<style>
body{
	background-image: url("./imgs/bg.jpg");
}
.title {
	text-align: center;
	margin: 35px;
	font-size: 26pt;
}

.subtitle {
	text-align: center;
	margin: 30px;
}

.table {
	width: 60%;
	border-spacing: 0;
	text-align: center;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin: auto;
}

.th {
	font-size: 15pt;
	padding: 10px;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	border-top: 1px solid #fff;
	border-left: 1px solid #fff;
	background: #eee;
}

.td {
	padding: 10px;
	border-bottom: 1px solid #ccc;
}



</style>
<script type="text/javascript">
window.onload=function start() {
	
	showSlides();
}
</script>
</head>
<body>
	<%
		ArrayList<ReservationVO> list = (ArrayList<ReservationVO>)request.getAttribute("list");
		ArrayList<ReservationVO> cancelList = (ArrayList<ReservationVO>)request.getAttribute("cancelList");
		int start = (int)request.getAttribute("start");
		int startRow = (int)request.getAttribute("startRow");
		int total = (int)request.getAttribute("total");
		int start3 = (int)request.getAttribute("start3");
		int startRow3 = (int)request.getAttribute("startRow3");
		int total3 = (int)request.getAttribute("total3");
		
		String rId = (String)request.getAttribute("rId");
	%>
	
	<header>
	<jsp:include page="header.jsp" />
	</header>
	
	<section id="sectionId">
	<div>
	
		<h1 class="title">���� ���� ��ȸ/���</h1>
		
		<hr>
		
		<h2 class="subtitle">���� ����</h2>
		
		<table class="table">
			<tr>
				<th class="th">�������</th> <th class="th">�����</th> <th class="th">��������</th> <th class="th">������</th> <th class="th">�¼�</th>
			</tr>
			
			<% if(list.isEmpty()) { %> <!-- list ��������� ���� ���� �� -->
				<tr>
					<td class="td" colspan="5">���� ������ �����ϴ�.</td>
				</tr>
			<% 
				} else { 
					
				for(ReservationVO vo : list) { //��ҵ��� ���� �͸� ��ȸ
			%>
				<tr>
					<td class="td"><%=vo.getrDTime() %></td>
					<td class="td"><%=vo.getrDeparture() %></td>
					<td class="td"><%=vo.getrATime() %></td>
					<td class="td"><%=vo.getrArrive() %></td>
					<td class="td">
					<% 
						String[] seat = vo.getrSeat().split("_"); 
						for(int i=0; i<seat.length; i++) {
					%>
						<%=seat[i] %>
					<% } %>
					</td>
				</tr>
			<% } %>
				<tr>
					<td colspan="5" align="right"><span>
					<input type="button" class="button" value="����ϱ�" onclick="location.href='reservationDetail.mypage'">
					<input type="button" class="button" value="���ư���" onclick="location.href='index.jsp'">
					</span>
					</td>
				</tr>
			<% } %>
				<tr>
					<td colspan="6">
					<%	// ����¡  ó��
						if(total > 0){
							// �� �������� ��
							int pageCount = total / 5 + (total%5 == 0 ? 0 : 1);
							// �� �������� ������ ������ ��(��ũ) ��
							int pageBlock = 5;
							// �� �������� ������ ���� �� �� ��ȣ(�� : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
							int startPage = ((start-1)/pageBlock)*pageBlock+1;
							int endPage = startPage + pageBlock - 1;
							
							// ������ �������� �� ������ �� ���� ũ�� endPage�� pageCount�� �Ҵ�
							if(endPage > pageCount){
								endPage = pageCount;
							}
							
							if(startPage > pageBlock){ // ������ ��ϼ����� startPage�� Ŭ��� ���� ��ũ ����
					%>
								<a href="reservation.mypage?start=<%=startPage - 10%>">[����]</a>	
					<%			
						}	
							for(int i=startPage; i <= endPage; i++){ // ������ ��� ��ȣ
								if(i == start){ // ���� ���������� ��ũ�� �������� ����
					%>
									[<%=i %>]
					<%									
								}else{ // ���� �������� �ƴ� ��� ��ũ ����
					%>
									<a href="reservation.mypage?start=<%=i%>">[<%=i %>]</a>
					<%	
								}
							} // for end
							
							if(endPage < pageCount){ // ���� ����� ������ ���������� ������ ��ü ��ϼ��� Ŭ��� ���� ��ũ ����
					%>
								<a href="reservation.mypage?start=<%=startPage + 10 %>">[����]</a>
					<%			
							}
						}
					%>
					</td>
				</tr>
			</table>
		
		
		
		<h2 class="subtitle">��� ����</h2>
		
		
		
		<table class="table">
			<tr>
				<th class="th">�������</th> <th class="th">�����</th> <th class="th">��������</th> <th class="th">������</th> <th class="th">�¼�</th>
			</tr>
			
			<% if(cancelList.isEmpty()) { %>
				<tr>
					<td class="td" colspan="5">��� ������ �����ϴ�.</td>
				</tr>
			<% 
				} else { 
					
				for(ReservationVO vo : cancelList) { //��ҵ� �͸� ��ȸ
			%>
				<tr>
					<td class="td"><%=vo.getrDTime() %></td>
					<td class="td"><%=vo.getrDeparture() %></td>
					<td class="td"><%=vo.getrATime() %></td>
					<td class="td"><%=vo.getrArrive() %></td>
					<td class="td">
					<% 
						String[] seat = vo.getrSeat().split("_"); 
						for(int i=0; i<seat.length; i++) {
					%>
						<%=seat[i] %>
					<% } %>
					</td>
				</tr>
			<% } %>
				<tr>
					<td colspan="5" align="right">
					<input type="button" class="button" value="�����ϱ�" onclick="location.href='deleteDetail.mypage'">
					<input type="button" class="button" value="���ư���" onclick="location.href='index.jsp'">
					</td>
				</tr>
			<% } %>
			<tr>
				<td colspan="6">
					<%	// ����¡  ó��
						if(total3 > 0){
							// �� �������� ��
							int pageCount = total3 / 5 + (total3%5 == 0 ? 0 : 1);
							// �� �������� ������ ������ ��(��ũ) ��
							int pageBlock = 5;
							// �� �������� ������ ���� �� �� ��ȣ(�� : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
							int startPage3 = ((start3-1)/pageBlock)*pageBlock+1;
							int endPage3 = startPage3 + pageBlock - 1;
							
							// ������ �������� �� ������ �� ���� ũ�� endPage�� pageCount�� �Ҵ�
							if(endPage3 > pageCount){
								endPage3 = pageCount;
							}
							
							if(startPage3 > pageBlock){ // ������ ��ϼ����� startPage�� Ŭ��� ���� ��ũ ����
					%>
								<a href="reservation.mypage?start3=<%=startPage3 - 10%>">[����]</a>	
					<%			
						}	
							for(int i=startPage3; i <= endPage3; i++){ // ������ ��� ��ȣ
								if(i == start3){ // ���� ���������� ��ũ�� �������� ����
					%>
									[<%=i %>]
					<%									
								}else{ // ���� �������� �ƴ� ��� ��ũ ����
					%>
									<a href="reservation.mypage?start3=<%=i%>">[<%=i %>]</a>
					<%	
								}
							} // for end
							
							if(endPage3 < pageCount){ // ���� ����� ������ ���������� ������ ��ü ��ϼ��� Ŭ��� ���� ��ũ ����
					%>
								<a href="reservation.mypage?start3=<%=startPage3 + 10 %>">[����]</a>
					<%			
							}
						}
					%>
					</td>
			</tr>
		</table>
		<br><br><br>
		
	</div>
	</section>
	
	<footer>
	<jsp:include page="footer.jsp" />
	</footer>

</body>
</html>