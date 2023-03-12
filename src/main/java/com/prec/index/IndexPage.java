package com.prec.index;

import org.springframework.context.annotation.Primary;

@Primary
public class IndexPage {
	int startNo; // 목록의 시작위치
	int endNo; // 목록의 끝 위치
	int listSize = 16; // 목록의 행 수
	int totSize; // 검색된 전체 건수
	int blockSize = 7; // 표시된 페이지의 수
	int totPage; // 전체 페이지 수
	int startPage; // 첫 페이지 위치
	int endPage; // 마지막 페이지 위치
	int nowPage = 1; // 사용자가 보고있는 현재 페이지
	String findStr;
	
	public IndexPage() {
		compute();
	}
	
	public IndexPage(int totSize, int nowPage) {
		this.totSize = totSize;
		this.nowPage = nowPage;
		compute();
	}
	
	public void compute() {
		totPage = (int)Math.ceil(totSize/(double)listSize);
		endNo = listSize * nowPage;
		startNo = endNo - listSize + 1;
		if(endNo>totSize) endNo = totSize;
		
		endPage = (int)Math.ceil(nowPage/(double)blockSize)*blockSize;
		startPage = endPage - blockSize + 1;
		if(endPage>totPage) endPage = totPage;
	}
	
	public static void main(String[] args) {
		IndexPage p = new IndexPage();
		p.setTotSize(450);
		p.setNowPage(1);
		p.compute();
		System.out.println("totPage : "+p.getTotPage());
		System.out.println("startNo : "+p.getStartNo());
		System.out.println("endNo : "+p.getEndNo());
		System.out.println("startPage : "+p.getStartPage());
		System.out.println("endPage : "+p.getEndPage());
		System.out.println("nowPage : "+p.getNowPage());
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getTotSize() {
		return totSize;
	}

	public void setTotSize(int totSize) {
		this.totSize = totSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public int getTotPage() {
		return totPage;
	}

	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public String getFindStr() {
		return findStr;
	}

	public void setFindStr(String findStr) {
		this.findStr = findStr;
	}
	
	
	
}
