package com.teamb.service;

import static org.junit.Assert.assertNotNull;

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
@ContextConfiguration(classes = {com.teamb.config.RootConfig.class} )
@Log4j
public class BoardServiceTest {

	@Setter(onMethod_ = {@Autowired})
	private BoardService service;
	
//	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
//	@Test
	public void testRegister() {
		BoardVO board = new BoardVO();
		board.setUser_id("testuser0013");
		board.setTitle("서비스 테스트 제목");
		board.setBoard_content("서비스 테스트 내용");
		board.setBoard_regdate(new Date());
		board.setBoard_w_updatedate(new Date());
		
		service.register(board);
		
		log.info("새로 작성된 게시물의 번호: " + board.getBoard_num());
	}
	
//	@Test
	public void testGetList() {
		service.getList().forEach(board -> log.info(board));
	}
	
//	@Test
	public void testGet() {
		//L앞에 가져올 게시판 글 번호
		log.info(service.get(18L));
	}
	
	@Test
	public void testDelete() {
		// 게시글 번호의 존재여부 확인후 테스트,L앞에 가져올 게시판 글 번호
		log.info("삭제 결과 : " + service.remove(11L));
	}
	
//	@Test
	public void testUpdate() {
//		L앞에 가져올 게시판 글 번호
		BoardVO board = service.get(12L);
		if (board == null) {
			return;
		}
		board.setTitle("제목 수정합니다.");
		log.info("수정 결과 입니다." + service.modify(board));
	}
	
}
