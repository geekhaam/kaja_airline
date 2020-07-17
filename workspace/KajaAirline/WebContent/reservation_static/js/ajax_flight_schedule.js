/**
 * DB에 Schedule 테이블의 데이터를 ajax를 통해 json 형태로 받아와 파싱하여 기존 스케쥴 테이블을 수정한다. 
 */


/*
 * ajax timer 지연 시간 설정 => 잦은 ajax 호출로 인한 서버 과부하 분산
 
	// ajax 통신중인지를 확인하는 전역변수 설정
	var timerOn = false;
	var expnowminsec = 0;


	// ajax 요청 이전에 확인하는 timer() 함수를 생성
	timer = function(delay) {
		var delayVal = delay || 1000;
		if (timerOn) {
        // timer에 현재시간을 설정
			nowTime = new Date;
			nowmin = nowTime.getMinutes()*60*1000;
			nowsec = nowTime.getSeconds() * 1000;
			nowmillisec = nowTime.getMilliseconds();
			nowminsec = nowmin + nowsec + nowmillisec;
		}
		else {
			nowTime = new Date;
			nowmin = nowTime.getMinutes()*60*1000;
			nowsec = nowTime.getSeconds() * 1000;
			nowmillisec = nowTime.getMilliseconds();
			expnowminsec = nowmin + nowsec + nowmillisec + delay;
			timerOn = true;
			return true;
		}

		if (((timerOn)) && (expnowminsec != 0) && (expnowminsec != '')) {
			if (expnowminsec <= nowminsec) {
				timerOn = false;
				expnowminsec = 0;
				return false;
			}
			else {
				timerOn = true;
				return true;
			}
		}
		timerOn = true;
		return true;
   }*/

	
/*
 * 숫자 단위 변경 메소드
 */
	function pad(n, width) {
	  n = n + '';
	  return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
	}

	
