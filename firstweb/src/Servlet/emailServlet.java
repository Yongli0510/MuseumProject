package Servlet;

import dao.impl.EmailDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/emailServlet")
public class emailServlet extends HttpServlet {
    public emailServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        EmailDaoImpl emailDao = new EmailDaoImpl();

        if("add".equals(type)){
            int sendId = Integer.parseInt(request.getParameter("sendId"));
            int resId = Integer.parseInt(request.getParameter("resId"));
            String content = request.getParameter("content");

            emailDao.addEmailRecord(sendId,resId,content);
        }

        else {
            int id = Integer.parseInt(request.getParameter("id"));
            if("change".equals(type))
                emailDao.changeReadStatus(id);
            else if("delete".equals(type))
                emailDao.deleteEmail(id);

        }
    }
}
