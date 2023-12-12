package com.teamb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.domain.Criteria;
import com.teamb.domain.ReplyVO;
import com.teamb.mapper.ReplyMapper;

import lombok.Setter;
@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Setter(onMethod_ = @Autowired)
	
	private ReplyMapper mapper;

	//댓 쓰기
	@Override
	public int register(ReplyVO reply) {
		return mapper.insert(reply);
	}

	//댓 번호로 조회
	@Override
	public ReplyVO get(Long reply_id) {
		return mapper.read(reply_id);
	}

	//댓수정
	@Override
	public int modify(ReplyVO reply) {
		return mapper.update(reply);
	}

	//댓삭제
	@Override
	public int remove(Long reply_id) {
		return mapper.delete(reply_id);
	}

	//특정게시글의 댓 모두 조회
	@Override
	public List<ReplyVO> getList(Criteria cri, Long board_num) {
        return mapper.getListWithPaging(cri, board_num);
    }




}
