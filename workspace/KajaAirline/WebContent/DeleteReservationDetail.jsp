<%@page import="reservationVO.ReservationVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clientsVO.ClientsVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>취소 확인</title>
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
	
		<h1 class="title">취소 확인</h1>

		<hr><br>
		
		<form action="deleteReservation.mypage" method="post">
			<table class="table">
				<tr>
					<th class="th">출발일자</th> <th class="th">출발지</th>
					<th class="th">도착일자</th> <th class="th">도착지</th>
					<th class="th">좌석</th> <th class="th">삭제</th>
				</tr>
			<% if(cancelList.isEmpty()) { %> <!-- list 비어있으면 내역 없음 뜸 -->
				<tr>
					<td class="td" colspan="6">예매 내역이 없습니다.</td>
				</tr>
			<% 
				} else { 
					
				for(ReservationVO vo1 : cancelList) { //취소되지 않은 것만 조회
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
					<%	// 페이징  처리
						if(total > 0){
							// 총 페이지의 수
							int pageCount = total / 5 + (total%5 == 0 ? 0 : 1);
							// 한 페이지에 보여줄 페이지 블럭(링크) 수
							int pageBlock = 5;
							// 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
							int startPage = ((start-1)/pageBlock)*pageBlock+1;
							int endPage = startPage + pageBlock - 1;
							
							// 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
							if(endPage > pageCount){
								endPage = pageCount;
							}
							
							if(startPage > pageBlock){ // 페이지 블록수보다 startPage가 클경우 이전 링크 생성
					%>
								<a href="deleteDetail.mypage?start=<%=startPage - 10%>">[이전]</a>	
					<%			
						}	
							for(int i=startPage; i <= endPage; i++){ // 페이지 블록 번호
								if(i == start){ // 현재 페이지에는 링크를 설정하지 않음
					%>
									[<%=i %>]
					<%									
								}else{ // 현재 페이지가 아닌 경우 링크 설정
					%>
									<a href="deleteDetail.mypage?start=<%=i%>">[<%=i %>]</a>
					<%	
								}
							} // for end
							
							if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
					%>
								<a href="deleteDetail.mypage?start=<%=startPage + 10 %>">[다음]</a>
					<%			
							}
						}
					%>
					</td>
				</tr>
			</table>
			
			<br><br>
			
			<div align="center">
				<input class="button" type="submit" value="삭 제">
				<input class="button" type="submit" value="돌아가기" onclick="location.href='reservation.mypage'">
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