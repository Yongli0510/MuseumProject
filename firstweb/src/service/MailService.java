package service;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

public class MailService {

    private int number;

    private int getRandomNumber(){
        number = (int) (Math.random()*10000);
        return number;
    }

    public int getNumber() {
        return number;
    }

    public void sendCaptcha(String mail){
        SimpleEmail email = new SimpleEmail();
        email.setHostName("smtp.163.com");
        try {
            // 收件人邮箱
            email.addTo(mail);
            // 邮箱服务器身份验证
            email.setAuthentication("keyhe0@163.com", "jjccaow21");
            // 发件人邮箱
            email.setFrom("keyhe0@163.com");
            // 邮件主题
            email.setSubject("这是来自官方的验证邮件，请勿回复");
            // 邮件内容
            email.setMsg("验证码："+getRandomNumber());
            // 发送邮件
            email.send();
        } catch (EmailException ex) {
            ex.printStackTrace();
        }
    }
}
