package com.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.PlayDTO;

@Repository
public class PlayDAO {

	@Autowired
	SqlSessionTemplate template;
	
	public List<PlayDTO> PlayUserList(){
		return template.selectList("PlayMapper.PlayUserList");
	}
	
	public void PlayJoin(PlayDTO pdto) {
		template.insert("PlayMapper.PlayJoin",pdto);
	}
	
	public List<PlayDTO> UserDetail(HashMap<String, Object> name_id_map){
		return template.selectList("PlayMapper.UserDetail",name_id_map);
	}
	
	public int CheckId(PlayDTO pdto) {
		return template.selectOne("PlayMapper.CheckId",pdto);
	}
	public int CheckEmail(PlayDTO pdto) {
		return template.selectOne("PlayMapper.CheckEmail",pdto);
	}
}
