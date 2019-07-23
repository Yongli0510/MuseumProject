package Servlet;

import com.alibaba.fastjson.JSONObject;
import dao.impl.ExhibitDaoImpl;
import dao.impl.FriendDaoImpl;
import dao.impl.LoveDaoImpl;
import dao.impl.UserDaoImpl;
import service.FriendService;
import service.LoveService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updatefriend")
public class UpdateFriendServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int uid,fid;
        String func;
        try {
            uid = Integer.parseInt(request.getParameter("uid"));
            fid = Integer.parseInt(request.getParameter("fid"));

            func = request.getParameter("func");
        }catch (Exception e){
            JSONObject object = new JSONObject();
            object.put("success", false);
            response.getWriter().println(object);
            return;
        }

        FriendService fs = new FriendService(new UserDaoImpl(),new FriendDaoImpl());

        if ("del".equals(func)){
            fs.delFriend(uid,fid);
        }else if ("add".equals(func)){
            fs.addFriend(uid,fid);
        }

        JSONObject object = new JSONObject();
        object.put("success", true);
        response.getWriter().println(object);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
