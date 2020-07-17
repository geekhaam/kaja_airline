<%@page import="reservationVO.ReservationVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clientsVO.ClientsVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>예약 확인</title>
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

.clienttable {
	width: 40%;
	border-spacing: 0;
	text-align: center;
	line-height: 1;
	border-top: 1px solid #ccc;
	margin: auto;
}

.reservationtable {
	width: 50%;
	border-spacing: 0;
	text-align: center;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin: auto;
}

.th {
	width: fit-content;
	font-size: 12pt;
	padding: 5px;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	border-top: 1px solid #fff;
	border-left: 1px solid #fff;
	background: #eee;
}

.th2 {
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
	padding: 5px;
	border-bottom: 1px solid #ccc;
}

.td2 {
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
		ClientsVO vo = (ClientsVO) request.getAttribute("vo");
		ArrayList<ReservationVO> list = (ArrayList<ReservationVO>) request.getAttribute("list");
		int total = (int)request.getAttribute("total");
		int start = (int)request.getAttribute("start");
		int startRow = (int)request.getAttribute("startRow");
	%>
	<section id="sectionId">
	<div style="position: relative;">
	
		<h1 class="title">예약 확인</h1>

		<hr>
		
		<h2 class="subtitle">승객 정보</h2>
		
		<table class="clienttable">
			<tr>
				<th class="th">이름</th> <th class="th">전화번호</th> <th class="th">이메일</th> <th class="th">국적</th>
			</tr>
			<tr>
				<td class="td"><%=vo.getcName() %></td>
				<td class="td"><%=vo.getcTel() %></td>
				<td class="td"><%=vo.getcEmail() %></td>
				<td class="td"><%=vo.getcNation() %></td>
			</tr>
		</table>
		
		<br>
		
		<h2 class="subtitle">여정</h2>
		
		<form action="cancelReservation.mypage" method="post">
			
			<table class="reservationtable">
				<tr>
					<th class="th2">출발일자</th> <th class="th2">출발지</th>
					<th class="th2">도착일자</th> <th class="th2">도착지</th>
					<th class="th2">좌석</th> <th class="th2">취소</th>
				</tr>
			<% if(list.isEmpty()) { %> <!-- list 비어있으면 내역 없음 뜸 -->
				<tr>
					<td class="td" colspan="6">예매 내역이 없습니다.</td>
				</tr>
			<% 
				} else { 
					
				for(ReservationVO vo1 : list) { //취소되지 않은 것만 조회
			%>
				<tr>
					<td class="td2"><%=vo1.getrDTime() %></td>
					<td class="td2"><%=vo1.getrDeparture()%></td>
					<td class="td2"><%=vo1.getrATime() %></td>
					<td class="td2"><%=vo1.getrArrive() %></td>
					<td class="td2">
					<% 
						String[] seat = vo1.getrSeat().split("_"); 
						for(int i=0; i<seat.length; i++) {
					%>
						<%=seat[i] %>
					<% } %>
					</td>
					<td class="td2"><input type="checkbox"  name="cancelReservation" value="<%=vo1.getrDTime() %>#<%=vo1.getrDeparture() %>#<%=vo1.getrATime() %>#<%=vo1.getrArrive() %>#<%=vo1.getrSeat() %>#<%=vo1.getrPId()%>"></td>
				</tr>
			<% } }%>
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
								<a href="reservationDetail.mypage?start=<%=startPage - 10%>">[이전]</a>	
					<%			
						}	
							for(int i=startPage; i <= endPage; i++){ // 페이지 블록 번호
								if(i == start){ // 현재 페이지에는 링크를 설정하지 않음
					%>
									[<%=i %>]
					<%									
								}else{ // 현재 페이지가 아닌 경우 링크 설정
					%>
									<a href="reservationDetail.mypage?start=<%=i%>">[<%=i %>]</a>
					<%	
								}
							} // for end
							
							if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
					%>
								<a href="reservationDetail.mypage?start=<%=startPage + 10 %>">[다음]</a>
					<%			
							}
						}
					%>
					</td>
			</tr>
			</table>
			<br>
			
			<br><br>
			
			<div align="center">
				<input class="button" type="submit" value="예약 취소" >
				<input class="button" type="button" value="돌아가기" onclick="location.href='reservation.mypage'">
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