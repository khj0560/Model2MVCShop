package com.model2.mvc.service.purchase;


import java.sql.SQLException;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;


public interface PurchaseDao {

	public void insertPurchase(Purchase purchase) throws SQLException ;

	public Map<String , Object> getPurchaseList(Search search, String buyerId) throws Exception ;
	
	public int getTotalCount(String sql) throws Exception ;
	//private?
	public String makeCurrentPageSql(String sql , Search search) ;
	//private?
	public Purchase getPurchase(int tranNo) throws Exception ;
	
	public Purchase getPurchase2(int prodNo) throws Exception ;
	
	public void updateTranCode(Purchase purchase) throws Exception ;

	public void updatePurchase(Purchase purchase) throws SQLException ;
		
}
