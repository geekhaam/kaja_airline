<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- ���� �˻� �ڵ��ϼ� Ajax ���� -->
<script type="text/javascript">

    $(document).ready(function() {
    	$("#depAirport").autocomplete({
    	source : function(request, response) {
    		$.ajax({
    			url : 'autocomplete_json.jsp',
    			dataType : 'json',
    			type : 'get',
    			success : function(result) { //������
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
    				alert("��ſ� �����߽��ϴ�.");
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
        			success : function(result) { //������
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
        				alert("��ſ� �����߽��ϴ�.");
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
</head>
<body>
	<table class="tab_selectDepArr" style="border: 0px; border-spacing: 10px">
		<tr>
			<td>
				<div class="dep">
					<label for="depAirport">�����</label> <br>
					<input type="text" id="depAirport" name="depAirport" required="required" style="width:200px; height:50px;" />
					<div class="btn_airport_list1" style="position: relative;">
						<button name="btn_airport_list1" type="button" onclick="javascript: openAirportList(document.getElementById('dep_airport_list'));">�ֿ䵵�� �ٷμ���</button>
					</div>
					<div class="dep_airport_list" id="dep_airport_list" style="position: absolute; display: none; border: 1px solid black; background-color: white; padding: 10px">
						<strong class="airport_list_title">�ֿ䵵�� �ٷμ���</strong>
						<h5>������</h5>
						<ul style="list-style:none; padding-left:0px;">
							<li>
								<a href="#none" onclick="javascript: setDepAirport(this);">����/��õ ICN</a>
							</li>
							<li>
								<a href="#none" onclick="javascript: setDepAirport(this);">����/���� GMP</a>
							</li>
						</ul>
					</div>
				</div>					
			</td>
			<td>
				<div class="arr">
					<label for="arrAirport">������</label> <br>
					<input type="text" id="arrAirport" name="arrAirport" required="required" style="width:200px; height:50px;" />
					<div class="btn_airport_list2" style="position: relative;">
						<button name="btn_airport_list2" type="button" onclick="javascript: openAirportList(document.getElementById('arr_airport_list'));">�ֿ䵵�� �ٷμ���</button>
					</div>
					<div class="arr_airport_list" id="arr_airport_list" style="position: absolute; display: none; border: 1px solid black; background-color: white; padding: 10px">
						<strong class="airport_list_title">�ֿ䵵�� �ٷμ���</strong>
						<h5>������</h5>
						<ul style="list-style:none; padding-left:0px;">
							<li>
								<a href="#none" onclick="javascript: setArrAirport(this);">����/���� GMP</a>
							</li>
						</ul>
					</div>
				</div>					
			</td>
			<td valign="top">
				<div class="date_go">
					<label for="goDate">���³�</label> <br>
					<input type="date" id="goDate" name="goDate" required="required" style="width:200px; height:50px;" >			
				</div>
			</td>
			<td valign="top">
				<div class="date_come">
					<label for="comeDate">���³�</label> <br>
					<input type="date" id="comeDate" name="comeDate" required="required" style="width:200px; height:50px;" >			
				</div>
			</td>
		</tr>
	</table>
</body>
</html>