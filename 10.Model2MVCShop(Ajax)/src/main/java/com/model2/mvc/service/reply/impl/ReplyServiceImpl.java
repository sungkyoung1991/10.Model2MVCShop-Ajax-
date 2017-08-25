package com.model2.mvc.service.reply.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.service.domain.Reply;
import com.model2.mvc.service.reply.ReplyDao;
import com.model2.mvc.service.reply.ReplyService;

@Service("replyServiceImpl")
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	@Qualifier("replyDaoImpl")
	ReplyDao replyDao;
	
	public ReplyServiceImpl(){
		
	}
	
public ReplyServiceImpl(ReplyDao replyDao){
		this.replyDao = replyDao;
	}

@Override
public void insertReply(Reply reply) throws Exception {
	// TODO Auto-generated method stub
	replyDao.insertReply(reply);
}




	
	

}