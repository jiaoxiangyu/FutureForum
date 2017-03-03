package com.jxy.futureforum.bo.impl;

import java.util.List;

import com.jxy.futureforum.bo.ReplyBo;
import com.jxy.futureforum.dao.ReplyDao;
import com.jxy.futureforum.model.PageArgs;
import com.jxy.futureforum.model.Reply;

public class ReplyBoImpl implements ReplyBo {
	private ReplyDao replyDao;
	
	public ReplyDao getReplyDao() {
		return replyDao;
	}

	public void setReplyDao(ReplyDao replyDao) {
		this.replyDao = replyDao;
	}

	@Override
	public Boolean add(Reply reply) {
		return replyDao.add(reply);
	}

	@Override
	public List<Reply> seekByArticleId(List<Reply> list,int articleId) {
		return replyDao.seekByArticleId(list, articleId);
	}

	@Override
	public Boolean removeByArticleId(int articleId) {		
		return replyDao.removeByArticleId(articleId);
	}

	@Override
	public PageArgs getMaxPageByaArtId(PageArgs pageArgs, int articleId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Reply> seekbyByaArtId(List<Reply> list, int articleId, PageArgs pageArgs) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public long seekReplyNumByUserId(int userId) {
		
		return replyDao.seekReplyNumByUserId(userId);
	}

}
