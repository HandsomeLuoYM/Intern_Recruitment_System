package com.System.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtil {
	public static void SendEmail(String reciveName , String UserEmail , Integer Score) throws Exception {
		Properties props= new Properties();
		props.setProperty("mail.transport.protocol", "smtp");//邮箱协议
		props.setProperty("mail.smtp.host", "smtp.qq.com");//协议地址
		props.setProperty("mail.smtp.port", "465");//协议端口
		props.setProperty("mail.smtp.auth", "true");//是否授权（是）
		//QQ邮箱：还需要SSL认证
		props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.setProperty("mail.smtp.socketFactory.fallback", "false");
		props.setProperty("mail.smtp.socketFactory.port", "465");//协议端口号

		Session session = Session.getInstance(props);
		
		session.setDebug(true);
		
		MimeMessage message =  creatMimeMessage(session, "2545512312@qq.com", UserEmail,reciveName,Score);
		
		Transport transport = session.getTransport();
		
		transport.connect("2545512312@qq.com", "xpknmtbfskgxdiij");//建立连接，一般以授权码形式发出
		
		transport.sendMessage(message, message.getAllRecipients());//发送邮件
		
		transport.close();//关闭连接
		
	}
	
	//创建一封邮件
	public static MimeMessage creatMimeMessage(Session session,String sender,String receiver,String UserName,Integer Score) throws Exception {
		
		MimeMessage message = new MimeMessage(session);
		
		//邮件有标题、正文、收件人  {照片，图片等}
				
		message.setSubject("面试通知", "UTF-8");//标题
								
		Address address = new InternetAddress(sender,"面试公司","UTF-8");//发件人名字
		
		message.setFrom(address);//发件人的信息好了
		
		message.setContent(UserName+"!你好，你的面试分数是："+Score, "text/html;charset=utf-8");//发送的内容
				
		message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiver,"收件人","UTF-8"));//收件人TO(普通收件人)、CC（抄送），BCC（密送）
		
		message.setSentDate(new Date());//发送时间

		message.saveChanges();//保存邮件
		
		return message;		
	}
	
}
