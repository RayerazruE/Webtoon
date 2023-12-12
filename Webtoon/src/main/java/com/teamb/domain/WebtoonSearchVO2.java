package com.teamb.domain;

import java.util.ArrayList;

import lombok.Data;

@Data
public class WebtoonSearchVO2 {
	
	private ArrayList<Long> genre_code;		
	private ArrayList<Long> platform_code;
	private ArrayList<Long> payment_code;
	private ArrayList<Long> weekday_code;
	
	private String author_name;
	private String webtoon_title;

	public WebtoonSearchVO2() {
		genre_code = new ArrayList<Long>();
		platform_code = new ArrayList<Long>();
		payment_code = new ArrayList<Long>();
		weekday_code = new ArrayList<Long>();
	}
	
	
	
	
	
	
}
