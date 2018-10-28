package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.PlayDAO;
import com.dto.PlayDTO;

@Service
public class PlayService {

	@Autowired
	PlayDAO dao;
	
	public List<PlayDTO> PlayUserList(){
		return dao.PlayUserList();
	}
	
	public void PlayJoin(PlayDTO pdto) {
		dao.PlayJoin(pdto);
	}
	
	public List<PlayDTO> UserDetail(String user_name){
		return dao.UserDetail(user_name);
	}
	
	public int CheckId(PlayDTO pdto) {
		return dao.CheckId(pdto);
	}
	
	public int CheckEmail(PlayDTO pdto) {
		return dao.CheckEmail(pdto);
	}
}
