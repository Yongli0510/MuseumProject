package Servlet;

import com.alibaba.fastjson.JSONObject;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;

@WebServlet("/fileUploadServlet")
public class fileUploadServlet extends HttpServlet {
    public fileUploadServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        try {
            request.setCharacterEncoding("utf-8");
            List<FileItem> items = upload.parseRequest(request);
            for(FileItem item : items){
                if(!item.isFormField()){
                    String fileName = item.getName();
                    try {
                        item.write(new File("C:Users/lenovo/MuseumProject/firstweb/web/image/exhibit/",fileName));
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }

            //返回json对象
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("code",0);
            response.getWriter().write(jsonObject.toString());
            response.getWriter().close();

        } catch (FileUploadException e) {
            e.printStackTrace();
        }
    }
}
