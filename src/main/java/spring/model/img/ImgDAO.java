package spring.model.img;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ImgDAO {	
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
		
	public void setMybatis(SqlSessionTemplate mybatis) {
		
		this.mybatis = mybatis;
	}
	
	@SuppressWarnings("rawtypes")
	public List<ImgDTO> list(Map map) {
		
		return mybatis.selectList("img.list", map);
	}
	
	public boolean updateFile(Map map){
		boolean flag = false;
		int cnt = mybatis.update("img.updateFile", map);
		if(cnt > 0) {
			flag = true;
		}
		return flag;
	}
	
	public ImgDTO read(int imgno){
		return mybatis.selectOne("img.read", imgno);
		
	}
	
	public boolean create(ImgDTO dto){
		boolean flag = false;
		int cnt = mybatis.insert("img.create", dto);
		if(cnt > 0) {
			flag = true;
		}
		return flag;
	}
	public boolean update(ImgDTO dto){
		boolean flag = false;
		int cnt = mybatis.update("img.update",dto);
		if(cnt > 0) {
			flag = true;
		}
		return flag;
	}
	
	public boolean delete(int imgno){
		boolean flag = false;
		int cnt = mybatis.delete("img.delete", imgno);
		if(cnt > 0) {
			flag = true;
		}
		return flag;
	}

	public int total(Map map) {
		
		return mybatis.selectOne("img.total", map);
	}
	

	
	
}