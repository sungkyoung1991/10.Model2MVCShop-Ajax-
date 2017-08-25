package com.model2.mvc.web.product;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Reply;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.reply.ReplyService;

@RestController
@RequestMapping("/product/*")
public class ProductRestController {

	/// Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
//	@Autowired
//	@Qualifier("replyServiceImpl")
//	private ReplyService replyService;

	public ProductRestController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
//	@RequestMapping(value = "json/addReply", method = RequestMethod.POST)
//	public List<Reply> addReply(@RequestBody Reply reply) throws Exception {
//
//		System.out.println("/addReply");
//		
//		Product product = new Product();
//		product.setReply(reply);
//		
//		replyService.insertReply(reply);
//		
//		List<Reply> list = new ArrayList<Reply>();
//		
//		list.add(reply);
//		
//			
//		return list;
//			
//		
//	}

	
//	@RequestMapping(value="json/productReply/{prodNo}", method=RequestMethod.POST)
//	public Product productReply(@RequestBody Product product, @PathVariable int prodNo) throws Exception{
//		
//		System.out.println("reply start..............................");
//		System.out.println("prodNo........" + prodNo);
//		System.out.println("product........" + product);
//		System.out.println("ch");
//		
//		Product returnProduct = productService.getProduct(prodNo);
//		
//		returnProduct.setReply(product.getReply());
//		
//		productService.updateReply(returnProduct);
//		
//		return returnProduct;
//		
//	}

	@RequestMapping(value = "json/addProduct", method = RequestMethod.POST)
	public Product addProduct(@RequestBody Product product, @RequestParam("file") MultipartFile file) throws Exception{
		System.out.println("json/addProduct........");
		if(file.getSize()>0){
			product.setManuDate(product.getManuDate().replaceAll("-", ""));
			String temDir ="/Users/sungkyoung-kim/git/10.Model2MVCShop(Ajax)/10.Model2MVCShop(Ajax)/WebContent/images/uploadFiles";
			File UploadedFile = new File(temDir, file.getOriginalFilename());
			product.setFileName(file.getOriginalFilename());
			file.transferTo(UploadedFile);
			productService.addProduct(product);
			return product;
			}else{
				product.setManuDate(product.getManuDate().replaceAll("-", ""));
				productService.addProduct(product);
				return product;
				
			}
			
		}
		
	@RequestMapping( value="json/getProduct/{prodNo}/{menu}", method=RequestMethod.GET )
	public Product getProduct(@PathVariable int prodNo, @PathVariable String menu) throws Exception{
		
		System.out.println("/product/json/getProduct : GET");
		
		System.out.println("prodNo......" + prodNo);
		System.out.println("menu......" + menu);
		
		Product returnProduct = new Product();
		
		returnProduct=productService.getProduct(prodNo);
		
		System.out.println("returnProduct............."+returnProduct);
		
//		Map map = new HashMap();
//		map.put("product", returnProduct);
		
		return returnProduct;
	}

	@RequestMapping(value = "json/updateProductView", method = RequestMethod.GET)
	public Product updateProductView(@PathVariable int prodNo) throws Exception {

		System.out.println("/updateProductView");

		Product dbProduct = productService.getProduct(prodNo);

		return dbProduct;
	}

	@RequestMapping("json/updateProduct")
	public Product updateProduct(@RequestBody Product product)
			throws Exception {

		System.out.println("/updateProduct");

		productService.updateProduct(product);
		System.out.println("updateProduct : " + product);

		return product;
	}

	@RequestMapping(value = "json/listProduct", method = RequestMethod.POST)
	public Map getProductList(@RequestBody Search search)
			throws Exception {

		System.out.println("/listProduct");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = productService.getProductList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);

		map.put("search", search);
		map.put("list", map.get("list"));
		map.put("resultPage", resultPage);

		return map;

	}

}