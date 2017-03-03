package com.jxy.futureforum.bo;

import java.util.List;

import com.jxy.futureforum.model.Scan;

public interface ScanBo {
	public void add(Scan scan);
	public int seekViewerNum(int articleId);
	public List<Scan> seekByArticleId(List<Scan> list,int articleId);
	public List<Scan> seekByViewerId(List<Scan> list,int viewerId);
	public Boolean removeByArticleId(int articleId);	
}
