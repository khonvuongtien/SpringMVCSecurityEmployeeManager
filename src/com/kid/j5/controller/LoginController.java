package com.kid.j5.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kid.j5.model.User;
import com.kid.j5.model.UserDAO;

@Controller
public class LoginController {
	
	@Autowired
	ServletContext context;
	@Autowired
	UserDAO userDAO;
	@Autowired
	MailSender mailSender;

	@RequestMapping(value="/loginform",method=RequestMethod.GET)
	public String showLoginForm(){
		
		return "login";
	}
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(auth!=null){
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/QuanLyTaiKhoan";
	}
	
	@RequestMapping("/recoverpass")
	public String recoverPass(HttpServletRequest request){
		String username = request.getParameter("username");
		String newPassword = "";
		User user = null;
		String alpha = "qwertyuiopasdfghjklzxcvbnm";
		String numb = "0123456789";
		String specialChar = "~!@#$%^&*()[]";
		String[] alphas = alpha.split("");
		String[] numbs = numb.split("");
		String[] sc = specialChar.split("");
		
		if(username.indexOf('@')==-1){
			user = userDAO.loadUser(username);
		}else{
			user=userDAO.getUserViaEmail(username);
		}
		
		for (int i = 0; i < 5; i++) {
			newPassword +=alphas[i]+numbs[i]+sc[i];
		}
		
		SimpleMailMessage message = new SimpleMailMessage();
		message.setText("Your new password is: "+newPassword);
		message.setTo(user.getEmail());
		message.setFrom("fpoly");
		message.setSubject("RESET PASSWORD");
		
		mailSender.send(message);
		System.out.println("send successfully");
		user.setPassword(newPassword);
		userDAO.updateUser(user);
		return "login";
	}
	
}
