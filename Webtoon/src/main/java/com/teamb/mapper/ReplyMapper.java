package com.teamb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.teamb.domain.Criteria;
import com.teamb.domain.ReplyVO;

public interface ReplyMapper 
{
	public int insert(ReplyVO vo);
	
	public ReplyVO read(Long board_num);
	
	public int delete(Long board_num);
	
	public int update(ReplyVO reply_content);

	public List<ReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("board_num") Long board_num);
	
}
