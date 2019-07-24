package Servlet;

import com.alibaba.fastjson.JSONObject;
import com.sun.mail.auth.MD4;
import com.sun.mail.smtp.DigestMD5;
import service.MailService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@WebServlet("/mailsend")
public class MailSendServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int captcha = 0;
        JSONObject object = new JSONObject();
        try {
            String email = request.getParameter("email");
            MailService ms = new MailService();
            //ms.sendCaptcha(email);
            ms.sslSend(email);
            captcha = ms.getNumber();
        }catch (Exception e){
            e.printStackTrace();
            object.put("success", false);
            response.getWriter().println(object);
            return;
        }
        object.put("success", true);
        object.put("captcha", captcha);
        System.out.println(captcha);
        response.getWriter().println(object);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

}
