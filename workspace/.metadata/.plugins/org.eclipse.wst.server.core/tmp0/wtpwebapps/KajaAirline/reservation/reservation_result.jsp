<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공편 조회 및 선택</title>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="../reservation_static/css/reservation_result_style.css?ver=2020071701">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="../reservation_static/js/ajax_flight_schedule.js?version=0717" charset="UTF-8"></script>

<!-- 화면 로드시 편도인지 왕복인지 확인하여 버튼 색상 변경 -->
<script type="text/javascript">
	$(function () {
		var tripType = $("#tripType").val();
		if(tripType == '편도') {
			$("#onewayTrip").css("background-color", "crimson")
			$("#onewayTrip").css("color", "white")
			$("#roundTrip").css("background-color", "white")
			$("#roundTrip").css("color", "black")
		} else {
			$("#roundTrip").css("background-color", "crimson")
			$("#roundTrip").css("color", "white")
			$("#onewayTrip").css("background-color", "white")
			$("#onewayTrip").css("color", "black")
		}
		showSlides();
	})
</script>

<!-- 주요공항 리스트 레이어 display 변경 로직  -->
<script type="text/javascript">

	function openAirportList(id) {
		if($('#'+id).css('display') == 'none') {
			$('#'+id).css('display', 'block');
		} else {
			$('#'+id).css('display', 'none');
		}
	};
	
</script>

<!-- 공항 선택시 input태그 공항 변경 -->
<script type="text/javascript">
	function setDepAirport(param) {
		var select = $(param).text();
		$("#depAirport").val(select);
		$("#dep_airport_list").css("display", "none");
	}
	
	function setArrAirport(param) {
		var select = $(param).text();
		$("#arrAirport").val(select);
		$("#arr_airport_list").css("display", "none");
	}
</script>

<!-- 승객 인원 div 띄우는 로직 -->
<script type="text/javascript">

	function openPersonLy(id) {
		if($('#'+id).css('display') == 'none') {
			$('#'+id).css('display', 'block');
		} else {
			$('#'+id).css('display', 'none');
		}
	};
	
</script>

<!-- 인원 선택 버튼 로직 -->
<script type="text/javascript">
	
	function modifyProductQuantity(id, quantity){
	    if(isNaN($("#"+id).val())){
	         alert( '숫자만 입력가능 합니다.' );
	         $("#"+id).focus();
	         $("#"+id).val(0);
	         return;
	    }
	    var q = parseInt($("#"+id).val())+parseInt(quantity);
	    if(q < 0) {
	    	alert('더 이상 줄일 수 없습니다.');
	    	q = 0;
	    }
	    $("#"+id).val(q);
	    var adultCnt = $("#adultCnt").val();
	    var childCnt = $("#childCnt").val();
	    var babyCnt = $("#babyCnt").val();
	    $("#boardingPerson").val("성인 "+adultCnt+", 유아 "+childCnt+", 소아 "+babyCnt);
	    
	};
	
	function inputPassenger(){
	    var adultCnt = $("#adultCnt").val();
	    var childCnt = $("#childCnt").val();
	    var babyCnt = $("#babyCnt").val();
	    $("#boardingPerson").val("성인 "+adultCnt+", 유아 "+childCnt+", 소아 "+babyCnt);
	    
	};

</script>

<!-- 편도, 왕복 선택에 따라 버튼 색상 변경 및 html 변경 -->
<script type="text/javascript">
	
	$(function() {
		$("#onewayTrip").click(function() {
			$.ajax({
				url : 'result_oneway_trip.jsp',
				dataType : 'html',
				type : 'get',
				success : function(result) {
					var refine = $(".date_person").html(result).find('.tab_date_person')
					$(".date_person").html(refine)
				}
			});
			$("#tripType").val("편도");
			$("#onewayTrip").css("background-color", "crimson")
			$("#onewayTrip").css("color", "white")
			$("#roundTrip").css("background-color", "white")
			$("#roundTrip").css("color", "black")
		});
			
		$("#roundTrip").click(function() {
			$.ajax({
				url : 'result_round_trip.jsp',
				dataType : 'html',
				type : 'get',
				success : function(result) {
					var refine = $(".date_person").html(result).find('.tab_date_person')
					$(".date_person").html(refine)
				}
			});
			$("#tripType").val("왕복");
			$("#roundTrip").css("background-color", "crimson")
			$("#roundTrip").css("color", "white")
			$("#onewayTrip").css("background-color", "white")
			$("#onewayTrip").css("color", "black")
		});

	});
</script>

<!-- 공항 검색 자동완성 Ajax 로직 -->
<script type="text/javascript">

    $(document).ready(function() {
    	$("#depAirport").autocomplete({
    	source : function(request, response) {
    		$.ajax({
    			url : 'autocomplete_json.jsp',
    			dataType : 'json',
    			type : 'get',
    			success : function(result) { //성공시
    				response(
    					$.map(result, function(item) {
    						if (item.location.indexOf($("#depAirport").val()) >= 0) {
    							return {
        							label: item.location + " " +item.code,
        							value: item.location + " " + item.code
        						}
    						}
    					})
    				); //response-end
    			},
    			error : function(e) {
    				alert("통신에 실패했습니다.");
    				console.dir(e);
    			}
    		});
    	}, //source-end
    	minLength : 1,
    	autoFocus : false,
    	select : function(evt, ui) {
    		
    	},
    	focus : function(evt, ui) {
    		return false;
    	},
    	close : function(evt) {
    		
    	}
    });
    	
    	$("#arrAirport").autocomplete({
        	source : function(request, response) {
        		$.ajax({
        			url : 'autocomplete_json.jsp',
        			dataType : 'json',
        			type : 'get',
        			success : function(result) { //성공시
        				response(
        					$.map(result, function(item) {
        						if (item.location.indexOf($("#arrAirport").val()) >= 0) {
        							return {
            							label: item.location + " " +item.code,
            							value: item.location + " " + item.code
            						}
        						}
        					})
        				); //response-end
        			},
        			error : function(e) {
        				alert("통신에 실패했습니다.");
        				console.dir(e);
        			}
        		});
        	}, //source-end
        	minLength : 1,
        	autoFocus : false,
        	select : function(evt, ui) {
        		
        	},
        	focus : function(evt, ui) {
        		return false;
        	},
        	close : function(evt) {
        		
        	}
        });
    });
</script>

<!-- 잔여 좌석이 예약 고객보다 적을 경우 '좌석 선택' 버튼을 invalid -->
<script type="text/javascript">

	function checkSeat(id) {
		var adultCnt = $("#adultCnt").val();
		var childCnt = $("#childCnt").val();
		var babyCnt = $("#babyCnt").val();
		var sum = Number(adultCnt) + Number(childCnt) + Number(babyCnt);
		var seatId = 'remainSeat_';
		if(id.length == 11) {
			seatId += id.slice(-7);
		} else {
			seatId += id.slice(-8);
		}
		var remainSeat = Number($("#"+seatId).text());
		if(remainSeat < sum) {
			$("#"+seatId).css("color", "red");
			$("#"+id).attr("disabled", "disabled");
			console.log('NO SEAT');
		} else {
			$("#"+id).removeAttr("disabled");
		}
	};
</script>

<!-- 좌석 선택 클릭시 좌석 선택 창 띄움  -->
<script type="text/javascript">

	function openSelectSeat(id) {
		if($("#"+id).css("display") == "none") {
			var adultCnt = $("#adultCnt").val();
			var childCnt = $("#childCnt").val();
			var babyCnt = $("#babyCnt").val();
			var sum = Number(adultCnt) + Number(childCnt) + Number(babyCnt);
			var pName = "";
			
			if(id.slice(0,2) == 'go') {
				if(id.length == 14) {
					pName = id.slice(-7);
				} else {
					pName = id.slice(-8);
				}
			} else if(id.slice(0,4) == 'come') {
				if(id.length == 16) {
					pName = id.slice(-7);
				} else {
					pName = id.slice(-8);
				}
			} else {
				if(id.length == 11) {
					pName = id.slice(-7);
				} else {
					pName = id.slice(-8);
				}
			}
			if($("#btn_"+pName).val() == "다시 선택") {
				sum = 0;
 			}
			$('#seat_passCnt_'+pName).val(sum);
			$("#"+id).css("display", "block");
			
			param = {"pName":pName};
			$.ajax({
				url : 'result_seat.jsp',
				type : 'post',
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				data : param,
				dataType : 'json',
				success : function(data) {
					$.each(data, function(key, value) {
						if(key != 'remainSeat' && Number(value) == 1) {
							$("#"+pName+"_"+key).css('background-color', 'gray');
							$("#"+pName+"_"+key).attr("disabled", "disabled");
						}
					})
					console.log('ajax seat json success');
				},
				error : function(err) {
					console.log(err);
				}
			});
		}
	};
	
	//좌석 선택 창에서 닫기 누를시 데이터 초기화
	function closeSelectSeat(id) {
		if(id.length == 11) {
			var pName = id.slice(-7);
		} else {
			var pName = id.slice(-8);
		}
		$("#"+id).css("display", "none");
		$('.btn_seat').css('background-color', 'white');
		$('#selected_seat_'+pName).val("");
		seatList = new StringBuffer();		
		var seatText = "selected_seat_"+pName;
		if($("#"+seatText).val() == "") {
			$("#btn_"+pName).val("좌석 선택");
			$("#btn_"+pName).css("background-color", "#EFEFEF")
			$("#btn_"+pName).css("color", "black")
			
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
		}
	}
	
	function closeGoSelectSeat(id) {
		$("#"+id).css("display", "none");
		$('.btn_seat').css('background-color', 'white');
		if(id.length == 14) {
			var pName = id.slice(-7);
		} else {
			var pName = id.slice(-8);
		}
		console.log(pName);
		$('#selected_seat_'+pName).val("");
		goSeatList = new StringBuffer();
		var seatText = "selected_seat_"+pName;
		if($("#"+seatText).val() == "") {
			$("#btn_"+pName).val("좌석 선택");
			$("#btn_"+pName).css("background-color", "#EFEFEF")
			$("#btn_"+pName).css("color", "black")
			
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
		}
	}
	
	function closeComeSelectSeat(id) {
		$("#"+id).css("display", "none");
		$('.btn_seat').css('background-color', 'white');
		if(id.length == 16) {
			var pName = id.slice(-7);
		} else {
			var pName = id.slice(-8);
		}
		$('#selected_seat_'+pName).val("");
		comeSeatList = new StringBuffer();
		var seatText = "selected_seat_"+pName;
		if($("#"+seatText).val() == "") {
			$("#btn_"+pName).val("좌석 선택");
			$("#btn_"+pName).css("background-color", "#EFEFEF")
			$("#btn_"+pName).css("color", "black")
			
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
		}
	}
