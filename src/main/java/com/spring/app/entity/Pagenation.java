package com.spring.app.entity;

public class Pagenation {
	
	private int size = 10;		//한 페이지에 있는 글 목록 개수
	private int skip;			//건너뛸 개수
	private int total;			//전체 글 개수
	private int page;			//현재 페이지
	private int startPN;		//번호 구역에서 시작 번호
	private int endPN;       	//번호 구역에서 마지막 번호
	private int lastPN;			//전체 번호 구역에서 최종 마지막 번호
	private boolean prev;		//이전 버튼
	private boolean next; 		//다음 버튼
	
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getSkip() {
		return skip;
	}
	public void setSkip(int skip) {
		this.skip = skip;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
        this.lastPN = (int)(Math.ceil(this.total / (double)this.size));
        setPage(this.page);
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
        if(page < 1) page = 1;
        this.page = page;
        this.skip = (this.page - 1) * this.size;
        //코드 순서 중요: start 번호가 제대로 나오기 위함
        this.endPN = (int)(Math.ceil(this.page / (double)this.size)) * this.size;
        this.startPN = (this.endPN - 9) > 0 ? (this.endPN - 9) : 1;
        this.endPN = (this.endPN > this.lastPN) ? this.lastPN : this.endPN;
        this.prev = this.startPN > 1;
        this.next = this.total > (this.endPN * this.size);
	}
	public int getStartPN() {
		return startPN;
	}
	public void setStartPN(int startPN) {
		this.startPN = startPN;
	}
	public int getEndPN() {
		return endPN;
	}
	public void setEndPN(int endPN) {
		this.endPN = endPN;
	}
	public int getLastPN() {
		return lastPN;
	}
	public void setLastPN(int lastPN) {
		this.lastPN = lastPN;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	
	@Override
	public String toString() {
		return "Pagenation [size=" + size + ", skip=" + skip + ", total=" + total + ", page=" + page + ", startPN="
				+ startPN + ", endPN=" + endPN + ", lastPN=" + lastPN + ", prev=" + prev + ", next=" + next + "]";
	}
	
}
