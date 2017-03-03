package com.jxy.futureforum.model;
/*
 * 分页类
 * 属性：当前页面、页面大小、最大页数、上一页的页码、下一页的页码
 */
public class PageArgs {
	private int pageNum;
	private int pageSize;
	private long maxPage;
	private int prePage;
	private int nextPage;
	public int getPageNum() {
		return pageNum;
	}	
	public void setPageNum(int pageNum){
		this.pageNum=pageNum;
		prePage=pageNum-1<=1 ? 1 : pageNum-1;//设置上一页的页码
		nextPage=(int) (pageNum+1>=maxPage ? maxPage : pageNum+1);//设置下一页的页码
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public long getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(long maxPage) {
		this.maxPage = maxPage;
	}
	public int getPrePage() {
		return prePage;
	}
	public int getNextPage() {
		return nextPage;
	}
	@Override
	public String toString() {
		return "PageArgs [pageNum=" + pageNum + ", pageSize=" + pageSize + ", maxPage=" + maxPage + ", prePage="
				+ prePage + ", nextPage=" + nextPage + "]";
	}	
}
