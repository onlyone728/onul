package com.onul.photo.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum Space {

	STUDIO("원룸")
	, LIVINGROOM("거실")
	, BEDROOM("침실")
	, KITCHEN("주방")
	, BATHROOM("욕실")
	, CHILDRENSROOM("아이방")
	, DRESSROOM("드레스룸")
	, WORKROOM("서재&작업실")
	, VERANDA("베란다")
	, OFFICESPACE("사무공간")
	, COMMERCIALSPACE("상업공간")
	, FURNITUREANDACC("가구&소품")
	, ENTRANCE("현관")
	, EXTERIORANDETC("외관&기타");
	
	private String label;
}
