package spring.model.bbs;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.model.bbs.BbsDAO;
import spring.model.bbs.BbsVO;
@Service
public class BbsService {
	@Autowired
	private BbsDAO dao;
	@Autowired
	private ReplyDAO rdao;
	
	
	public void delete(int bbsno) throws Exception{
		rdao.bdelete(bbsno);
		dao.delete(bbsno);
	}
	public boolean reply(BbsVO vo) throws Exception{
		// TODO Auto-generated method stub
		boolean flag = false;
		Map<String,Integer> map = new HashMap<String,Integer>();

		
		flag = dao.replyCreate(vo);
	 
		return flag;
	}
	
}