</script>

<!-- 좌석 선택 완료시 데이터 전달 -->
<script type="text/javascript">
	var StringBuffer2 = function() {
		this.buffer = new Array();
		var len = this.buffer.length
	}
	StringBuffer2.prototype.append = function(obj) {
		this.buffer.push(obj);
	}
	StringBuffer2.prototype.toString = function() {
		return this.buffer.join("#");
	}
	StringBuffer2.prototype.remove = function(obj) {
		this.buffer.splice(this.buffer.indexOf(obj), 1);
	}
	
	var one_values = new StringBuffer2();
	var go_values = new StringBuffer2();
	var come_values = new StringBuffer2();
	
	//로직 추가 필요 : 출발일과 도착일이 다를 경우에 도착일 계산해주는 로직
	function completeSelectSeat(id) {
		if(id.slice(0,2) == 'go') { //왕복(가는날)
			if(id.length == 14) {
				pName = id.slice(-7);
			} else {
				pName = id.slice(-8);
			}
			
			var btnId = "btn_"+pName;
			if($("#seat_passCnt_"+pName).val() == 0) {
				$("#"+id).css("display", "none");
				$("#"+btnId).css("background-color", "crimson");
				$("#"+btnId).css("color", "white");
				$("#"+btnId).val('다시 선택');
				
				var go_dep = $("#depAirport").val();
				var go_dep_date = $("#goDate").val()+" "+$("#"+pName+"_dep_time").text().slice(0,5);
				var go_arr = $("#arrAirport").val();
				var go_arr_date = $("#goDate").val()+" "+$("#"+pName+"_arr_time").text().slice(0,5);
				var sum = Number($("#adultCnt").val())+Number($("#childCnt").val())+Number($("#babyCnt").val());
				var bPerson = $("#boardingPerson").val();
				var go_passenger_cnt = "총 "+sum+"명("+bPerson+")";
				var go_seats = $("#selected_seat_"+pName).val();
				var go_price = Number($("#adultCnt").val())*Number($("#"+pName+"_adult_price").text())
								+ Number($("#childCnt").val())*Number($("#"+pName+"_child_price").text())
								+ Number($("#babyCnt").val())*Number($("#"+pName+"_baby_price").text())
				
				$("#go_pName").text(pName);
				go_values.append(pName);
				$("#go_dep").text(go_dep);
				go_values.append(go_dep);
				$("#go_dep_date").text(go_dep_date);
				go_values.append(go_dep_date);
				$("#go_arr").text(go_arr);
				go_values.append(go_arr);
				$("#go_arr_date").text(go_arr_date);
				go_values.append(go_arr_date);
				$("#go_passenger_cnt").text(go_passenger_cnt);
				go_values.append(go_passenger_cnt);
				$("#go_seats").text(go_seats);
				go_values.append(go_seats);
				$("#go_price").text(go_price);
				go_values.append(go_price);
				
				$("#go_values").val(go_values.toString());
				console.log(go_values.toString());
				
				$("#not_selected").addClass('display-none');
				$("#go_result_tr").removeClass('display-none');
				
			} else {
				alert('모든 인원이 선택되지 않았습니다!');
			}
			
		} else if(id.slice(0,4) == 'come') { //왕복(오는날)
			if(id.length == 16) {
				pName = id.slice(-7);
			} else {
				pName = id.slice(-8);
			}
			
			var btnId = "btn_"+pName;
			if($("#seat_passCnt_"+pName).val() == 0) {
				$("#"+id).css("display", "none");
				$("#"+btnId).css("background-color", "crimson");
				$("#"+btnId).css("color", "white");
				$("#"+btnId).val('다시 선택');
				
				var come_dep = $("#depAirport").val();
				var come_dep_date = $("#comeDate").val()+" "+$("#"+pName+"_dep_time").text().slice(0,5);
				var come_arr = $("#arrAirport").val();
				var come_arr_date = $("#comeDate").val()+" "+$("#"+pName+"_arr_time").text().slice(0,5);
				var sum = Number($("#adultCnt").val())+Number($("#childCnt").val())+Number($("#babyCnt").val());
				var bPerson = $("#boardingPerson").val();
				var come_passenger_cnt = "총 "+sum+"명("+bPerson+")";
				var come_seats = $("#selected_seat_"+pName).val();
				var come_price = Number($("#adultCnt").val())*Number($("#"+pName+"_adult_price").text())
								+ Number($("#childCnt").val())*Number($("#"+pName+"_child_price").text())
								+ Number($("#babyCnt").val())*Number($("#"+pName+"_baby_price").text())
				
				$("#come_pName").text(pName);
				come_values.append(pName);
				$("#come_dep").text(come_dep);
				come_values.append(come_dep);
				$("#come_dep_date").text(come_dep_date);
				come_values.append(come_dep_date);
				$("#come_arr").text(come_arr);
				come_values.append(come_arr);
				$("#come_arr_date").text(come_arr_date);
				come_values.append(come_arr_date);
				$("#come_passenger_cnt").text(come_passenger_cnt);
				come_values.append(come_passenger_cnt);
				$("#come_seats").text(come_seats);
				come_values.append(come_seats);
				$("#come_price").text(come_price);
				come_values.append(come_price);
				
				var total = Number($("#go_price").text())+Number(come_price);
				console.log(total);
				$("#total_price").text(total+"원")
				console.log(come_values.toString());
				$("#come_values").val(come_values.toString());
				
				$("#come_result_tr").removeClass('display-none');
				$("#total_price_tr").removeClass('display-none');
				$("#btn_submit_tr").removeClass('display-none');
				
			} else {
				alert('모든 인원이 선택되지 않았습니다!');
			}
			
		} else { //편도
			if(id.length == 11) {
				pName = id.slice(-7);
			} else {
				pName = id.slice(-8);
			}
			console.log(seatList);
			var btnId = "btn_"+pName;
			if($("#seat_passCnt_"+pName).val() == 0) {
				$("#"+id).css("display", "none");
				$("#"+btnId).css("background-color", "crimson");
				$("#"+btnId).css("color", "white");
				$("#"+btnId).val('다시 선택');
				
				var one_dep = $("#depAirport").val();
				var one_dep_date = $("#boardingDate").val()+" "+$("#"+pName+"_dep_time").text().slice(0,5);
				var one_arr = $("#arrAirport").val();
				var one_arr_date = $("#boardingDate").val()+" "+$("#"+pName+"_arr_time").text().slice(0,5);
				var sum = Number($("#adultCnt").val())+Number($("#childCnt").val())+Number($("#babyCnt").val());
				var bPerson = $("#boardingPerson").val();
				var one_passenger_cnt = "총 "+sum+"명("+bPerson+")";
				var one_seats = $("#selected_seat_"+pName).val();
				var one_price = Number($("#adultCnt").val())*Number($("#"+pName+"_adult_price").text())
								+ Number($("#childCnt").val())*Number($("#"+pName+"_child_price").text())
								+ Number($("#babyCnt").val())*Number($("#"+pName+"_baby_price").text())
				
				$("#one_pName").text(pName);
				one_values.append(pName);
				$("#one_dep").text(one_dep);
				one_values.append(one_dep);
				$("#one_dep_date").text(one_dep_date);
				one_values.append(one_dep_date);
				$("#one_arr").text(one_arr);
				one_values.append(one_arr);
				$("#one_arr_date").text(one_arr_date);
				one_values.append(one_arr_date);
				$("#one_passenger_cnt").text(one_passenger_cnt);
				one_values.append(one_passenger_cnt);
				$("#one_seats").text(one_seats);
				one_values.append(one_seats);
				$("#one_price").text(one_price);
				one_values.append(one_price);
				
				$("#total_price").text(+one_price+"원")
				console.log(one_values.toString());
				$("#one_values").val(one_values.toString());
				
				$("#not_selected").addClass('display-none');
				$("#one_result_tr").removeClass('display-none');
				$("#total_price_tr").removeClass('display-none');
				$("#btn_submit_tr").removeClass('display-none');
			} else {
				alert('모든 인원이 선택되지 않았습니다!');
			}
		}
	}
</script>

