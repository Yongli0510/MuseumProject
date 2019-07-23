package Servlet;

import com.alibaba.fastjson.JSONObject;
import dao.impl.ExhibitDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/exhibitManageServlet")
public class exhibitManageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String type = request.getParameter("type");

        ExhibitDaoImpl exhibitDao = new ExhibitDaoImpl();

        if(type != null){
            if("modify".equals(type) || "add".equals(type)){
                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                String detail = request.getParameter("detail");
                String place = request.getParameter("place");
                String age = request.getParameter("age");
                String year = request.getParameter("year");
                String pic = request.getParameter("pic");

                if("modify".equals(type))
                    exhibitDao.updateExhibit(id,name,detail,place,age,year,pic);
                else
                    exhibitDao.addExhibit(name,detail,place,age,year,pic);

            }
            else if("delete".equals(type)){
                System.out.println("???????");
                int id = Integer.parseInt(request.getParameter("id"));
                exhibitDao.deleteExhibit(id);
            }
        }
    }
}
