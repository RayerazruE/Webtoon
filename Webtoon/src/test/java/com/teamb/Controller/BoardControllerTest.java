package com.teamb.Controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(classes = {com.teamb.config.RootConfig.class,
								 com.teamb.config.ServletConfig.class})
@Log4j
public class BoardControllerTest 
{
	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc; //가짜 mvc- url과 파라미터를 브라우저 사용처럼 만들어 컨트롤러 실행 
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	//@Test  //1.입력테스트
	public void testRegister() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders
											.get("/page/boardregister")
											.param("user_id", "testuser0012")
											.param("title", "컨트롤러 테스트제목")
											.param("board_content", "컨트롤러 테스트 내용")
											)
										.andReturn()
										.getModelAndView()
										.getViewName();
		log.info(resultPage);
	}
	
//	@Test //2.조회 테스트
	public void testGet() throws Exception {
		
		log.info(mockMvc.perform(MockMvcRequestBuilders
								 .get("/page/boardget")
								 .param("board_num", "58"))
						.andReturn()
						.getModelAndView()
						.getModelMap()
				);
	}
	
//	@Test //3.수정 테스트
	public void testModify() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders
											.get("/page/boardmodify")
											.param("board_num", "58")
											.param("user_id", "testuser0012")
											.param("title", "컨트롤러 수정테스트 제목")
											.param("board_content", "컨트롤러 수정테스트 내용"))
							.andReturn()
							.getModelAndView()
							.getViewName();
		log.info(resultPage);
	}
	
//	@Test //4.삭제 테스트
	public void testRemove() throws Exception {
		// 삭제전에 데이터베이스에 게시물 번호 확인하기
		String resultPage = mockMvc.perform(MockMvcRequestBuilders
											.get("/page/boardremove")
											.param("board_num", "58"))
									.andReturn()
									.getModelAndView()
									.getViewName();
		log.info(resultPage);
	}
}