<!-- 좌석 선택시 색상 변경 및 텍스트 변경-->
<script type="text/javascript">

		var StringBuffer = function() {
			this.buffer = new Array();
			var len = this.buffer.length
		}
		StringBuffer.prototype.append = function(obj) {
			this.buffer.push(obj);
		}
		StringBuffer.prototype.toString = function() {
			return this.buffer.join(" ");
		}
		StringBuffer.prototype.remove = function(obj) {
			this.buffer.splice(this.buffer.indexOf(obj), 1);
		}
	
		var seatList = new StringBuffer();
		
		//편도
		function selectSeat(id) {
			var seatVal = id.slice(-2)
			if(id.length == 10) {
				var pName = id.slice(0, 7);				
			} else {
				var pName = id.slice(0, 8);
			}
			var cnt = Number($('#seat_passCnt_'+pName).val());
			if($("#"+id).css('background-color') == "rgb(255, 255, 255)") {
				if(cnt <= 0) {
					alert('더 이상 선택할 수 없습니다!');
				} else {
					$("#"+id).css('background-color', 'crimson');
					seatList.append(seatVal);
					$('#selected_seat_'+pName).val(seatList.toString());
					cnt -= 1;
					$('#seat_passCnt_'+pName).val(cnt);					
				}
			} else {
				$("#"+id).css('background-color', 'white');
				seatList.remove(seatVal);
				$('#selected_seat_'+pName).val(seatList.toString());
				cnt += 1;
				$('#seat_passCnt_'+pName).val(cnt);
			}			
		};
</script>

<script type="text/javascript">
		//가는날
		var goSeatList = new StringBuffer();
		
		function goSelectSeat(id) {
			var seatVal = id.slice(-2)
			if(id.length == 10) {
				var pName = id.slice(0, 7);				
			} else {
				var pName = id.slice(0, 8);
			}
			var cnt = Number($('#seat_passCnt_'+pName).val());
			if($("#"+id).css('background-color') == "rgb(255, 255, 255)") {
				if(cnt <= 0) {
					alert('더 이상 선택할 수 없습니다!');
				} else {
					$("#"+id).css('background-color', 'crimson');
					goSeatList.append(seatVal);
					$('#selected_seat_'+pName).val(goSeatList.toString());
					cnt -= 1;
					$('#seat_passCnt_'+pName).val(cnt);
				}
			} else {
				$("#"+id).css('background-color', 'white');
				goSeatList.remove(seatVal);
				$('#selected_seat_'+pName).val(goSeatList.toString());
				cnt += 1;
				$('#seat_passCnt_'+pName).val(cnt);
			}			
		};
</script>

<script type="text/javascript">		
		//오는날
		var comeSeatList = new StringBuffer();
		
		function comeSelectSeat(id) {
			var seatVal = id.slice(-2)
			if(id.length == 10) {
				var pName = id.slice(0, 7);				
			} else {
				var pName = id.slice(0, 8);
			}
			var cnt = Number($('#seat_passCnt_'+pName).val());
			if($("#"+id).css('background-color') == "rgb(255, 255, 255)") {
				if(cnt <= 0) {
					alert('더 이상 선택할 수 없습니다!');
				} else {
					$("#"+id).css('background-color', 'crimson');
					comeSeatList.append(seatVal);
					$('#selected_seat_'+pName).val(comeSeatList.toString());
					cnt -= 1;
					$('#seat_passCnt_'+pName).val(cnt);					
				}
			} else {
				$("#"+id).css('background-color', 'white');
				comeSeatList.remove(seatVal);
				$('#selected_seat_'+pName).val(comeSeatList.toString());
				cnt += 1;
				$('#seat_passCnt_'+pName).val(cnt);
			}			
		};
</script>
</head>
<body>

<header><jsp:include page="./header.jsp" /></header>