/*
 * $(document).ready(function(){ 소스  })
 * 상단의 ready는 해당 문서를 다읽고 실행되는 function, 따라서 문서의 내용이 변화하면 감지를 하지 못한다.
 * 하지만 on()은 바뀐 시점에서 전체 내용을 읽기 때문에 내용 변경 후에도 이벤트가 가능하다.
 * $(document).on("click","some_element", function(event){});
 */	
	
	$(document).on("click", "#btn_search_schedule", function(event) {
		
		var tripType = $("#tripType").val();
		var depAirport = $("#depAirport").val();
		var arrAirport = $("#arrAirport").val();
		var bDate = $("#boardingDate").val();
		var goDate = $("#goDate").val();
		var comeDate = $("#comeDate").val();
		var adultCnt = $("#adultCnt").val();
		var childCnt = $("#childCnt").val();
		var babyCnt = $("#babyCnt").val();
		var passengerCnt = Number(adultCnt) + Number(childCnt) + Number(babyCnt);
		var param = {"tripType":tripType, "depAirport":depAirport, "arrAirport":arrAirport, "bDate":bDate,
						"goDate":goDate, "comeDate":comeDate, "passengerCnt":passengerCnt };
		
		$.ajax({
			url : 'result_flight_schedule.jsp',
			type : 'post',
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data : param,
			dataType : 'json',
			success : function(data) {
				$('#tab_schedule').html("");
				//$("<table class='tab_schedule'/>").appendTo("#schedule");
				var html = "";
				if(tripType == '편도') {
					$.each(data, function(key, value) {
						console.log(value);
						console.log(value.oneSchedule.length);
						html += "<tr><th colspan='9' style='height: 65px; font-size: x-large; font-weight: 700; background-color: slategray; color: white;'>편도 항공편</th></tr>"
							+ "<tr>"
							+ "<th colspan='3' rowspan='2' style='font-weight: 400; background-color: dimgray; color: white;'>출도착시간 (비행시간)</th>"
							+ "<th rowspan='2' style='font-weight: 400; background-color: dimgray; color: white;'>편명</th>"
							+ "<th colspan='3' style='font-weight: 400; color: white; background-color: dimgray;'>가격</th>"
							+ "<th rowspan='2' style='font-weight: 400; color: white; background-color: dimgray;'>잔여 좌석</th>"
							+ "<th rowspan='2' style='font-weight: 400; color: white; background-color: dimgray;'>좌석 선택</th>"
							+ "</tr>"
							+ "<tr>"
							+ "<th style='font-weight: 400; color: white; background-color: dimgray;'>성인</th>"
							+ "<th style='font-weight: 400; color: white; background-color: dimgray;'>소아</th>"
							+ "<th style='font-weight: 400; color: white; background-color: dimgray;'>유아</th>"
							+ "</tr>";
						if(value.oneSchedule.length == 0) {
							html += "<tr><td colspan='9' style='height: 65px; font-size: x-large; font-weight: 700;'>선택하신 조건에 맞는 예약 가능 항공편이 없습니다.</td></tr>";
						} else {
							$.each(value.oneSchedule, function(index, schedule) {
								html += "<tr class='tr_schedule'>"
									+ "<td id='"+schedule.pName+"_dep_time' style='border-right: none; vertical-align: middle; font-size: x-large;'><br>"+schedule.pDTime+"<br>&nbsp;</td>" //출발 시간
									+ "<td style='padding: 0px; border-right: none; border-left: none; vertical-align: middle; text-align: center; color: #848484;'>"
									+ parseInt(schedule.pFTime/60)+"시간 "+ pad(schedule.pFTime%60, 2)+"분 소요"
									+ "<div id='trip_line'><img src='../reservation_static/imgs/trip_line.png'></div>"
									+ "</td>" //비행 시간
									+ "<td id='"+schedule.pName+"_arr_time' style='border-left: none; vertical-align: middle; font-size: x-large;'><br>"+schedule.pATime+"<br>&nbsp;</td>" //도착 시간
									+ "<td>"+schedule.pName+"</td>" //편명
									+ "<td id='"+schedule.pName+"_adult_price'>"+schedule.pAdultPrice+"</td>" //성인
									+ "<td id='"+schedule.pName+"_child_price'>"+schedule.pChildPrice+"</td>" //소아
									+ "<td id='"+schedule.pName+"_baby_price'>"+schedule.pBabyPrice+"</td>" //유아
									+ "<td id='remainSeat_"+schedule.pName+"'>"+schedule.remainSeat+"</td>"//잔여 좌석
									+ "<td style='position: relative;'>"
									+ "<input type='button' id='btn_"+schedule.pName+"' onmouseover='checkSeat(\"btn_"+schedule.pName+"\")' onclick='openSelectSeat(\"div_"+schedule.pName+"\")' value='좌석 선택'>"
									+ "<div class='select_seat' id='div_"+schedule.pName+"'>"
									+ "<h3 class='flight_title'>&nbsp;&nbsp;&nbsp;"+schedule.pName+"<span class='flight_info' style='font-weight: 300;'> : "+schedule.pDTime+" → "+schedule.pATime+"</span></h3>"
									+ "<table class='tab_seat' id='tab_seat_"+schedule.pName+"'>"
									+ "<thead>"
									+ "<tr>"
									+ "<th></th>"
									+ "<th style='border-bottom: 1px solid gray;'>1</th>"
									+ "<th style='border-bottom: 1px solid gray;'>2</th>"
									+ "<th></th>"
									+ "<th></th>"
									+ "<th style='border-bottom: 1px solid gray;'>3</th>"
									+ "<th style='border-bottom: 1px solid gray;'>4</th>"
									+ "</tr>"
									+ "</thead>"
									+ "<tbody>"
									+ "<tr>"
									+ "<td>A</td>"
									+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_A1' onclick='selectSeat(\""+schedule.pName+"_A1\")'></td>"
									+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_A2' onclick='selectSeat(\""+schedule.pName+"_A2\")'></td>"
									+ "<td></td>"
									+ "<td></td>"
									+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_A3' onclick='selectSeat(\""+schedule.pName+"_A3\")'></td>"
									+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_A4' onclick='selectSeat(\""+schedule.pName+"_A4\")'></td>"
									+ "</tr>"
									+ "<tr>"
									+ "<td>B</td>"
									+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_B1' onclick='selectSeat(\""+schedule.pName+"_B1\")'></td>"
									+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_B2' onclick='selectSeat(\""+schedule.pName+"_B2\")'></td>"
									+ "<td></td>"
									+ "<td></td>"
									+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_B3' onclick='selectSeat(\""+schedule.pName+"_B3\")'></td>"
									+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_B4' onclick='selectSeat(\""+schedule.pName+"_B4\")'></td>"
									+ "</tr>"
									+ "<tr>"
									+ "<td>C</td>"
									+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_C1' onclick='selectSeat(\""+schedule.pName+"_C1\")'></td>"
									+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_C2' onclick='selectSeat(\""+schedule.pName+"_C2\")'></td>"
									+ "<td></td>"
									+ "<td></td>"
									+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_C3' onclick='selectSeat(\""+schedule.pName+"_C3\")'></td>"
									+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_C4' onclick='selectSeat(\""+schedule.pName+"_C4\")'></td>"
									+ "</tr>"
									+ "<tr>"
									+ "<td>D</td>"
									+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_D1' onclick='selectSeat(\""+schedule.pName+"_D1\")'></td>"
									+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_D2' onclick='selectSeat(\""+schedule.pName+"_D2\")'></td>"
									+ "<td></td>"
									+ "<td></td>"
									+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_D3' onclick='selectSeat(\""+schedule.pName+"_D3\")'></td>"
									+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_D4' onclick='selectSeat(\""+schedule.pName+"_D4\")'></td>"
									+ "</tr>"
									+ "<tr>"
									+ "<td>E</td>"
									+ "<td style='border-bottom: 1px solid gray;'><input type=button class='btn_seat' id='"+schedule.pName+"_E1' onclick='selectSeat(\""+schedule.pName+"_E1\")'></td>"
									+ "<td style='border-bottom: 1px solid gray;'><input type=button class='btn_seat' id='"+schedule.pName+"_E2' onclick='selectSeat(\""+schedule.pName+"_E2\")'></td>"
									+ "<td></td>"
									+ "<td></td>"
									+ "<td style='border-bottom: 1px solid gray;'><input type=button class='btn_seat' id='"+schedule.pName+"_E3' onclick='selectSeat(\""+schedule.pName+"_E3\")'></td>"
									+ "<td style='border-bottom: 1px solid gray;'><input type=button class='btn_seat' id='"+schedule.pName+"_E4' onclick='selectSeat(\""+schedule.pName+"_E4\")'></td>"
									+ "</tr>"
									+ "</tbody>"
									+ "</table>"
									+ "<div class='seat_info'>"
									+ "<table class='tab_seat_info'>"
									+ "<tr>"
									+ "<td>"
									+ "<label for='seat_passCnt'>탑승 인원</label>"
									+ "<input type='text' class='seat_passCnt' id='seat_passCnt_"+schedule.pName+"' value='' readonly>"
									+ "</td>"
									+ "</tr>"
									+ "<tr>"
									+ "<td>"
									+ "<label for='selected_seat'>선택 좌석</label>"
									+ "<input type='text' class='selected_seat' id='selected_seat_"+schedule.pName+"' value='' readonly>"
									+ "</td>"
									+ "</tr>"
									+ "<tr style='height: 100px; text-align: right; vertical-align: bottom;'>"
									+ "<td>"
									+ "<input type='button' class='complete_select' id='complete_select' onclick='completeSelectSeat(\"div_"+schedule.pName+"\")' value='선택 완료'>"
									+ "<input type='button' class='close_select' value='닫기' onclick='closeSelectSeat(\"div_"+schedule.pName+"\")'>"
									+ "</td>"
									+ "</tr>"
									+ "</table>"
									+ "</div>"	
									+ "</div>"
									+ "</td>" //좌석 선택 버튼
									+ "</tr>";
							})
						}
					})
				} else {
					$.each(data, function(key, value) {
						if(key == 0) {
							console.log(value);
							console.log(value.goSchedule.length);
							html += "<tr><th colspan='9' style='height: 65px; font-size: x-large; font-weight: 700; background-color: slategray; color: white;'>가는날 항공편</th></tr>"
								+ "<tr>"
								+ "<th colspan='3' rowspan='2' style='font-weight: 400; background-color: dimgray; color: white;'>출도착시간 (비행시간)</th>"
								+ "<th rowspan='2' style='font-weight: 400; background-color: dimgray; color: white;'>편명</th>"
								+ "<th colspan='3' style='font-weight: 400; color: white; background-color: dimgray;'>가격</th>"
								+ "<th rowspan='2' style='font-weight: 400; color: white; background-color: dimgray;'>잔여 좌석</th>"
								+ "<th rowspan='2' style='font-weight: 400; color: white; background-color: dimgray;'>좌석 선택</th>"
								+ "</tr>"
								+ "<tr>"
								+ "<th style='font-weight: 400; color: white; background-color: dimgray;'>성인</th>"
								+ "<th style='font-weight: 400; color: white; background-color: dimgray;'>소아</th>"
								+ "<th style='font-weight: 400; color: white; background-color: dimgray;'>유아</th>"
								+ "</tr>";
							if(value.goSchedule.length == 0) { //가는날
								html += "<tr><td colspan='9' style='height: 65px; font-size: x-large; font-weight: 700;'>선택하신 조건에 맞는 예약 가능 항공편이 없습니다.</td></tr>";
							} else {
								$.each(value.goSchedule, function(index, schedule) {
									html += "<tr class='tr_schedule'>"
										+ "<td id='"+schedule.pName+"_dep_time' style='border-right: none; vertical-align: middle; font-size: x-large;'><br>"+schedule.pDTime+"<br>&nbsp;</td>" //출발 시간
										+ "<td style='padding: 0px; border-right: none; border-left: none; vertical-align: middle; text-align: center; color: #848484;'>"
										+ parseInt(schedule.pFTime/60)+"시간 "+ pad(schedule.pFTime%60, 2)+"분 소요"
										+ "<div id='trip_line'><img src='../reservation_static/imgs/trip_line.png'></div>"
										+ "</td>" //비행 시간
										+ "<td id='"+schedule.pName+"_arr_time' style='border-left: none; vertical-align: middle; font-size: x-large;'><br>"+schedule.pATime+"<br>&nbsp;</td>" //도착 시간
										+ "<td>"+schedule.pName+"</td>" //편명
										+ "<td id='"+schedule.pName+"_adult_price'>"+schedule.pAdultPrice+"</td>" //성인
										+ "<td id='"+schedule.pName+"_child_price'>"+schedule.pChildPrice+"</td>" //소아
										+ "<td id='"+schedule.pName+"_baby_price'>"+schedule.pBabyPrice+"</td>" //유아
										+ "<td id='remainSeat_"+schedule.pName+"'>"+schedule.remainSeat+"</td>"//잔여 좌석
										+ "<td style='position: relative;'>"
										+ "<input type='button' id='btn_"+schedule.pName+"' onmouseover='checkSeat(\"btn_"+schedule.pName+"\")' onclick='openSelectSeat(\"go_div_"+schedule.pName+"\")' value='좌석 선택'>"
										+ "<div class='select_seat' id='go_div_"+schedule.pName+"'>"
										+ "<h3 class='flight_title'>&nbsp;&nbsp;&nbsp;"+schedule.pName+"<span class='flight_info' style='font-weight: 300;'> : "+schedule.pDTime+" → "+schedule.pATime+"</span></h3>"
										+ "<table class='tab_seat' id='tab_seat_"+schedule.pName+"'>"
										+ "<thead>"
										+ "<tr>"
										+ "<th></th>"
										+ "<th style='border-bottom: 1px solid gray;'>1</th>"
										+ "<th style='border-bottom: 1px solid gray;'>2</th>"
										+ "<th></th>"
										+ "<th></th>"
										+ "<th style='border-bottom: 1px solid gray;'>3</th>"
										+ "<th style='border-bottom: 1px solid gray;'>4</th>"
										+ "</tr>"
										+ "</thead>"
										+ "<tbody>"
										+ "<tr>"
										+ "<td>A</td>"
										+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_A1' onclick='goSelectSeat(\""+schedule.pName+"_A1\")'></td>"
										+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_A2' onclick='goSelectSeat(\""+schedule.pName+"_A2\")'></td>"
										+ "<td></td>"
										+ "<td></td>"
										+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_A3' onclick='goSelectSeat(\""+schedule.pName+"_A3\")'></td>"
										+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_A4' onclick='goSelectSeat(\""+schedule.pName+"_A4\")'></td>"
										+ "</tr>"
										+ "<tr>"
										+ "<td>B</td>"
										+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_B1' onclick='goSelectSeat(\""+schedule.pName+"_B1\")'></td>"
										+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_B2' onclick='goSelectSeat(\""+schedule.pName+"_B2\")'></td>"
										+ "<td></td>"
										+ "<td></td>"
										+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_B3' onclick='goSelectSeat(\""+schedule.pName+"_B3\")'></td>"
										+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_B4' onclick='goSelectSeat(\""+schedule.pName+"_B4\")'></td>"
										+ "</tr>"
										+ "<tr>"
										+ "<td>C</td>"
										+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_C1' onclick='goSelectSeat(\""+schedule.pName+"_C1\")'></td>"
										+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_C2' onclick='goSelectSeat(\""+schedule.pName+"_C2\")'></td>"
										+ "<td></td>"
										+ "<td></td>"
										+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_C3' onclick='goSelectSeat(\""+schedule.pName+"_C3\")'></td>"
										+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_C4' onclick='goSelectSeat(\""+schedule.pName+"_C4\")'></td>"
										+ "</tr>"
										+ "<tr>"
										+ "<td>D</td>"
										+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_D1' onclick='goSelectSeat(\""+schedule.pName+"_D1\")'></td>"
										+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_D2' onclick='goSelectSeat(\""+schedule.pName+"_D2\")'></td>"
										+ "<td></td>"
										+ "<td></td>"
										+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_D3' onclick='goSelectSeat(\""+schedule.pName+"_D3\")'></td>"
										+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_D4' onclick='goSelectSeat(\""+schedule.pName+"_D4\")'></td>"
										+ "</tr>"
										+ "<tr>"
										+ "<td>E</td>"
										+ "<td style='border-bottom: 1px solid gray;'><input type=button class='btn_seat' id='"+schedule.pName+"_E1' onclick='goSelectSeat(\""+schedule.pName+"_E1\")'></td>"
										+ "<td style='border-bottom: 1px solid gray;'><input type=button class='btn_seat' id='"+schedule.pName+"_E2' onclick='goSelectSeat(\""+schedule.pName+"_E2\")'></td>"
										+ "<td></td>"
										+ "<td></td>"
										+ "<td style='border-bottom: 1px solid gray;'><input type=button class='btn_seat' id='"+schedule.pName+"_E3' onclick='goSelectSeat(\""+schedule.pName+"_E3\")'></td>"
										+ "<td style='border-bottom: 1px solid gray;'><input type=button class='btn_seat' id='"+schedule.pName+"_E4' onclick='goSelectSeat(\""+schedule.pName+"_E4\")'></td>"
										+ "</tr>"
										+ "</tbody>"
										+ "</table>"
										+ "<div class='seat_info'>"
										+ "<table class='tab_seat_info'>"
										+ "<tr>"
										+ "<td>"
										+ "<label for='seat_passCnt'>탑승 인원</label>"
										+ "<input type='text' class='seat_passCnt' id='seat_passCnt_"+schedule.pName+"' value='' readonly>"
										+ "</td>"
										+ "</tr>"
										+ "<tr>"
										+ "<td>"
										+ "<label for='selected_seat'>선택 좌석</label>"
										+ "<input type='text' class='selected_seat' id='selected_seat_"+schedule.pName+"' value='' readonly>"
										+ "</td>"
										+ "</tr>"
										+ "<tr style='height: 100px; text-align: right; vertical-align: bottom;'>"
										+ "<td>"
										+ "<input type='button' class='complete_select' id='complete_select' onclick='completeSelectSeat(\"go_div_"+schedule.pName+"\")' value='선택 완료'>"
										+ "<input type='button' class='close_select' value='닫기' onclick='closeGoSelectSeat(\"go_div_"+schedule.pName+"\")'>"
										+ "</td>"
										+ "</tr>"
										+ "</table>"
										+ "</div>"	
										+ "</div>"
										+ "</td>" //좌석 선택 버튼
										+ "</tr>";
								})
							}
						} else {
							console.log(value);
							console.log(value.comeSchedule.length);
							html += "<tr><th colspan='9' style='height: 65px; font-size: x-large; font-weight: 700; background-color: slategray; color: white;'>오는날 항공편</th></tr>"
								+ "<tr>"
								+ "<th colspan='3' rowspan='2' style='font-weight: 400; background-color: dimgray; color: white;'>출도착시간 (비행시간)</th>"
								+ "<th rowspan='2' style='font-weight: 400; background-color: dimgray; color: white;'>편명</th>"
								+ "<th colspan='3' style='font-weight: 400; color: white; background-color: dimgray;'>가격</th>"
								+ "<th rowspan='2' style='font-weight: 400; color: white; background-color: dimgray;'>잔여 좌석</th>"
								+ "<th rowspan='2' style='font-weight: 400; color: white; background-color: dimgray;'>좌석 선택</th>"
								+ "</tr>"
								+ "<tr>"
								+ "<th style='font-weight: 400; color: white; background-color: dimgray;'>성인</th>"
								+ "<th style='font-weight: 400; color: white; background-color: dimgray;'>소아</th>"
								+ "<th style='font-weight: 400; color: white; background-color: dimgray;'>유아</th>"
								+ "</tr>";
							if(value.comeSchedule.length == 0) { //오는날
								html += "<tr><td colspan='9' style='height: 65px; font-size: x-large; font-weight: 700;'>선택하신 조건에 맞는 예약 가능 항공편이 없습니다.</td></tr>";
							} else {
								$.each(value.comeSchedule, function(index, schedule) {
									html += "<tr class='tr_schedule'>"
										+ "<td id='"+schedule.pName+"_dep_time' style='border-right: none; vertical-align: middle; font-size: x-large;'><br>"+schedule.pDTime+"<br>&nbsp;</td>" //출발 시간
										+ "<td style='padding: 0px; border-right: none; border-left: none; vertical-align: middle; text-align: center; color: #848484;'>"
										+ parseInt(schedule.pFTime/60)+"시간 "+ pad(schedule.pFTime%60, 2)+"분 소요"
										+ "<div id='trip_line'><img src='../reservation_static/imgs/trip_line.png'></div>"
										+ "</td>" //비행 시간
										+ "<td id='"+schedule.pName+"_arr_time' style='border-left: none; vertical-align: middle; font-size: x-large;'><br>"+schedule.pATime+"<br>&nbsp;</td>" //도착 시간
										+ "<td>"+schedule.pName+"</td>" //편명
										+ "<td id='"+schedule.pName+"_adult_price'>"+schedule.pAdultPrice+"</td>" //성인
										+ "<td id='"+schedule.pName+"_child_price'>"+schedule.pChildPrice+"</td>" //소아
										+ "<td id='"+schedule.pName+"_baby_price'>"+schedule.pBabyPrice+"</td>" //유아
										+ "<td id='remainSeat_"+schedule.pName+"'>"+schedule.remainSeat+"</td>"//잔여 좌석
										+ "<td style='position: relative;'>"
										+ "<input type='button' id='btn_"+schedule.pName+"' onmouseover='checkSeat(\"btn_"+schedule.pName+"\")' onclick='openSelectSeat(\"come_div_"+schedule.pName+"\")' value='좌석 선택'>"
										+ "<div class='select_seat' id='come_div_"+schedule.pName+"'>"
										+ "<h3 class='flight_title'>&nbsp;&nbsp;&nbsp;"+schedule.pName+"<span class='flight_info' style='font-weight: 300;'> : "+schedule.pDTime+" → "+schedule.pATime+"</span></h3>"
										+ "<table class='tab_seat' id='tab_seat_"+schedule.pName+"'>"
										+ "<thead>"
										+ "<tr>"
										+ "<th></th>"
										+ "<th style='border-bottom: 1px solid gray;'>1</th>"
										+ "<th style='border-bottom: 1px solid gray;'>2</th>"
										+ "<th></th>"
										+ "<th></th>"
										+ "<th style='border-bottom: 1px solid gray;'>3</th>"
										+ "<th style='border-bottom: 1px solid gray;'>4</th>"
										+ "</tr>"
										+ "</thead>"
										+ "<tbody>"
										+ "<tr>"
										+ "<td>A</td>"
										+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_A1' onclick='comeSelectSeat(\""+schedule.pName+"_A1\")'></td>"
										+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_A2' onclick='comeSelectSeat(\""+schedule.pName+"_A2\")'></td>"
										+ "<td></td>"
										+ "<td></td>"
										+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_A3' onclick='comeSelectSeat(\""+schedule.pName+"_A3\")'></td>"
										+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_A4' onclick='comeSelectSeat(\""+schedule.pName+"_A4\")'></td>"
										+ "</tr>"
										+ "<tr>"
										+ "<td>B</td>"
										+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_B1' onclick='comeSelectSeat(\""+schedule.pName+"_B1\")'></td>"
										+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_B2' onclick='comeSelectSeat(\""+schedule.pName+"_B2\")'></td>"
										+ "<td></td>"
										+ "<td></td>"
										+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_B3' onclick='comeSelectSeat(\""+schedule.pName+"_B3\")'></td>"
										+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_B4' onclick='comeSelectSeat(\""+schedule.pName+"_B4\")'></td>"
										+ "</tr>"
										+ "<tr>"
										+ "<td>C</td>"
										+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_C1' onclick='comeSelectSeat(\""+schedule.pName+"_C1\")'></td>"
										+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_C2' onclick='comeSelectSeat(\""+schedule.pName+"_C2\")'></td>"
										+ "<td></td>"
										+ "<td></td>"
										+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_C3' onclick='comeSelectSeat(\""+schedule.pName+"_C3\")'></td>"
										+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_C4' onclick='comeSelectSeat(\""+schedule.pName+"_C4\")'></td>"
										+ "</tr>"
										+ "<tr>"
										+ "<td>D</td>"
										+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_D1' onclick='comeSelectSeat(\""+schedule.pName+"_D1\")'></td>"
										+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_D2' onclick='comeSelectSeat(\""+schedule.pName+"_D2\")'></td>"
										+ "<td></td>"
										+ "<td></td>"
										+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_D3' onclick='comeSelectSeat(\""+schedule.pName+"_D3\")'></td>"
										+ "<td><input type=button class='btn_seat' id='"+schedule.pName+"_D4' onclick='comeSelectSeat(\""+schedule.pName+"_D4\")'></td>"
										+ "</tr>"
										+ "<tr>"
										+ "<td>E</td>"
										+ "<td style='border-bottom: 1px solid gray;'><input type=button class='btn_seat' id='"+schedule.pName+"_E1' onclick='comeSelectSeat(\""+schedule.pName+"_E1\")'></td>"
										+ "<td style='border-bottom: 1px solid gray;'><input type=button class='btn_seat' id='"+schedule.pName+"_E2' onclick='comeSelectSeat(\""+schedule.pName+"_E2\")'></td>"
										+ "<td></td>"
										+ "<td></td>"
										+ "<td style='border-bottom: 1px solid gray;'><input type=button class='btn_seat' id='"+schedule.pName+"_E3' onclick='comeSelectSeat(\""+schedule.pName+"_E3\")'></td>"
										+ "<td style='border-bottom: 1px solid gray;'><input type=button class='btn_seat' id='"+schedule.pName+"_E4' onclick='comeSelectSeat(\""+schedule.pName+"_E4\")'></td>"
										+ "</tr>"
										+ "</tbody>"
										+ "</table>"
										+ "<div class='seat_info'>"
										+ "<table class='tab_seat_info'>"
										+ "<tr>"
										+ "<td>"
										+ "<label for='seat_passCnt'>탑승 인원</label>"
										+ "<input type='text' class='seat_passCnt' id='seat_passCnt_"+schedule.pName+"' value='' readonly>"
										+ "</td>"
										+ "</tr>"
										+ "<tr>"
										+ "<td>"
										+ "<label for='selected_seat'>선택 좌석</label>"
										+ "<input type='text' class='selected_seat' id='selected_seat_"+schedule.pName+"' value='' readonly>"
										+ "</td>"
										+ "</tr>"
										+ "<tr style='height: 100px; text-align: right; vertical-align: bottom;'>"
										+ "<td>"
										+ "<input type='button' class='complete_select' id='complete_select' onclick='completeSelectSeat(\"come_div_"+schedule.pName+"\")' value='선택 완료'>"
										+ "<input type='button' class='close_select' value='닫기' onclick='closeComeSelectSeat(\"come_div_"+schedule.pName+"\")'>"
										+ "</td>"
										+ "</tr>"
										+ "</table>"
										+ "</div>"	
										+ "</div>"
										+ "</td>" //좌석 선택 버튼
										+ "</tr>";
								});
							}
						}
					});
					
				}
				setTimeout(function() {
					$('.tab_schedule').append(html);
				}, 3000);
			},
			error : function(err) {
				console.log(err);
				alert('에러!! 스케쥴을 불러오는데 실패하였습니다.');
				location.href = history.back();
			},
			beforeSend: function() {
				$('.wrap-loading').removeClass('display-none');
				
				if(!$('#one_result_tr').hasClass('display-none')) {
					$('#one_result_tr').addClass('display-none');
					one_values = new StringBuffer2();
				}
				if(!$('#go_result_tr').hasClass('display-none')) {
					$('#go_result_tr').addClass('display-none');
					go_values = new StringBuffer2();
				}
				if(!$('#come_result_tr').hasClass('display-none')) {
					$('#come_result_tr').addClass('display-none');
					come_values = new StringBuffer2();
				}
				if(!$('#total_price_tr').hasClass('display-none')) {
					$('#total_price_tr').addClass('display-none');
				}
				if(!$('#btn_submit_tr').hasClass('display-none')) {
					$('#btn_submit_tr').addClass('display-none');
				}
				if($('#not_selected').hasClass('display-none')) {
					$('#not_selected').removeClass('display-none');
				}
			},
			complete: function() {
				setTimeout(function() {
					$('.wrap-loading').addClass('display-none');
				}, 3000);	
			},
			timeout: 10000,
		}) //ajax end	
	}); //function end