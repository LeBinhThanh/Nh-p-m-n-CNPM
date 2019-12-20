package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.HashSet;
import java.util.ArrayList;
import entity.Flower;
import model.FlowerDB;

public final class Home_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"shortcut icon\" href=\"images/favicon.ico\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"Default.css\" />\n");
      out.write("        <title>Flower Shop - Hệ Thống Bán Hoa Chất Lượng Cao</title>\n");
      out.write("        <style>\n");
      out.write("            table{\n");
      out.write("                margin:20px auto;\n");
      out.write("                padding: 0;\n");
      out.write("            }\n");
      out.write("            h1{\n");
      out.write("                font-size:30px;\n");
      out.write("                color:blue;\n");
      out.write("            }\n");
      out.write("            th{\n");
      out.write("                color: brown;\n");
      out.write("                background: antiquewhite;\n");
      out.write("            }\n");
      out.write("            #fixed{\n");
      out.write("                position: absolute;\n");
      out.write("                border: 1px solid yellowgreen;\n");
      out.write("                border-radius: 0 1.5em 1.5em 0;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            *{\n");
      out.write("                margin: 0px;\n");
      out.write("                padding: 0;\n");
      out.write("                font-family: sans-serif;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            #sidebar {\n");
      out.write("                margin-top: -20px;\n");
      out.write("                position:absolute;\n");
      out.write("                width: 14%;\n");
      out.write("                background: darksalmon;\n");
      out.write("                left: -14%;\n");
      out.write("                transition: all 500ms linear; \n");
      out.write("            }\n");
      out.write("            #sidebar.active {\n");
      out.write("                left: 0px;\n");
      out.write("            }\n");
      out.write("            #sidebar ul li {\n");
      out.write("                color: White;\n");
      out.write("                list-style:none;\n");
      out.write("                padding: 15px 10px;\n");
      out.write("                border-bottom: 1px solid rgba(100,100,100,0.3);\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            #sidebar li:hover{\n");
      out.write("                background-color: #ff9999;\n");
      out.write("            }\n");
      out.write("            .old{\n");
      out.write("                text-decoration: line-through;\n");
      out.write("                color: red;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("\n");
      out.write("        <script>\n");
      out.write("            function toggleSidebar() {\n");
      out.write("                document.getElementById(\"sidebar\").classList.toggle('active');\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <!-- start header -->\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "nav.jsp", out, false);
      out.write(" \n");
      out.write("        <!-- end header -->\n");
      out.write("\n");
      out.write("        <!-- start menu -->\n");
      out.write("        <section id=\"menuContaniner\">\n");
      out.write("            <div id=\"menu\">\n");
      out.write("                <nav class=\"menu_bg\">\n");
      out.write("                    <div class=\"navbar\" onclick=\"toggleSidebar()\">\n");
      out.write("                        <img src=\"images/list.png\" id=\"list\"/>\n");
      out.write("                        <a href=\"#list_product\" >DANH MỤC HOA TƯƠI</a>\n");
      out.write("                    </div>\n");
      out.write("                </nav>\n");
      out.write("                <div id=\"timkiem\" >\n");
      out.write("                    <form name=\"SearchServlet\" action=\"searchFlower.jsp\" method=\"get\">\n");
      out.write("                        <input id=\"txtTim\" type=\"text\" name=\"txt\" placeholder=\"Tên sản phẩm\"  required/>\n");
      out.write("                        <input type=\"image\" src=\"images/Search2.png\" name=\"btnTim\" id=\"btnTim\" onclick=\"search()\" />\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("        <!-- end menu -->\n");
      out.write("\n");
      out.write("        <!-- start content -->\n");
      out.write("        ");

            int y = 0;
            int iPage = 0;
            int flowersPerPage = 6;
            FlowerDB fdb = new FlowerDB();
            ArrayList<Flower> list = fdb.getAllFlowers();
            int size = list.size();
            try {
                iPage = Integer.parseInt(request.getParameter("page"));
            } catch (NumberFormatException ex) {
                iPage = 0;
            }
            if ((iPage == 0)) {
                iPage = 1;
            }
            y = (iPage - 1) * flowersPerPage;
            int iCounter = 0;
        
      out.write("\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <form action=\"\" method=\"post\">\n");
      out.write("            <table width=\"100%\">\n");
      out.write("                <tr>\n");
      out.write("                <div id=\"sidebar\">\n");
      out.write("                    <ul>\n");
      out.write("                        ");

                            HashSet<String> hs = fdb.getFlowersType();
                            for (String i : hs) {
                        
      out.write("\n");
      out.write("                        <a href=\"searchByType.jsp?type=");
      out.print( i);
      out.write("\" style=\"text-decoration: none; color: white\"/> \n");
      out.write("                        <li> ");
      out.print( i);
      out.write(" </li>\n");
      out.write("                        </a>\n");
      out.write("                        ");

                            }
                        
      out.write(" \n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                <td>\n");
      out.write("                    <div style=\"text-align: center; width: 100%; margin: auto;padding-left: 230px\">\n");
      out.write("                        <ul style=\"display: inline-table;\n");
      out.write("                            margin: 0;\n");
      out.write("                            padding:0;\n");
      out.write("                            white-space: nowrap\">\n");
      out.write("\n");
      out.write("                            ");

                                String code = "";
                                String type = "";
                                String name = "";
                                String image = "";
                                double price,sale;
                                Flower f = new Flower();

                                if (list != null) {
                                    while ((y < size ) && (iCounter < flowersPerPage)) {
                                        f = list.get(y);
                                        code = f.getCode();
                                        type = f.getType();
                                        name = f.getName();
                                        image = f.getImage();
                                        price = f.getPrice();
                                        sale = price * 0.9;
                            
      out.write("\n");
      out.write("                            <a href=\"flowerDetail.jsp?code=");
      out.print(code);
      out.write("\" class=\"content-item\">\n");
      out.write("                                <li>\n");
      out.write("                                    <p><img src=\"");
      out.print( image);
      out.write("\" style=\"width: 300px; height: 350px; margin-top: 5px\" ></p><br>\n");
      out.write("                                    <p>Mã Sản Phẩm: ");
      out.print( code);
      out.write("</p><br>\n");
      out.write("                                    <p>Tên Sản Phẩm: ");
      out.print( name);
      out.write("</p><br>\n");
      out.write("                                    <p>Giá: <span class=\"old\"> ");
      out.print(price);
      out.write(" VNĐ </span></p><br>\n");
      out.write("                                    <p>Sale: ");
      out.print( sale);
      out.write("VND</p>\n");
      out.write("                                </li>\n");
      out.write("                            </a>\n");
      out.write("\n");
      out.write("                            ");

                                        y++;
                                        iCounter++;
                                        if (iCounter >= flowersPerPage) {
                                            break;
                                        }
                                    }
                                }
                            
      out.write("\n");
      out.write("                        </ul>\n");
      out.write("                    </div>\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    <div style=\"float:right\"><img src=\"images/img1.png\" style=\"width: 260px;height: 320px\"><br>\n");
      out.write("                        <img src=\"images/img2.png\" style=\"width: 260px;height: 320px\"><br>\n");
      out.write("                        <img src=\"images/img3.jpg\" style=\"width: 260px;height: 320px\">\n");
      out.write("                    </div>\n");
      out.write("                </td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("            <center>\n");
      out.write("                ");

                    String sFileName = "Home.jsp";
                    if (y == 0) {
                        out.println("No Flower");
                    } else {
                        if (iPage == 1) {
                            out.print("<a href=#>Previous</a>");
                        } else {
                            out.print("<a href=" + sFileName + "?page=" + (iPage - 1) + ">Previous</a>");
                        }
                        y = 1;
                        int numPage;
                        if (size % flowersPerPage == 0) {
                            numPage = size / flowersPerPage;
                        } else {
                            numPage = size / flowersPerPage + 1;
                        }
                        while (y < numPage) {
                            out.print("<a href=" + sFileName + "?page=" + y + "> [" + y + "] </a>");
                            y++;
                        }
                        if (iPage == numPage) {
                            out.print("<a href=#>Next</a>");
                        } else {
                            out.print("<a href=" + sFileName + "?page=" + (iPage + 1) + ">Next</a>");
                        }
                    }
                
      out.write("    \n");
      out.write("            </center>            \n");
      out.write("        </form>\n");
      out.write("        <!-- end content -->\n");
      out.write("\n");
      out.write("        <!-- start footer -->\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\n");
      out.write("        <!-- end footer -->\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
