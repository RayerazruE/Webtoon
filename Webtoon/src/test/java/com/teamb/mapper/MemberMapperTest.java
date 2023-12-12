package com.teamb.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.teamb.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.teamb.config.RootConfig.class})
@Log4j
public class MemberMapperTest {
	
	@Autowired
	MemberMapper membermapper;

	@Test
	public void MemberLogin() throws Exception {
		
		MemberVO member = new MemberVO();
		
		member.setUser_id("testuser0001");
		member.setPassword("pw1111");
		
		
		/* 틀린값 */
		//member.setUser_id("testuser1");
		//member.setPassword("pw11");
		
		
		membermapper.MemberLogin(member);
		System.out.println("결과 값 : " + membermapper.MemberLogin(member));
	}
	
}
