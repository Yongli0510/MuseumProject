package service;

import com.sun.nio.sctp.MessageInfo;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.security.Security;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

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

    public void sslSend(String mail)
            throws AddressException, MessagingException, IOException {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.163.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("keyhe0@163.com","jjccaow21");
                    }
                });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("keyhe0@163.com"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(mail));
            message.setSubject("这是来自官方的验证邮件，请勿回复");
            message.setText("验证码："+getRandomNumber());

            Transport.send(message);
            System.out.println("Done");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

}
