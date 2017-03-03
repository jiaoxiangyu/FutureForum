package com.jxy.futureforum.bo.impl;

import java.util.List;

import com.jxy.futureforum.bo.ScanBo;
import com.jxy.futureforum.dao.ScanDao;
import com.jxy.futureforum.model.Scan;

public class ScanBoImpl implements ScanBo {
	private ScanDao scanDao;	
	public ScanDao getScanDao() {
		return scanDao;
	}

	public void setScanDao(ScanDao scanDao) {
		this.scanDao = scanDao;
	}

	@Override
	public void add(Scan scan) {
		scanDao.add(scan);
	}

	@Override
	public List<Scan> seekByArticleId(List<Scan> list, int articleId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Scan> seekByViewerId(List<Scan> list, int viewerId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int seekViewerNum(int articleId) {
		return scanDao.seekViewerNum(articleId);
	}

	@Override
	public Boolean removeByArticleId(int articleId) {		
		return scanDao.removeByArticleId(articleId);
	}

}
