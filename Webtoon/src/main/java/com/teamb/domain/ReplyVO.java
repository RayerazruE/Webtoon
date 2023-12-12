package com.teamb.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

  private Long reply_id;
  private Long board_num;

  private String user_id;
  private String reply_content;
  private Date reply_regdate;
  private Date reply_w_updatedate;

}