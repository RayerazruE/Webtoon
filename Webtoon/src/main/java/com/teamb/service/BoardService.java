package com.teamb.service;

import java.util.List;

import com.teamb.domain.BoardVO;

public interface BoardService {
	//게시글 등록
	public void register(BoardVO board);
	//보드넘버로 특정 게시글 가져오기
	public BoardVO get(Long board_num);
	//게시글 수정
	public boolean modify(BoardVO board);
	//게시글 삭제
	public boolean remove(Long board_num);
	//게시글 모두 조회
	public List<BoardVO> getList();
}