<section id="sectionId">
<div class="wrapper">
	<div class="inner">
		<div class="result_container">
			<h1 style="text-align: left; font-weight: 700; font-size: xx-large; padding-bottom: 15px;">여정 조회</h1>
			<div class="reserve_container">
				<h4>&nbsp;여정/날짜 선택</h4>
				<div class="reserve_info">
					<table class="tab_selectTypeDepArr" style="border-spacing: 10px;">
						<tr>
							<td colspan="2">
								<div id="trip_type">
									<input type="button" id="onewayTrip" value="편도" style="width:80px; height:30px;">
									<input type="button" id="roundTrip" value="왕복"style="width:80px; height:30px;">
									<input type="hidden" id="tripType" name="tripType" value="<%=request.getAttribute("tripType")%>">
								</div> <!-- tab_trip_type end -->
							</td>
						</tr>
						<tr>
							<td>
								<div class="dep">
									<label for="depAirport">출발지</label> <br>
									<input type="text" id="depAirport" name="depAirport" onFocus="this.value=''; return true;" value="${param.depAirport}" style="width:120px; height:30px;" required="required"/>
									<div class="btn_airport_list1" style="position: relative;">
										<button name="btn_airport_list1" type="button" onclick="openAirportList('dep_airport_list');">주요도시 바로선택</button>
									</div>
									<div class="dep_airport_list" id="dep_airport_list">
										<strong class="airport_list_title">주요도시 바로선택</strong>
										<h5>국내선</h5>
										<ul style="list-style:none; padding-left:0px;">
											<li>
												<a href="#none" onclick="javascript: setDepAirport(this);">서울/인천 ICN</a>
											</li>
											<li>
												<a href="#none" onclick="javascript: setDepAirport(this);">서울/김포 GMP</a>
											</li>
										</ul>
									</div>
								</div>
							</td>
							<td>
								<div class="arr">
									<label for="arrAirport">도착지</label> <br>
									<input type="text" id="arrAirport" name="arrAirport" onFocus="this.value=''; return true;" value="${param.arrAirport}" style="width:120px; height:30px;" required="required"/>
									<div class="btn_airport_list2" style="position: relative;">
										<button name="btn_airport_list2" type="button" onclick="openAirportList('arr_airport_list');">주요도시 바로선택</button>
									</div>
									<div class="arr_airport_list" id="arr_airport_list">
										<strong class="airport_list_title">주요도시 바로선택</strong>
										<h5>국내선</h5>
										<ul style="list-style:none; padding-left:0px;">
											<li>
												<a href="#none" onclick="javascript: setArrAirport(this);">서울/김포 GMP</a>
											</li>
										</ul>
									</div>
								</div>					
							</td>
						</tr>
					</table>
				</div> <!-- tab_depArr_date end -->
				<div class="date_person">
					<table class="tab_date_person" style="border: 0px; border-spacing: 10px;">
						<tr>
						<c:choose>
							<c:when test="${param.tripType eq '왕복'}">
								<td>
									<div class="date_go">
										<label for="goDate">가는날</label> <br>
										<input type="date" id="goDate" name="goDate" value="${param.goDate}" style="width:130px; height:30px; font-size: small;" required="required">			
									</div>
								</td>
								<td>
									<div class="date_come">
										<label for="comeDate">오는날</label> <br>
										<input type="date" id="comeDate" name="comeDate" value="${param.comeDate}"style="width:130px; height:30px; font-size: small;" required="required">			
									</div>
								</td>
							</c:when>
							<c:otherwise>
								<td>
									<div class="date">
										<label for="boardingDate">탑승일</label> <br>
										<input type="date" id="boardingDate" name="bDate" value="${param.bDate}"style="width:260px; height:30px;" required="required">			
									</div>
								</td>
							</c:otherwise>
						</c:choose>
						</tr>
						<tr>
							<td colspan="2">
								<div class="person">
									<label for="boardingPerson">탑승인원</label> <br>
									<input type="text" id="boardingPerson" name="bPerson" value="성인 ${param.adultCount}, 소아 ${param.childCount}, 유아 ${param.babyCount}" onclick="javascript: openPersonLy('passenger');" style="width:260px; height:30px; position: relative;" readonly="readonly">
									<div class="passenger" id="passenger">
										<table class="selectPassenger" style="border: 0px; border-spacing: 0px;" >
											<tr>
												<td>
													<div class="pass_adult" id="adult">
														<h6>성인&nbsp;<span id="adultAge">(만 12세 이상)</span></h6>
														<div class="btn_number_box">
															<input type="button" name="btn_number_minus" onclick="modifyProductQuantity('adultCnt', -1);" value="-" style="width: 25px; height:25px;" >
															<input type="text" id="adultCnt" name="adultCount" title="성인 탑승 인원" oninput="inputPassenger()" value="${param.adultCount }" style="text-align: center; width:50px; height:20px;" >
															<input type="button" name="btn_number_plus" onclick="modifyProductQuantity('adultCnt', 1);" value="+" style="width: 25px; height:25px;" >
														</div>
													</div>
												</td>	
											</tr>
											<tr>
												<td>
													<div class="pass_child" id="child">
														<h6>소아&nbsp;<span id="childAge">(12세 미만)</span></h6>
														<div class="btn_number_box">
															<input type="button" name="btn_number_minus" onclick="modifyProductQuantity('childCnt', -1);" value="-" style="width: 25px; height:25px;" >
															<input type="text" id="childCnt" name="childCount" title="소아 탑승 인원" oninput="inputPassenger()" value="${param.childCount }" style="text-align: center; width:50px; height:20px;" >
															<input type="button" name="btn_number_plus" onclick="modifyProductQuantity('childCnt', 1);" value="+" style="width: 25px; height:25px;" >
														</div>
													</div>	
												</td>				
											</tr>
											<tr>
												<td>
													<div class="pass_baby" id="baby">
														<h6>유아&nbsp;<span id="babyAge">(24개월 미만)</span></h6>
														<div class="btn_number_box">
															<input type="button" name="btn_number_minus" onclick="modifyProductQuantity('babyCnt', -1);" value="-" style="width: 25px; height:25px;" >
															<input type="text" id="babyCnt" name="babyCount" title="유아 탑승 인원" oninput="inputPassenger()" value="${param.babyCount }" style="text-align: center; width:50px; height:20px;" >
															<input type="button" name="btn_number_plus" onclick="modifyProductQuantity('babyCnt', 1);" value="+" style="width: 25px; height:25px;" >
														</div>
													</div>
												</td>				
											</tr>
										</table>
									</div> <!-- tab_passenger end -->
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2"><input type="button" id="btn_search_schedule" value="항공권 검색" style="width:260px; height:40px;"></td>
						</tr>
					</table>
				</div> <!-- date_person end -->
			</div> <!-- reserve_container end -->
			
			<div class="schedule" id="schedule">
				<table class="tab_schedule" id="tab_schedule">
				<c:choose>
					<c:when test="${param.tripType eq '편도'}">
						<tr><th colspan="9" style="height: 65px; font-size: x-large; font-weight: 700; background-color: slategray; color: white;">편도 항공편</th></tr>
						<tr>
							<th colspan="3" rowspan="2" style="font-weight: 400; background-color: dimgray; color: white;">출도착시간 (비행시간)</th>
							<th rowspan="2" style="font-weight: 400; background-color: dimgray; color: white;">편명</th>
							<th colspan="3" style="font-weight: 400; color: white; background-color: dimgray;">가격</th>
							<th rowspan="2" style="font-weight: 400; color: white; background-color: dimgray;">잔여 좌석</th>
							<th rowspan="2" style="font-weight: 400; color: white; background-color: dimgray;">좌석 선택</th>
						</tr>
						<tr>
							<th style="font-weight: 400; color: white; background-color: dimgray;">성인</th>
							<th style="font-weight: 400; color: white; background-color: dimgray;">소아</th>
							<th style="font-weight: 400; color: white; background-color: dimgray;">유아</th>
						</tr>
						<c:choose>
							<c:when test="${fn:length(scheduleList) eq 0}">
								<tr><td colspan="9" style="height: 65px; font-size: x-large; font-weight: 700;">선택하신 조건에 맞는 예약 가능 항공편이 없습니다.</td></tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="schedule" items="${scheduleList}">
									<tr class="tr_schedule">
										<td id="${schedule.pName}_dep_time" style="border-right: none; vertical-align: middle; font-size: x-large;"><br><c:out value="${schedule.pDTime}" /><br>&nbsp;</td> <!-- 출발 시각 -->
										<td style="padding: 0px; border-right: none; border-left: none; vertical-align: middle; text-align: center; color: #848484;">
											<fmt:parseNumber integerOnly="true" value="${schedule.pFTime/60}"/>시간 <fmt:formatNumber value="${schedule.pFTime%60}" pattern="00"/>분 소요
											<div id="trip_line"><img src="../reservation_static/imgs/trip_line.png"></div>
										</td><!-- 비행 시간 -->
										<td id="${schedule.pName}_arr_time" style="border-left: none; vertical-align: middle; font-size: x-large;"><br><c:out value="${schedule.pATime}" /><br>&nbsp;</td> <!-- 도착 시각 -->
										<td><c:out value="${schedule.pName}" /></td> <!-- 편명 -->
										<td id="${schedule.pName}_adult_price"><c:out value="${schedule.pAdultPrice}" /></td> <!-- 성인 가격 -->
										<td id="${schedule.pName}_child_price"><c:out value="${schedule.pChildPrice}" /></td> <!-- 소아 가격 -->
										<td id="${schedule.pName}_baby_price"><c:out value="${schedule.pBabyPrice}" /></td> <!-- 유아 가격 -->
										<td id="remainSeat_${schedule.pName}" /><c:out value="${schedule.remainSeat}" /></td> <!-- 잔여 좌석 -->
										<!-- !!! 아래 코드 수정, ajax쪽 html 수정 필요 !!! -->
										<td style="position: relative;">
											<input type="button" id="btn_${schedule.pName}" onmouseover="checkSeat('btn_${schedule.pName}')" onclick="openSelectSeat('div_${schedule.pName}')" value="좌석 선택">
											<div class="select_seat" id="div_${schedule.pName}">
												<h3 class="flight_title">&nbsp;&nbsp;&nbsp;${schedule.pName}<span class="flight_info" style="font-weight: 300;"> : ${schedule.pDTime} → ${schedule.pATime}</span></h3>
												<table class="tab_seat" id="tab_seat_${schedule.pName}">
													<thead>
														<tr>
															<th></th>
															<th style="border-bottom: 1px solid gray;">1</th>
															<th style="border-bottom: 1px solid gray;">2</th>
															<th></th>
															<th></th>
															<th style="border-bottom: 1px solid gray;">3</th>
															<th style="border-bottom: 1px solid gray;">4</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>A</td>
															<td><input type=button class="btn_seat" id="${schedule.pName}_A1" onclick="selectSeat('${schedule.pName}_A1')"></td>
															<td><input type=button class="btn_seat" id="${schedule.pName}_A2" onclick="selectSeat('${schedule.pName}_A2')"></td>
															<td></td>
															<td></td>
															<td><input type=button class="btn_seat" id="${schedule.pName}_A3" onclick="selectSeat('${schedule.pName}_A3')"></td>
															<td><input type=button class="btn_seat" id="${schedule.pName}_A4" onclick="selectSeat('${schedule.pName}_A4')"></td>
														</tr>
														<tr>
															<td>B</td>
															<td><input type=button class="btn_seat" id="${schedule.pName}_B1" onclick="selectSeat('${schedule.pName}_B1')"></td>
															<td><input type=button class="btn_seat" id="${schedule.pName}_B2" onclick="selectSeat('${schedule.pName}_B2')"></td>
															<td></td>
															<td></td>
															<td><input type=button class="btn_seat" id="${schedule.pName}_B3" onclick="selectSeat('${schedule.pName}_B3')"></td>
															<td><input type=button class="btn_seat" id="${schedule.pName}_B4" onclick="selectSeat('${schedule.pName}_B4')"></td>
														</tr>
														<tr>
															<td>C</td>
															<td><input type=button class="btn_seat" id="${schedule.pName}_C1" onclick="selectSeat('${schedule.pName}_C1')"></td>
															<td><input type=button class="btn_seat" id="${schedule.pName}_C2" onclick="selectSeat('${schedule.pName}_C2')"></td>
															<td></td>
															<td></td>
															<td><input type=button class="btn_seat" id="${schedule.pName}_C3" onclick="selectSeat('${schedule.pName}_C3')"></td>
															<td><input type=button class="btn_seat" id="${schedule.pName}_C4" onclick="selectSeat('${schedule.pName}_C4')"></td>
														</tr>
														<tr>
															<td>D</td>
															<td><input type=button class="btn_seat" id="${schedule.pName}_D1" onclick="selectSeat('${schedule.pName}_D1')"></td>
															<td><input type=button class="btn_seat" id="${schedule.pName}_D2" onclick="selectSeat('${schedule.pName}_D2')"></td>
															<td></td>
															<td></td>
															<td><input type=button class="btn_seat" id="${schedule.pName}_D3" onclick="selectSeat('${schedule.pName}_D3')"></td>
															<td><input type=button class="btn_seat" id="${schedule.pName}_D4" onclick="selectSeat('${schedule.pName}_D4')"></td>
														</tr>
														<tr>
															<td>E</td>
															<td style="border-bottom: 1px solid gray;"><input type=button class="btn_seat" id="${schedule.pName}_E1" onclick="selectSeat('${schedule.pName}_E1')"></td>
															<td style="border-bottom: 1px solid gray;"><input type=button class="btn_seat" id="${schedule.pName}_E2" onclick="selectSeat('${schedule.pName}_E2')"></td>
															<td></td>
															<td></td>
															<td style="border-bottom: 1px solid gray;"><input type=button class="btn_seat" id="${schedule.pName}_E3" onclick="selectSeat('${schedule.pName}_E3')"></td>
															<td style="border-bottom: 1px solid gray;"><input type=button class="btn_seat" id="${schedule.pName}_E4" onclick="selectSeat('${schedule.pName}_E4')"></td>
														</tr>
													</tbody>
												</table>
												<div class="seat_info">
													<table class="tab_seat_info">
														<tr>
															<td>
																<label for="seat_passCnt">탑승 인원</label>
																<input type="text" class="seat_passCnt" id="seat_passCnt_${schedule.pName}" value="" readonly>
															</td>
														</tr>
														<tr>
															<td>
																<label for="selected_seat">선택 좌석</label>
																<input type="text" class="selected_seat" id="selected_seat_${schedule.pName}" value="" readonly>
															</td>
														</tr>
														<tr style="height: 100px; text-align: right; vertical-align: bottom;">
															<td>
																<input type="button" class="complete_select" id="complete_select" onclick="completeSelectSeat('div_${schedule.pName}')" value="선택 완료">
																<input type="button" class="close_select" value="닫기" onclick="closeSelectSeat('div_${schedule.pName}')">
															</td>
														</tr>
													</table>
												</div>	
											</div>
										</td> <!-- 좌석 선택 버튼 -->
									</tr> 
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<tr><th colspan="9" style="height: 65px; font-size: x-large; font-weight: 700; background-color: slategray; color: white;">가는날 항공편</th></tr>
						<tr>
							<th colspan="3" rowspan="2" style="font-weight: 400; background-color: dimgray; color: white;">출도착시간 (비행시간)</th>
							<th rowspan="2" style="font-weight: 400; background-color: dimgray; color: white;">편명</th>
							<th colspan="3" style="font-weight: 400; color: white; background-color: dimgray;">가격</th>
							<th rowspan="2" style="font-weight: 400; color: white; background-color: dimgray;">잔여 좌석</th>
							<th rowspan="2" style="font-weight: 400; color: white; background-color: dimgray;">좌석 선택</th>
						</tr>
						<tr>
							<th style="font-weight: 400; color: white; background-color: dimgray;">성인</th>
							<th style="font-weight: 400; color: white; background-color: dimgray;">소아</th>
							<th style="font-weight: 400; color: white; background-color: dimgray;">유아</th>
						</tr>
						<c:choose>
							<c:when test="${fn:length(goScheduleList) eq 0 and fn:length(comeScheduleList) eq 0}">
								<tr><td colspan="9" style="height: 65px; font-size: x-large; font-weight: 700;">선택하신 조건에 맞는 예약 가능 항공편이 없습니다.</td></tr>
								<tr><th colspan="9" style="height: 65px; font-size: x-large; font-weight: 700; background-color: slategray; color: white;">오는날 항공편</th></tr>
								<tr>
									<th colspan="3" rowspan="2" style="font-weight: 400; background-color: dimgray; color: white;">출도착시간 (비행시간)</th>
									<th rowspan="2" style="font-weight: 400; background-color: dimgray; color: white;">편명</th>
									<th colspan="3" style="font-weight: 400; color: white; background-color: dimgray;">가격</th>
									<th rowspan="2" style="font-weight: 400; color: white; background-color: dimgray;">잔여 좌석</th>
									<th rowspan="2" style="font-weight: 400; color: white; background-color: dimgray;">좌석 선택</th>
								</tr>
								<tr>
									<th style="font-weight: 400; color: white; background-color: dimgray;">성인</th>
									<th style="font-weight: 400; color: white; background-color: dimgray;">소아</th>
									<th style="font-weight: 400; color: white; background-color: dimgray;">유아</th>
								</tr>
								<tr><td colspan="9" style="height: 65px; font-size: x-large; font-weight: 700;">선택하신 조건에 맞는 예약 가능 항공편이 없습니다.</td></tr>
							</c:when>
							<c:when test="${fn:length(goScheduleList) ne 0 and fn:length(comeScheduleList) eq 0}">
								<c:forEach var="go_schedule" items="${goScheduleList}">
									<tr class="tr_schedule">
										<td id="${go_schedule.pName}_dep_time" style="border-right: none; vertical-align: middle; font-size: x-large;"><br><c:out value="${go_schedule.pDTime}" /><br>&nbsp;</td> <!-- 출발 시각 -->
										<td style="padding: 0px; border-right: none; border-left: none; vertical-align: middle; text-align: center; color: #848484;">
											<fmt:parseNumber integerOnly="true" value="${go_schedule.pFTime/60}"/>시간 <fmt:formatNumber value="${go_schedule.pFTime%60}" pattern="00"/>분 소요
											<div id="trip_line"><img src="../reservation_static/imgs/trip_line.png"></div>
										</td><!-- 비행 시간 -->
										<td id="${go_schedule.pName}_arr_time" style="border-left: none; vertical-align: middle; font-size: x-large;"><br><c:out value="${go_schedule.pATime}" /><br>&nbsp;</td> <!-- 도착 시각 -->
										<td><c:out value="${go_schedule.pName}" /></td> <!-- 편명 -->
										<td id="${go_schedule.pName}_adult_price"><c:out value="${go_schedule.pAdultPrice}" /></td> <!-- 성인 가격 -->
										<td id="${go_schedule.pName}_child_price"><c:out value="${go_schedule.pChildPrice}" /></td> <!-- 소아 가격 -->
										<td id="${go_schedule.pName}_baby_price"><c:out value="${go_schedule.pBabyPrice}" /></td> <!-- 유아 가격 -->
										<td id="remainSeat_${go_schedule.pName}"><c:out value="${go_schedule.remainSeat}" /></td> <!-- 잔여 좌석 -->
										<td style="position: relative;">
											<input type="button" id="btn_${go_schedule.pName}" onmouseover="checkSeat('btn_${go_schedule.pName}')" onclick="openSelectSeat('go_div_${go_schedule.pName}')" value="좌석 선택">
											<div class="select_seat" id="go_div_${go_schedule.pName}">
												<h3 class="flight_title">&nbsp;&nbsp;&nbsp;${go_schedule.pName}<span class="flight_info" style="font-weight: 300;"> : ${go_schedule.pDTime} → ${go_schedule.pATime}</span></h3>
												<table class="tab_seat" id="tab_seat_${go_schedule.pName}">
													<thead>
														<tr>
															<th></th>
															<th style="border-bottom: 1px solid gray;">1</th>
															<th style="border-bottom: 1px solid gray;">2</th>
															<th></th>
															<th></th>
															<th style="border-bottom: 1px solid gray;">3</th>
															<th style="border-bottom: 1px solid gray;">4</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>A</td>
															<td><input type=button class="btn_seat" id="${go_schedule.pName}_A1" onclick="goSelectSeat('${go_schedule.pName}_A1')"></td>
															<td><input type=button class="btn_seat" id="${go_schedule.pName}_A2" onclick="goSelectSeat('${go_schedule.pName}_A2')"></td>
															<td></td>
															<td></td>
															<td><input type=button class="btn_seat" id="${go_schedule.pName}_A3" onclick="goSelectSeat('${go_schedule.pName}_A3')"></td>
															<td><input type=button class="btn_seat" id="${go_schedule.pName}_A4" onclick="goSelectSeat('${go_schedule.pName}_A4')"></td>
														</tr>
														<tr>
															<td>B</td>
															<td><input type=button class="btn_seat" id="${go_schedule.pName}_B1" onclick="goSelectSeat('${go_schedule.pName}_B1')"></td>
															<td><input type=button class="btn_seat" id="${go_schedule.pName}_B2" onclick="goSelectSeat('${go_schedule.pName}_B2')"></td>
															<td></td>
															<td></td>
															<td><input type=button class="btn_seat" id="${go_schedule.pName}_B3" onclick="goSelectSeat('${go_schedule.pName}_B3')"></td>
															<td><input type=button class="btn_seat" id="${go_schedule.pName}_B4" onclick="goSelectSeat('${go_schedule.pName}_B4')"></td>
														</tr>
														<tr>
															<td>C</td>
															<td><input type=button class="btn_seat" id="${go_schedule.pName}_C1" onclick="goSelectSeat('${go_schedule.pName}_C1')"></td>
															<td><input type=button class="btn_seat" id="${go_schedule.pName}_C2" onclick="goSelectSeat('${go_schedule.pName}_C2')"></td>
															<td></td>
															<td></td>
															<td><input type=button class="btn_seat" id="${go_schedule.pName}_C3" onclick="goSelectSeat('${go_schedule.pName}_C3')"></td>
															<td><input type=button class="btn_seat" id="${go_schedule.pName}_C4" onclick="goSelectSeat('${go_schedule.pName}_C4')"></td>
														</tr>
														<tr>
															<td>D</td>
															<td><input type=button class="btn_seat" id="${go_schedule.pName}_D1" onclick="goSelectSeat('${go_schedule.pName}_D1')"></td>
															<td><input type=button class="btn_seat" id="${go_schedule.pName}_D2" onclick="goSelectSeat('${go_schedule.pName}_D2')"></td>
															<td></td>
															<td></td>
															<td><input type=button class="btn_seat" id="${go_schedule.pName}_D3" onclick="goSelectSeat('${go_schedule.pName}_D3')"></td>
															<td><input type=button class="btn_seat" id="${go_schedule.pName}_D4" onclick="goSelectSeat('${go_schedule.pName}_D4')"></td>
														</tr>
														<tr>
															<td>E</td>
															<td style="border-bottom: 1px solid gray;"><input type=button class="btn_seat" id="${go_schedule.pName}_E1" onclick="goSelectSeat('${go_schedule.pName}_E1')"></td>
															<td style="border-bottom: 1px solid gray;"><input type=button class="btn_seat" id="${go_schedule.pName}_E2" onclick="goSelectSeat('${go_schedule.pName}_E2')"></td>
															<td></td>
															<td></td>
															<td style="border-bottom: 1px solid gray;"><input type=button class="btn_seat" id="${go_schedule.pName}_E3" onclick="goSelectSeat('${go_schedule.pName}_E3')"></td>
															<td style="border-bottom: 1px solid gray;"><input type=button class="btn_seat" id="${go_schedule.pName}_E4" onclick="goSelectSeat('${go_schedule.pName}_E4')"></td>
														</tr>
													</tbody>
												</table>
												<div class="seat_info">
													<table class="tab_seat_info">
														<tr>
															<td>
																<label for="seat_passCnt">탑승 인원</label>
																<input type="text" class="seat_passCnt" id="seat_passCnt_${go_schedule.pName}" value="" readonly>
															</td>
														</tr>
														<tr>
															<td>
																<label for="selected_seat">선택 좌석</label>
																<input type="text" class="selected_seat" id="selected_seat_${go_schedule.pName}" value="" readonly>
															</td>
														</tr>
														<tr style="height: 100px; text-align: right; vertical-align: bottom;">
															<td>
																<input type="button" class="complete_select" id="complete_select" onclick="completeSelectSeat('go_div_${go_schedule.pName}')" value="선택 완료">
																<input type="button" class="close_select" value="닫기" onclick="closeGoSelectSeat('go_div_${go_schedule.pName}')">
															</td>
														</tr>
													</table>
												</div>	
											</div>
										</td>
									</tr>
									</c:forEach>
									<tr><th colspan="9" style="height: 65px; font-size: x-large; font-weight: 700; background-color: slategray; color: white;">오는날 항공편</th></tr>
									<tr>
										<th colspan="3" rowspan="2" style="font-weight: 400; background-color: dimgray; color: white;">출도착시간 (비행시간)</th>
										<th rowspan="2" style="font-weight: 400; background-color: dimgray; color: white;">편명</th>
										<th colspan="3" style="font-weight: 400; color: white; background-color: dimgray;">가격</th>
										<th rowspan="2" style="font-weight: 400; color: white; background-color: dimgray;">잔여 좌석</th>
										<th rowspan="2" style="font-weight: 400; color: white; background-color: dimgray;">좌석 선택</th>
									</tr>
									<tr>
										<th style="font-weight: 400; color: white; background-color: dimgray;">성인</th>
										<th style="font-weight: 400; color: white; background-color: dimgray;">소아</th>
										<th style="font-weight: 400; color: white; background-color: dimgray;">유아</th>
									</tr>
									<tr><td colspan="9" style="height: 65px; font-size: x-large; font-weight: 700;">선택하신 조건에 맞는 예약 가능 항공편이 없습니다.</td></tr>
							</c:when>
							<c:when test="${fn:length(goScheduleList) eq 0 and fn:length(comeScheduleList) ne 0}">
								<tr><td colspan="9" style="height: 65px; font-size: x-large; font-weight: 700;">선택하신 조건에 맞는 예약 가능 항공편이 없습니다.</td></tr>
								<tr><th colspan="9" style="height: 65px; font-size: x-large; font-weight: 700; background-color: slategray; color: white;">오는날 항공편</th></tr>
									<tr>
										<th colspan="3" rowspan="2" style="font-weight: 400; background-color: dimgray; color: white;">출도착시간 (비행시간)</th>
										<th rowspan="2" style="font-weight: 400; background-color: dimgray; color: white;">편명</th>
										<th colspan="3" style="font-weight: 400; color: white; background-color: dimgray;">가격</th>
										<th rowspan="2" style="font-weight: 400; color: white; background-color: dimgray;">잔여 좌석</th>
										<th rowspan="2" style="font-weight: 400; color: white; background-color: dimgray;">좌석 선택</th>
									</tr>
									<tr>
										<th style="font-weight: 400; color: white; background-color: dimgray;">성인</th>
										<th style="font-weight: 400; color: white; background-color: dimgray;">소아</th>
										<th style="font-weight: 400; color: white; background-color: dimgray;">유아</th>
									</tr>
								<c:forEach var="come_schedule" items="${comeScheduleList}">
									<tr class="tr_schedule">
										<td id="${come_schedule.pName}_dep_time" style="border-right: none; vertical-align: middle; font-size: x-large;"><br><c:out value="${come_schedule.pDTime}" /><br>&nbsp;</td> <!-- 출발 시각 -->
										<td style="padding: 0px; border-right: none; border-left: none; vertical-align: middle; text-align: center; color: #848484;">
											<fmt:parseNumber integerOnly="true" value="${come_schedule.pFTime/60}"/>시간 <fmt:formatNumber value="${come_schedule.pFTime%60}" pattern="00"/>분 소요
											<div id="trip_line"><img src="../reservation_static/imgs/trip_line.png"></div>
										</td><!-- 비행 시간 -->
										<td id="${come_schedule.pName}_arr_time" style="border-left: none; vertical-align: middle; font-size: x-large;"><br><c:out value="${come_schedule.pATime}" /><br>&nbsp;</td> <!-- 도착 시각 -->
										<td><c:out value="${come_schedule.pName}" /></td> <!-- 편명 -->
										<td id="${come_schedule.pName}_adult_price"><c:out value="${come_schedule.pAdultPrice}" /></td> <!-- 성인 가격 -->
										<td id="${come_schedule.pName}_child_price"><c:out value="${come_schedule.pChildPrice}" /></td> <!-- 소아 가격 -->
										<td id="${come_schedule.pName}_baby_price"><c:out value="${come_schedule.pBabyPrice}" /></td> <!-- 유아 가격 -->
										<td id="remainSeat_${come_schedule.pName}"><c:out value="${come_schedule.remainSeat}" /></td> <!-- 잔여 좌석 -->
										<td style="position: relative;">
											<input type="button" id="btn_${come_schedule.pName}" onmouseover="checkSeat('btn_${come_schedule.pName}')" onclick="openSelectSeat('come_div_${come_schedule.pName}')" value="좌석 선택">
											<div class="select_seat" id="come_div_${come_schedule.pName}">
												<h3 class="flight_title">&nbsp;&nbsp;&nbsp;${come_schedule.pName}<span class="flight_info" style="font-weight: 300;"> : ${come_schedule.pDTime} → ${come_schedule.pATime}</span></h3>
												<table class="tab_seat" id="tab_seat_${come_schedule.pName}">
													<thead>
														<tr>
															<th></th>
															<th style="border-bottom: 1px solid gray;">1</th>
															<th style="border-bottom: 1px solid gray;">2</th>
															<th></th>
															<th></th>
															<th style="border-bottom: 1px solid gray;">3</th>
															<th style="border-bottom: 1px solid gray;">4</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>A</td>
															<td><input type=button class="btn_seat" id="${come_schedule.pName}_A1" onclick="comeSelectSeat('${come_schedule.pName}_A1')"></td>
															<td><input type=button class="btn_seat" id="${come_schedule.pName}_A2" onclick="comeSelectSeat('${come_schedule.pName}_A2')"></td>
															<td></td>
															<td></td>
															<td><input type=button class="btn_seat" id="${come_schedule.pName}_A3" onclick="comeSelectSeat('${come_schedule.pName}_A3')"></td>
															<td><input type=button class="btn_seat" id="${come_schedule.pName}_A4" onclick="comeSelectSeat('${come_schedule.pName}_A4')"></td>
														</tr>
														<tr>
															<td>B</td>
															<td><input type=button class="btn_seat" id="${come_schedule.pName}_B1" onclick="comeSelectSeat('${come_schedule.pName}_B1')"></td>
															<td><input type=button class="btn_seat" id="${come_schedule.pName}_B2" onclick="comeSelectSeat('${come_schedule.pName}_B2')"></td>
															<td></td>
															<td></td>
															<td><input type=button class="btn_seat" id="${come_schedule.pName}_B3" onclick="comeSelectSeat('${come_schedule.pName}_B3')"></td>
															<td><input type=button class="btn_seat" id="${come_schedule.pName}_B4" onclick="comeSelectSeat('${come_schedule.pName}_B4')"></td>
														</tr>
														<tr>
															<td>C</td>
															<td><input type=button class="btn_seat" id="${come_schedule.pName}_C1" onclick="comeSelectSeat('${come_schedule.pName}_C1')"></td>
															<td><input type=button class="btn_seat" id="${come_schedule.pName}_C2" onclick="comeSelectSeat('${come_schedule.pName}_C2')"></td>
															<td></td>
															<td></td>
															<td><input type=button class="btn_seat" id="${come_schedule.pName}_C3" onclick="comeSelectSeat('${come_schedule.pName}_C3')"></td>
															<td><input type=button class="btn_seat" id="${come_schedule.pName}_C4" onclick="comeSelectSeat('${come_schedule.pName}_C4')"></td>
														</tr>
														<tr>
															<td>D</td>
															<td><input type=button class="btn_seat" id="${come_schedule.pName}_D1" onclick="comeSelectSeat('${come_schedule.pName}_D1')"></td>
															<td><input type=button class="btn_seat" id="${come_schedule.pName}_D2" onclick="comeSelectSeat('${come_schedule.pName}_D2')"></td>
															<td></td>
															<td></td>
															<td><input type=button class="btn_seat" id="${come_schedule.pName}_D3" onclick="comeSelectSeat('${come_schedule.pName}_D3')"></td>
															<td><input type=button class="btn_seat" id="${come_schedule.pName}_D4" onclick="comeSelectSeat('${come_schedule.pName}_D4')"></td>
														</tr>
														<tr>
															<td>E</td>
															<td style="border-bottom: 1px solid gray;"><input type=button class="btn_seat" id="${come_schedule.pName}_E1" onclick="comeSelectSeat('${come_schedule.pName}_E1')"></td>
															<td style="border-bottom: 1px solid gray;"><input type=button class="btn_seat" id="${come_schedule.pName}_E2" onclick="comeSelectSeat('${come_schedule.pName}_E2')"></td>
															<td></td>
															<td></td>
															<td style="border-bottom: 1px solid gray;"><input type=button class="btn_seat" id="${come_schedule.pName}_E3" onclick="comeSelectSeat('${come_schedule.pName}_E3')"></td>
															<td style="border-bottom: 1px solid gray;"><input type=button class="btn_seat" id="${come_schedule.pName}_E4" onclick="comeSelectSeat('${come_schedule.pName}_E4')"></td>
														</tr>
													</tbody>
												</table>
												<div class="seat_info">
													<table class="tab_seat_info">
														<tr>
															<td>
																<label for="seat_passCnt">탑승 인원</label>
																<input type="text" class="seat_passCnt" id="seat_passCnt_${come_schedule.pName}" value="" readonly>
															</td>
														</tr>
														<tr>
															<td>
																<label for="selected_seat">선택 좌석</label>
																<input type="text" class="selected_seat" id="selected_seat_${come_schedule.pName}" value="" readonly>
															</td>
														</tr>
														<tr style="height: 100px; text-align: right; vertical-align: bottom;">
															<td>
																<input type="button" class="complete_select" id="complete_select" onclick="completeSelectSeat('come_div_${come_schedule.pName}')" value="선택 완료">
																<input type="button" class="close_select" value="닫기" onclick="closeComeSelectSeat('come_div_${come_schedule.pName}')">
															</td>
														</tr>
													</table>
												</div>	
											</div>
										</td> <!-- 좌석 선택 버튼 -->
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:forEach var="go_schedule" items="${goScheduleList}">
								<tr class="tr_schedule">
									<td id="${go_schedule.pName}_dep_time" style="border-right: none; vertical-align: middle; font-size: x-large;"><br><c:out value="${go_schedule.pDTime}" /><br>&nbsp;</td> <!-- 출발 시각 -->
									<td style="padding: 0px; border-right: none; border-left: none; vertical-align: middle; text-align: center; color: #848484;">
										<fmt:parseNumber integerOnly="true" value="${go_schedule.pFTime/60}"/>시간 <fmt:formatNumber value="${go_schedule.pFTime%60}" pattern="00"/>분 소요
										<div id="trip_line"><img src="../reservation_static/imgs/trip_line.png"></div>
									</td><!-- 비행 시간 -->
									<td id="${go_schedule.pName}_arr_time" style="border-left: none; vertical-align: middle; font-size: x-large;"><br><c:out value="${go_schedule.pATime}" /><br>&nbsp;</td> <!-- 도착 시각 -->
									<td><c:out value="${go_schedule.pName}" /></td> <!-- 편명 -->
									<td id="${go_schedule.pName}_adult_price"><c:out value="${go_schedule.pAdultPrice}" /></td> <!-- 성인 가격 -->
									<td id="${go_schedule.pName}_child_price"><c:out value="${go_schedule.pChildPrice}" /></td> <!-- 소아 가격 -->
									<td id="${go_schedule.pName}_baby_price"><c:out value="${go_schedule.pBabyPrice}" /></td> <!-- 유아 가격 -->
									<td id="remainSeat_${go_schedule.pName}"><c:out value="${go_schedule.remainSeat}" /></td> <!-- 잔여 좌석 -->
									<td style="position: relative;">
										<input type="button" id="btn_${go_schedule.pName}" onmouseover="checkSeat('btn_${go_schedule.pName}')" onclick="openSelectSeat('go_div_${go_schedule.pName}')" value="좌석 선택">
										<div class="select_seat" id="go_div_${go_schedule.pName}">
											<h3 class="flight_title">&nbsp;&nbsp;&nbsp;${go_schedule.pName}<span class="flight_info" style="font-weight: 300;"> : ${go_schedule.pDTime} → ${go_schedule.pATime}</span></h3>
											<table class="tab_seat" id="tab_seat_${go_schedule.pName}">
												<thead>
													<tr>
														<th></th>
														<th style="border-bottom: 1px solid gray;">1</th>
														<th style="border-bottom: 1px solid gray;">2</th>
														<th></th>
														<th></th>
														<th style="border-bottom: 1px solid gray;">3</th>
														<th style="border-bottom: 1px solid gray;">4</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>A</td>
														<td><input type=button class="btn_seat" id="${go_schedule.pName}_A1" onclick="goSelectSeat('${go_schedule.pName}_A1')"></td>
														<td><input type=button class="btn_seat" id="${go_schedule.pName}_A2" onclick="goSelectSeat('${go_schedule.pName}_A2')"></td>
														<td></td>
														<td></td>
														<td><input type=button class="btn_seat" id="${go_schedule.pName}_A3" onclick="goSelectSeat('${go_schedule.pName}_A3')"></td>
														<td><input type=button class="btn_seat" id="${go_schedule.pName}_A4" onclick="goSelectSeat('${go_schedule.pName}_A4')"></td>
													</tr>
													<tr>
														<td>B</td>
														<td><input type=button class="btn_seat" id="${go_schedule.pName}_B1" onclick="goSelectSeat('${go_schedule.pName}_B1')"></td>
														<td><input type=button class="btn_seat" id="${go_schedule.pName}_B2" onclick="goSelectSeat('${go_schedule.pName}_B2')"></td>
														<td></td>
														<td></td>
														<td><input type=button class="btn_seat" id="${go_schedule.pName}_B3" onclick="goSelectSeat('${go_schedule.pName}_B3')"></td>
														<td><input type=button class="btn_seat" id="${go_schedule.pName}_B4" onclick="goSelectSeat('${go_schedule.pName}_B4')"></td>
													</tr>
													<tr>
														<td>C</td>
														<td><input type=button class="btn_seat" id="${go_schedule.pName}_C1" onclick="goSelectSeat('${go_schedule.pName}_C1')"></td>
														<td><input type=button class="btn_seat" id="${go_schedule.pName}_C2" onclick="goSelectSeat('${go_schedule.pName}_C2')"></td>
														<td></td>
														<td></td>
														<td><input type=button class="btn_seat" id="${go_schedule.pName}_C3" onclick="goSelectSeat('${go_schedule.pName}_C3')"></td>
														<td><input type=button class="btn_seat" id="${go_schedule.pName}_C4" onclick="goSelectSeat('${go_schedule.pName}_C4')"></td>
													</tr>
													<tr>
														<td>D</td>
														<td><input type=button class="btn_seat" id="${go_schedule.pName}_D1" onclick="goSelectSeat('${go_schedule.pName}_D1')"></td>
														<td><input type=button class="btn_seat" id="${go_schedule.pName}_D2" onclick="goSelectSeat('${go_schedule.pName}_D2')"></td>
														<td></td>
														<td></td>
														<td><input type=button class="btn_seat" id="${go_schedule.pName}_D3" onclick="goSelectSeat('${go_schedule.pName}_D3')"></td>
														<td><input type=button class="btn_seat" id="${go_schedule.pName}_D4" onclick="goSelectSeat('${go_schedule.pName}_D4')"></td>
													</tr>
													<tr>
														<td>E</td>
														<td style="border-bottom: 1px solid gray;"><input type=button class="btn_seat" id="${go_schedule.pName}_E1" onclick="goSelectSeat('${go_schedule.pName}_E1')"></td>
														<td style="border-bottom: 1px solid gray;"><input type=button class="btn_seat" id="${go_schedule.pName}_E2" onclick="goSelectSeat('${go_schedule.pName}_E2')"></td>
														<td></td>
														<td></td>
														<td style="border-bottom: 1px solid gray;"><input type=button class="btn_seat" id="${go_schedule.pName}_E3" onclick="goSelectSeat('${go_schedule.pName}_E3')"></td>
														<td style="border-bottom: 1px solid gray;"><input type=button class="btn_seat" id="${go_schedule.pName}_E4" onclick="goSelectSeat('${go_schedule.pName}_E4')"></td>
													</tr>
												</tbody>
											</table>
											<div class="seat_info">
												<table class="tab_seat_info">
													<tr>
														<td>
															<label for="seat_passCnt">탑승 인원</label>
															<input type="text" class="seat_passCnt" id="seat_passCnt_${go_schedule.pName}" value="" readonly>
														</td>
													</tr>
													<tr>
														<td>
															<label for="selected_seat">선택 좌석</label>
															<input type="text" class="selected_seat" id="selected_seat_${go_schedule.pName}" value="" readonly>
														</td>
													</tr>
													<tr style="height: 100px; text-align: right; vertical-align: bottom;">
														<td>
															<input type="button" class="complete_select" id="complete_select" onclick="completeSelectSeat('go_div_${go_schedule.pName}')" value="선택 완료">
															<input type="button" class="close_select" value="닫기" onclick="closeGoSelectSeat('go_div_${go_schedule.pName}')">
														</td>
													</tr>
												</table>
											</div>	
										</div>
									</td> <!-- 좌석 선택 버튼 -->
								</tr>
								</c:forEach>
								<tr><th colspan="9" style="height: 65px; font-size: x-large; font-weight: 700; background-color: slategray; color: white;">오는날 항공편</th></tr>
								<tr>
									<th colspan="3" rowspan="2" style="font-weight: 400; background-color: dimgray; color: white;">출도착시간 (비행시간)</th>
									<th rowspan="2" style="font-weight: 400; background-color: dimgray; color: white;">편명</th>
									<th colspan="3" style="font-weight: 400; color: white; background-color: dimgray;">가격</th>
									<th rowspan="2" style="font-weight: 400; color: white; background-color: dimgray;">잔여 좌석</th>
									<th rowspan="2" style="font-weight: 400; color: white; background-color: dimgray;">좌석 선택</th>
								</tr>
								<tr>
									<th style="font-weight: 400; color: white; background-color: dimgray;">성인</th>
									<th style="font-weight: 400; color: white; background-color: dimgray;">소아</th>
									<th style="font-weight: 400; color: white; background-color: dimgray;">유아</th>
								</tr>
								<c:forEach var="come_schedule" items="${comeScheduleList}">
								<tr class="tr_schedule">
									<td id="${come_schedule.pName}_dep_time" style="border-right: none; vertical-align: middle; font-size: x-large;"><br><c:out value="${come_schedule.pDTime}" /><br>&nbsp;</td> <!-- 출발 시각 -->
									<td style="padding: 0px; border-right: none; border-left: none; vertical-align: middle; text-align: center; color: #848484;">
										<fmt:parseNumber integerOnly="true" value="${come_schedule.pFTime/60}"/>시간 <fmt:formatNumber value="${come_schedule.pFTime%60}" pattern="00"/>분 소요
										<div id="trip_line"><img src="../reservation_static/imgs/trip_line.png"></div>
									</td><!-- 비행 시간 -->
									<td id="${come_schedule.pName}_arr_time" style="border-left: none; vertical-align: middle; font-size: x-large;"><br><c:out value="${come_schedule.pATime}" /><br>&nbsp;</td> <!-- 도착 시각 -->
									<td><c:out value="${come_schedule.pName}" /></td> <!-- 편명 -->
									<td id="${come_schedule.pName}_adult_price"><c:out value="${come_schedule.pAdultPrice}" /></td> <!-- 성인 가격 -->
									<td id="${come_schedule.pName}_child_price"><c:out value="${come_schedule.pChildPrice}" /></td> <!-- 소아 가격 -->
									<td id="${come_schedule.pName}_baby_price"><c:out value="${come_schedule.pBabyPrice}" /></td> <!-- 유아 가격 -->
									<td id="remainSeat_${come_schedule.pName}"><c:out value="${come_schedule.remainSeat}" /></td> <!-- 잔여 좌석 -->
									<td style="position: relative;">
										<input type="button" id="btn_${come_schedule.pName}" onmouseover="checkSeat('btn_${come_schedule.pName}')" onclick="openSelectSeat('come_div_${come_schedule.pName}')" value="좌석 선택">
										<div class="select_seat" id="come_div_${come_schedule.pName}">
											<h3 class="flight_title">&nbsp;&nbsp;&nbsp;${come_schedule.pName}<span class="flight_info" style="font-weight: 300;"> : ${come_schedule.pDTime} → ${come_schedule.pATime}</span></h3>
											<table class="tab_seat" id="tab_seat_${come_schedule.pName}">
												<thead>
													<tr>
														<th></th>
														<th style="border-bottom: 1px solid gray;">1</th>
														<th style="border-bottom: 1px solid gray;">2</th>
														<th></th>
														<th></th>
														<th style="border-bottom: 1px solid gray;">3</th>
														<th style="border-bottom: 1px solid gray;">4</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>A</td>
														<td><input type=button class="btn_seat" id="${come_schedule.pName}_A1" onclick="comeSelectSeat('${come_schedule.pName}_A1')"></td>
														<td><input type=button class="btn_seat" id="${come_schedule.pName}_A2" onclick="comeSelectSeat('${come_schedule.pName}_A2')"></td>
														<td></td>
														<td></td>
														<td><input type=button class="btn_seat" id="${come_schedule.pName}_A3" onclick="comeSelectSeat('${come_schedule.pName}_A3')"></td>
														<td><input type=button class="btn_seat" id="${come_schedule.pName}_A4" onclick="comeSelectSeat('${come_schedule.pName}_A4')"></td>
													</tr>
													<tr>
														<td>B</td>
														<td><input type=button class="btn_seat" id="${come_schedule.pName}_B1" onclick="comeSelectSeat('${come_schedule.pName}_B1')"></td>
														<td><input type=button class="btn_seat" id="${come_schedule.pName}_B2" onclick="comeSelectSeat('${come_schedule.pName}_B2')"></td>
														<td></td>
														<td></td>
														<td><input type=button class="btn_seat" id="${come_schedule.pName}_B3" onclick="comeSelectSeat('${come_schedule.pName}_B3')"></td>
														<td><input type=button class="btn_seat" id="${come_schedule.pName}_B4" onclick="comeSelectSeat('${come_schedule.pName}_B4')"></td>
													</tr>
													<tr>
														<td>C</td>
														<td><input type=button class="btn_seat" id="${come_schedule.pName}_C1" onclick="comeSelectSeat('${come_schedule.pName}_C1')"></td>
														<td><input type=button class="btn_seat" id="${come_schedule.pName}_C2" onclick="comeSelectSeat('${come_schedule.pName}_C2')"></td>
														<td></td>
														<td></td>
														<td><input type=button class="btn_seat" id="${come_schedule.pName}_C3" onclick="comeSelectSeat('${come_schedule.pName}_C3')"></td>
														<td><input type=button class="btn_seat" id="${come_schedule.pName}_C4" onclick="comeSelectSeat('${come_schedule.pName}_C4')"></td>
													</tr>
													<tr>
														<td>D</td>
														<td><input type=button class="btn_seat" id="${come_schedule.pName}_D1" onclick="comeSelectSeat('${come_schedule.pName}_D1')"></td>
														<td><input type=button class="btn_seat" id="${come_schedule.pName}_D2" onclick="comeSelectSeat('${come_schedule.pName}_D2')"></td>
														<td></td>
														<td></td>
														<td><input type=button class="btn_seat" id="${come_schedule.pName}_D3" onclick="comeSelectSeat('${come_schedule.pName}_D3')"></td>
														<td><input type=button class="btn_seat" id="${come_schedule.pName}_D4" onclick="comeSelectSeat('${come_schedule.pName}_D4')"></td>
													</tr>
													<tr>
														<td>E</td>
														<td style="border-bottom: 1px solid gray;"><input type=button class="btn_seat" id="${come_schedule.pName}_E1" onclick="comeSelectSeat('${come_schedule.pName}_E1')"></td>
														<td style="border-bottom: 1px solid gray;"><input type=button class="btn_seat" id="${come_schedule.pName}_E2" onclick="comeSelectSeat('${come_schedule.pName}_E2')"></td>
														<td></td>
														<td></td>
														<td style="border-bottom: 1px solid gray;"><input type=button class="btn_seat" id="${come_schedule.pName}_E3" onclick="comeSelectSeat('${come_schedule.pName}_E3')"></td>
														<td style="border-bottom: 1px solid gray;"><input type=button class="btn_seat" id="${come_schedule.pName}_E4" onclick="comeSelectSeat('${come_schedule.pName}_E4')"></td>
													</tr>
												</tbody>
											</table>
											<div class="seat_info">
												<table class="tab_seat_info">
													<tr>
														<td>
															<label for="seat_passCnt">탑승 인원</label>
															<input type="text" class="seat_passCnt" id="seat_passCnt_${come_schedule.pName}" value="" readonly>
														</td>
													</tr>
													<tr>
														<td>
															<label for="selected_seat">선택 좌석</label>
															<input type="text" class="selected_seat" id="selected_seat_${come_schedule.pName}" value="" readonly>
														</td>
													</tr>
													<tr style="height: 100px; text-align: right; vertical-align: bottom;">
														<td>
															<input type="button" class="complete_select" id="complete_select" onclick="completeSelectSeat('come_div_${come_schedule.pName}')" value="선택 완료">
															<input type="button" class="close_select" value="닫기" onclick="closeComeSelectSeat('come_div_${come_schedule.pName}')">
														</td>
													</tr>
												</table>
											</div>	
										</div>
									</td> <!-- 좌석 선택 버튼 -->
								</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
				</table>
				
				<!-- ajax wrap-loading -->
				<div class="wrap-loading display-none">
				    <div><img src="../reservation_static/imgs/airplane-loader.gif" /></div>
				    <h2>선택하신 여정을 찾고 있습니다</h2>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="estimate_container">
	<h1 style="font-weight: 700; font-size: xx-large; padding-bottom: 15px;">예상운임 총액</h1>
	<form action="reservation_payment.rsv" method="post"> <%-- 주소 넣을 것 --%>
		<table class="tab_estimate" id="tab_estimate">
			<thead>
				<tr>
					<th>편명</th>
					<th>출발지</th>
					<th>출발시간</th>
					<th>도착지</th>
					<th>도착시간</th>
					<th>탑승 인원</th>
					<th>좌석</th>
					<th>가격</th>
				</tr>
			</thead>
			<tbody>
				<tr class="" id="not_selected">
					<td colspan="8" style="height:60px; font-weight: 700; font-size: x-large;">여정을 선택해주시길 바랍니다.</td>
				</tr>
				<tr class="display-none" id="one_result_tr">
					<td id="one_pName"></td>
					<td id="one_dep"></td>
					<td id="one_dep_date"></td>
					<td id="one_arr"></td>
					<td id="one_arr_date"></td>
					<td id="one_passenger_cnt"></td>
					<td id="one_seats"></td>
					<td id="one_price"></td>
				</tr>
				<tr class="display-none" id="go_result_tr">
					<td id="go_pName"></td>
					<td id="go_dep"></td>
					<td id="go_dep_date"></td>
					<td id="go_arr"></td>
					<td id="go_arr_date"></td>
					<td id="go_passenger_cnt"></td>
					<td id="go_seats"></td>
					<td id="go_price"></td>
				</tr>
				<tr class="display-none" id="come_result_tr">
					<td id="come_pName"></td>
					<td id="come_dep"></td>
					<td id="come_dep_date"></td>
					<td id="come_arr"></td>
					<td id="come_arr_date"></td>
					<td id="come_passenger_cnt"></td>
					<td id="come_seats"></td>
					<td id="come_price"></td>
				</tr>
				<tr class="display-none active_row" id="total_price_tr">
					<td colspan="8" style="border-left: none; border-right: none; color: black;">
						<div class="toRight" style="float: none; text-align: right;">
							<span class="total_title" style="display: inline-block; font-size: large;">총 결제 금액</span>
						</div>
						<div id="toRight" style="text-align: right; float: none; flex: 1;">
							<span id="total_price" style="font-weight: 700; font-size: xx-large;"></span>
						</div>
					</td>
				</tr>
				<tr class="display-none" id="input_hidden_tr">
					<td>
						<input type="hidden" id="one_values" name="one_values">
						<input type="hidden" id="go_values" name="go_values">
						<input type="hidden" id="come_values" name="come_values">
					</td>
				</tr>
				<tr class="display-none active_row" id="btn_submit_tr">
					<td class="active_row" colspan="8">
					<c:choose>
						<c:when test="${sessionScope.id ne null}">
						<input type="submit" value="결제하기" style="font-weight: 400; font-size: larger; width: 200px; height: 50px; background-color: #475774; color: white; margin-top: 8px;">
						</c:when>
						<c:otherwise>
						<input type="submit" value="결제하기" style="font-weight: 400; font-size: larger; width: 200px; height: 50px; background-color: white; color: black; margin-top: 8px;" disabled="disabled"> <br>
						<a href="#">로그인 후 이용 가능합니다.</a>
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
</section>

<footer><jsp:include page="./footer.jsp" /></footer>

</body>
</html>