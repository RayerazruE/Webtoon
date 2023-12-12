package com.teamb.mapper;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.teamb.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.teamb.config.RootConfig.class})
@Log4j
public class BoardMapperTest {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	

	
	
//	@Test
	public void testGetList() {
		mapper.getList();
	}
	
//	@Test
	public void testInsert()
	{
		BoardVO board = new BoardVO();
		board.setUser_id("testuser0012");
		board.setTitle("스프링에서 글 써보기 ");
		board.setBoard_content("스프링에서에서 작성한 내용");
		board.setBoard_regdate(new Date());
		board.setBoard_regdate(new Date());
		mapper.insert(board);
		
	}
	
//	@Test
	public void testInsertSelectKey()
	{
		BoardVO board = new BoardVO();
		board.setUser_id("testuser0013");
		board.setTitle("STS에서 글 써보기 select key ");
		board.setBoard_content("STS에서 작성한 내용 select key");
		
		mapper.insertSelectKey(board);
		
	}
	
//	@Test
	public void testRead()
	{  
		//존재 하는 번호로 할것 L앞에 숫자
		BoardVO board = mapper.read(1L);
	}
	
//	@Test
	public void testDelete()
	{	//존재 하는 번호로 할것 L앞에 숫자
		log.info("DELETE COUNT" + mapper.delete(45L));
	}
	
	@Test
	public void testUpdate() {
		//존재 하는 번호로 할것 L앞에 숫자
		BoardVO board = new BoardVO();
		board.setBoard_num(2L);
		board.setUser_id("testuser0002");
		board.setTitle("STS에서 수정한 제목 ");
		board.setBoard_content("STS에서 수정한 내용");
		
		int count = mapper.update(board);
		log.info("UPDATE COUNT" + count);
	}
}
