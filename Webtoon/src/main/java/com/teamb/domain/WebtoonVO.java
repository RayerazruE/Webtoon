package com.teamb.domain;

import java.util.Date;

import lombok.Data;

@Data
public class WebtoonVO {

	private Long webtoon_id;
	private String webtoon_title;
	private String thumbnail;
	private String webtoon_explain;
	
	private Long webtoon_ranking;
	private Long webtoon_popularity;
	private String genre_name;

	
	private Long weekday_code;
	private String weekday_day;
	

	
	private String user_id;
	private String name;

	private Long platform_code;
	private String platform_name;
	private Long min_platform_code;
	
	
	
	private String author_name;
	private String author_id;
	
	private String url;
	private Long payment_code;
	private String payment_type; // 추가됨
	private String platform_url;// 플랫폼url 가져오기

	private String w_new;
	private String w_rest;
	private String w_up;
	private String w_adult;
	
	
	private Long view_count;

	private String comments_content;
	private Date comments_regdate;
	private Date commnets_W_updatedate;
}
