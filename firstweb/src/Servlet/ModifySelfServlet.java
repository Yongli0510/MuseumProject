package Servlet;

import com.alibaba.fastjson.JSONObject;
import dao.impl.UserDaoImpl;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/modifyself")
public class ModifySelfServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name;
        String email;
        String sig;
        String pwd;
        int id;
        JSONObject object = new JSONObject();
        try {
            name = request.getParameter("name");
            email = request.getParameter("email");
            sig = request.getParameter("sig");
            pwd = request.getParameter("pwd");
            id = Integer.parseInt(request.getParameter("id"));
        }catch (Exception e){
            object.put("success", false);
            response.getWriter().println(object);
            return;
        }

        UserService us = new UserService(new UserDaoImpl());
        object.put("success", true);

        if (us.checkPwd(id,pwd)){
            if (us.checkName(id,name)){
                us.updateMessage(id,name,email,sig);
            }else {
                object.put("nameValid", false);
            }
        }else {
            object.put("pwdCorrect", false);
        }
        response.getWriter().println(object);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
