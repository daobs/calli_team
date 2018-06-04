package spring.sts.team;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Academy_noticeController {
	
	@RequestMapping("academy_notice/list")
	public ModelAndView list() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("academy_notice/list.tiles");
		return mav;
	}
	
	@RequestMapping("academy_notice/read")
	public ModelAndView read() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("academy_notice/read.tiles");
		return mav;
	}
}
