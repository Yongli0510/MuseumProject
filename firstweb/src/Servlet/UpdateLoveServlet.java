package servlet;

import com.alibaba.fastjson.JSONObject;
import dao.impl.ExhibitDaoImpl;
import dao.impl.LoveDaoImpl;
import service.LoveService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/updatelovelevel")
public class UpdateLoveServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int userId,artId,newLevel;
        String func;
        try {
            userId = Integer.parseInt(request.getParameter("userId"));
            artId = Integer.parseInt(request.getParameter("artId"));
            newLevel =Integer.parseInt(request.getParameter("newLevel"));

            func = request.getParameter("func");
        }catch (Exception e){
            JSONObject object = new JSONObject();
            object.put("success", false);
            response.getWriter().println(object);
            return;
        }

        LoveService ls = new LoveService(new LoveDaoImpl(),new ExhibitDaoImpl());

        if ("setpublic".equals(func)){
            ls.updatePublicLevel(userId,artId,newLevel);
        }else if ("del".equals(func)){
            ls.delLove(userId,artId);
        }


        JSONObject object = new JSONObject();
        object.put("success", true);
        response.getWriter().println(object);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
