<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	.table_imsi{
		width: 100%;
		margin-left: auto;
		margin-right: auto;
		background-color: #475774;
		color: #e6dbdb;
	}
</style>
</head>
<body>
	<%request.setCharacterEncoding("EUC-KR"); 
	response.setCharacterEncoding("EUC-KR");%>
	<hr>

	<table class="table_imsi">
	<tr><td colspan="3" align="center"><strong style="font-style: italic;font-size: 20pt;">Kaja Airline</strong></td></tr>
	<tr><td align="left" width="70%" style="padding-left: 20px;">
	<ul>
		<li><strong>가자항공㈜</strong> 대표이사 사장 서영준</li>
		<li>사업자등록번호 104-81-17480</li>
		<li>통신판매업 신고 제 11-1111</li>
		<li>서울특별시 종로구 묘동 56</li>
		<li>예약 1588-9999 / 02-1212-2121</li>
		<li>개인정보보호책임자 여객전략 상무 강정구</li>
		<li>서버 위치 : 단성사빌딩 가자항공㈜ 전산센터</li>
	</ul>
	</td>
	<td width="15%" align="right" style="font-size: 6pt;"><img src="./imgs/award1.jpg"><br>고객선정 고객응대 금상 수상</td>
	<td width="15%" align="center" style="font-size: 6pt;"><img src="./imgs/award2.jpg"><br>관광산업부 선정 관광 은상 수상</td>
	</tr>
	</table>
</body>
</html>