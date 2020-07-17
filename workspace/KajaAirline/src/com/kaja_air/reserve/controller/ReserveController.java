package com.kaja_air.reserve.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;

import com.kaja_air.reserve.model.Schedule;
import com.kaja_air.reserve.repository.ReserveDAO;

/**
 * Servlet implementation class ReserveController
 */
@WebServlet("*.rsv")
public class ReserveController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private ReserveDAO dao;
    /**
     * @throws SQLException 
     * @throws ClassNotFoundException 
     * @see HttpServlet#HttpServlet()
     */
    public ReserveController() throws ClassNotFoundException, SQLException {
        super();
        dao = ReserveDAO.getInstance();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		doRequest(request, response);
	}
	
	private void doRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] uri1 = request.getRequestURI().split("/");
		/*
		String conPath = request.getContextPath();
		int upperCateLength = "/reservation/".length();
		uri = uri.substring(conPath.length()+upperCateLength, uri.lastIndexOf("."));
		*/
		
		String uri=uri1[uri1.length-1].substring(0, uri1[uri1.length-1].lastIndexOf("."));
		
		String viewPage = delimRequest(uri, request, response);
		
		if(viewPage != null) {
			RequestDispatcher dp = request.getRequestDispatcher(viewPage);
			dp.forward(request, response);
		}
	}
	
	private String delimRequest(String uri, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String viewPage = null;
		
		/*ServletContext application = request.getServletContext();*/
		/*HttpSession session = request.getSession(false);*/
		/*session.setAttribute("id", "a");*/
		PrintWriter out = response.getWriter();
		
		switch(uri) {
		case "reservation_main" :
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.sendRedirect("/KajaAirline/reservation/reservation_main.jsp"); //KajaAirline(취합 프로젝트명) 변경 필요
			break;
			
		case "reservation_result" :
			
			String tripType = request.getParameter("tripType").equals("") ? "편도" : request.getParameter("tripType");
			if(tripType.equals("편도")) {
				
				request.setAttribute("tripType", tripType);
				
				String departure = request.getParameter("depAirport");
				String arrive = request.getParameter("arrAirport");
				String depTime = request.getParameter("bDate");
				StringBuffer sb = new StringBuffer();
				String[] dateSplit = depTime.split("-");
				for(String s : dateSplit) {
					sb.append(s);
				}
				String strDepTime = new String(sb);
				ArrayList<Schedule> sList = dao.getScheduleList(departure, arrive, strDepTime);
				request.setAttribute("scheduleList", sList);
				
			} else { //왕복일 경우엔 list가 2개 필요하다
				
				request.setAttribute("tripType", tripType);
				
				//가는날 항공편 리스트 받아온다.
				String departure = request.getParameter("depAirport");
				String arrive = request.getParameter("arrAirport");
				String goTime = request.getParameter("goDate");
				StringBuffer goSb = new StringBuffer();
				String[] goDateSplit = goTime.split("-");
				for(String s : goDateSplit) {
					goSb.append(s);
				}
				String strGoTime = new String(goSb);
				ArrayList<Schedule> goList = dao.getScheduleList(departure, arrive, strGoTime);
				request.setAttribute("goScheduleList", goList);
				
				//오는날 항공편 리스트 받아온다.
				String comeTime = request.getParameter("comeDate");
				StringBuffer comeSb = new StringBuffer();
				String[] comeDateSplit = comeTime.split("-");
				for(String s : comeDateSplit) {
					comeSb.append(s);
				}
				String strComeTime = new String(comeSb);
				ArrayList<Schedule> comeList = dao.getScheduleList(arrive, departure, strComeTime); //출발지와 도착지를 역순으로 넣어준 뒤, 돌아오는 날짜로 검색
				request.setAttribute("comeScheduleList", comeList);
			}
			
			viewPage = "/reservation/reservation_result.jsp";
			break;
			
		case "reservation_payment" :
			request.setCharacterEncoding("EUC-KR");
			String oneWayValues = request.getParameter("one_values");
			String goValues = request.getParameter("go_values");
			String comeValues = request.getParameter("come_values");
			
			//편도인 경우
			if(!oneWayValues.equals("")) {
				String[] valueArr = oneWayValues.split("#");
				request.setAttribute("rPId", valueArr[0]);						//0 : 비행기 번호(편명)
				request.setAttribute("rDTime", valueArr[2]);					//2 : 출발 시간
				request.setAttribute("rDeparture", valueArr[1]);				//1 : 출발지
				request.setAttribute("rATime", valueArr[4]);					//4 : 도착 시간
				request.setAttribute("rArrive", valueArr[3]);					//3 : 도착지
				request.setAttribute("rSeat", valueArr[6]);						//6 : 좌석
				request.setAttribute("price", Integer.parseInt(valueArr[7])); 	//7 : 총 가격
				String passengers = valueArr[5];								//5 : 인원수 => 총 n명(성인 a, 소아 b, 유아 c) 이런 형식
			}
			//왕복인 경우
			else {
				String[] goValArr = goValues.split("#");
				request.setAttribute("rPId", goValArr[0]);
				request.setAttribute("rDTime", goValArr[2]);
				request.setAttribute("rDeparture", goValArr[1]);
				request.setAttribute("rATime", goValArr[4]);
				request.setAttribute("rArrive", goValArr[3]);
				request.setAttribute("rSeat", goValArr[6]);	
				request.setAttribute("price", Integer.parseInt(goValArr[7]));
				
				String[] comeValArr = comeValues.split("#");
				request.setAttribute("rPId2", comeValArr[0]);
				request.setAttribute("rDTime2", comeValArr[2]);
				request.setAttribute("rDeparture2", comeValArr[1]);
				request.setAttribute("rATime2", comeValArr[4]);
				request.setAttribute("rArrive2", comeValArr[3]);
				request.setAttribute("rSeat2", comeValArr[6]);
				request.setAttribute("price2", Integer.parseInt(comeValArr[7]));
			}
			
			viewPage = "/reservation/reservation_payment.jsp";
			break;
			
		case "paymentComplete" :
			response.setContentType("text/html; charset=EUC-KR");
			if(request.getParameter("rPId2") == null) { //편도
				String rPIdStr = request.getParameter("rPId");
				int rPId = Integer.parseInt(rPIdStr.substring(6));
				//ICNNRT1
				String rId = request.getParameter("rId");
				String rDTime = request.getParameter("rDTime");
				String rDeparture = request.getParameter("rDeparture");
				String rATime = request.getParameter("rATime");
				String rArrive = request.getParameter("rArrive");
				String rSeatSplit = request.getParameter("rSeat");
				String[] rSeatArr = rSeatSplit.split(" ");
				String rSeat = String.join("_", rSeatArr);
				
				if(!dao.insertReservation(rPId, rId, rDTime, rDeparture, rATime, rArrive, rSeat)) {
					out.println("<script>\r\n"
								+ "alert(\"결제에 실패했습니다!\");\r\n"
								+ "location.href = history.back();\r\n"
								+ "</script>");
				}
				else {
					if(!dao.updateSeat(rPIdStr, rSeat)) {
						out.println("<script>\r\n"
								+ "alert(\"결제에 실패했습니다!\");\r\n"
								+ "location.href = history.back();\r\n"
								+ "</script>");
					} else {
						out.println("<script>\r\n"
								+ "alert(\"결제에 성공했습니다!\");\r\n"
								+ "location.href = \"/KajaAirline/reservation/reservation_complete.jsp\";\r\n"//KajaAirline(취합 프로젝트명) 변경 필요
								+ "</script>");
					}
				}
				out.flush();
				out.close();
			} else { //왕복
				//가는날
				String rPIdStr = request.getParameter("rPId");
				int rPId = Integer.parseInt(rPIdStr.substring(6));
				//ICNNRT1
				String rId = request.getParameter("rId");
				String rDTime = request.getParameter("rDTime");
				String rDeparture = request.getParameter("rDeparture");
				String rATime = request.getParameter("rATime");
				String rArrive = request.getParameter("rArrive");
				String rSeatSplit = request.getParameter("rSeat");
				String[] rSeatArr = rSeatSplit.split(" ");
				String rSeat = String.join("_", rSeatArr);
				
				//오는날
				String rPIdStr2 = request.getParameter("rPId2");
				int rPId2 = Integer.parseInt(rPIdStr2.substring(6));
				//ICNNRT1
				String rId2 = request.getParameter("rId2");
				String rDTime2 = request.getParameter("rDTime2");
				String rDeparture2 = request.getParameter("rDeparture2");
				String rATime2 = request.getParameter("rATime2");
				String rArrive2 = request.getParameter("rArrive2");
				String rSeatSplit2 = request.getParameter("rSeat2");
				String[] rSeatArr2 = rSeatSplit2.split(" ");
				String rSeat2 = String.join("_", rSeatArr2);
								
				if(!dao.insertReservation(rPId, rId, rDTime, rDeparture, rATime, rArrive, rSeat)) { //가는날 예약 실패
					out.println("<script>\r\n"
								+ "alert(\"결제에 실패했습니다!\");\r\n"
								+ "location.href = history.back();\r\n"
								+ "</script>");
				}
				else {
					if(!dao.updateSeat(rPIdStr, rSeat)) { //가는날 좌석 실패
						out.println("<script>\r\n"
								+ "alert(\"결제에 실패했습니다!\");\r\n"
								+ "location.href = history.back();\r\n"
								+ "</script>");
					} else { //가는날 성공
						if(!dao.insertReservation(rPId2, rId2, rDTime2, rDeparture2, rATime2, rArrive2, rSeat2)) { //오는날 예약 실패 
							out.println("<script>\r\n"
									+ "alert(\"결제에 실패했습니다!\");\r\n"
									+ "location.href = history.back();\r\n"
									+ "</script>");
						} else {
							if(!dao.updateSeat(rPIdStr2, rSeat2)) { //오는날 좌석 실패
								out.println("<script>\r\n"
										+ "alert(\"결제에 실패했습니다!\");\r\n"
										+ "location.href = history.back();\r\n"
										+ "</script>");
							} else { //모두 성공
								out.println("<script>\r\n"
										+ "alert(\"결제에 성공했습니다!\");\r\n"
										+ "location.href = \"/KajaAirline/reservation/reservation_complete.jsp\";\r\n" //KajaAirline(취합 프로젝트명) 변경 필요
										+ "</script>");
							}
						}
					}
				}
				out.flush();
				out.close();
			}
			break;
		}
		
		return viewPage;
	}

}
