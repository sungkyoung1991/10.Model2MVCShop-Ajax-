package com.model2.mvc.web.reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.service.domain.Reply;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.reply.ReplyService;

@RestController
@RequestMapping("/reply/*")
public class ReplyRestController {

	/// Field
	@Autowired
	@Qualifier("replyServiceImpl")
	private ReplyService replyService;

	@Qualifier("productServiceImpl")
	private ProductService productService;

	public ReplyRestController() {
		System.out.println(this.getClass());
	}

	
	@RequestMapping(value="json/insertReply", method=RequestMethod.POST)
	public Reply insertReply(@RequestBody Reply reply ) throws Exception{
		
		System.out.println("reply start..............................");
		
		System.out.println(reply.getReply());
		
		reply.setProdNo(reply.getProdNo());
		
		replyService.insertReply(reply);
		
		return reply;
		
		
		
	}
	

}