package com.teamb.mapper;

import java.util.ArrayList;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.teamb.domain.WebtoonSearchVO2;
import com.teamb.domain.WebtoonVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { com.teamb.config.RootConfig.class })
@Log4j
public class WebtoonMapperTest {

	@Setter(onMethod_ = @Autowired)
	private WebtoonMapper w_mapper;
	
	@Test
	public void testIsCommentExist() {
		w_mapper.isCommentExist("testuser0001",1L);
	}
	
//	@Test
	public void testSameAuthorWT() {
		w_mapper.sameAuthorWT(1L);
	}
//	@Test
	public void testFav() {
//		w_mapper.insertFav("testuser0001", 5L);
		w_mapper.deleteFav("testuser0001", 5L);
	}
//	@Test
	public void testUpdateRanking() {
		w_mapper.updateRanking();
	}
	
//	@Test
	public void testUpdatePopularity() {
		w_mapper.updatePopularity(27L);
	}
//	@Test
	public void testRanking_new() {
		w_mapper.ranking_new(27L);
	}
//	@Test
	public void testSelectRanking() {
		w_mapper.selectRanking(27L);
	}
//	@Test
	public void testView_count() {
		w_mapper.selectView_count(1L, "testuser0001");
	}
	
	
//	@Test
	public void testSelectView_count() {
		w_mapper.selectView_count(1L, "testuser0001");
	}
	
//	@Test
	public void testView_count_up() {
		w_mapper.view_count_up(1L, "testuser0001");
		w_mapper.selectView_count(1L, "testuser0001");
	}
	
//	@Test
	public void testView_count_new() {
		w_mapper.view_count_new(1L, "testuser0001");
		w_mapper.selectView_count(1L, "testuser0001");
	}
	
//	@Test
	public void testGetWebtoonGenre() {
		w_mapper.getWebtoonGenre(2L);
	}
	
	
//	@Test
	public void testGetWebtoonWeekday() {
		log.info("----------------"+w_mapper.getWebtoonWeekday(1L, 1L));
		
	}
	
	
//	@Test
	public void testGetWebtoonPlatform() {
		w_mapper.getWebtoonPlatform(2L);
	}
	
	
//	@Test
	public void testGetWebtoonList() {
		w_mapper.getWebtoonList();
	}

//	@Test
	public void testGetSearchPaymentButton() {
		w_mapper.getSearchPaymentButton();
	}

//	@Test
	public void testGetSearchWeekdayButton() {
		w_mapper.getSearchWeekdayButton();
	}

//	@Tests
	public void testInsertWebtoon() {
		WebtoonVO webtoon = new WebtoonVO();
		webtoon.setWebtoon_id(100L);
		webtoon.setThumbnail("http://어쩌구");
		webtoon.setWebtoon_title("나루토");
		webtoon.setWebtoon_ranking(111L);
		webtoon.setWebtoon_popularity(100L);
//		w_mapper.insertWebtoon(webtoon);

//		w_mapper.getWebtoonList().forEach(webtoon -> log.info(webtoon));

	}

//	@Test
	public void testgetSearchGenreButton() {
		w_mapper.getSearchGenreButton();

//		w_mapper.getWebtoonList().forEach(webtoon -> log.info(webtoon));

	}

//	@Test
	public void testgetSearchPlatformButton() {
		w_mapper.getSearchPlatformButton();

//		w_mapper.getWebtoonList().forEach(webtoon -> log.info(webtoon));

	}

//	@Test
//	public void testWebtoonFav() {
//		WebtoonVO webtoon = new WebtoonVO();
//		webtoon.setUser_id("testuser0001");
//		w_mapper.fav(webtoon);
//	}

//	@Test
	public void testWebtoonSearch() {
//
		WebtoonSearchVO2 webtoonSearch = new WebtoonSearchVO2();

		ArrayList<Long> genre_code1 = new ArrayList<Long>();
//		genre_code1.add(1L);
//		genre_code1.add(2L);
//		genre_code1.add(1L);
//		genre_code1.add(1L);
//		genre_code1.add(1L);
//		genre_code1.add(1L);
//		genre_code1.add(1L);
//		genre_code1.add(1L);
//		genre_code1.add(1L);
//		genre_code1.add(1L);
//		genre_code1.add(1L);
//		genre_code1.add(1L);
//		genre_code1.add(1L);

		ArrayList<Long> platform_code1 = new ArrayList<Long>();
//		platform_code1.add(1L);
//		platform_code1.add(2L);
//		platform_code1.add(2L);

		ArrayList<Long> payment_code1 = new ArrayList<Long>();
//		payment_code1.add(1L);
//		payment_code1.add(2L);
//		payment_code1.add(2L);

		ArrayList<Long> weekday_code1 = new ArrayList<Long>();
//		weekday_code1.add(1L);
//		weekday_code1.add(2L);
//		weekday_code1.add(2L);
//		weekday_code1.add(2L);
//		weekday_code1.add(2L);
//		weekday_code1.add(2L);
//		weekday_code1.add(2L);
//		weekday_code1.add(2L);

		webtoonSearch.setGenre_code(genre_code1);
		webtoonSearch.setPlatform_code(platform_code1);
		webtoonSearch.setPayment_code(payment_code1);
		webtoonSearch.setWeekday_code(weekday_code1);

		webtoonSearch.setAuthor_name("");

		webtoonSearch.setWebtoon_title("");
		
		
		w_mapper.WebtoonSearch(webtoonSearch);

//		genre_code 넣기
		if (webtoonSearch.getGenre_code().size() == 0) {
			for (int i = 0; i < 13; i++) {
				webtoonSearch.getGenre_code().set(i, Long.valueOf(i + 1));
			}
		}
		else {
			for (int i = 0; i < 13; i++) {

				if (webtoonSearch.getGenre_code().get(i) == null) {
					webtoonSearch.getGenre_code().set(i, webtoonSearch.getGenre_code().get(i - 1));
				}
			}
		}
		
//		Platform_code 넣기
		if (webtoonSearch.getPlatform_code().size() == 0) {
			for (int i = 0; i < 3; i++) {
				webtoonSearch.getPlatform_code().set(i, Long.valueOf(i + 1));
			}
		}
		else {
			for (int i = 0; i < 3; i++) {

				if (webtoonSearch.getPlatform_code().get(i) == null) {
					webtoonSearch.getPlatform_code().set(i, webtoonSearch.getPlatform_code().get(i - 1));
				}
			}
		}
		
//		Payment_code 넣기
		if (webtoonSearch.getPayment_code().size() == 0) {
			for (int i = 0; i < 3; i++) {
				webtoonSearch.getPayment_code().set(i, Long.valueOf(i + 1));
			}
		}
		else {
			for (int i = 0; i < 3; i++) {

				if (webtoonSearch.getPayment_code().get(i) == null) {
					webtoonSearch.getPayment_code().set(i, webtoonSearch.getPayment_code().get(i - 1));
				}
			}
		}
		
//		Weekday_code 넣기
		if (webtoonSearch.getWeekday_code().size() == 0) {
			for (int i = 0; i < 8; i++) {
				webtoonSearch.getWeekday_code().set(i, Long.valueOf(i + 1));
			}
		}
		else {
			for (int i = 0; i < 8; i++) {

				if (webtoonSearch.getWeekday_code().get(i) == null) {
					webtoonSearch.getWeekday_code().set(i, webtoonSearch.getWeekday_code().get(i - 1));
				}
			}
		}

//		author_name, webtoon_title 가공
		webtoonSearch.setAuthor_name("%" + webtoonSearch.getAuthor_name() + "%");
		webtoonSearch.setWebtoon_title("%" + webtoonSearch.getWebtoon_title() + "%");

		/////////////////////////////////////////////////////////////////////

		ArrayList<Long> genre_code = new ArrayList<Long>();
		ArrayList<Long> platform_code = new ArrayList<Long>();
		ArrayList<Long> payment_code = new ArrayList<Long>();
		ArrayList<Long> weekday_code = new ArrayList<Long>();

		// genre_code
		if (webtoonSearch.getGenre_code().size() != 0) {

			for (int i = 0; i < webtoonSearch.getGenre_code().size(); i++) {
				genre_code.add(webtoonSearch.getGenre_code().get(i));
			}
			for (int i = webtoonSearch.getGenre_code().size(); i < 13; i++) {
				genre_code.add(webtoonSearch.getGenre_code().get(0));
			}

		}

		// platform_code
		if (webtoonSearch.getPlatform_code().size() == 0) {
			platform_code.add(1L);
			platform_code.add(2L);
			platform_code.add(3L);
		} else {

			for (int i = 0; i < webtoonSearch.getPlatform_code().size(); i++) {
				platform_code.add(webtoonSearch.getPlatform_code().get(i));
			}
			for (int i = webtoonSearch.getPlatform_code().size(); i < 3; i++) {
				platform_code.add(webtoonSearch.getPlatform_code().get(0));
			}
		}

		// payment_code
		if (webtoonSearch.getPayment_code().size() == 0) {
			payment_code.add(1L);
			payment_code.add(2L);
			payment_code.add(3L);
		} else {

			for (int i = 0; i < webtoonSearch.getPayment_code().size(); i++) {
				payment_code.add(webtoonSearch.getPayment_code().get(i));
			}
			for (int i = webtoonSearch.getPayment_code().size(); i < 3; i++) {
				payment_code.add(webtoonSearch.getPayment_code().get(0));
			}
		}

		// weekday_code
		if (webtoonSearch.getWeekday_code().size() == 0) {
			weekday_code.add(1L);
			weekday_code.add(2L);
			weekday_code.add(3L);
			weekday_code.add(4L);
			weekday_code.add(5L);
			weekday_code.add(6L);
			weekday_code.add(7L);
			weekday_code.add(8L);
		} else {

			for (int i = 0; i < webtoonSearch.getWeekday_code().size(); i++) {
					weekday_code.add(webtoonSearch.getWeekday_code().get(i));
			}
			for (int i = webtoonSearch.getWeekday_code().size(); i < 8; i++) {
				weekday_code.add(webtoonSearch.getWeekday_code().get(0));
			}
		}

		String author_name = "%" + webtoonSearch.getAuthor_name() + "%";

		String webtoon_title = "%" + webtoonSearch.getWebtoon_title() + "%";

		WebtoonSearchVO2 webtoonSearch1 = new WebtoonSearchVO2();
		webtoonSearch1.setGenre_code(genre_code);
		webtoonSearch1.setPlatform_code(platform_code);
		webtoonSearch1.setPayment_code(payment_code);
		webtoonSearch1.setWeekday_code(weekday_code);
		webtoonSearch1.setWebtoon_title(webtoon_title);
		webtoonSearch1.setAuthor_name(author_name);

		if (webtoonSearch.getGenre_code().size() != 0) {
			w_mapper.WebtoonSearch(webtoonSearch1);
		} else {
			w_mapper.WebtoonSearch2(webtoonSearch1);
		}

//		w_mapper.WebtoonSearch(webtoonSearch);

	}

//	@Test
	public void testfav() {
		WebtoonVO webtoon = new WebtoonVO();
		webtoon.setUser_id("testuser0001");
		w_mapper.fav(webtoon);
	}
//	

//	@Test
//	public void testInsert() {
//		BoardVO board = new BoardVO();
//		board.setTitle("새로 작성하는 글");
//		board.setContent("새로 작성하는 내용");
//		board.setWriter("newbie");
//		
//		mapper.insert(board);
//		
//		log.info(board);
//	}

//	@Test
//	public void testInsertSelectKey() {
//		BoardVO board = new BoardVO();
//		board.setTitle("새로 작성하는 글 select key");
//		board.setContent("새로 작성하는 내용 select key");
//		board.setWriter("newbie");
//		
//		mapper.insertSelectKey(board);
//		
//		log.info(board);
//	}
//
//	@Test
//	public void testRead() {
//		BoardVO board = mapper.read(8L);
//		
//		log.info(board);
//	}
////	
//	@Test
//	public void testDelete() {
//		
//		log.info("DELETE COUNT: " + mapper.delete(3L));
//	}
//	
//	@Test
//	public void testUpdate() {
//		WebtoonVO Webtoon = new WebtoonVO();
//		Webtoon.set(8L);
//		Webtoon.setTitle("수정된 제목");
//		Webtoon.setContent("수정된 내용");
//		Webtoon.setWriter("user00");
//		
//		int count = mapper.update(board);
//		log.info("UPDATE COUNT: " + count);
//	}
//	

	// 웹툰 상세보기
	// @Test
	public void testdetail_tt() {
		WebtoonVO webtoon = new WebtoonVO();
		webtoon.setWebtoon_id(1L);

//		w_mapper.detail_tt(webtoon);
	}

	// @Test
	public void testdetail_character() {
		WebtoonVO webtoon = new WebtoonVO();
		webtoon.setWebtoon_id(1L);
		webtoon.setPlatform_code(1L);

//		w_mapper.detail_character(webtoon);
	}
	
	//플랫폼 url가져오기
	//@Test
	   public void testplurl() {
		   
		   w_mapper.plurl();
	   }

}
