package com.teamb.domain;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class WTUploadAdditionalVO {
	
	Boolean w_new;
	Boolean rest;
	Boolean up;
	Boolean adult;
	
	
	String w_new1;
	String rest1;
	String up1;
	String adult1;
	
	public WTUploadAdditionalVO() {
		w_new = false;
		rest = false;
		up = false;
		adult = false;
		
		w_new1 = "false";
		rest1 = "false";
		up1 = "false";
		adult1 = "false";
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
