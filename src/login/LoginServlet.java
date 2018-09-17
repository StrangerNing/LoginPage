package login;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginServlet extends javax.servlet.http.HttpServlet {
    @Override
    public void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        response.sendRedirect("index.jsp");
    }

    @Override
    public void destroy(){

    }

    @Override
    public ServletConfig getServletConfig(){
        return null;
    }

    @Override
    public String getServletInfo(){
        return null;
    }

    @Override
    public void init(ServletConfig arg0) throws ServletException {

    }

    @Override
    public void service(ServletRequest request, ServletResponse response)
            throws ServletException,IOException {
        HttpServletRequest rq = (HttpServletRequest) request;
        HttpServletResponse rs = (HttpServletResponse) response;
        doPost(rq,rs);
    }
}
