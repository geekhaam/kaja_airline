<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.kaja_air.reserve.repository.ReserveDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%
    	request.setCharacterEncoding("UTF-8");
    	String tripType = request.getParameter("tripType");
    	String depAirport = request.getParameter("depAirport");
    	String arrAirport = request.getParameter("arrAirport");
    	
    	//날짜 yyyyMMdd 포맷으로 바꿔주는 로직
    	String bDate = request.getParameter("bDate");
    	StringBuffer sb = new StringBuffer();
    	if(bDate != null) {
    		String[] oneDateSplit = bDate.split("-");
    		for(String s : oneDateSplit) {
    	sb.append(s);
    		}		
    	}
    	String strBDate = new String(sb);
    	
    	String goDate = request.getParameter("goDate");
    	sb = new StringBuffer();
    	if(goDate != null) {
    		String[] goDateSplit = goDate.split("-");
    		for(String s : goDateSplit) {
    	sb.append(s);
    		}		
    	}
    	String strGoDate = new String(sb);
    	
    	String comeDate = request.getParameter("comeDate");
    	sb = new StringBuffer();
    	if(comeDate != null) {
    		String[] comeDateSplit = comeDate.split("-");
    		for(String s : comeDateSplit) {
    	sb.append(s);
    		}		
    	}
    	String strComeDate = new String(sb);
    	
    	int passengerCnt = Integer.parseInt(request.getParameter("passengerCnt"));
    	
    	ReserveDAO dao = ReserveDAO.getInstance();
    	JSONObject oneScheduleObj = new JSONObject();
    	JSONObject goScheduleObj = new JSONObject();
    	JSONObject comeScheduleObj = new JSONObject();
    	JSONArray jsonArr = new JSONArray();
    	if(tripType.equals("편도")) {
    		oneScheduleObj.put("oneSchedule", dao.getScheduleJson(depAirport, arrAirport, strBDate));
    		jsonArr.add(oneScheduleObj);		
    	} else {
    		goScheduleObj.put("goSchedule", dao.getScheduleJson(depAirport, arrAirport, strGoDate));
    		comeScheduleObj.put("comeSchedule", dao.getScheduleJson(arrAirport, depAirport, strComeDate));
    		jsonArr.add(goScheduleObj);
    		jsonArr.add(comeScheduleObj);
    	}
    	out.println(jsonArr.toJSONString());
    %>
