package com.teamb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.teamb.domain.BoardVO;

public interface BoardMapper 
{
	@Select("select * from board where board_num > 0")
	
	//글 리스트
	public List<BoardVO> getList();
	
	//글 작성
	public void insert (BoardVO board);
	
	//글 작성key 지정
	public Integer insertSelectKey(BoardVO board);
	
	//글 조회 (게시글 번호를 이용)
	public BoardVO read(Long board_num);
	
	//글 삭제 (게시글 번호를 이용)
	public int delete(Long board_num);

	//글 수정
	public int update(BoardVO board);
}
