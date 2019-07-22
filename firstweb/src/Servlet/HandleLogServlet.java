package servlet;

import com.alibaba.fastjson.JSON;
import dao.impl.UserDaoImpl;
import entity.User;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/slog")
public class HandleLogServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/text; charset=utf-8");
        PrintWriter out = response.getWriter();

        String name = "";
        if (request.getParameter("log_name") != null)
            name = request.getParameter("log_name");
        System.out.println(name);

        String pwd = "";
        if (request.getParameter("log_pwd") != null)
            pwd = request.getParameter("log_pwd");
        System.out.println(pwd);


        //TODO:
        String path = "back.jsp";

        UserService userService = new UserService(new UserDaoImpl());
        User ru = userService.log(name, pwd);
        System.out.println(ru);

        if (ru != null) {
            response.sendRedirect(path);
            request.getSession().setAttribute("me",ru);
        }else {
            out.append(JSON.toJSONString(ru));
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        doPost(request, response);
    }
}
