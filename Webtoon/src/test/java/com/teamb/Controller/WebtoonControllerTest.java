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
@ContextConfiguration(classes = { com.teamb.config.RootConfig.class, com.teamb.config.ServletConfig.class} )
@Log4j
public class WebtoonControllerTest {
	
	@Setter(onMethod_ = { @Autowired })
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testRegister() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders
											.post("/page/main2")
											.param("genre_code[0]", "1")
											.param("genre_code[1]", "2")
											.param("platform_code[0]", "1")
											.param("platform_code[1]", "2")
											.param("author_name", "user00")
											.param("webtoon_title", "title00")
											)
									.andReturn()
									.getModelAndView()
									.getViewName();
		log.info(resultPage);
	}
	
//	@Test
	public void testRegister2() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders
											.post("/page/main")
//											.param("webtoonSearch.genre_code[0]", "1")
//											.param("webtoonSearch.genre_code[1]", "2")
//											.param("webtoonSearch.platform_code[0]", "1")
//											.param("webtoonSearch.platform_code[1]", "2")
//											.param("author_name", "user00")
//											.param("webtoon_title", "title00")
											.param("genre_code1", "1")
											.param("genre_code2", "2")
											)
									.andReturn()
									.getModelAndView()
									.getViewName();
		log.info(resultPage);
	}

}
