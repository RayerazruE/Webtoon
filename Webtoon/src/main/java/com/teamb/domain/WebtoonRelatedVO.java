package com.teamb.domain;

import java.util.ArrayList;

import lombok.Data;

@Data
public class WebtoonRelatedVO {
	
	private ArrayList<Long> author_id;		

	public WebtoonRelatedVO() {
		author_id = new ArrayList<Long>();
	}
	
	
	
	
	
	
}
