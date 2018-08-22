package com.zhiyou100.util;

import java.util.List;

public class PageUtil<E> {
	 
		private int pageNumber;
		private int pageCount;
		private int pageIndex;
		private int pageSize;
		private List<E> list;
		@Override
		public String toString() {
			return "PageUtil [pageNumber=" + pageNumber + ", pageCount=" + pageCount + ", pageIndex=" + pageIndex
					+ ", pageSize=" + pageSize + ", list=" + list + "]";
		}
		public int getPageNumber() {
			return pageNumber;
		}
		public void setPageNumber(int pageNumber) {
			this.pageNumber = pageNumber;
		}
		public int getPageCount() {
			return pageCount;
		}
		public void setPageCount(int pageCount) {
			this.pageCount = pageCount;
		}
		public int getPageIndex() {
			return pageIndex;
		}
		public void setPageIndex(int pageIndex) {
			this.pageIndex = pageIndex;
		}
		public int getPageSize() {
			return pageSize;
		}
		public void setPageSize(int pageSize) {
			this.pageSize = pageSize;
		}
		public List<E> getList() {
			return list;
		}
		public void setList(List<E> list) {
			this.list = list;
		}
		
}
