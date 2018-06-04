package spring.sts.team;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.img.ImgDTO;
import spring.model.member.MemberDAO;
import spring.model.member.MemberVO;
import spring.sts.utility.SecurityUtil;
import spring.sts.utility.Utility;

/**
 * Handles requests for the application home page.
 */
@Controller

public class MemberController {
	@Autowired
	private MemberDAO dao;
	
	
	@RequestMapping("/member/list")
//	@ResponseBody
	public String list(HttpServletRequest request,Model model) {
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		if(col.equals("total")){
			word = "";
		}
		
		//System.out.println("word: "+word);
		//페이지관련-----------------------
		int nowPage = 1;//현재 보고있는 페이지
		if(request.getParameter("nowPage")!=null){
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 20;//한페이지당 보여줄 레코드갯수

		//DB에서 가져올 순번-----------------
		int sno = ((nowPage-1)*recordPerPage);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("col", col);
		map.put("sno",sno);
		map.put("word",word);

		int total= dao.total(map);
		List<MemberVO> list = dao.list(map);
		String paging = Utility.paging2("list", total, nowPage, recordPerPage, col, word);







		model.addAttribute("list", list);		
		model.addAttribute("paging", paging);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		return "member/list.tiles";
	}
	
	@RequestMapping(value="/member/delete_proc")
	public String delete_proc(MemberVO vo, HttpSession session, String id, HttpServletRequest request) {
		SecurityUtil securityUtil = new SecurityUtil();
		String rtn1 = securityUtil.encryptSHA256(vo.getPasswd());
		vo.setPasswd(rtn1);
		if(id==null) {
			id=(String)session.getAttribute("id");
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("passwd", vo.getPasswd());
		
		boolean pflag = dao.passwdCheck(map);
		
		boolean flag = false;
		if(pflag) {
			flag = dao.delete(id);
		}
		if(flag) {
			request.getSession().invalidate();
		}
		request.setAttribute("flag", flag);
		
		return "member/delete_proc";
	}
	@RequestMapping(value = "/member/delete", method = RequestMethod.POST)
	public String delete(String id, MemberVO vo, HttpSession session, HttpServletRequest request) {	
		return "redirect:/";
	}
	@RequestMapping(value = "/member/delete", method = RequestMethod.GET)
	public String delete(String id, Model model, HttpSession session) {	
		if(id==null) {
			id=(String)session.getAttribute("id");
		}
		model.addAttribute("id", id);
		return "member/delete.tiles";
	}
	
	@RequestMapping(value = "/member/agreement", method = RequestMethod.GET)
	public String home() {

		return "member/agreement.tiles";
	}
	
	@RequestMapping(value = "/member/create", method=RequestMethod.GET)
	public String create() {
		
		return "member/create.tiles";
	}
	
	@RequestMapping(value = "/member/create", method=RequestMethod.POST)
	public String create(MemberVO vo) {
		
		boolean flag = false;
		SecurityUtil securityUtil = new SecurityUtil();
		String rtn1 = securityUtil.encryptSHA256(vo.getPasswd());
		vo.setPasswd(rtn1);
		

		flag = dao.create(vo);
		if(flag) {
			return "redirect:login";
		}else {
			return "error/error";
		}
	}
	@RequestMapping(value="/member/id_proc")
	public String idCheck(String id,Model model) {
		model.addAttribute("flag",dao.duplicateId(id));
		return "member/id_proc";
	}
	@RequestMapping(value="/member/email_proc")
	public String emailCheck(String email,Model model, String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("id", id);

		model.addAttribute("old_flag",dao.duplicate_UpEmail(map));
		model.addAttribute("flag",dao.duplicateEmail(email));
		return "member/email_proc";
	}
	@RequestMapping(value="/member/login_proc")
	public String login_proc(Model model, HttpServletRequest request, MemberVO vo) {
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		SecurityUtil securityUtil = new SecurityUtil();
		String rtn1 = securityUtil.encryptSHA256(passwd);
		vo.setPasswd(rtn1);
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("passwd", vo.getPasswd());
		
		boolean flag = dao.loginCheck(map);
		model.addAttribute("flag", flag);
		return "member/login_proc";
	}

	
	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public String login(HttpServletRequest request, HttpServletResponse response, Model model, MemberVO vo) {
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		boolean flag = false;
	
		
		SecurityUtil securityUtil = new SecurityUtil();
		String rtn1 = securityUtil.encryptSHA256(passwd);
		vo.setPasswd(rtn1);

		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("passwd", vo.getPasswd());
		
		flag = dao.loginCheck(map);
		String grade = null;//회원등급
		if(flag){//회원인경우
			grade = dao.getGrade(id);
			request.getSession().setAttribute("id", id);
			request.getSession().setAttribute("grade", grade);
		   
		   // ---------------------------------------------- 
		   // Cookie 저장, Checkbox는 선택하지 않으면 null 임 
		   // ---------------------------------------------- 
			Cookie cookie = null; 
			String c_id = request.getParameter("c_id"); // Y, 아이디 저장 여부 
		      
		   if (c_id != null){  // 처음에는 값이 없음으로 null 체크로 처리
			     cookie = new Cookie("c_id", "Y");    // 아이디 저장 여부 쿠키 
			     cookie.setMaxAge(120);               // 2 분 유지 
			     response.addCookie(cookie);          // 쿠키 기록 
			  
			     cookie = new Cookie("c_id_val", id); // 아이디 값 저장 쿠키  
			     cookie.setMaxAge(120);               // 2 분 유지 
			     response.addCookie(cookie);          // 쿠키 기록  
			        
		   }else{ 
			     cookie = new Cookie("c_id", "");     // 쿠키 삭제 
			     cookie.setMaxAge(0); 
			     response.addCookie(cookie); 
			        
			     cookie = new Cookie("c_id_val", ""); // 쿠키 삭제 
			     cookie.setMaxAge(0); 
			     response.addCookie(cookie); 
		   } 
		   // --------------------------------------------- 
		}else {
			return "member/login.tiles";
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value="member/login",method=RequestMethod.GET) 
	public String login(HttpServletRequest request) {
		String c_id = "";     // ID 저장 여부를 저장하는 변수, Y
		String c_id_val = ""; // ID 값
		 
		Cookie[] cookies = request.getCookies(); 
		Cookie cookie=null; 
		 
		if (cookies != null){ 
		 for (int i = 0; i < cookies.length; i++) { 
		   cookie = cookies[i]; 
		 
		   if (cookie.getName().equals("c_id")){ 
		     c_id = cookie.getValue();     // Y 
		   }else if(cookie.getName().equals("c_id_val")){ 
		     c_id_val = cookie.getValue(); // user1... 
		   } 
		 } 
		} 
		
		request.setAttribute("c_id", c_id);
		request.setAttribute("c_id_val", c_id_val);
		return "member/login.tiles";
	}
	@RequestMapping("member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("member/kakaologin")
	public String kakaologin(HttpSession session,String id,String thumnail, HttpServletRequest request) {
		request.getSession().setAttribute("id", id);
		request.getSession().setAttribute("kakao", true);
		request.getSession().setAttribute("thumnail", thumnail);
		return "redirect:/";
	}
	
	@RequestMapping(value = "member/update", method = RequestMethod.GET)
	public String update(String id, HttpSession session, Model model) {
		if(id==null) {
			id=(String)session.getAttribute("id");
		}
		MemberVO vo = dao.read(id);
		model.addAttribute("vo", vo);
		return "member/update.tiles";
	}
	
	@RequestMapping(value = "member/update", method = RequestMethod.POST)
	public String update(MemberVO vo, Model model) {
		SecurityUtil securityUtil = new SecurityUtil();
		String rtn1 = securityUtil.encryptSHA256(vo.getPasswd());
		vo.setPasswd(rtn1);
		model.addAttribute("flag", dao.update(vo));
		return "redirect:/";
	}
	
	@RequestMapping(value = "member/updatemember", method = RequestMethod.GET)
	public String updatemember(String id, String grade) {
		boolean flag = dao.updatemember(id,grade);
		//model.addAttribute("flag", dao.update(vo));
		return "redirect:/member/list";
	}
	@RequestMapping(value = "member/popup/findIdForm")
	public String findIdForm() {

		return "member/popup/findIdForm";
	}
	@RequestMapping(value = "member/popup/findPwForm", method = RequestMethod.GET)
	public String findPwForm() {
		
		return "member/popup/findPwForm";
	}
//	@RequestMapping(value = "member/popup/findPwProc")
//	public String findPwProc(String id, String email, Model model) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("id", id);
//		map.put("email", email);
//		
//		String passwd = null;
//		boolean flag = false;
//		
//		passwd= dao.findPw(map);
//		if(passwd!=null) {
//			flag = true;
//		}
//		model.addAttribute("passwd", passwd);
//		model.addAttribute("flag", flag);
//		return "member/popup/findPwProc";
//	}
	@RequestMapping(value = "member/popup/findIdProc")
	public String findIdProc(String name, String email, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("email", email);
	
		String id = null;
		boolean flag = false;
		
		id= dao.findId(map);
		
		if(id!=null) {
			flag = true;
		}
		model.addAttribute("id", id);
		model.addAttribute("flag", flag);
		return "member/popup/findIdProc";
	}
	@RequestMapping(value = "introduce/company")
	public String company() {

		return "introduce/company.tiles";
	}
	@RequestMapping(value = "introduce/author")
	public String author() {

		return "introduce/author.tiles";
	}
}
