package com.dao;

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
	
	public List<PlayDTO> UserDetail(String user_name){
		return template.selectList("PlayMapper.UserDetail",user_name);
	}
	
	public int CheckId(PlayDTO pdto) {
		return template.selectOne("PlayMapper.CheckId",pdto);
	}
	public int CheckEmail(PlayDTO pdto) {
		return template.selectOne("PlayMapper.CheckEmail",pdto);
	}
}
