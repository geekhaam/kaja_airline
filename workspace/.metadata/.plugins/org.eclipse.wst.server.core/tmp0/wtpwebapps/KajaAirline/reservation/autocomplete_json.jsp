<%@page import="java.io.PrintWriter"%>
<%@page import="com.kaja_air.reserve.repository.ReserveDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="application/json; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String searchValue = request.getParameter("searchValue");
	
	ReserveDAO dao = ReserveDAO.getInstance();
	JSONArray airJson = dao.getAirportJson();
%>
<%= airJson.toJSONString()%>
