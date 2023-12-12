package com.teamb.Controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.teamb.config.RootConfig;
import com.teamb.config.ServletConfig;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(classes = {RootConfig.class, ServletConfig.class})
@Log4j
public class ReplyControllerTest {

    @Setter(onMethod_ = {@Autowired})
    private WebApplicationContext ctx;

    private MockMvc mockMvc;

    @Before
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
    }

//    @Test  // 댓글 등록 테스트  ㅇㅋ
    public void testCreate() throws Exception {
        mockMvc.perform(post("/page/new")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"board_num\": 3,\"reply_content\": \"댓글 테스트 내용\",\"user_id\": \"testuser0012\"}"))
               .andDo(print())
               .andExpect(status().isOk());
    }

//    @Test // 특정 게시글 댓글 목록 조회 테스트    ㅇㅋ
    public void testGetList() throws Exception {
        mockMvc.perform(get("/page/pages/{board_num}/{page}", 3, 1)
               .accept(MediaType.APPLICATION_JSON)) // JSON 응답을 요청
               .andDo(print())
               .andExpect(status().isOk())
               .andExpect(content().contentType(MediaType.APPLICATION_JSON));
    }


//    @Test // 댓글 조회 테스트   ㅇㅋ
    public void testGet() throws Exception {
        mockMvc.perform(get("/page/{reply_id}", 22)
               .accept(MediaType.APPLICATION_JSON)) // JSON 응답을 요청하는 헤더를 추가
               .andDo(print())
               .andExpect(status().isOk())
               .andExpect(content().contentType(MediaType.APPLICATION_JSON));
    }


//    @Test // 댓글 수정 테스트  ㅇㅋ
    public void testModify() throws Exception {
        mockMvc.perform(put("/page/{reply_id}", 22)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"reply_content\": \"수정된 댓글 내용\",\"user_id\": \"testuser0012\"}"))
               .andDo(print())
               .andExpect(status().isOk());
    }

//    @Test // 댓글 삭제 테스트  ㅇㅋ
    public void testRemove() throws Exception {
        mockMvc.perform(delete("/page/{reply_id}", 21))
               .andDo(print())
               .andExpect(status().isOk());
    }
}
