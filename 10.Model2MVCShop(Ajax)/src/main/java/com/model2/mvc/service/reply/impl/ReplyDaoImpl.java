package com.model2.mvc.service.reply.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Reply;
import com.model2.mvc.service.reply.ReplyDao;


@Repository("replyDaoImpl")
public class ReplyDaoImpl implements ReplyDao {

	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) throws Exception {
		System.out.println("::" + getClass() + ".setSqlSession() call..");
		this.sqlSession = sqlSession;
	}


	@Override
	public void insertReply(Reply reply) throws Exception {
		// TODO Auto-generated method stub
		
		sqlSession.insert("ReplyMapper.insertReply",reply);
		
	}
	

	
		

}
