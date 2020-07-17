<%@page import="reservationVO.ReservationVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clientsVO.ClientsVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��� Ȯ��</title>
<style>
body{
	background-image: url("./imgs/bg.jpg");
}

.title {
	text-align: center;
	margin: 35px;
}

.subtitle {
	text-align: center;
	margin: 30px;
}

.table {
	width: 50%;
	border-spacing: 0;
	text-align: center;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin: auto;
}

.th {
	width: fit-content;
	font-size: 15pt;
	padding: 10px;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	border-top: 1px solid #fff;
	border-left: 1px solid #fff;
	background: #eee;
}

.td {
	width: fit-content;
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

	<header>
	<jsp:include page="header.jsp" />
	</header>

	<%
		ArrayList<ReservationVO> cancelList = (ArrayList<ReservationVO>)request.getAttribute("cancelList");
		String rId = (String)request.getAttribute("rId");
		int total = (int)request.getAttribute("total");
		int start = (int)request.getAttribute("start");
		int startRow = (int)request.getAttribute("startRow");
	%>
	
	<section id="sectionId">
	<div>
	
		<h1 class="title">��� Ȯ��</h1>

		<hr><br>
		
		<form action="deleteReservation.mypage" method="post">
			<table class="table">
				<tr>
					<th class="th">�������</th> <th class="th">�����</th>
					<th class="th">��������</th> <th class="th">������</th>
					<th class="th">�¼�</th> <th class="th">����</th>
				</tr>
			<% if(cancelList.isEmpty()) { %> <!-- list ��������� ���� ���� �� -->
				<tr>
					<td class="td" colspan="6">���� ������ �����ϴ�.</td>
				</tr>
			<% 
				} else { 
					
				for(ReservationVO vo1 : cancelList) { //��ҵ��� ���� �͸� ��ȸ
			%>
				<tr>
					<td class="td"><%=vo1.getrDTime() %></td>
					<td class="td"><%=vo1.getrDeparture()%></td>
					<td class="td"><%=vo1.getrATime() %></td>
					<td class="td"><%=vo1.getrArrive() %></td>
					<td class="td">
					<% 
						String[] seat = vo1.getrSeat().split("_"); 
						for(int i=0; i<seat.length; i++) {
					%>
						<%=seat[i] %>
					<% } %>
					</td>
					<td class="td"><input type="checkbox" name="deleteReservation" value="<%=vo1.getrDTime() %>#<%=vo1.getrDeparture() %>#<%=vo1.getrATime() %>#<%=vo1.getrArrive() %>#<%=vo1.getrSeat() %>"></td>
				</tr>
				<% } } %>
				<tr>
					<td colspan="6">
					<%	// ����¡  ó��
						if(total > 0){
							// �� �������� ��
							int pageCount = total / 5 + (total%5 == 0 ? 0 : 1);
							// �� �������� ������ ������ ����(��ũ) ��
							int pageBlock = 5;
							// �� �������� ������ ���� �� �� ��ȣ(�� : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
							int startPage = ((start-1)/pageBlock)*pageBlock+1;
							int endPage = startPage + pageBlock - 1;
							
							// ������ �������� �� ������ �� ���� ũ�� endPage�� pageCount�� �Ҵ�
							if(endPage > pageCount){
								endPage = pageCount;
							}
							
							if(startPage > pageBlock){ // ������ ���ϼ����� startPage�� Ŭ��� ���� ��ũ ����
					%>
								<a href="deleteDetail.mypage?start=<%=startPage - 10%>">[����]</a>	
					<%			
						}	
							for(int i=startPage; i <= endPage; i++){ // ������ ���� ��ȣ
								if(i == start){ // ���� ���������� ��ũ�� �������� ����
					%>
									[<%=i %>]
					<%									
								}else{ // ���� �������� �ƴ� ��� ��ũ ����
					%>
									<a href="deleteDetail.mypage?start=<%=i%>">[<%=i %>]</a>
					<%	
								}
							} // for end
							
							if(endPage < pageCount){ // ���� ������ ������ ���������� ������ ��ü ���ϼ��� Ŭ��� ���� ��ũ ����
					%>
								<a href="deleteDetail.mypage?start=<%=startPage + 10 %>">[����]</a>
					<%			
							}
						}
					%>
					</td>
				</tr>
			</table>
			
			<br><br>
			
			<div align="center">
				<input class="button" type="submit" value="�� ��">
				<input class="button" type="submit" value="���ư���" onclick="location.href='reservation.mypage'">
				<br><br>
				
			</div>
		</form>
	</div>
	</section>
	
	<footer>
	<jsp:include page="footer.jsp" />
	</footer>

</body>
</html>