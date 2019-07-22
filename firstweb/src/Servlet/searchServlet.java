package servlet;

import com.alibaba.fastjson.JSON;
import dao.impl.ExhibitDaoImpl;
import entity.Exhibit;
import entity.Page;
import service.PageService;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/searchServlet")
public class searchServlet extends HttpServlet {

    public searchServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String name = "";
        String detail = "";
        String place = "";

        if(request.getParameter("name") != null)
            name = request.getParameter("name");
        if(request.getParameter("detail") != null)
            detail = request.getParameter("detail");
        if(request.getParameter("place") != null)
            place = request.getParameter("place");

        System.out.println(name + detail + place);

        int page = 1;
        if(request.getParameter("page") != null)
            page = Integer.parseInt(request.getParameter("page"));

        PageService pageService = new PageService(new ExhibitDaoImpl());
        Page<Exhibit> bean = pageService.paging(new String[]{name,detail,place},page);
        String json = JSON.toJSONString(bean);

        System.out.println(json);

        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.append(json);
    }
}
