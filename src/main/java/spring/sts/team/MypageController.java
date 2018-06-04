package spring.sts.team;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MypageController {

	@RequestMapping(value = "/mypage/cancel", method = RequestMethod.GET)
	public ModelAndView cancel() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/cancel.tiles");
		return mav;
	}

	@RequestMapping(value = "/mypage/detail", method = RequestMethod.GET)
	public ModelAndView detail() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/detail.tiles");
		return mav;
	}

	@RequestMapping(value = "/mypage/reviewCreatePop", method = RequestMethod.GET)
	public ModelAndView review() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/reviewCreatePop.tiles");
		return mav;
	}

	@RequestMapping(value = "/mypage/recently", method = RequestMethod.GET)
	public ModelAndView recently() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/recently.tiles");
		return mav;
	}

	@RequestMapping(value = "/mypage/myinfo", method = RequestMethod.GET)
	public ModelAndView myinfo() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/myinfo.tiles");
		return mav;
	}

	@RequestMapping(value = "/mypage/wishlist", method = RequestMethod.GET)
	public ModelAndView wishlist() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/wishlist.tiles");
		return mav;
	}

}
