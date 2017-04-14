package com.model2.mvc.service.purchase.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.purchase.PurchaseDao;

@Repository("purchaseDaoImpl")
public class PurchaseDaoImpl implements PurchaseDao{

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession; 

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public PurchaseDaoImpl() {
		System.out.println(this.getClass());
	}

	public void insertPurchase(Purchase purchase) throws SQLException {
		sqlSession.insert("PurchaseMapper.insertPurchase", purchase);
		
	}

	@Override
	public Map<String, Object> getPurchaseList(Search search, String buyerId) throws Exception {
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		System.out.println("디에오디에도이");
		
		map.put("search", search);
		map.put("buyerId", buyerId);
		
		List<Purchase> list = sqlSession.selectList("PurchaseMapper.getPurchaseList",map);
		
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setBuyer((User)sqlSession.selectOne("UserMapper.getUser", list.get(i).getBuyer().getUserId()));
			list.get(i).setPurchaseProd((Product)sqlSession.selectOne("ProductMapper.getProduct", list.get(i).getPurchaseProd().getProdNo()));
		}
		
		map.put("totalCount", sqlSession.selectOne("PurchaseMapper.getTotalCount", buyerId));
		
		map.put("list", list);
		
		return map;
	}

	@Override
	public int getTotalCount(String sql) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String makeCurrentPageSql(String sql, Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Purchase getPurchase(int tranNo) throws Exception {
		Purchase purchase = sqlSession.selectOne("PurchaseMapper.getPurchase", tranNo);
		return purchase;
	}

	@Override
	public Purchase getPurchase2(int prodNo) throws Exception {
		Purchase purchase = sqlSession.selectOne("PurchaseMapper.getPurchase2", prodNo);
		return purchase;
	}

	@Override
	public void updateTranCode(Purchase purchase) throws Exception {
		sqlSession.update("PurchaseMapper.updateTrancode",purchase);
	}

	@Override
	public void updatePurchase(Purchase purchase) throws SQLException {
		System.out.println("디에이오임쁠입니다 : "+purchase);
		sqlSession.update("PurchaseMapper.updatePurchase",purchase);
	}

}
