package com.teamb.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.teamb.domain.BoardVO;
import com.teamb.mapper.BoardMapper;

import lombok.AllArgsConstructor;
@Service
@AllArgsConstructor
public class BoardServiceimpl implements BoardService{

	private BoardMapper mapper;
	
	//글 등록
	@Override
	public void register(BoardVO board) {
		mapper.insertSelectKey(board);	
	}
	
	//글 번호로조 회
	@Override
	public BoardVO get(Long board_num) {
		return mapper.read(board_num);
	}

	//글 수정
	@Override
	public boolean modify(BoardVO board) {
		return mapper.update(board) == 1;
	}

	//글 삭제
	@Override
	public boolean remove(Long board_num) {
		return mapper.delete(board_num) == 1;
	}

	//글 전체 리스드 보기
	@Override
	public List<BoardVO> getList() {
		return mapper.getList();
	}

}
