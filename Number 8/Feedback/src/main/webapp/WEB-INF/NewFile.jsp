<HTML><HEAD><TITLE> feedback Form </TITLE></HEAD>
<BODY><H1> Feedback Form </H1>
<HR>
<BR>
<FORM NAME="ParameterPost" ACTION="/servlets-examples/PrintFormParams" METHOD="POST">
<TABLE BGCOLOR="BLANCHEDALMOND" ALIGN="CENTER" BORDER="0">
    <TR>
    <TD ALIGN="CENTER"><B>Name:</B></TD> 
    <TD ALIGN="CENTER"> <INPUT TYPE="TEXT" SIZE="25" NAME="Person"></TD>
    </TR>
   
    <TR>
    <TD ALIGN="CENTER"><B>Email:</B></TD> 
    <TD ALIGN="CENTER"> <INPUT TYPE="TEXT" SIZE="25" MAXLENGTH="40" NAME="emailaddress"></TD>
    </TR>
   
   
    <TR>
    <TD ALIGN="CENTER"><B>How did you find this site?</B></TD> 
    <TD ALIGN="CENTER"> 
        <SELECT NAME="from" SIZE="1">
        <OPTION VALUE = "Web hosting" SELECTED>Web hosting/OPTION>
        <OPTION VALUE = "Domain transfer">Domain transfe</OPTION>
        <OPTION VALUE = "Domain selling">Domain selling</OPTION>
        <OPTION VALUE = "SSL">SSL</OPTION>
        <OPTION VALUE = "VPS">VPS</OPTION>
        </SELECT>
    </TD>    
    </TR>
   
    <TR>
    <TD ALIGN="CENTER"><B>Comments or Suggestions:</B></TD> 
    <TD ALIGN="CENTER"> 
    <TEXTAREA ROWS="6" COLS="40" WRAP="PHYSICAL" Name="suggestions">
             Enter any comments or suggestions you have here.</TEXTAREA>
    </TD>
    </TR>
    
   
    <TR>
    
    <TD ALIGN="LEFT">
    
    <INPUT TYPE="SUBMIT" VALUE="Send Comments" ALIGN="MIDDLE">  &nbsp; &nbsp;
    <INPUT TYPE="RESET" VALUE="Clear Form" ALIGN="MIDDLE"> 
    
    </TD>
    </TR>
   
</FORM>
</BODY>
</html>

<!-- web.xml -->
    <servlet>
        <servlet-name>PrintFormParams</servlet-name>
        <servlet-class>PrintFormParams</servlet-class>
    </servlet>

    <servlet-mapping>
        <servlet-name>PrintFormParams</servlet-name>
        <url-pattern>/PrintFormParams</url-pattern>
    </servlet-mapping>
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PrintFormParams extends HttpServlet {

  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    PrintParams(request, response);

  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    PrintParams(request, response);
  }

  public void PrintParams(HttpServletRequest request,
      HttpServletResponse response) throws IOException {

    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    String htmlHeader = "<HTML><HEAD><TITLE> Printed Form Parameters </TITLE></HEAD><BODY>";
    String htmlFooter = "</BODY></HTML>";

    out.println(htmlHeader);
    out.println("<TABLE ALIGN=CENTER BORDER=1>");
    out.println("<tr><th> Input Name </th><th> Value </th>");

    Enumeration enum = request.getParameterNames();

    while (enum.hasMoreElements()) {
      String inputName = (String) enum.nextElement();
      String value = request.getParameter(inputName);

      if (value.length() != 0) {
        out.println("<tr><td align=center>" + inputName + "</td>");
        out.println("<td align=center>" + value + "</td></tr>");
      } else {
        out.println("<tr><td align=center>" + inputName + "</td>");
        out.println("<td align=center><i>Null</i></td></tr>");
      }

    }
    out.println("</TABLE><BR>");
    out.println(htmlFooter);
  }
}
