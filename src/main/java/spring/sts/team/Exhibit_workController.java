package spring.sts.team;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class Exhibit_workController {
	
	@RequestMapping(value="/exhibit_work/list" ,method=RequestMethod.GET)
	public String read() {
		
		return "exhibit_work/list.tiles";
	}

}
