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

import spring.model.img.ImgDAO;
import spring.model.img.ImgDTO;

import spring.sts.utility.Utility;


@Controller
public class ImgController {
	@Autowired
	private ImgDAO dao;

	@RequestMapping(value="/img/update",method=RequestMethod.POST)
	public String update(ImgDTO dto,HttpServletRequest request,String oldFile,Model model,String col,String nowPage) {
		String upDir = request.getRealPath("images/img/storage");
		int filesize = (int)dto.getFilenameMF().getSize();
		String filename = null;
		System.out.println("oldfile : "+ oldFile);

		if(filesize>0){
			if(oldFile!=null && !oldFile.equals("default.jpg"))
				Utility.deleteFile(upDir, oldFile);
			filename = Utility.saveFileSpring30(dto.getFilenameMF(), upDir);
		}
		//		if(filesize > 0) {
		//			dto.setNail_img(Utility.saveFileSpring30(dto.getFilenameMF(), upDir));
		//			
		//		}
		if(filename.equals(null)|| filename.equals("")) {
			dto.setNail_img(oldFile);
		} else {
			dto.setNail_img(filename);
		}
		Map<Object,Object> map = new HashMap<Object, Object>();
		//System.out.println("imgno "+dto.getImgno());
		map.put("imgno", dto.getImgno());
		map.put("nail_img", filename);

		boolean flag = dao.update(dto);
		//System.out.println("falg: "+flag);

		String classes = dto.getClasses();
		if(flag) {
			if(oldFile != null && !oldFile.equals("member.jpg"))
				Utility.deleteFile(upDir, oldFile);
			model.addAttribute("col",col);
			model.addAttribute("nowPage",nowPage);
			
			if(classes.equals("academy")) {
				classes = "student_art";
			}
			return "redirect:/"+classes+"/list";
		}else {
			return "error/error";
		}

	}
	@RequestMapping(value="/img/update",method=RequestMethod.GET)
	public String update(int imgno,Model model,HttpSession session) {
		ImgDTO dto = dao.read(imgno);
		
		if(session.getAttribute("grade").equals("A")) {
		model.addAttribute("dto",dto);		
		return "img/update.tiles";
		} else {
			return "error/error";
		}
	}


	@RequestMapping(value="/img/delete")
	public String delete(int imgno,String oldFile,Model model,HttpServletRequest request,String col,String word,String nowPage) {
		String upDir = request.getRealPath("images/img/storage");
		boolean flag = dao.delete(imgno);
		if(flag) {
			if(!oldFile.equals("default.jpg") && oldFile != null) {
				Utility.deleteFile(upDir, oldFile);
			}
		}

		model.addAttribute("col",col);
		model.addAttribute("nowPage",nowPage);
		model.addAttribute("flag",flag);
		return "img/deleteProc.tiles";
	}

	@RequestMapping(value="img/create",method=RequestMethod.POST)
	public String create(ImgDTO dto,HttpServletRequest request,Model model,String col,String nowPage) {
		String upDir = request.getRealPath("images/img/storage");
		int filesize = (int)dto.getFilenameMF().getSize();
		String fname = "default.jpg";
		if(filesize > 0) {
			fname = Utility.saveFileSpring30(dto.getFilenameMF(), upDir);

		}
		dto.setNail_img(fname);
		boolean flag = dao.create(dto);

		String classes = dto.getClasses();

		if(classes.equals("academy")) {
			classes = "student_art";
		}
		if(flag) {
			model.addAttribute("col",col);
			model.addAttribute("nowPage",nowPage);
			return "redirect:/"+classes+"/list";
		}else {
			return "error/error";
		}
	}
	@RequestMapping(value="/img/create",method=RequestMethod.GET)
	public String create() {

		return "img/create.tiles";
	}

}
