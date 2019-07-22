package Servlet;

import com.alibaba.fastjson.JSONObject;
import dao.impl.FriendDaoImpl;
import dao.impl.InviteDaoImpl;
import dao.impl.UserDaoImpl;
import service.FriendService;
import service.InviteService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/invitehandle")
public class InviteHandleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int sendId, resId;
        String func;
        try {
            sendId = Integer.parseInt(request.getParameter("sendId"));
            resId = Integer.parseInt(request.getParameter("resId"));

            func = request.getParameter("func");
        } catch (Exception e) {
            JSONObject object = new JSONObject();
            object.put("success", false);
            response.getWriter().println(object);
            return;
        }

        FriendService fs = new FriendService(new UserDaoImpl(), new FriendDaoImpl());
        InviteService is = new InviteService(new InviteDaoImpl(), fs);


        if ("agree".equals(func)) {
            is.agree(sendId, resId);
        } else if ("refuse".equals(func)) {
            is.refuse(sendId, resId);
        }

        JSONObject object = new JSONObject();
        object.put("success", true);
        response.getWriter().println(object);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
