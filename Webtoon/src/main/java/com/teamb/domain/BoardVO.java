package com.teamb.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private long board_num;
	private String user_id;
	private String title;
	private String board_content;
	private Date board_regdate;
	private Date board_w_updatedate;
}
