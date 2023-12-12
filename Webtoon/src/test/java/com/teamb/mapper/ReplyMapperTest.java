package com.teamb.mapper;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.teamb.domain.BoardVO;
import com.teamb.domain.Criteria;
import com.teamb.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.teamb.config.RootConfig.class})
@Log4j
public class ReplyMapperTest {

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;

//	@Test  //댓글 입력 테스트
	public void testInsert()
	{
		ReplyVO reply = new ReplyVO();
		Long Board_num = 13L;
		reply.setBoard_num(Board_num);
		
		reply.setUser_id("testuser0002");
		reply.setReply_content("스프링에서에서 작성한 댓글");
		reply.setReply_regdate(new Date());
		reply.setReply_w_updatedate(new Date());
		mapper.insert(reply);
		
	}
	
	
//	@Test  //댓글 조회
	public void testRead()
	{
		//존재 하는 댓글 번호로 할것 L앞에 숫자
		Long reply_id = 14L;
		ReplyVO reply = mapper.read(reply_id);
	}

//	@Test //댓글 삭제
	public void testDelete() 
	{		//존재 하는 댓번호로 할것 L앞에 숫자
		log.info("DELETE COUNT" + mapper.delete(14L));
		
	}
	
//	@Test //댓글 수정
    public void testUpdate() {
        // 테스트를 위한 ReplyVO 객체 생성
        ReplyVO reply = new ReplyVO();
        reply.setReply_id(1L);
        reply.setReply_content("새로운 내용"); // 변경할 내용
        int count = mapper.update(reply);
        log.info("UPDATE COUNT" + count);
	}
	
    @Test  //특정 게시글 댓 모두 출력
    public void testGetListWithPaging() {
        // 페이징을 위한 Criteria 객체 생성
        Criteria cri = new Criteria();
        cri.setPageNum(1);
        cri.setAmount(10);

        // 특정 게시판 번호 L앞에 게스글 번호
        Long board_num = 1L;

        // getListWithPaging 메소드 호출
        List<ReplyVO> list = mapper.getListWithPaging(cri, board_num);

        // 필요한 경우, 리스트의 내용을 출력하여 확인
        list.forEach(reply -> System.out.println(reply));
    }
}
