/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.53
 * Generated at: 2020-07-17 11:12:13 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import reservationVO.ReservationVO;
import java.util.ArrayList;
import clientsVO.ClientsVO;

public final class ReservationDetail_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/lib/standard.jar", Long.valueOf(1593517452000L));
    _jspx_dependants.put("jar:file:/D:/Java_Web_PM_Class_JB/project/Kaja_Airline_final/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/KajaAirline/WEB-INF/lib/standard.jar!/META-INF/c.tld", Long.valueOf(1098678690000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("reservationVO.ReservationVO");
    _jspx_imports_classes.add("clientsVO.ClientsVO");
    _jspx_imports_classes.add("java.util.ArrayList");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=EUC-KR");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"EUC-KR\">\r\n");
      out.write("<title>예약 확인</title>\r\n");
      out.write("<style>\r\n");
      out.write("body{\r\n");
      out.write("\tbackground-image: url(\"./imgs/bg.jpg\");\r\n");
      out.write("}\r\n");
      out.write(".title {\r\n");
      out.write("\ttext-align: center;\r\n");
      out.write("\tmargin: 35px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".subtitle {\r\n");
      out.write("\ttext-align: center;\r\n");
      out.write("\tmargin: 30px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".clienttable {\r\n");
      out.write("\twidth: 40%;\r\n");
      out.write("\tborder-spacing: 0;\r\n");
      out.write("\ttext-align: center;\r\n");
      out.write("\tline-height: 1;\r\n");
      out.write("\tborder-top: 1px solid #ccc;\r\n");
      out.write("\tmargin: auto;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".reservationtable {\r\n");
      out.write("\twidth: 50%;\r\n");
      out.write("\tborder-spacing: 0;\r\n");
      out.write("\ttext-align: center;\r\n");
      out.write("\tline-height: 1.5;\r\n");
      out.write("\tborder-top: 1px solid #ccc;\r\n");
      out.write("\tmargin: auto;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".th {\r\n");
      out.write("\twidth: fit-content;\r\n");
      out.write("\tfont-size: 12pt;\r\n");
      out.write("\tpadding: 5px;\r\n");
      out.write("\tborder-right: 1px solid #ccc;\r\n");
      out.write("\tborder-bottom: 1px solid #ccc;\r\n");
      out.write("\tborder-top: 1px solid #fff;\r\n");
      out.write("\tborder-left: 1px solid #fff;\r\n");
      out.write("\tbackground: #eee;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".th2 {\r\n");
      out.write("\twidth: fit-content;\r\n");
      out.write("\tfont-size: 15pt;\r\n");
      out.write("\tpadding: 10px;\r\n");
      out.write("\tborder-right: 1px solid #ccc;\r\n");
      out.write("\tborder-bottom: 1px solid #ccc;\r\n");
      out.write("\tborder-top: 1px solid #fff;\r\n");
      out.write("\tborder-left: 1px solid #fff;\r\n");
      out.write("\tbackground: #eee;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".td {\r\n");
      out.write("\twidth: fit-content;\r\n");
      out.write("\tpadding: 5px;\r\n");
      out.write("\tborder-bottom: 1px solid #ccc;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".td2 {\r\n");
      out.write("\twidth: fit-content;\r\n");
      out.write("\tpadding: 10px;\r\n");
      out.write("\tborder-bottom: 1px solid #ccc;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\twindow.onload=function start() {\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tshowSlides();\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("\t<header>\r\n");
      out.write("\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\r\n");
      out.write("\t</header>\r\n");
      out.write("\r\n");
      out.write("\t");

		ClientsVO vo = (ClientsVO) request.getAttribute("vo");
		ArrayList<ReservationVO> list = (ArrayList<ReservationVO>) request.getAttribute("list");
		int total = (int)request.getAttribute("total");
		int start = (int)request.getAttribute("start");
		int startRow = (int)request.getAttribute("startRow");
	
      out.write("\r\n");
      out.write("\t<section id=\"sectionId\">\r\n");
      out.write("\t<div style=\"position: relative;\">\r\n");
      out.write("\t\r\n");
      out.write("\t\t<h1 class=\"title\">예약 확인</h1>\r\n");
      out.write("\r\n");
      out.write("\t\t<hr>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<h2 class=\"subtitle\">승객 정보</h2>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<table class=\"clienttable\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th class=\"th\">이름</th> <th class=\"th\">전화번호</th> <th class=\"th\">이메일</th> <th class=\"th\">국적</th>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"td\">");
      out.print(vo.getcName() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"td\">");
      out.print(vo.getcTel() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"td\">");
      out.print(vo.getcEmail() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"td\">");
      out.print(vo.getcNation() );
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<br>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<h2 class=\"subtitle\">여정</h2>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<form action=\"cancelReservation.mypage\" method=\"post\">\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t<table class=\"reservationtable\">\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<th class=\"th2\">출발일자</th> <th class=\"th2\">출발지</th>\r\n");
      out.write("\t\t\t\t\t<th class=\"th2\">도착일자</th> <th class=\"th2\">도착지</th>\r\n");
      out.write("\t\t\t\t\t<th class=\"th2\">좌석</th> <th class=\"th2\">취소</th>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t");
 if(list.isEmpty()) { 
      out.write(" <!-- list 비어있으면 내역 없음 뜸 -->\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td class=\"td\" colspan=\"6\">예매 내역이 없습니다.</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t");
 
				} else { 
					
				for(ReservationVO vo1 : list) { //취소되지 않은 것만 조회
			
      out.write("\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td class=\"td2\">");
      out.print(vo1.getrDTime() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"td2\">");
      out.print(vo1.getrDeparture());
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"td2\">");
      out.print(vo1.getrATime() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"td2\">");
      out.print(vo1.getrArrive() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"td2\">\r\n");
      out.write("\t\t\t\t\t");
 
						String[] seat = vo1.getrSeat().split("_"); 
						for(int i=0; i<seat.length; i++) {
					
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
      out.print(seat[i] );
      out.write("\r\n");
      out.write("\t\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"td2\"><input type=\"checkbox\"  name=\"cancelReservation\" value=\"");
      out.print(vo1.getrDTime() );
      out.write('#');
      out.print(vo1.getrDeparture() );
      out.write('#');
      out.print(vo1.getrATime() );
      out.write('#');
      out.print(vo1.getrArrive() );
      out.write('#');
      out.print(vo1.getrSeat() );
      out.write('#');
      out.print(vo1.getrPId());
      out.write("\"></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t");
 } }
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"6\">\r\n");
      out.write("\t\t\t\t\t");
	// 페이징  처리
						if(total > 0){
							// 총 페이지의 수
							int pageCount = total / 5 + (total%5 == 0 ? 0 : 1);
							// 한 페이지에 보여줄 페이지 블럭(링크) 수
							int pageBlock = 5;
							// 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
							int startPage = ((start-1)/pageBlock)*pageBlock+1;
							int endPage = startPage + pageBlock - 1;
							
							// 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
							if(endPage > pageCount){
								endPage = pageCount;
							}
							
							if(startPage > pageBlock){ // 페이지 블록수보다 startPage가 클경우 이전 링크 생성
					
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"reservationDetail.mypage?start=");
      out.print(startPage - 10);
      out.write("\">[이전]</a>\t\r\n");
      out.write("\t\t\t\t\t");
			
						}	
							for(int i=startPage; i <= endPage; i++){ // 페이지 블록 번호
								if(i == start){ // 현재 페이지에는 링크를 설정하지 않음
					
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t[");
      out.print(i );
      out.write("]\r\n");
      out.write("\t\t\t\t\t");
									
								}else{ // 현재 페이지가 아닌 경우 링크 설정
					
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<a href=\"reservationDetail.mypage?start=");
      out.print(i);
      out.write('"');
      out.write('>');
      out.write('[');
      out.print(i );
      out.write("]</a>\r\n");
      out.write("\t\t\t\t\t");
	
								}
							} // for end
							
							if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
					
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"reservationDetail.mypage?start=");
      out.print(startPage + 10 );
      out.write("\">[다음]</a>\r\n");
      out.write("\t\t\t\t\t");
			
							}
						}
					
      out.write("\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\t<br>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t<br><br>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t<div align=\"center\">\r\n");
      out.write("\t\t\t\t<input class=\"button\" type=\"submit\" value=\"예약 취소\" >\r\n");
      out.write("\t\t\t\t<input class=\"button\" type=\"button\" value=\"돌아가기\" onclick=\"location.href='reservation.mypage'\">\r\n");
      out.write("\t\t\t\t<br><br>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</form>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t</section>\r\n");
      out.write("\t\r\n");
      out.write("\t<footer>\r\n");
      out.write("\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\r\n");
      out.write("\t</footer>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
