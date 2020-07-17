<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.kaja_air.reserve.repository.ReserveDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    	request.setCharacterEncoding("UTF-8");
    	String pName = request.getParameter("pName");
    	
    	ReserveDAO dao = ReserveDAO.getInstance();
    	JSONObject seatJsonObj = dao.getSeatJson(pName);
    	
    	out.println(seatJsonObj.toJSONString());
    %>
