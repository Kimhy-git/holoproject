package com.javalec.holo.dto;

public class Pagination {
	private int listSize = 10;                //초기값으로 목록개수를 10으로 셋팅, 마이폐이지의 내가쓴글, 내가쓴댓글

	private int mypageListSize = 5;			//마이페이지에서 자신이 지원한 목록을 띄울 때 사용하는 셋팅
	
	private int rangeSize = 5;            //초기값으로 페이지범위를 10으로 셋팅

	private int page;

	private int range;

	private int listCnt;

	private double pageCnt;

	private int startPage;

	private int startList;

	private double endPage;

	private boolean prev;

	private boolean next;
	
	private String helpme_id;
	private String helpyou_id;
	private String applier;
	private String user_id;
	
	
	public Pagination() {}
	

	public Pagination(String helpme_id, String helpyou_id, String applier) {
		super();
		this.helpme_id = helpme_id;
		this.helpyou_id = helpyou_id;
		this.applier = applier;
	}


	public double getPageCnt() {
		return pageCnt;
	}

	public String getHelpme_id() {
		return helpme_id;
	}

	public String getHelpyou_id() {
		return helpyou_id;
	}

	public String getApplier() {
		return applier;
	}

	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}

	public void setStartList(int startList) {
		this.startList = startList;
	}

	public void setHelpme_id(String helpme_id) {
		this.helpme_id = helpme_id;
	}

	public void setHelpyou_id(String helpyou_id) {
		this.helpyou_id = helpyou_id;
	}

	public void setApplier(String applier) {
		this.applier = applier;
	}

	public int getRangeSize() {
		return rangeSize;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}
	
	public int getRange() {
		return range;
	}
	
	public void setRange(int range) {
		this.range = range;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public double getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
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

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getListCnt() {
		return listCnt;
	}

	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}

	public int getStartList() {
		return startList;
	}

	public void pageInfo(int page, int range, int listCnt) {
		this.page = page;
		this.range = range;
		this.listCnt = listCnt;

		//전체 페이지수 
		if(listCnt%listSize!=0) {
			this.pageCnt = (int)Math.ceil(listCnt/listSize)+1;
		} else {
			this.pageCnt = (int)Math.ceil(listCnt/listSize);
		}

		//시작 페이지
		this.startPage = (range - 1) * rangeSize + 1 ;

		//끝 페이지
		this.endPage = range * rangeSize;

		//게시판 시작번호
		this.startList = (page - 1) * listSize;

		//이전 버튼 상태
		this.prev = range == 1 ? false : true;

		//다음 버튼 상태
		this.next = endPage > pageCnt ? false : true;
		if (this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}

	}
	
	public void pageInfo_mypage(int page, int range, int listCnt,String user_id) {
		this.page = page;
		this.range = range;
		this.listCnt = listCnt;
		this.user_id = user_id;
		
		//전체 페이지수 
		this.pageCnt = (double)Math.ceil(listCnt/listSize)+1;

		//시작 페이지
		this.startPage = (range - 1) * rangeSize + 1 ;

		//끝 페이지
		this.endPage = range * rangeSize;

		//게시판 시작번호
		this.startList = (page - 1) * listSize;

		//이전 버튼 상태
		this.prev = range == 1 ? false : true;

		//다음 버튼 상태
		this.next = endPage > pageCnt ? false : true;
		if (this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}

	}
}
