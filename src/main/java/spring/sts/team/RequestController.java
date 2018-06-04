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

import spring.model.request.RequestDAO;
import spring.model.request.RequestDTO;
import spring.sts.utility.Utility;
@Controller
public class RequestController {
	
	@Autowired
	private RequestDAO dao;
	
	@RequestMapping("/request/delete")
	public String delete(int requestno, Model model, int nowPage, String col, String word) {
		dao.delete(requestno);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		return "redirect:list.tiles";
	}
	
	@RequestMapping("/request/read")
	public String read(int nowPage, String col, String word, int requestno, Model model) {
		
		RequestDTO dto = dao.read(requestno);
		
		model.addAttribute("dto", dto);
		
		return "request/read.tiles";
		
	}
	@RequestMapping(value = "/request/create", method = RequestMethod.POST)
	public String create(RequestDTO vo,Model model) {
		boolean flag = dao.create(vo);
		model.addAttribute("flag",flag);			
			return "redirect:/request/createProc";

	}
	
	@RequestMapping(value = "/request/create", method = RequestMethod.GET)
	public String create() {
		return "request/create.tiles";
	}
	@RequestMapping(value = "/request/createProc", method = RequestMethod.GET)
	public String createProc() {
		return "request/createProc.tiles";
	}
	
	@RequestMapping("/request/list")
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
		List<RequestDTO> list = dao.list(map);
		
		String paging = Utility.paging2("list", total, nowPage, recordPerPage, col, word);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		return "request/list.tiles";
	}

}
