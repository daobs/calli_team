package spring.model.notice;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	public int total(Map map){
		return mybatis.selectOne("board.total", map);
	}
	public List<NoticeVO> list(Map map) {
		return mybatis.selectList("board.list", map);
	}
	public boolean create(NoticeVO vo) {
		return mybatis.insert("board.create", vo)>0;
	}
	public void upViewcnt(int noticeno) {
		mybatis.update("board.upViewcnt", noticeno);
	}
	public NoticeVO read(int noticeno) {
		return mybatis.selectOne("board.read", noticeno);
	}
	public boolean delete(int noticeno) {
		return mybatis.delete("board.delete", noticeno)>0;
	}

}
