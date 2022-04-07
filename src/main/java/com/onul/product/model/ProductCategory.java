package com.onul.product.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum ProductCategory {

	FURNITURE("가구")
	, FABRIC("패브릭")
	, LIGHT("조명")
	, HOMEAPPLIANCES("가전")
	, KITCHEN("주방용품")
	, DECO("데코/식물")
	, ORGANIZE("수납정리")
	, HOUSEHOLDGOODS("생활용품")
	, DRAWER("서랍/수납장")
	, DAILYNECESSITY("생필품");
	
	private String label;
}
