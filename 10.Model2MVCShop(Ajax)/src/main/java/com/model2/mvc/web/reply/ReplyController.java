package com.model2.mvc.web.reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Reply;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.reply.ReplyService;

@Controller
@RequestMapping("/reply/*")
public class ReplyController {
	
	///Field
	@Autowired
	@Qualifier("replyServiceImpl")
	private ReplyService replyService;
	
	@Qualifier("productServiceImpl")
	private ProductService productService; 
		
	public ReplyController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="insertReply/{prodNo}", method=RequestMethod.POST)
	public ModelAndView insertReply(@ModelAttribute("reply")Reply reply ,@PathVariable("prodNo")int prodNo) throws Exception{
		
		System.out.println("reply start..............................");
		
		System.out.println(reply.getReply());
		
		reply.setProdNo(prodNo);
		
		replyService.insertReply(reply);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/product/getProduct.jsp");
		modelAndView.addObject(reply);
		
		return modelAndView;
		
		
		
	}
	

}
	
	
