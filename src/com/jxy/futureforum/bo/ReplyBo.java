package com.jxy.futureforum.bo;

import java.util.List;

import com.jxy.futureforum.model.PageArgs;
import com.jxy.futureforum.model.Reply;

public interface ReplyBo {
	public Boolean add(Reply reply);
	public List<Reply> seekByArticleId(List<Reply> list,int articleId);
	public Boolean removeByArticleId(int articleId);
	//根据articleId获得评论页数的最大值
	public PageArgs getMaxPageByaArtId(PageArgs pageArgs,int articleId);
	//根据articleId分页查询
	public List<Reply> seekbyByaArtId(List<Reply> list,int articleId,PageArgs pageArgs);
	//根据userId查询评论条数
    public long seekReplyNumByUserId(int userId);
}
