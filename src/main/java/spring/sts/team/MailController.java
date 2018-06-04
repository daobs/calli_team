package spring.sts.team;


import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.member.MemberDAO;
import spring.model.member.MemberVO;
import spring.sts.utility.SecurityUtil;
 
@Controller
public class MailController {
 
  @Autowired
  private JavaMailSender mailSender;
	@Autowired
	private MemberDAO dao;
	
	  
		  
  
	@RequestMapping(value = "member/popup/findPwProc")
	public String findPwProc(String id, String email, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("email", email);
		
		String passwd = null;
		boolean flag = false;
		
		passwd= dao.findPw(map);
		
		if(passwd!=null) {
			flag = true;
			 String setfrom = "babuobs@gmail.com";
			 Random random = new Random();
			 int result = random.nextInt(100000000)+100000000;
			    
			    MemberVO vo = new MemberVO();
				passwd = String.valueOf(result);
				vo.setId(id);
				
				SecurityUtil securityUtil = new SecurityUtil();								
				vo.setPasswd(securityUtil.encryptSHA256(passwd));			 
			 	model.addAttribute("flagPw", dao.updatePasswd(vo));

			    String content = "왕은실 캘리그라피입니다.\n\n"+"비밀번호는 : "+ passwd + "입니다.";


			    try {
			      MimeMessage message = mailSender.createMimeMessage();
			      MimeMessageHelper messageHelper 
			                        = new MimeMessageHelper(message, true, "UTF-8");
			 
			      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
			      messageHelper.setTo(email);     // 받는사람 이메일
			      messageHelper.setSubject("(비밀번호)왕은실 캘리그라피 입니다"); // 메일제목은 생략이 가능하다
			      messageHelper.setText(content);  // 메일 내용
			     
			      mailSender.send(message);
			      //System.out.println("메일보내기성공");
			    } catch(Exception e){
			      System.out.println(e);
			    }

		}
		model.addAttribute("email",email);
		model.addAttribute("passwd", passwd);
		model.addAttribute("flag", flag);
		return "member/popup/findPwProc";
	}
  

 
 
  // mailForm
  @RequestMapping(value = "member/popup/mailForm", method = RequestMethod.GET)
  public String mailForm(String email, Model model) {
	  model.addAttribute("tomail", email);
    return "member/popup/mailForm";
  }  
  
  
 
  // mailSending 코드
  @RequestMapping(value = "member/popup/mailForm", method = RequestMethod.POST)
  public String mailSending(Model model, String tomail, String code, HttpSession session) {
    String setfrom = "babuobs@gmail.com";         
    
    /* 0~9999 까지의 난수를 발생시킨 후 1~3자리 수를 없애기위해 1000을 더해준다 (1000~10999)*/
    Random random = new Random();
    int result = random.nextInt(10000)+1000;
    if(result>10000){
        result = result - 1000;
    }
   
    String content = "왕은실 캘리그라피입니다.\n\n"+"인증번호는 : "+ Integer.toString(result) + "입니다.";


    try {
      MimeMessage message = mailSender.createMimeMessage();
      MimeMessageHelper messageHelper 
                        = new MimeMessageHelper(message, true, "UTF-8");
 
      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
      messageHelper.setTo(tomail);     // 받는사람 이메일
      messageHelper.setSubject("(인증번호)왕은실 캘리그라피 입니다"); // 메일제목은 생략이 가능하다
      messageHelper.setText(content);  // 메일 내용
     
      mailSender.send(message);
    } catch(Exception e){
      System.out.println(e);
    }
	  System.out.println("Form code : " + code);
	  System.out.println("Form result : " + result);
	  session.setAttribute("result", result);
    return "redirect:mailProc";
  }
  @RequestMapping(value = "member/popup/mailProc", method=RequestMethod.GET)
  public String mailProc(String code, String result) {
    return "member/popup/mailProc";
  }  
  @RequestMapping(value = "member/popup/mailProc", method=RequestMethod.POST)
  public String mailProc(String code, String result, Model model, HttpSession session) {
	  boolean flag = false;
	  System.out.println("param : "+ code);
	  System.out.println("param : "+ result);
	  if(Integer.parseInt(code)==Integer.parseInt(result)) {
		  flag = true;
		  System.out.println("flag : "+ flag);
		  model.addAttribute("flag", flag);
		  return "member/popup/mailProc"; // code == result시 
/*		  session.invalidate();*/
	  }
	  else {
		  return "member/popup/mailFalse"; // != 불일치시
	  }
  }  
  @RequestMapping(value = "member/popup/mailFalse", method=RequestMethod.GET)
  public String mailFalse() {
    return "member/popup/mailFalse";
  }  
} 