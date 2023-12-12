package com.teamb.domain;

import lombok.Data;

@Data
public class MemberVO {
	
	private String user_id;
	private String password;
	private String name;
	private String email;
	private String phone;
	private String admin_code;
	private String profile_photo;
	
}