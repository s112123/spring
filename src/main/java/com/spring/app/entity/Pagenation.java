package com.spring.app.entity;

public class Pagenation {
	
	private int size = 10;		//한 페이지에 있는 글 목록 개수
	private int total;			//전체 글 개수
	private int page;			//현재 페이지
	private int startPN;		//번호 구역에서 시작 번호
	private int endPN;       	//번호 구역에서 마지막 번호
	private int lastPN;			//전체 번호 구역에서 최종 마지막 번호
	private boolean prev;		//이전 버튼
	private boolean next; 		//다음 버튼
	
	//건너뛸 개수
	public int getSkip() {
		return (this.page - 1) * size;
	}
	
	public int getTotal() {
		return total;
	}
	
	//전체 글 개수
	public void setTotal(int total) {
		this.total = total;
		this.lastPN = (int)(Math.ceil((this.total / (double) this.size)));
	}
	
	public int getPage() {
		return page;
	}
	
	//현재 페이지
	public void setPage(int page) {
		this.page = page;
		this.endPN = (int)(Math.ceil(this.page / 10.0)) * 10;
		this.endPN = this.endPN > this.lastPN ? this.lastPN : this.endPN;
		this.startPN = (this.endPN - 9 > 0) ? this.endPN - 9 : 1;
		this.prev = this.startPN > 1;
		this.next = this.total > (this.endPN * this.size);
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
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
		return "Pagenation [size=" + size + ", total=" + total + ", page=" + page + ", startPN=" + startPN + ", endPN="
				+ endPN + ", lastPN=" + lastPN + ", prev=" + prev + ", next=" + next + "]";
	}
	
}
