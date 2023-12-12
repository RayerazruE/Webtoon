package com.teamb.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.teamb.domain.WTUploadAdditionalVO;
import com.teamb.domain.WTUploadVO;
import com.teamb.domain.WebtoonRelatedVO;
import com.teamb.domain.WebtoonSearchButtonVO;
import com.teamb.domain.WebtoonSearchVO;
import com.teamb.domain.WebtoonSearchVO2;
import com.teamb.domain.WebtoonVO;

public interface WebtoonMapper {

	public List<WebtoonVO> getWebtoonList(); //전체 웹툰 리스트

	public List<WebtoonVO> WebtoonSearch(WebtoonSearchVO2 webtoonSearch); //웹툰검색(장르선택O)
	
	public List<WebtoonVO> WebtoonSearch2(WebtoonSearchVO2 webtoonSearch); //웹툰검색(장르선택X)

	public List<WebtoonSearchButtonVO> getSearchGenreButton(); //장르검색버튼 가져오기
	
	public List<WebtoonSearchButtonVO> getSearchPlatformButton(); //플랫폼검색버튼 가져오기
	
	public List<WebtoonSearchButtonVO> getSearchPaymentButton(); //결제버튼 가져오기
	
	public List<WebtoonSearchButtonVO> getSearchWeekdayButton(); //요일버튼 가져오기
	
	public WebtoonVO getWebtoonDetail(Long webtoon_id);

	public List<WebtoonVO> getWebtoonPlatform(Long webtoon_id);
	
	public List<WebtoonVO> getWebtoonGenre(Long webtoon_id);

	public List<WebtoonVO> getWebtoonWeekday(@Param("webtoon_id") Long webtoon_id, @Param("platform_code") Long platform_code);

	public List<WebtoonVO> getWebtoonAuthor(@Param("webtoon_id") Long webtoon_id, @Param("platform_code") Long platform_code);

	public WebtoonVO getPlatformChar(@Param("webtoon_id") Long webtoon_id, @Param("platform_code") Long platform_code);

	public WebtoonVO selectView_count(@Param("webtoon_id") Long webtoon_id, @Param("user_id") String user_id);

	public void view_count_up(@Param("webtoon_id") Long webtoon_id, @Param("user_id") String user_id);

	public void view_count_new(@Param("webtoon_id") Long webtoon_id, @Param("user_id") String user_id);

	public WebtoonVO selectRanking(Long webtoon_id);

	public void ranking_new(Long webtoon_id);

	public void updatePopularity(Long webtoon_id);

	public void updateRanking();

	public Object getlike(@Param("user_id") String user_id, @Param("webtoon_id") Long webtoon_id);

	public Object getFav(@Param("user_id") String user_id, @Param("webtoon_id") Long webtoon_id);

	public void insertLike(@Param("user_id") String user_id, @Param("webtoon_id") Long webtoon_id);

	public void deleteLike(@Param("user_id") String user_id, @Param("webtoon_id") Long webtoon_id);
	
	public void insertFav(@Param("user_id") String user_id, @Param("webtoon_id") Long webtoon_id);

	public void deleteFav(@Param("user_id") String user_id, @Param("webtoon_id") Long webtoon_id);

	public List<WebtoonVO> sameAuthorWT(Long webtoon_id);
	
	public WebtoonVO isCommentExist(@Param("user_id") String user_id, @Param("webtoon_id") Long webtoon_id);
	
	public void insertComment(@Param("user_id") String user_id, @Param("webtoon_id") Long webtoon_id, @Param("newComment") String newComment);

	
//-------------------웹툰 등록 json -------------------------------------------------------------------
	public Object selectWebtoonId(Long webtoon_id);//

	public void updateAdditional(@Param("webtoon_id") Long webtoon_id, @Param("platform_name") String platform_name, @Param("additional") WTUploadAdditionalVO uploadAdditionalVO1);//

	public Object selectAuthor(String author_name);//

	public void insertAuthor(@Param("author_name") String author_name);//

	public WebtoonVO selectPlatform(String platform_name);//

	public void insertPlatform(@Param("platform_name") String platform_name);//

	public Object selectWeekday(String weekday_day);//

	public void insertWeekday(@Param("weekday_day") String weekday_day);//
	
	
	public List<WebtoonVO> selectWebtoonIdByTitle(String webtoon_title);
	
	public void insertWebtoon(@Param("webtoon_id") Long webtoon_id, @Param("webtoon_title") String webtoon_title, @Param("thumbnail") String thumbnail);

//	public void insertWebtoon(WTUploadVO wtUploadVO);//

//-----------------------코드 및 아이디 테이블 넣기 완료-----------------------------------------------------

	public void insertPlatformcharacter(@Param("webtoon_id") Long webtoon_id, @Param("platform_name") String platform_name, @Param("url") String url, @Param("payment_code") Long payment_code);

	public void insertWt_aut(@Param("webtoon_id") Long webtoon_id, @Param("platform_name") String platform_name, @Param("author_name")  String author_name);//

	public void insertWt_wd_pl(@Param("webtoon_id") Long webtoon_id, @Param("weekday_day") String weekday_day, @Param("platform_name") String platform_name);//


	public void insertWT_gen(@Param("webtoon_id") Long webtoon_id, @Param("genre_name") String genre_name);
	



/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public List<WebtoonVO> cmtList (Long webtoon_id); //댓글조회
	
	public List<WebtoonVO> fav(WebtoonVO webtoon); //좋아요
	
	public List<WebtoonVO> plurl(); //플랫폼 URL가져오기
	
	public List<WebtoonVO> fav_getWebtoonList(WebtoonVO webtoon); //즐겨찾기
	
	public void wt_delete(Long webtoon_id);
	
	public List<WebtoonVO> SimilarWT(Long webtoon_id);

	public void wt_cmt_delete(@Param("webtoon_id")Long webtoon_id, @Param("user_id") String user_id);

	public void wt_cmt_modify(@Param("webtoon_id")Long webtoon_id,@Param("modifyComment") String modifyComment, @Param("user_id") String user_id);




	
	
	

}
