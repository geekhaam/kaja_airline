<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
    				console.log(result);
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
        				console.log(result);
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

<!-- 탑승 인원 초기값 설정 -->
<script type="text/javascript">
	$(function() {
		var adultCnt = $("#adultCnt").val();
	    var childCnt = $("#childCnt").val();
	    var babyCnt = $("#babyCnt").val();
	    $("#boardingPerson").val("성인 "+adultCnt+", 유아 "+childCnt+", 소아 "+babyCnt);
	});
</script>

</head>
<body>
<table class="tab_date_person" style="border: 0px; border-spacing: 10px;">
	<tr>
		<td>
			<div class="date_go">
				<label for="goDate">가는날</label> <br>
				<input type="date" id="goDate" name="goDate" value="" style="width:130px; height:30px; font-size: small;" required="required">			
			</div>
		</td>
		<td>
			<div class="date_come">
				<label for="comeDate">오는날</label> <br>
				<input type="date" id="comeDate" name="comeDate" value=""style="width:130px; height:30px; font-size: small;" required="required">			
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<div class="person">
				<label for="boardingPerson">탑승인원</label> <br>
				<input type="text" id="boardingPerson" name="bPerson" value="" onclick="javascript: openPersonLy('passenger');" style="width:260px; height:30px; position: relative;" readonly="readonly">
				<div class="passenger" id="passenger">
					<table class="selectPassenger" style="border: 0px; border-spacing: 0px;" >
						<tr>
							<td>
								<div class="pass_adult" id="adult">
									<h6>성인&nbsp;<span id="adultAge">(만 12세 이상)</span></h6>
									<div class="btn_number_box">
										<input type="button" name="btn_number_minus" onclick="modifyProductQuantity('adultCnt', -1);" value="-" style="width: 25px; height:25px;" >
										<input type="text" id="adultCnt" name="adultCount" title="성인 탑승 인원" oninput="inputPassenger()" value="1" style="text-align: center; width:50px; height:20px;" >
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
										<input type="text" id="childCnt" name="childCount" title="소아 탑승 인원" oninput="inputPassenger()" value="0" style="text-align: center; width:50px; height:20px;" >
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
										<input type="text" id="babyCnt" name="babyCount" title="유아 탑승 인원" oninput="inputPassenger()" value="0" style="text-align: center; width:50px; height:20px;" >
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
</body>
</html>