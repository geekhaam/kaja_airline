/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.53
 * Generated at: 2020-07-17 09:35:13 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.reservation;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class oneway_005ftrip_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes = null;
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"EUC-KR\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css\">\r\n");
      out.write("<script type=\"text/javascript\" src=\"https://code.jquery.com/jquery-3.5.1.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"https://code.jquery.com/ui/1.12.1/jquery-ui.js\"></script>\r\n");
      out.write("<!-- 공항 검색 자동완성 Ajax 로직 -->\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("    $(document).ready(function() {\r\n");
      out.write("    \t$(\"#depAirport\").autocomplete({\r\n");
      out.write("    \tsource : function(request, response) {\r\n");
      out.write("    \t\t$.ajax({\r\n");
      out.write("    \t\t\turl : 'autocomplete_json.jsp',\r\n");
      out.write("    \t\t\tdataType : 'json',\r\n");
      out.write("    \t\t\ttype : 'get',\r\n");
      out.write("    \t\t\tsuccess : function(result) { //성공시\r\n");
      out.write("    \t\t\t\tconsole.log(result);\r\n");
      out.write("    \t\t\t\tresponse(\r\n");
      out.write("    \t\t\t\t\t$.map(result, function(item) {\r\n");
      out.write("    \t\t\t\t\t\tif (item.location.indexOf($(\"#depAirport\").val()) >= 0) {\r\n");
      out.write("    \t\t\t\t\t\t\treturn {\r\n");
      out.write("        \t\t\t\t\t\t\tlabel: item.location + \" \" +item.code,\r\n");
      out.write("        \t\t\t\t\t\t\tvalue: item.location + \" \" + item.code\r\n");
      out.write("        \t\t\t\t\t\t}\r\n");
      out.write("    \t\t\t\t\t\t}\r\n");
      out.write("    \t\t\t\t\t})\r\n");
      out.write("    \t\t\t\t); //response-end\r\n");
      out.write("    \t\t\t},\r\n");
      out.write("    \t\t\terror : function(e) {\r\n");
      out.write("    \t\t\t\talert(\"통신에 실패했습니다.\");\r\n");
      out.write("    \t\t\t\tconsole.dir(e);\r\n");
      out.write("    \t\t\t}\r\n");
      out.write("    \t\t});\r\n");
      out.write("    \t}, //source-end\r\n");
      out.write("    \tminLength : 1,\r\n");
      out.write("    \tautoFocus : false,\r\n");
      out.write("    \tselect : function(evt, ui) {\r\n");
      out.write("    \t\t\r\n");
      out.write("    \t},\r\n");
      out.write("    \tfocus : function(evt, ui) {\r\n");
      out.write("    \t\treturn false;\r\n");
      out.write("    \t},\r\n");
      out.write("    \tclose : function(evt) {\r\n");
      out.write("    \t\t\r\n");
      out.write("    \t}\r\n");
      out.write("    \t});\r\n");
      out.write("    \t\r\n");
      out.write("    \t$(\"#arrAirport\").autocomplete({\r\n");
      out.write("        \tsource : function(request, response) {\r\n");
      out.write("        \t\t$.ajax({\r\n");
      out.write("        \t\t\turl : 'autocomplete_json.jsp',\r\n");
      out.write("        \t\t\tdataType : 'json',\r\n");
      out.write("        \t\t\ttype : 'get',\r\n");
      out.write("        \t\t\tsuccess : function(result) { //성공시\r\n");
      out.write("        \t\t\t\tconsole.log(result);\r\n");
      out.write("        \t\t\t\tresponse(\r\n");
      out.write("        \t\t\t\t\t$.map(result, function(item) {\r\n");
      out.write("        \t\t\t\t\t\tif (item.location.indexOf($(\"#arrAirport\").val()) >= 0) {\r\n");
      out.write("        \t\t\t\t\t\t\treturn {\r\n");
      out.write("            \t\t\t\t\t\t\tlabel: item.location + \" \" +item.code,\r\n");
      out.write("            \t\t\t\t\t\t\tvalue: item.location + \" \" + item.code\r\n");
      out.write("            \t\t\t\t\t\t}\r\n");
      out.write("        \t\t\t\t\t\t}\r\n");
      out.write("        \t\t\t\t\t})\r\n");
      out.write("        \t\t\t\t); //response-end\r\n");
      out.write("        \t\t\t},\r\n");
      out.write("        \t\t\terror : function(e) {\r\n");
      out.write("        \t\t\t\talert(\"통신에 실패했습니다.\");\r\n");
      out.write("        \t\t\t\tconsole.dir(e);\r\n");
      out.write("        \t\t\t}\r\n");
      out.write("        \t\t});\r\n");
      out.write("        \t}, //source-end\r\n");
      out.write("        \tminLength : 1,\r\n");
      out.write("        \tautoFocus : false,\r\n");
      out.write("        \tselect : function(evt, ui) {\r\n");
      out.write("        \t\t\r\n");
      out.write("        \t},\r\n");
      out.write("        \tfocus : function(evt, ui) {\r\n");
      out.write("        \t\treturn false;\r\n");
      out.write("        \t},\r\n");
      out.write("        \tclose : function(evt) {\r\n");
      out.write("        \t\t\r\n");
      out.write("        \t}\r\n");
      out.write("        \t});\r\n");
      out.write("    });\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<table class=\"tab_selectDepArr\" style=\"border: 0px; border-spacing: 10px\">\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<div class=\"dep\">\r\n");
      out.write("\t\t\t\t\t<label for=\"depAirport\">출발지</label> <br>\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" id=\"depAirport\" name=\"depAirport\" required=\"required\" style=\"width:200px; height:50px;\" />\r\n");
      out.write("\t\t\t\t\t<div class=\"btn_airport_list1\" style=\"position: relative;\">\r\n");
      out.write("\t\t\t\t\t\t<button name=\"btn_airport_list1\" type=\"button\" onclick=\"javascript: openAirportList(document.getElementById('dep_airport_list'));\">주요도시 바로선택</button>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"dep_airport_list\" id=\"dep_airport_list\" style=\"position: absolute; display: none; border: 1px solid black; background-color: white; padding: 10px\">\r\n");
      out.write("\t\t\t\t\t\t<strong class=\"airport_list_title\">주요도시 바로선택</strong>\r\n");
      out.write("\t\t\t\t\t\t<h5>국내선</h5>\r\n");
      out.write("\t\t\t\t\t\t<ul style=\"list-style:none; padding-left:0px;\">\r\n");
      out.write("\t\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"#none\" onclick=\"javascript: setDepAirport(this);\">서울/인천 ICN</a>\r\n");
      out.write("\t\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"#none\" onclick=\"javascript: setDepAirport(this);\">서울/김포 GMP</a>\r\n");
      out.write("\t\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\t\t\t\t\t\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<div class=\"arr\">\r\n");
      out.write("\t\t\t\t\t<label for=\"arrAirport\">도착지</label> <br>\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" id=\"arrAirport\" name=\"arrAirport\" required=\"required\" style=\"width:200px; height:50px;\" />\r\n");
      out.write("\t\t\t\t\t<div class=\"btn_airport_list2\" style=\"position: relative;\">\r\n");
      out.write("\t\t\t\t\t\t<button name=\"btn_airport_list2\" type=\"button\" onclick=\"javascript: openAirportList(document.getElementById('arr_airport_list'));\">주요도시 바로선택</button>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"arr_airport_list\" id=\"arr_airport_list\" style=\"position: absolute; display: none; border: 1px solid black; background-color: white; padding: 10px\">\r\n");
      out.write("\t\t\t\t\t\t<strong class=\"airport_list_title\">주요도시 바로선택</strong>\r\n");
      out.write("\t\t\t\t\t\t<h5>국내선</h5>\r\n");
      out.write("\t\t\t\t\t\t<ul style=\"list-style:none; padding-left:0px;\">\r\n");
      out.write("\t\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"#none\" onclick=\"javascript: setArrAirport(this);\">서울/김포 GMP</a>\r\n");
      out.write("\t\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\t\t\t\t\t\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td valign=\"top\">\r\n");
      out.write("\t\t\t\t<div class=\"date\">\r\n");
      out.write("\t\t\t\t\t<label for=\"boardingDate\">탑승일</label> <br>\r\n");
      out.write("\t\t\t\t\t<input type=\"date\" id=\"boardingDate\" name=\"bDate\" required=\"required\" style=\"width:200px; height:50px;\" >\t\t\t\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t</table>\r\n");
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
