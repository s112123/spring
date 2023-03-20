package com.spring.app.entity;

public class LinkParam {
	
	private String searchOption;
	private String searchKeyword;
	
	public String getSearchOption() {
		return searchOption;
	}
	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	@Override
	public String toString() {
		return "SearchParam [searchOption=" + searchOption + ", searchKeyword=" + searchKeyword + "]";
	}
		
}
