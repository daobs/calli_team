package spring.model.bbs;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BbsDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	public int total(Map map){
		return mybatis.selectOne("bbs.total", map);
	}
	public List<BbsVO> list(Map map) {
		return mybatis.selectList("bbs.list", map);
	}
	public boolean create(BbsVO vo) {
		return mybatis.insert("bbs.create", vo)>0;
	}
	public void upViewcnt(int bbsno) {
		mybatis.update("bbs.upViewcnt", bbsno);
	}
	public BbsVO read(int bbsno) {
		return mybatis.selectOne("bbs.read", bbsno);
	}
	public boolean delete(int bbsno) {
		return mybatis.delete("bbs.delete", bbsno)>0;
	}
	public boolean update(BbsVO vo) {
		boolean flag = false;
		int cnt = mybatis.update("bbs.update",vo);
		if(cnt > 0) {
			flag = true;
		}
		return flag;
	}
	
	public boolean replyCreate(BbsVO vo){
		boolean flag = false;
		int cnt = mybatis.insert("bbs.replyCreate", vo);
		if(cnt > 0) {
			flag = true;
		}
		return flag;
	}

}
