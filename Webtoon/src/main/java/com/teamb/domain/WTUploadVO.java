package com.teamb.domain;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class WTUploadVO {
	Long webtoonId;
	String title;
	ArrayList<String> author;
	String url;
	String img;
	String service;
	ArrayList<String> updateDays;
	WTUploadAdditionalVO additional;
	
	public WTUploadVO() {
		updateDays = new ArrayList<String>();
	}
	
//	
//	{
//		"_id": "63c175fb0ed41c5c6179e52a",
//		"webtoonId": 3000060722620,
//		"title": "도군",
//		"author": "China Literature/Yueguan Baishao,약천수",
//		"url": "https://page.kakao.com/content/60722620",
//		"img": "//dn-img-page.kakao.com/download/resource?kid=06UJi/hyCQ9kwg5C/kwhHWoeYhGhyMJ4CtSCgc0&filename=th3",
//		"service": "kakaoPage",
//		"updateDays": [
//			"mon",
//			"wed",
//			"fri",
//			"sat"
//		],
//		"fanCount": 24,
//		"searchKeyword": "도군chinaliteratureyueguanbaishao약천수",
//		"additional": {
//			"new": false,
//			"rest": false,
//			"up": true,
//			"adult": false,
//			"singularityList": []
//		}
//	}
}



