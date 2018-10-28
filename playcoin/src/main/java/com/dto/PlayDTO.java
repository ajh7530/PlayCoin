package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("Play")
public class PlayDTO {

	private String user_id;
	private String user_name;
	private String user_email;
	private String user_nickname;
	private String user_register_date;

	public PlayDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PlayDTO(String user_id, String user_name, String user_email, String user_nickname,
			String user_register_date) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_nickname = user_nickname;
		this.user_register_date = user_register_date;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getUser_register_date() {
		return user_register_date;
	}

	public void setUser_register_date(String user_register_date) {
		this.user_register_date = user_register_date;
	}

	@Override
	public String toString() {
		return "PlayDTO [user_id=" + user_id + ", user_name=" + user_name + ", user_email=" + user_email
				+ ", user_nickname=" + user_nickname + ", user_register_date=" + user_register_date + "]";
	}

}
