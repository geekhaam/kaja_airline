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
.locationTable{
		margin-left: auto;
		margin-right: auto;
		width: 80%;
		text-align: left;
		border: 0;
		padding: 0;
}	
.locationStation{
	font-size: 15pt;
	font-weight: bold;
	font-style: italic;
}	
</style>

</head>
<body>
	<header>
		<jsp:include page="header.jsp"></jsp:include>
	</header>
	<section id="sectionId">
		<table class="locationTable">
			<tr><td colspan="2" style="text-align: center;font-size: 30pt;">
				Kaja Airline<hr>
			</td></tr>
			<tr><td style="width: 50%;">
				<div id="map" style="width:500px;height:400px;"></div>
			</td><td>
				<div style="font-size: 30pt;">ã�� ���ô� ��</div>
				<span class="locationStation">���� 3���� (1/3/5ȣ��)</span><br> &nbsp; &nbsp; - 9�� �ⱸ �̿� 1�� �ҿ�<br>
				<span class="locationStation">������ 3���� (2/3ȣ��)</span><br> &nbsp; &nbsp; - 5�� �ⱸ �̿� 6�� �ҿ�<br>
				<span class="locationStation">������ (1ȣ��)</span><br> &nbsp; &nbsp; - 3�� �ⱸ �̿� 12�� �ҿ�<br>
				<span class="locationStation">������ 4���� (2/5ȣ��)</span><br> &nbsp; &nbsp; - 4�� �ⱸ �̿� 13�� �ҿ�<br>
			</td></tr>
		</table>
	</section>
	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
<script src="./js/jquery-3.1.1.js"charset="euc-kr"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8c02a075cc02c33ee8fde4dfb44e6476"></script>
<script type="text/javascript">
window.onload=function setSign() {

	var container = document.getElementById("map");
	var options = {
	    center: new kakao.maps.LatLng(37.570914, 126.992442),
	    level: 3  
	};
	var map = new kakao.maps.Map(container, options);
	var markerPosition  = new kakao.maps.LatLng(37.570914, 126.992442); 

	// ��Ŀ�� �����մϴ�
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});

	// ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
	marker.setMap(map);
	showSlides();
	
}

</script>
</body>
</html>