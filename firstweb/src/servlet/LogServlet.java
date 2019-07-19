package servlet;

import entity.User;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LogServlet", value = "slog")
public class LogServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/text; charset=utf-8");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("log_name");
        String pwd = request.getParameter("log_pwd");
        //TODO:
        String path = "back.jsp";

        UserService userService = new UserService();

        if (name != null && pwd != null) {
            User ru = userService.log(name, pwd);
            if (ru != null && pwd.equals(ru.getPassword())) {
                response.sendRedirect(path);
            } else
                out.write("false");
        } else
            out.write("false");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        doPost(request, response);
    }
}
