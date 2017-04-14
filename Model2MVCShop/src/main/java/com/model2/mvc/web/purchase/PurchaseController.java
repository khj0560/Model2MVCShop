package com.model2.mvc.web.purchase;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;

@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {

	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	public PurchaseController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="addPurchase", method=RequestMethod.GET)
	public String addPurchase(@RequestParam("prodNo") int prodNo, Model model) throws Exception{
		
		System.out.println("/purchase/addPurchase : GET");
		
		Product product=productService.getProduct(prodNo);
		
		System.out.println("PurchaseController productÂô ³ª¿Í¶ù : "+product);
		
		model.addAttribute("product",product);
		
		return "forward:/purchase/addPurchaseView.jsp";
	}
	
	@RequestMapping(value="addPurchase", method=RequestMethod.POST)
	public String addPurchase(@RequestParam("userId") String userId, @RequestParam("prodNo") String stringProdNo, @ModelAttribute("purchase") Purchase purchase, Model model) throws Exception {
		
		System.out.println("/purchase/addPurchase : POST");
		
		int prodNo = Integer.parseInt(stringProdNo);
		Product purchaseProd = productService.getProduct(prodNo);
		purchase.setPurchaseProd(purchaseProd);
		
		User buyer = userService.getUser(userId);
		purchase.setBuyer(buyer);
		
		purchaseService.addPurchase(purchase);
		
		model.addAttribute("purchase",purchase);
		
		return "forward:/purchase/addPurchase.jsp";
	}
	
	@RequestMapping(value="listPurchase")
	public String listPurchase(@ModelAttribute("search") Search search, HttpSession session, Model model) throws Exception {

		System.out.println("/purchase/listPurchase : GET / POST");	
		
		String buyerId=((User)session.getAttribute("user")).getUserId();
		
		System.out.println("2222222: "+buyerId);
		
		if(search.getCurrentPage() == 0){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		System.out.println("11111111111: "+search);
		
		Map<String, Object> map = purchaseService.getPurchaseList(search,buyerId);
		
		System.out.println("ÅäÅ»Ä«¿îÆ®?! : "+map.get("totalCount"));
		
		Page resultPage =	new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);

		System.out.println("list°¡ ¹»±î ¹¹µé¾úÀ»±î : "+map.get("list"));
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/purchase/listPurchase.jsp";
	}
	
	@RequestMapping(value="getPurchase")
	public String getPurchase(@RequestParam("tranNo") int tranNo, Model model ) throws Exception {
	
		Purchase purchase = purchaseService.getPurchase(tranNo);
		
		model.addAttribute("purchase",purchase);
			
		return "forward:/purchase/getPurchase.jsp";
	}
	
	@RequestMapping(value="updatePurchase", method=RequestMethod.GET)
	public String updatePurchase(@RequestParam("tranNo") int tranNo, Model model ) throws Exception {
		
		System.out.println("/purchase/updatePurchase : GET");
		
		Purchase purchase = purchaseService.getPurchase(tranNo);
		
		model.addAttribute("purchase", purchase);
		
		return "forward:/purchase/updatePurchaseView.jsp";
	}
	
	@RequestMapping(value="updatePurchase", method=RequestMethod.POST)
	public String updatePurchase(@ModelAttribute("purchase") Purchase purchase, @RequestParam("buyerId") String buyerId ) throws Exception {
		
		System.out.println("/purchase/updatePurchase : POST");	
		
		User user = userService.getUser(buyerId);
		purchase.setBuyer(user);
		
		System.out.println("¾÷µ¥ÀÌÆ®ÆÞÃ­ÁîÀÔ´Ï´Ù : "+purchase);
		
		purchaseService.updatePurchase(purchase);
		
		return "redirect:/purchase/listPurchase";
	}
	
	@RequestMapping(value="updateTranCodeByProd")
	public String UpdateTranCodeByProdAction(@RequestParam("prodNo") int prodNo ) throws Exception {
		
		Purchase purchase = purchaseService.getPurchase2(prodNo);
		purchaseService.updateTranCode(purchase);
		
		return "redirect:/product/listProduct?menu=manage";
	}
	
	@RequestMapping(value="updateTranCode")
	public String UpdateTranCode(@RequestParam("tranNo") int tranNo ) throws Exception {
		
		Purchase purchase = purchaseService.getPurchase(tranNo);
		purchaseService.updateTranCode(purchase);		
		
		return "redirect:/purchase/listPurchase.jsp";
	}
}
