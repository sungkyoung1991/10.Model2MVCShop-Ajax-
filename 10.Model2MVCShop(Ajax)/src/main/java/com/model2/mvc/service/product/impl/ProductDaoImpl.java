package com.model2.mvc.service.product.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductDao;


@Repository("productDaoImpl")
public class ProductDaoImpl implements ProductDao {

	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	

	public void setSqlSession(SqlSession sqlSession) {
		System.out.println("::" + getClass() + ".setSqlSession() call..");
		this.sqlSession = sqlSession;
	}

	public ProductDaoImpl() {
		System.out.println("::" + getClass() + "default Constructor Call");
	}

	@Override
	public void insertProduct(Product product) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("ProductMapper.addProduct", product);

	}

	@Override
	public Product findProduct(int prodNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ProductMapper.getProduct", prodNo);
	}

	@Override
	public List<Product> getProductList(Search search) throws Exception {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList("ProductMapper.getProductList", search);
	}

	@Override
	public void updateProduct(Product product) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("ProductMapper.updateProduct", product);

	}

	@Override
	public int removeProduct(int prodNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete("ProductMapper.removeProduct", prodNo);
	}

	@Override
	public String makeCurrentPageSql(String sql, Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ProductMapper.getTotalCount", search);
	}

	@Override
	public List<Product> updateReply(Product product) {
		return sqlSession.selectList("ProductMapper.updateReply", product);
		
		
	}
	
		

}
