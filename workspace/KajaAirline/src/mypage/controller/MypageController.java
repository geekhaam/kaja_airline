package mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import clientsVO.ClientsVO;
import mypageDAO.MypageDAO;
import reservationVO.ReservationVO;

/**
 * Servlet implementation class MypageController
 */
@WebServlet("*.mypage")
public class MypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public MypageController() {
        // TODO Auto-generated constructor stub
    	super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		//response.setContentType("text/html; charset=euc-kr");
		HttpSession session=request.getSession();
		
		String[] uri = request.getRequestURI().split("/");
		String c="/"+uri[uri.length-1].substring(0);
		System.out.println(c);
		if(c.equals("/reservation/reservation.mypage")) {
			c = "/reservation.mypage";
		}
		String str = null;
		
		switch(c) {
		case "/clientsUpdate.mypage": //ȸ�� ���� ����
			String cId = request.getParameter("cId");
			String cPw = request.getParameter("cPw");
			String cName = request.getParameter("cName");
			String cTel = request.getParameter("cTel");
			String cEmail = request.getParameter("cEmail");
			String cNation = request.getParameter("cNation");
			String cResiAddr = request.getParameter("cResiAddr");
			
			MypageDAO mdao = null;
			try {
				mdao = new MypageDAO();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			mdao.clientsUpdate(cPw, cName, cTel, cEmail, cNation, cResiAddr, cId);
			str = "index.jsp";
			break;
		case "/clientsDelete.mypage": //ȸ�� Ż��
			String cId1 = (String)session.getAttribute("id");
			
			MypageDAO mdao1 = null;
			try {
				mdao1 = new MypageDAO();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			try {
				mdao1.clientsDelete(cId1);
				session.removeAttribute("id");
				session.removeAttribute("result");
			} catch (SQLException e) {
				e.printStackTrace();
			}
			str = "index.jsp";
			break;
			
		case ("/reservation.mypage"): //���ų��� ��� ���� ������
			String rId = (String)session.getAttribute("id");
			
			int start = 1;
			if (request.getParameter("start") != null) {
				start = Integer.parseInt(request.getParameter("start"));
			}

			int startRow = (start - 1) * 5 + 1;
			int endRow = start * 5;
			
			int start3 = 1;
			if (request.getParameter("start3") != null) {
				start3 = Integer.parseInt(request.getParameter("start3"));
			}

			int startRow3 = (start3 - 1) * 5 + 1;
			int endRow3 = start3 * 5;

			MypageDAO mdao2 = null;
			try {
				mdao2 = new MypageDAO();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			ArrayList<ReservationVO> list = null;
			ArrayList<ReservationVO> cancelList = null;
			String rId0 = null;
			int total = 0;
			int total3 = 0;
			try {
				list = mdao2.selectReservation(startRow, endRow, rId);
				cancelList = mdao2.selectCancelReservation(startRow3, endRow3, rId);
				total = mdao2.getCount(rId);
				total3 = mdao2.getCount2(rId);
				rId0 = mdao2.selectId(rId);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if(rId.equals(rId0)) {
		        request.setAttribute("startRow", startRow);
				request.setAttribute("start", start);
				request.setAttribute("total", total);
				request.setAttribute("startRow3", startRow3);
				request.setAttribute("start3", start3);
				request.setAttribute("total3", total3);
				request.setAttribute("cancelList", cancelList);
				request.setAttribute("list", list);
				request.setAttribute("rId", rId);
				str = "MypageReservation.jsp";
			} else
				str = "index.jsp";
			break;
		
		case "/selectClients.mypage": //ȸ�� ���� ������
			String cId3 = (String)session.getAttribute("id");
			
			MypageDAO mdao3 = null;
			try {
				mdao3 = new MypageDAO();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			ClientsVO vo = null;
			String cId33 = null;
			try {
				vo = mdao3.selectClients(cId3);
				cId33 = mdao3.selectId(cId3);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if(cId3.equals(cId33)) {
				request.setAttribute("vo", vo);
				str = "ClientsUpdate.jsp";
			} else
				str = "index.jsp";
			break;
		case "/reservationDetail.mypage": //���� ��ҵ��� ���� �� �� ��ȸ
			String rId1 = (String)session.getAttribute("id");
			
			int start1 = 1;
			if (request.getParameter("start") != null) {
				start1 = Integer.parseInt(request.getParameter("start"));
			}
			int startRow1 = (start1 - 1) * 5 + 1;
			int endRow1 = start1 * 5;
			
			MypageDAO mdao4 = null;
			try {
				mdao4 = new MypageDAO();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			ClientsVO vo1 = null;
			ArrayList<ReservationVO> list1 = null;
			int total1 = 0;
			try {
				vo1 = mdao4.selectClients(rId1);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				list1 = mdao4.selectReservation(startRow1, endRow1, rId1);
				total1 = mdao4.getCount(rId1);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("vo", vo1);
			request.setAttribute("list", list1);
			request.setAttribute("total", total1);
			request.setAttribute("startRow", startRow1);
			request.setAttribute("start", start1);
			str = "ReservationDetail.jsp";
			break;
		case "/cancelReservation.mypage": //���ų��� ���
			String rId2 = (String)session.getAttribute("id");
			if(request.getParameterValues("cancelReservation")!=null) {
				
				String[] check = request.getParameterValues("cancelReservation"); //üũ�ڽ� ���õ� �͵�
				for(int i=0; i<check.length; i++) {
					 String one = check[i]; //�������/�����/��������/������/�¼� �̷��� ����
					 String[] Bae = one.split("#"); // /���� ���ø�
					 String rDTime = Bae[0]; //ù��°�� �������
					 String rDeparture = Bae[1]; //�����
					 String rATime = Bae[2]; //��������
					 String rArrive = Bae[3]; //������
					 String rSeat = Bae[4]; //�¼�
					 int rPId=Integer.parseInt(Bae[5]);
				MypageDAO mdao5 = null;
				try {
					mdao5 = new MypageDAO();
				} catch (ClassNotFoundException | SQLException e1) {
					e1.printStackTrace();
				}
				try {
						mdao5.cancelReservation(rPId,rId2, rDTime, rDeparture, rATime, rArrive, rSeat);
						mdao5.cancelSeat(rDeparture,rArrive,rPId,rSeat);
						} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				request.setAttribute("rId", rId2);
				str = "reservation.mypage";
			} else {
				
				str="reservation.mypage";
			}
			
			break;
		case "/deleteDetail.mypage": //���� ��ҵ� �͸� �� ��ȸ
			String rId3 = (String)session.getAttribute("id");
			
			int start2 = 1;
			if (request.getParameter("start") != null) {
				start2 = Integer.parseInt(request.getParameter("start"));
			}

			int startRow2 = (start2 - 1) * 5 + 1;
			int endRow2 = start2 * 5;
			
			MypageDAO mdao6 = null;
			try {
				mdao6 = new MypageDAO();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			ArrayList<ReservationVO> list3 = null;
			int total0 = 0;
			try {
				list3 = mdao6.selectCancelReservation(startRow2, endRow2, rId3);
				total0 = mdao6.getCount2(rId3);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("rId", rId3);
			request.setAttribute("cancelList", list3);
			request.setAttribute("total", total0);
			request.setAttribute("startRow", startRow2);
			request.setAttribute("start", start2);
			str = "DeleteReservationDetail.jsp";
			break;
		case "/deleteReservation.mypage": //��ҳ��� ����
			String rId4 = (String)session.getAttribute("id");
			if (request.getParameterValues("cancelReservation") != null) {
				String[] check1 = request.getParameterValues("deleteReservation"); // üũ�ڽ� ���õ� �͵�

				for (int i = 0; i < check1.length; i++) {
					String one1 = check1[i]; // �������/�����/��������/������/�¼� �̷��� ����
					String[] Bae = one1.split("#"); // /���� ���ø�
					String rDTime = Bae[0]; // ù��°�� �������
					String rDeparture = Bae[1]; // �����
					String rATime = Bae[2]; // ��������
					String rArrive = Bae[3]; // ������
					String rSeat = Bae[4]; // �¼�
					MypageDAO mdao5 = null;
					try {
						mdao5 = new MypageDAO();
					} catch (ClassNotFoundException | SQLException e1) {
						e1.printStackTrace();
					}
					try {
						mdao5.deleteReservation(rId4, rDTime, rDeparture, rATime, rArrive, rSeat);
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				request.setAttribute("rId", rId4);
				str = "reservation.mypage";
			} else
				str = "reservation.mypage";
			break;

		case "/signup.mypage":
			String cId5 = request.getParameter("cId");
			String cPw5 = request.getParameter("cPw");
			String cName5 = request.getParameter("cName");
			String cTel5 = request.getParameter("cTel");
			String cEmail5 = request.getParameter("cEmail");
			String cNation5 = request.getParameter("cNation");
			String cResiAddr5 = request.getParameter("cResiAddr");

			MypageDAO mdao8 = null;
			try {
				mdao8 = new MypageDAO();
			} catch (ClassNotFoundException | SQLException e1) {
				e1.printStackTrace();
			}
			try {
				mdao8.insertClients(cId5, cPw5, cName5, cTel5, cEmail5, cNation5, cResiAddr5);
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			str = "index.jsp"; // �α�����������
			break;
		case "/idOverlap.mypage":
			String cId2 = request.getParameter("cId");

			MypageDAO mdao7 = null;
			String cId22 = null;
			try {
				mdao7 = new MypageDAO();
				cId22 = mdao7.selectId(cId2);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			PrintWriter out = response.getWriter();
			if (cId22 == null) {
				out.print(1);
			} else {
				out.print(2);
			}
			out.flush();
			break;
		}
		if(str != null) {
			RequestDispatcher rd1 = request.getRequestDispatcher(str);
			rd1.forward(request, response);
		}
		
	}

}