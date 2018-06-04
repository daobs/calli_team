package spring.model.bbs;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	public int rcount(int bbsno){
	    return mybatis.selectOne("reply.total", bbsno);
	}
	public List<ReplyDTO> list(Map map) {
		
		return mybatis.selectList("reply.list", map);
	}
	public int total(int bbsno) {
		
		return mybatis.selectOne("reply.total", bbsno);
	}
	public boolean create(ReplyDTO dto) {
		// TODO Auto-generated method stub
		return mybatis.insert("reply.create", dto)>0;
	}
	public ReplyDTO read(int rnum) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("reply.read", rnum);
	}
	public boolean delete(int rnum) {
		// TODO Auto-generated method stub
		return mybatis.delete("reply.delete", rnum)>0;
	}
	public boolean update(ReplyDTO dto) {
		// TODO Auto-generated method stub
		return mybatis.update("reply.update", dto)>0;
	}
	public void bdelete(int bbsno) {
		mybatis.delete("reply.bdelete", bbsno);
		
	}
}
