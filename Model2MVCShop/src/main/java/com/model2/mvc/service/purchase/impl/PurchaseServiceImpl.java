package com.model2.mvc.service.purchase.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseDao;
import com.model2.mvc.service.purchase.PurchaseService;

@Service("purchaseServiceImpl")
public class PurchaseServiceImpl implements PurchaseService{

	@Autowired
	@Qualifier("purchaseDaoImpl")
	private PurchaseDao purchaseDao;

	public void setPurchaseDao(PurchaseDao purchaseDao) {
		this.purchaseDao = purchaseDao;
	}
	
	public PurchaseServiceImpl() {
		System.out.println(this.getClass());
	}


	public void addPurchase(Purchase purchase) throws Exception{
		purchaseDao.insertPurchase(purchase);
	}

	@Override
	public Purchase getPurchase(int tranNo) throws Exception {
		Purchase purchase = purchaseDao.getPurchase(tranNo);
		return purchase;
	}

	@Override
	public Purchase getPurchase2(int prodNo) throws Exception {
		Purchase purchase = purchaseDao.getPurchase2(prodNo);
		return purchase;
	}

	@Override
	public Map<String, Object> getPurchaseList(Search search, String buyerId) throws Exception {
		Map<String, Object> map = purchaseDao.getPurchaseList(search,buyerId);
		System.out.println("여기는 서비스 임플 : "+map);
		return map;
	}

	@Override
	public HashMap<String, Object> getSaleList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updatePurchase(Purchase purchase) throws Exception {
		purchaseDao.updatePurchase(purchase);
	}

	@Override
	public void updateTranCode(Purchase purchase) throws Exception {
		purchaseDao.updateTranCode(purchase);
	}
	
	
}