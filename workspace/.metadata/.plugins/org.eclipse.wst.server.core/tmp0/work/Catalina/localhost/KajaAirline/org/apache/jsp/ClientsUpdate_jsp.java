/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.53
 * Generated at: 2020-07-17 10:32:20 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import clientsVO.ClientsVO;

public final class ClientsUpdate_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("clientsVO.ClientsVO");
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"EUC-KR\">\r\n");
      out.write("<title>회원 정보 변경</title>\r\n");
      out.write("<style>\r\n");
      out.write("\r\n");
      out.write("body{\r\n");
      out.write("\tbackground-image: url(\"./imgs/bg.jpg\");\r\n");
      out.write("}\r\n");
      out.write(".title {\r\n");
      out.write("\ttext-align: center;\r\n");
      out.write("\tmargin: 35px;\r\n");
      out.write("\tfont-size: 26pt;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".subtitle {\r\n");
      out.write("\ttext-align: center;\r\n");
      out.write("\tmargin: 30px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".table {\r\n");
      out.write("\twidth: 50%;\r\n");
      out.write("\tborder-spacing: 0;\r\n");
      out.write("\ttext-align: left;\r\n");
      out.write("\tline-height: 1.5;\r\n");
      out.write("\tborder-top: 1px solid #ccc;\r\n");
      out.write("\tborder-left: 1px solid #ccc;\r\n");
      out.write("\tmargin: auto;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".th {\r\n");
      out.write("\twidth: 30%;\r\n");
      out.write("\tfont-size: 17pt;\r\n");
      out.write("\tpadding: 10px;\r\n");
      out.write("\tborder-right: 1px solid #ccc;\r\n");
      out.write("\tborder-bottom: 1px solid #ccc;\r\n");
      out.write("\tborder-top: 1px solid #fff;\r\n");
      out.write("\tborder-left: 1px solid #fff;\r\n");
      out.write("\tbackground: #eee;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".td {\r\n");
      out.write("\twidth: 70%;\r\n");
      out.write("\tborder-right: 1px solid #ccc;\r\n");
      out.write("\tborder-bottom: 1px solid #ccc;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".input {\r\n");
      out.write("\twidth: 94%;\r\n");
      out.write("\t\r\n");
      out.write("\tfont-size: 15pt;\r\n");
      out.write("\tpadding: 13px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\twindow.onload=function start() {\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tshowSlides();\r\n");
      out.write("\t}\r\n");
      out.write("\t\tfunction deleteClick() {\r\n");
      out.write("\t\t\tif(confirm(\"정말 탈퇴하시겠습니까?\")){\r\n");
      out.write("\t\t\t\tlocation.href=\"clientsDelete.mypage\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("\t");

		ClientsVO vo = (ClientsVO)request.getAttribute("vo");
	
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t<header>\r\n");
      out.write("\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\r\n");
      out.write("\t</header>\r\n");
      out.write("\r\n");
      out.write("\t<section id=\"sectionId\">\r\n");
      out.write("\t<div>\r\n");
      out.write("\t\t<h1 class=\"title\">회원 정보 변경</h1>\r\n");
      out.write("\r\n");
      out.write("\t\t<hr>\r\n");
      out.write("\r\n");
      out.write("\t\t<h2 class=\"subtitle\">");
      out.print(vo.getcName() );
      out.write("님, 안녕하세요!</h2>\r\n");
      out.write("\r\n");
      out.write("\t\t<form action=\"clientsUpdate.mypage\" method=\"post\">\r\n");
      out.write("\t\t\t<table class=\"table\">\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<th class=\"th\">아이디</th>\r\n");
      out.write("\t\t\t\t\t<td class=\"td\"><input class=\"input\" type=\"text\" name=\"cId\" value=\"");
      out.print(vo.getcId() );
      out.write("\" readonly></td> <!-- 아이디는 못바꿈 -->\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<th class=\"th\">비밀번호</th>\r\n");
      out.write("\t\t\t\t\t<td class=\"td\"><input class=\"input\" type=\"text\" name=\"cPw\" value=\"");
      out.print(vo.getcPw() );
      out.write("\" required=\"required\"></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<th class=\"th\">이름</th>\r\n");
      out.write("\t\t\t\t\t<td class=\"td\"><input class=\"input\" type=\"text\" name=\"cName\" value=\"");
      out.print(vo.getcName() );
      out.write("\" required=\"required\"></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<th class=\"th\">전화번호</th>\r\n");
      out.write("\t\t\t\t\t<td class=\"td\"><input class=\"input\" type=\"text\" name=\"cTel\" value=\"");
      out.print(vo.getcTel() );
      out.write("\" required=\"required\"></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<th class=\"th\">이메일</th>\r\n");
      out.write("\t\t\t\t\t<td class=\"td\"><input class=\"input\" type=\"text\" name=\"cEmail\" value=\"");
      out.print(vo.getcEmail() );
      out.write("\" required=\"required\"></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<th class=\"th\">국적</th>\r\n");
      out.write("\t\t\t\t\t<td class=\"td\"><input class=\"input\" type=\"text\" name=\"cNation\" value=\"");
      out.print(vo.getcNation() );
      out.write("\" required=\"required\"></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<th class=\"th\">주소</th>\r\n");
      out.write("\t\t\t\t\t<td class=\"td\"><input class=\"input\" type=\"text\" name=\"cResiAddr\" value=\"");
      out.print(vo.getcResiAddr() );
      out.write("\" required=\"required\"></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<br><br>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<div align=\"center\">\r\n");
      out.write("\t\t\t\t\t<input class=\"buttonUpdate\" type=\"submit\" value=\"회원 정보 변경\"> &nbsp;\r\n");
      out.write("\t\t\t\t\t<input class=\"buttonUpdate\" type=\"button\" value=\"회원 탈퇴\"\tonclick=\"deleteClick();\"><br><br>\r\n");
      out.write("\t\t\t\t\t<!-- cId 임의 --> \r\n");
      out.write("\t\t\t\t\t<input class=\"buttonUpdate\" type=\"button\" value=\"취 소\" onclick=\"location.href='index.jsp'\">\r\n");
      out.write("\t\t\t\t\t<!-- 취소버튼은 메인으로 가는 버튼 -->\r\n");
      out.write("\t\t\t\t</div>\r\n");
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
