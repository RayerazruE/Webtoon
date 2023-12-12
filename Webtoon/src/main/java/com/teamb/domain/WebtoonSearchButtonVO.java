package com.teamb.domain;

import java.util.List;

import lombok.Data;

@Data
public class WebtoonSearchButtonVO {
	
	Long genre_code;	
	String genre_name;
	
	Long platform_code;
	String platform_name;
	String platform_url;

	Long payment_code;
	String payment_type;

	Long weekday_code;
	String weekday_day;

//	String author_name;
//	
//	String webtoon_title;
	
	
	
	
}
