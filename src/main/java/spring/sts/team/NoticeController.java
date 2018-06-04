package spring.sts.team;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.notice.NoticeDAO;
import spring.model.notice.NoticeVO;
import spring.sts.utility.Utility;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeDAO dao;
	
	@RequestMapping("/notice/delete")
	public String delete(int noticeno, Model model, int nowPage, String col, String word) {
		dao.delete(noticeno);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		return "redirect:list.tiles";
	}
	
	@RequestMapping("/notice/read")
	public String read(int nowPage, String col, String word, int noticeno, Model model) {
		dao.upViewcnt(noticeno);
		NoticeVO vo = dao.read(noticeno);
		
		model.addAttribute("vo", vo);
		
		return "notice/read.tiles";
		
	}
	@RequestMapping(value = "/notice/create", method = RequestMethod.POST)
	public String create(NoticeVO vo) {
		boolean flag = dao.create(vo);
		if(flag) {
			return "redirect:/notice/list";
		}else {
			return "error/error";
		}
	}
	
	@RequestMapping(value = "/notice/create", method = RequestMethod.GET)
	public String create() {
		return "notice/createForm.tiles";
	}
	
	@RequestMapping("/notice/list")
	public String list(HttpServletRequest request, Model model) {
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		if(col.equals("total")){
			word = "";
		}
		//페이지관련-----------------------
		int nowPage = 1;//현재 보고있는 페이지
		if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 15;//한페이지당 보여줄 레코드갯수
		 
		//DB에서 가져올 순번-----------------
		int sno = ((nowPage-1)*recordPerPage);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("col", col);
		map.put("word", word);
		map.put("sno",sno);
		

		int total= dao.total(map);
		List<NoticeVO> list = dao.list(map);
		
		String paging = Utility.paging2("list", total, nowPage, recordPerPage, col, word);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		return "notice/list.tiles";
	}

}
