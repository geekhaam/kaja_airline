<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>결제 페이지</title>
<script src="./js/jquery-3.3.1.js"></script>
<style>
html, body {
   padding: 0px;
   border: 0px;
   margin: 0;
}

header {
   width : 100%;
   padding: 0px;
   top : 0;
   position: fixed;
   background-color : white;
   height: auto;
   z-index: 90;
}

section{
   margin: 2%;
    margin-top: 13%;
}

footer {
   position : relative;
   width: 100%;
   height: 20%;
   z-index: 100;
}

.title {
	text-align: center;
	margin: 35px;
	font-size: 26pt;
}

.table {
	width: 45%;
	border-spacing: 0;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	border-left: 1px solid #ccc;
	margin: auto;
}

.th {
	width: 25%;
	font-size: 17pt;
	padding: 10px;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	border-top: 1px solid #fff;
	border-left: 1px solid #fff;
	background: #eee;
}

.td {
	width: 70%;
	padding: 10px;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.option {
	height: 30px;
	font-size: 13pt;
}

.button {
	font-size: 14pt;
}
</style>
<script type="text/javascript">
	window.onload = function() {
		showSlides();
	}
</script>
</head>
<body>
	
	<header>
		<jsp:include page="./header.jsp" />
	</header>

	<section id="sectionId">
	<h1 class="title">일반 결제 정보</h1>
	
	<hr><br><br> 
	
	<form action="paymentComplete.rsv" method="post">
	<table class="table">
		<tr>
			<th class="th">결제 수단</th>
			<td class="td">
				<input type="radio" name="paymentMethod" value="creditCard" checked="checked">신용카드 <br>
				<input type="radio" name="paymentMethod" value="overseas">해외신용카드 <br>
				<input type="radio" name="paymentMethod" value="kakao">카카오페이
			</td>
		</tr>
		<tr>
			<th class="th">카드 선택</th>
			<td class="td">
				<select class="option" id="card" name="card" >
					<option value="samsung">삼성카드
					<option value="shinhan">신한카드
					<option value="hyundai">현대카드
					<option value="kb">KB국민카드
					<option value="nh">NH농협카드
				</select>
			</td>
		</tr>
		<tr>
			<th class="th">할부</th>
			<td class="td">
				<select class="option" name="monthly">
					<option value="one">일시불
					<option value="two">2개월
					<option value="three">3개월
				</select>
			</td>
		</tr>
		<c:choose>
			<c:when test="${rPId2 eq ''}">
				<tr>
					<td align="right" class="td" colspan="2">결제 예정금액 <b>${price}</b> KRW</td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td align="right" class="td" colspan="2">결제 예정금액 <b>${price + price2}</b> KRW</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	<br>
	
	<input type="hidden" name="rId" value="${sessionScope.id}" readonly> <br>
	<input type="hidden" name="rPId" value="${rPId}" readonly> <br>
	<input type="hidden" name="rDTime" value="${rDTime}" readonly> <br>
	<input type="hidden" name="rDeparture" value="${rDeparture}" readonly> <br>
	<input type="hidden" name="rATime" value="${rATime}" readonly> <br>
	<input type="hidden" name="rArrive" value="${rArrive}" readonly> <br>
	<input type="hidden" name="rSeat" value="${rSeat}" readonly><br>
	
	<c:if test="${rPId2 ne null}">
		<input type="hidden" name="rPId2" value="${rPId2}" readonly> <br>
		<input type="hidden" name="rDTime2" value="${rDTime2}" readonly> <br>
		<input type="hidden" name="rDeparture2" value="${rDeparture2}" readonly> <br>
		<input type="hidden" name="rATime2" value="${rATime2}" readonly> <br>
		<input type="hidden" name="rArrive2" value="${rArrive2}" readonly> <br>
		<input type="hidden" name="rSeat2" value="${rSeat2}" readonly><br>
	</c:if>
	
	<div align="center">
		<input class="button" type="submit" value="결제하기">
	</div>
	</form>
	</section>
	
	<footer>
	<jsp:include page="./footer.jsp" />
	</footer>

</body>
</html>