package spring.sts.team;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/*
 *  애노테이션
 *  @RequestParam 파라미터 값 찾아냄
 *  @CookieValue 쿠키 이름 이용해 쿠키 값 추출
 *  @SessionAttribute 세션상에서 모델 정보를 유지하고 싶은 경우
 *  @Repository dao 객체
 *  @Service 서비스 객체
 *  
 *  RedirectAttributes 클래스 : 리다이렉트 시점에 원하는 데이터 임시로 추가 가능
 */
@Controller
public class ArtController {

	@RequestMapping(value = "/art/orderCheck", method = RequestMethod.GET)
	public ModelAndView orderCheck() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("art/orderCheck.tiles");
		return mav;
	}

	@RequestMapping(value = "/art/make", method = RequestMethod.GET)
	public ModelAndView make() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("art/make.tiles");
		return mav;
	}

	@RequestMapping(value = "/art/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("art/create.tiles");
		return mav;
	}

	@RequestMapping(value = "/art/order", method = RequestMethod.GET)
	public ModelAndView order() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("art/order.tiles");
		return mav;
	}

	@RequestMapping(value = "/art/cart", method = RequestMethod.GET)
	public ModelAndView cart() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("art/cart.tiles");
		return mav;
	}

	@RequestMapping(value = "/art/read", method = RequestMethod.GET)
	public ModelAndView read() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("art/read.tiles");
		return mav;
	}

	@RequestMapping(value = "/art/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("art/list.tiles");
		return mav;

	}

}
