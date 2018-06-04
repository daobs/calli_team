package spring.sts.team;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.bbs.BbsDAO;
import spring.model.bbs.BbsService;
import spring.model.bbs.BbsVO;
import spring.model.bbs.ReplyDAO;
import spring.model.bbs.ReplyDTO;
import spring.sts.utility.Utility;

@Controller
public class BbsController {
	
	@Autowired
	private BbsDAO dao;
	@Autowired
	private BbsService service;
	@Autowired
	private ReplyDAO rdao;
	
	@RequestMapping("bbs/rdelete")
	public String rdelete(int rnum,Model model,int bbsno,int nowPage,String col,String word,int nPage) {
		int total = rdao.total(bbsno);
		int totalPage = (int)Math.ceil(total/3.0);
		
		if(rdao.delete(rnum)) {
			if(nPage!=1 && nPage==totalPage && total%3==1) {
				nPage = nPage -1;
			}
			model.addAttribute("bbsno",bbsno);
			model.addAttribute("nowPage",nowPage);
			model.addAttribute("col",col);
			model.addAttribute("word",word);
			model.addAttribute("nPage",nPage);
			return "redirect:./read";
		}else {
			return "error/error";
		}
	}
	@RequestMapping("bbs/rupdate")
	public String rupdate(ReplyDTO dto,Model model,int nowPage,String col,String word,String nPage) {
		System.out.println(dto.getRnum()+"::updateController");
		if(rdao.update(dto)) {
			model.addAttribute("bbsno",dto.getBbsno());
			model.addAttribute("nowPage",nowPage);
			model.addAttribute("col",col);
			model.addAttribute("word",word);
			model.addAttribute("nPage",nPage);
			return "redirect:./read";
		}else {
			return "error/error";
		}
	};
	@RequestMapping(value="/bbs/rcreate",method=RequestMethod.POST)
	public String rcreate(ReplyDTO dto,int nowPage,String col,String word,Model model) {
		;
		if(rdao.create(dto)) {
		
			model.addAttribute("bbsno",dto.getBbsno());
			model.addAttribute("nowPage",nowPage);
			model.addAttribute("col",col);
			model.addAttribute("word",word);
			return "redirect:./read";
		}else {
			return "error/error";
		}
	}
	
	@RequestMapping(value = "bbs/update", method = RequestMethod.GET)
	public String update(String bbsno, HttpSession session, Model model) {
		
		
		
		BbsVO vo = dao.read(Integer.parseInt(bbsno));
		if(session.getAttribute("id").equals(vo.getId()) || session.getAttribute("grade").equals("A")) {				
		model.addAttribute("vo", vo);
		return "bbs/update.tiles";
	} else {
		return "bbs/list.tiles";
	}
	
	}
	
	@RequestMapping(value = "bbs/update", method = RequestMethod.POST)
	public String update(BbsVO vo, Model model,String col,String nowPage,String word) {
		

		model.addAttribute("flag", dao.update(vo));
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		return "redirect:/bbs/list";
	}
	
	@RequestMapping("/bbs/delete")
	public String delete(int bbsno, Model model, int nowPage, String col, String word) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("bbsno", bbsno);
		
		map.put("col", col);
		map.put("word", word);
		int total = dao.total(map);
			try {
				service.delete(bbsno);				
				model.addAttribute("col",col);
				model.addAttribute("word",word);
				model.addAttribute("nowPage",nowPage);
				return "redirect:list.tiles";
			}catch(Exception e){
				return "error/error";
			}

	}
	
	@RequestMapping("/bbs/read")
	public String read(int nowPage, String col, String word, int bbsno, Model model,HttpServletRequest request) {
		dao.upViewcnt(bbsno);
		BbsVO vo = dao.read(bbsno);
		vo.setContent(vo.getContent().replaceAll("/r/n", "<br>"));
		model.addAttribute("vo", vo);
		
		/* 댓글 관련 시작 */
		String url = "read";
		int nPage = 1; // 시작 페이지 번호는 1부터

		if (request.getParameter("nPage") != null) {
			nPage = Integer.parseInt(request.getParameter("nPage"));
		}
		int recordPerPage = 10; // 한페이지당 출력할 레코드 갯수

		int sno = ((nPage - 1) * recordPerPage); //
		int eno = nPage * recordPerPage;

		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("bbsno", bbsno);

		List<ReplyDTO> list = rdao.list(map);

		int total = rdao.total(bbsno);
		String paging = Utility.pagingR(total, nPage, recordPerPage, url,bbsno,nowPage, col,word);
		
		model.addAttribute("rlist", list);
		model.addAttribute("paging", paging);
		model.addAttribute("nPage", nPage);
		/* 댓글 관련 끝 */
		
		return "bbs/read.tiles";
		
	}
	@RequestMapping(value = "/bbs/create", method = RequestMethod.POST)
	public String create(BbsVO vo) {
		boolean flag = dao.create(vo);
		if(flag) {
			return "redirect:/bbs/list";
		}else {
			return "error/error";
		}
	}
	
	@RequestMapping(value = "/bbs/create", method = RequestMethod.GET)
	public String create() {
		return "bbs/createForm.tiles";
	}
	
	@RequestMapping("/bbs/list")
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
		List<BbsVO> list = dao.list(map);
		
		String paging = Utility.paging2("list", total, nowPage, recordPerPage, col, word);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("rdao",rdao);
		return "bbs/list.tiles";
	}

}
