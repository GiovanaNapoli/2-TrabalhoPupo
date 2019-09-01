package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class amortizacaoConstante_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Amortização Constante</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <!--\n");
      out.write("        <form>\n");
      out.write("            valor: <input type=\"text\" name=\"valor\" plachouder=\"Digite o valor\"/>\n");
      out.write("            valor: <input type=\"text\" name=\"mes\" plachouder=\"Digite o valor\"/>\n");
      out.write("            <input type=\"submit\" name=\"calc\" value=\"Calcular\"/>\n");
      out.write("        </form>-->\n");
      out.write("        <div class = \"content\">\n");
      out.write("            ");
if (request.getParameter("calc") == null) {
      out.write("\n");
      out.write("            <form>\n");
      out.write("                valor: <input type=\"text\" name=\"valor\" plachouder=\"Digite o valor\"/>\n");
      out.write("                valor: <input type=\"text\" name=\"mes\" plachouder=\"Digite o valor\"/>\n");
      out.write("                <input type=\"submit\" name=\"calc\" value=\"Calcular\"/>\n");
      out.write("            </form>\n");
      out.write("            ");
} else {
      out.write("\n");
      out.write("            ");
 int v1 = Integer.parseInt(request.getParameter("valor"));
      out.write("\n");
      out.write("            ");
 int m = Integer.parseInt(request.getParameter("mes"));
      out.write("\n");
      out.write("            ");
 int vlp = v1 / m;
      out.write("\n");
      out.write("            <table border=\"1px\">\n");
      out.write("                <tr>\n");
      out.write("                    <th>Valor</th>\n");
      out.write("                    <th>Valor por mês</th>\n");
      out.write("                    <th>Valor de juros</th>\n");
      out.write("                </tr>\n");
      out.write("                ");
for (int i = 1; i <= m; i++) {
      out.write("\n");
      out.write("                ");

                    double v = v1;
                    double n1 = v * 0.01;
                    double n = v + n1;
                    v = v1 - n;
                    
                
      out.write("\n");
      out.write("               \n");
      out.write("                <tr>\n");
      out.write("                    <td>");
      out.print(v);
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(vlp);
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(n1);
      out.write("</td>\n");
      out.write("                </tr>\n");
      out.write("                 ");
}
      out.write("\n");
      out.write("                ");
}
      out.write("\n");
      out.write("            </table>\n");
      out.write("        </div>\n");
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
