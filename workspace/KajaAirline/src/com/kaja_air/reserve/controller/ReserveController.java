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
			response.sendRedirect("/KajaAirline/reservation/reservation_main.jsp"); //KajaAirline(���� ������Ʈ��) ���� �ʿ�
			break;
			
		case "reservation_result" :
			
			String tripType = request.getParameter("tripType").equals("") ? "��" : request.getParameter("tripType");
			if(tripType.equals("��")) {
				
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
				
			} else { //�պ��� ��쿣 list�� 2�� �ʿ��ϴ�
				
				request.setAttribute("tripType", tripType);
				
				//���³� �װ��� ����Ʈ �޾ƿ´�.
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
				
				//���³� �װ��� ����Ʈ �޾ƿ´�.
				String comeTime = request.getParameter("comeDate");
				StringBuffer comeSb = new StringBuffer();
				String[] comeDateSplit = comeTime.split("-");
				for(String s : comeDateSplit) {
					comeSb.append(s);
				}
				String strComeTime = new String(comeSb);
				ArrayList<Schedule> comeList = dao.getScheduleList(arrive, departure, strComeTime); //������� �������� �������� �־��� ��, ���ƿ��� ��¥�� �˻�
				request.setAttribute("comeScheduleList", comeList);
			}
			
			viewPage = "/reservation/reservation_result.jsp";
			break;
			
		case "reservation_payment" :
			request.setCharacterEncoding("EUC-KR");
			String oneWayValues = request.getParameter("one_values");
			String goValues = request.getParameter("go_values");
			String comeValues = request.getParameter("come_values");
			
			//���� ���
			if(!oneWayValues.equals("")) {
				String[] valueArr = oneWayValues.split("#");
				request.setAttribute("rPId", valueArr[0]);						//0 : ����� ��ȣ(���)
				request.setAttribute("rDTime", valueArr[2]);					//2 : ��� �ð�
				request.setAttribute("rDeparture", valueArr[1]);				//1 : �����
				request.setAttribute("rATime", valueArr[4]);					//4 : ���� �ð�
				request.setAttribute("rArrive", valueArr[3]);					//3 : ������
				request.setAttribute("rSeat", valueArr[6]);						//6 : �¼�
				request.setAttribute("price", Integer.parseInt(valueArr[7])); 	//7 : �� ����
				String passengers = valueArr[5];								//5 : �ο��� => �� n��(���� a, �Ҿ� b, ���� c) �̷� ����
			}
			//�պ��� ���
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
			if(request.getParameter("rPId2") == null) { //��
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
								+ "alert(\"������ �����߽��ϴ�!\");\r\n"
								+ "location.href = history.back();\r\n"
								+ "</script>");
				}
				else {
					if(!dao.updateSeat(rPIdStr, rSeat)) {
						out.println("<script>\r\n"
								+ "alert(\"������ �����߽��ϴ�!\");\r\n"
								+ "location.href = history.back();\r\n"
								+ "</script>");
					} else {
						out.println("<script>\r\n"
								+ "alert(\"������ �����߽��ϴ�!\");\r\n"
								+ "location.href = \"/KajaAirline/reservation/reservation_complete.jsp\";\r\n"//KajaAirline(���� ������Ʈ��) ���� �ʿ�
								+ "</script>");
					}
				}
				out.flush();
				out.close();
			} else { //�պ�
				//���³�
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
				
				//���³�
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
								
				if(!dao.insertReservation(rPId, rId, rDTime, rDeparture, rATime, rArrive, rSeat)) { //���³� ���� ����
					out.println("<script>\r\n"
								+ "alert(\"������ �����߽��ϴ�!\");\r\n"
								+ "location.href = history.back();\r\n"
								+ "</script>");
				}
				else {
					if(!dao.updateSeat(rPIdStr, rSeat)) { //���³� �¼� ����
						out.println("<script>\r\n"
								+ "alert(\"������ �����߽��ϴ�!\");\r\n"
								+ "location.href = history.back();\r\n"
								+ "</script>");
					} else { //���³� ����
						if(!dao.insertReservation(rPId2, rId2, rDTime2, rDeparture2, rATime2, rArrive2, rSeat2)) { //���³� ���� ���� 
							out.println("<script>\r\n"
									+ "alert(\"������ �����߽��ϴ�!\");\r\n"
									+ "location.href = history.back();\r\n"
									+ "</script>");
						} else {
							if(!dao.updateSeat(rPIdStr2, rSeat2)) { //���³� �¼� ����
								out.println("<script>\r\n"
										+ "alert(\"������ �����߽��ϴ�!\");\r\n"
										+ "location.href = history.back();\r\n"
										+ "</script>");
							} else { //��� ����
								out.println("<script>\r\n"
										+ "alert(\"������ �����߽��ϴ�!\");\r\n"
										+ "location.href = \"/KajaAirline/reservation/reservation_complete.jsp\";\r\n" //KajaAirline(���� ������Ʈ��) ���� �ʿ�
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
