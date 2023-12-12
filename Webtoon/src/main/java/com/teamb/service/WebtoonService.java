package com.teamb.service;

import java.util.List;

import org.json.simple.JSONArray;

import com.teamb.domain.WebtoonRelatedVO;
import com.teamb.domain.WebtoonSearchVO;
import com.teamb.domain.WebtoonSearchVO2;
import com.teamb.domain.WebtoonVO;

public interface WebtoonService {
	
	
	public List<WebtoonVO> getWebtoonList();

	public List<WebtoonVO> WebtoonSearch();

	public Object getSearchGenreButton();

	public Object getSearchPlatformButton();

	public Object getSearchPaymentButton();

	public Object getSearchWeekdayButton();

	public Object getWebtoonSearch(WebtoonSearchVO2 webtoonSearch);

	public WebtoonVO getWebtoonDetail(Long webtoon_id);

	public List<WebtoonVO> getWebtoonPlatform(Long webtoon_id);

	public List<WebtoonVO> getWebtoonGenre(Long webtoon_id);

	public List<WebtoonVO> getWebtoonWeekday(Long webtoon_id, Long platform_code);

	public List<WebtoonVO> getWebtoonAuthor(Long webtoon_id, Long platform_code);

	public WebtoonVO getPlatformChar(Long webtoon_id, Long platform_code);

	public void hitUp(Long webtoon_id, String user_id);

	public void updateRanking(Long webtoon_id);

	public Long isLiked(String user_id, Long webtoon_id);

	public Long isFav(String user_id, Long webtoon_id);

	public Long insertOrDeleteLike(Long isLiked, String user_id, Long webtoon_id);
	
	public Long insertOrDeleteFav(Long isFav, String user_id, Long webtoon_id);
	
	public  List<WebtoonVO> sameAuthorWT(Long webtoon_id);

	public Long isCommentExist(String user_id, Long webtoon_id);
	
	public void insertComment(String user_id, Long webtoon_id, String newComment);
	
	public void uploadWebtoonByJson(String WTJson);
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public List<WebtoonVO> plurl(); //플랫폼 url 가져오기

	public List<WebtoonVO> fav_getWebtoonList(WebtoonVO webtoon); //즐겨찾기

	public List<WebtoonVO> cmtList (Long webtoon_id); //댓글조회

	public void wt_delete(Long webtoon_id);

	public List<WebtoonVO> SimilarWT(Long webtoon_id);

	public void wt_cmt_delete(Long webtoon_id, String user_id);

	public void wt_cmt_modify(Long webtoon_id, String modifyComment, String user_id);





}
