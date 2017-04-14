package com.model2.mvc.web.product;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.channels.FileChannel;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	public ProductController() {
			System.out.println(this.getClass());
		}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="addProduct", method=RequestMethod.GET)
	public String addProduct() throws Exception {
		
		System.out.println("/product/addProduct : GET");
		
		return "redirect:/product/addProductView.jsp";		
	}
	
	@RequestMapping(value="addProduct", method=RequestMethod.POST)
	public String addProduct( @ModelAttribute("product") Product product ) throws Exception {
		
		System.out.println("/product/addProduct : POST");
		
		////////////////FileUpload/////////////////
		//파일경로를 가져와서 경로 때고 확장자 포함해서 파일이름으로 String저장
		Path p = Paths.get(product.getFileName());
		String refileName = p.getFileName().toString();
		  
		//저장할곳 설정
		String target = "C:\\workspace\\Model2MVCShop\\WebContent\\images\\uploadFiles\\"
		        +refileName;
		//가져올곳 설정
		File sourceFile = new File(product.getFileName());
      
		FileInputStream inputStream =null;
		FileOutputStream outputStream = null;
		FileChannel fcin = null;
		FileChannel fcout = null;		   		   
		      
		inputStream = new FileInputStream(sourceFile);
		outputStream = new FileOutputStream(target);
		      
		fcin = inputStream.getChannel();
		fcout = outputStream.getChannel();
		      
		long size = fcin.size();
		fcin.transferTo(0, size, fcout);
		      
		         
		fcout.close();
		         
		fcin.close();
		         
		outputStream.close();
		         
		inputStream.close();   
		         
		product.setFileName(refileName);		         
		////////////////추가한부분/////////////////
	      
		productService.addProduct(product);
		
		return "forward:/product/addProduct.jsp";
	}
	
	@RequestMapping(value="listProduct")
	public String listProduct( @ModelAttribute("search") Search search, Model model, HttpServletRequest request) throws Exception {
		
		System.out.println("/product/listProduct : GET / POST");
		
		if(search.getCurrentPage() == 0){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = productService.getProductList(search);
		
		Page resultPage =	new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("ListProductAction ::"+resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		
		return "forward:/product/listProduct.jsp";
	}
	
	@RequestMapping(value="getProduct")
	public String getProduct( @RequestParam("prodNo") int prodNo, @RequestParam("menu") String menu, Model model ) throws Exception {
		
		System.out.println("/product/getProduct : GET");
		
		Product product = productService.getProduct(prodNo);
		
		model.addAttribute("product", product);
		
		if(menu.equals("manage")){
			return "forward:/product/updateProduct.jsp";
		}
		
		return "forward:/product/getProduct.jsp";
	}
	
	@RequestMapping(value="getJsonProduct/{prodNo}/{menu}", method=RequestMethod.GET)
	public void getJsonProduct( @PathVariable int prodNo, @PathVariable String menu, Model model ) throws Exception {
		
		System.out.println("/product/getJsonProduct : GET");
		
		Product product = productService.getProduct(prodNo);
		
		model.addAttribute("product", product);

	}
	
	
	@RequestMapping(value="updateProduct")
	public String updateProduct( @ModelAttribute("product") Product product) throws Exception {
		
		System.out.println("/product/updateProduct : GET");
		System.out.println("여기이이이이ㅣ이이이이이이이이이이이이이이"+product.getFileName());
		////////////////FileUpload/////////////////
		//파일경로를 가져와서 경로 때고 확장자 포함해서 파일이름으로 String저장
		Path p = Paths.get(product.getFileName());
		String refileName = p.getFileName().toString();
		  
		//저장할곳 설정
		String target = "C:\\workspace\\Model2MVCShop\\WebContent\\images\\uploadFiles\\"
		        +refileName;
		//가져올곳 설정
		File sourceFile = new File(product.getFileName());
		
		FileInputStream inputStream =null;
		FileOutputStream outputStream = null;
		FileChannel fcin = null;
		FileChannel fcout = null;		   		   
		      
		inputStream = new FileInputStream(sourceFile);
		outputStream = new FileOutputStream(target);
		      
		fcin = inputStream.getChannel();
		fcout = outputStream.getChannel();
		      
		long size = fcin.size();
		fcin.transferTo(0, size, fcout);
		      
		         
		fcout.close();
		         
		fcin.close();
		         
		outputStream.close();
		         
		inputStream.close();   
		         
		product.setFileName(refileName);		         
		////////////////추가한부분/////////////////
		productService.updateProduct(product);
		
		return "redirect:/product/listProduct?menu=manage";
	}
}
