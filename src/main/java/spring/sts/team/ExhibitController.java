package spring.sts.team;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.model.img.ImgDAO;
import spring.model.img.ImgDTO;
import spring.sts.utility.Utility;
@Controller
public class ExhibitController {
	@Autowired
	private ImgDAO dao;
	
	
	
	@RequestMapping(value="/exhibit/json", produces = "application/text; charset=utf8")
	 @ResponseBody
	 public String json(HttpServletRequest request,Model model){
		//		jsontest
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
		int recordPerPage = 9;//한페이지당 보여줄 레코드갯수

		//DB에서 가져올 순번-----------------
		int sno = ((nowPage-1)*recordPerPage);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("col", col);
		map.put("sno",sno);
		map.put("classes", "exhibit");
		List<ImgDTO> list = dao.list(map);
		//System.out.println("AASDADS");
		map.put("list", list);
		
		
		System.out.println(list.get(0).getImgno());
		JSONArray jarr = new JSONArray(); 
		for(int i =0; i<list.size(); i++) {
			JSONObject jsonObject= new JSONObject();
			jsonObject.put("imgno", list.get(i).getImgno());
			jsonObject.put("title", list.get(i).getTitle());
			jsonObject.put("subtitle", list.get(i).getSubtitle());
			jsonObject.put("nail_img", list.get(i).getNail_img());
			jsonObject.put("classes", list.get(i).getClasses());
			jsonObject.put("types", list.get(i).getTypes());			
			jarr.add(jsonObject);			
		}
		

	  return jarr.toJSONString();
	 }
	
	@RequestMapping("/exhibit/list")
	public String list(HttpServletRequest request,Model model) {
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
		int recordPerPage = 9;//한페이지당 보여줄 레코드갯수
		 
		//DB에서 가져올 순번-----------------
		int sno = ((nowPage-1)*recordPerPage);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("col", col);
		map.put("sno",sno);
		map.put("classes", "exhibit");
		
		int total= dao.total(map);
		List<ImgDTO> list = dao.list(map);
		String paging = Utility.paging2("list", total, nowPage, recordPerPage, col, word);
	
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		return "exhibit/list.tiles";
	}
	
	@RequestMapping(value="/exhibit/read" ,method=RequestMethod.GET)
	public String read(int imgno, Model model) {
		ImgDTO dto = dao.read(imgno);
		model.addAttribute("dto",dto);		
		return "exhibit/read.tiles";
	}
}
