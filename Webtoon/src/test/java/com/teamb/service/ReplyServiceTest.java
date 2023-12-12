package com.teamb.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.teamb.domain.Criteria;
import com.teamb.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.teamb.config.RootConfig.class} )
@Log4j
public class ReplyServiceTest {

	@Setter(onMethod_ = {@Autowired})
	private ReplyService service;
	
//	@Test  //댓 등록
    public void testRegister() {
        ReplyVO reply = new ReplyVO();
        reply.setBoard_num(1L); // 게시판 번호 설정
        reply.setUser_id("testuser0010"); // 사용자 ID 설정
        reply.setReply_content("서비스 테스트 댓글 내용"); // 댓글 내용 설정

        service.register(reply);
        log.info("새로 작성된 게시물의 번호: " + reply.getReply_id());
    }

//    @Test // 댓 조회
    public void testGet() {
        Long reply_id = 21L; // 존재하는 댓글 ID
        ReplyVO reply = service.get(reply_id);
        
    }

//    @Test //댓 수정
    public void testModify() {
        ReplyVO reply = new ReplyVO();
        reply.setReply_id(21L); // 수정할 댓글의 ID 설정
        reply.setReply_content("수정된 서비스 댓글 내용"); // 수정할 내용 설정

        service.modify(reply);
        log.info("수정 결과 입니다." + service.modify(reply));
    }

//    @Test //댓 삭
    public void testRemove() {
        Long replyId = 21L; // 존재하는 댓글 ID
        service.remove(replyId);
    }

//    @Test //특정 게시글 댓 모두 조회
    public void testGetList() {
        Criteria cri = new Criteria(); // 필요한 경우 설정
        Long board_num = 1L; // 존재하는 게시판 번호
        List<ReplyVO> reply = service.getList(cri, board_num);
    }
}