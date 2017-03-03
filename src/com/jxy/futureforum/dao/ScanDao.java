package com.jxy.futureforum.dao;

import java.util.List;

import com.jxy.futureforum.model.Scan;

public interface ScanDao {
	public void add(Scan scan);
	public int seekViewerNum(int articleId);
	public List<Scan> seekByArticleId(List<Scan> list,int articleId);
	public List<Scan> seekByViewerId(List<Scan> list,int viewerId);
	public Boolean removeByArticleId(int articleId);
}
