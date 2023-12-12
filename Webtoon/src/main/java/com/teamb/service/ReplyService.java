package com.teamb.service;

import java.util.List;

import com.teamb.domain.Criteria;
import com.teamb.domain.ReplyVO;

public interface ReplyService {
	
	public int register(ReplyVO reply);
	
	public ReplyVO get(Long reply_id);
	
	public int modify(ReplyVO reply);
	
	public int remove(Long reply_id);
	
	public List<ReplyVO> getList(Criteria cri , Long board_num);
}
