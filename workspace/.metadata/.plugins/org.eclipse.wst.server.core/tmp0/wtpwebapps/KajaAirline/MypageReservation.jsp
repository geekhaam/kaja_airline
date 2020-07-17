<%@page import="java.util.ArrayList"%>
<%@page import="reservationVO.ReservationVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>예약 조회/취소</title>
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
	
		<h1 class="title">나의 예약 조회/취소</h1>
		
		<hr>
		
		<h2 class="subtitle">예약 내역</h2>
		
		<table class="table">
			<tr>
				<th class="th">출발일자</th> <th class="th">출발지</th> <th class="th">도착일자</th> <th class="th">도착지</th> <th class="th">좌석</th>
			</tr>
			
			<% if(list.isEmpty()) { %> <!-- list 비어있으면 내역 없음 뜸 -->
				<tr>
					<td class="td" colspan="5">예매 내역이 없습니다.</td>
				</tr>
			<% 
				} else { 
					
				for(ReservationVO vo : list) { //취소되지 않은 것만 조회
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
					<input type="button" class="button" value="취소하기" onclick="location.href='reservationDetail.mypage'">
					<input type="button" class="button" value="돌아가기" onclick="location.href='index.jsp'">
					</span>
					</td>
				</tr>
			<% } %>
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
								<a href="reservation.mypage?start=<%=startPage - 10%>">[이전]</a>	
					<%			
						}	
							for(int i=startPage; i <= endPage; i++){ // 페이지 블록 번호
								if(i == start){ // 현재 페이지에는 링크를 설정하지 않음
					%>
									[<%=i %>]
					<%									
								}else{ // 현재 페이지가 아닌 경우 링크 설정
					%>
									<a href="reservation.mypage?start=<%=i%>">[<%=i %>]</a>
					<%	
								}
							} // for end
							
							if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
					%>
								<a href="reservation.mypage?start=<%=startPage + 10 %>">[다음]</a>
					<%			
							}
						}
					%>
					</td>
				</tr>
			</table>
		
		
		
		<h2 class="subtitle">취소 내역</h2>
		
		
		
		<table class="table">
			<tr>
				<th class="th">출발일자</th> <th class="th">출발지</th> <th class="th">도착일자</th> <th class="th">도착지</th> <th class="th">좌석</th>
			</tr>
			
			<% if(cancelList.isEmpty()) { %>
				<tr>
					<td class="td" colspan="5">취소 내역이 없습니다.</td>
				</tr>
			<% 
				} else { 
					
				for(ReservationVO vo : cancelList) { //취소된 것만 조회
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
					<input type="button" class="button" value="삭제하기" onclick="location.href='deleteDetail.mypage'">
					<input type="button" class="button" value="돌아가기" onclick="location.href='index.jsp'">
					</td>
				</tr>
			<% } %>
			<tr>
				<td colspan="6">
					<%	// 페이징  처리
						if(total3 > 0){
							// 총 페이지의 수
							int pageCount = total3 / 5 + (total3%5 == 0 ? 0 : 1);
							// 한 페이지에 보여줄 페이지 블럭(링크) 수
							int pageBlock = 5;
							// 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
							int startPage3 = ((start3-1)/pageBlock)*pageBlock+1;
							int endPage3 = startPage3 + pageBlock - 1;
							
							// 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
							if(endPage3 > pageCount){
								endPage3 = pageCount;
							}
							
							if(startPage3 > pageBlock){ // 페이지 블록수보다 startPage가 클경우 이전 링크 생성
					%>
								<a href="reservation.mypage?start3=<%=startPage3 - 10%>">[이전]</a>	
					<%			
						}	
							for(int i=startPage3; i <= endPage3; i++){ // 페이지 블록 번호
								if(i == start3){ // 현재 페이지에는 링크를 설정하지 않음
					%>
									[<%=i %>]
					<%									
								}else{ // 현재 페이지가 아닌 경우 링크 설정
					%>
									<a href="reservation.mypage?start3=<%=i%>">[<%=i %>]</a>
					<%	
								}
							} // for end
							
							if(endPage3 < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
					%>
								<a href="reservation.mypage?start3=<%=startPage3 + 10 %>">[다음]</a>
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