<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
body{
	background-image: url("./imgs/bg.jpg");
}
	.introduceTable{
		margin-left: auto;
		margin-right: auto;
		width: 80%;
		text-align: left;
		border: 0;
		padding: 0;
	}	
</style>
<script src="./js/jquery-3.1.1.js"charset="euc-kr"></script>
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
	
		<table class="introduceTable">
			<tr><td colspan="2" style="text-align: center;font-size: 25pt;">
				Kaja Airline
			</td></tr>
			<tr>
			<td style="width: 50%;">
				<p style="font-size: 20pt;">회사 소개</p>
				<p style="font-size: 13pt;line-height: 130%;">&nbsp;2020년 '최고의 안전과 서비스, 저렴한 가격을 통한<br> 
				고객 만족'이라는 경영이념으로 창립된 Kaja Airline은 <br>
				미래 전 세계에 색동날개를 펼치는 글로벌 항공사로 성장하여<br>
				색동 날개 만큼이나 친절하고 참신하며 정성 어린 서비스로<br>
				고객에게 다가가고자 합니다.<br>
				저희 Kaja Airline은 최신 설비로 안전을 최우선으로<br>
				추구하며 미래를 향한 비상을 계속하고 있습니다.<br>
				언젠가는 업계 최고 1등의 기업가치를 창출하는 아름다운 <br>
				기업으로서의 역할을 다하고자 끊임없는 노력을 기울이고 있습니다.<br>
 				또한 윤리/환경/상생 경영 및 사회공헌에 이르기까지 <br>
 				기업의 사회적 책임을 다하여 지속 가능한 성장을 추구하는 <br>
 				세계 최고의 항공사가 되고자 합니다.<br>
				저희 Kaja Airline과 함께 즐겁고 편안한 여행 되시길 바랍니다.</p>
			</td>
			<td class="slideshow-container" style="width: 50%;">
				<div class="imgSlides fade" style="display: block;"><br>
					<img src="./imgs/testAirPort1.jpg" style="width: 100%;">
				</div>
				<div class="imgSlides fade"><br>
					<img src=./imgs/testAirPort2.jpg style="width: 100%;">
				</div>
			</td>
			</tr>
		</table>
	</section>
	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
</body>
</html>