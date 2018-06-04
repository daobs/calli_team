package spring.model.request;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RequestDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	public int total(Map map){
		return mybatis.selectOne("request.total", map);
	}
	public List<RequestDTO> list(Map map) {
		return mybatis.selectList("request.list", map);
	}
	public boolean create(RequestDTO vo) {
		return mybatis.insert("request.create", vo)>0;
	}
	public RequestDTO read(int requestno) {
		return mybatis.selectOne("request.read", requestno);
	}
	public boolean delete(int requestno) {
		return mybatis.delete("request.delete", requestno)>0;
	}

}
