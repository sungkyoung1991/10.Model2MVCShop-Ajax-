<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	
<title></title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}").submit();
	}
	 $(function(){
			 $( ".ct_btn01:contains('검색')" ).on("click" , function() {
				fncGetList(1);
			});
	 });
	 
	 
	 
	    /* $(function(){
		 	 	$(".ct_list_pop td:nth-child(2)").on("click",function(){
		 			 	 self.location="/product/getProduct?prodNo="+$("p",this).text().trim()+"&menu=${param.menu}"; 
			}); 
		 }); */
	/* 	 
		 $(function(){
		 
			 $( ".ct_list_pop td:nth-child(2)" ).on("click" , function() {
				 
				 		var prodNo=$("p",this).text().trim();
				 		
					$.ajax( 
							{
								url : "/product/json/getProduct/"+prodNo+"/${param.menu}",
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								
								success : function(JSONData , status) {
	
									var displayValue = "<h3>"
																+"상품번호 : "+JSONData.prodNo+"<br/>"
																+"상품명 : "+JSONData.prodName+"<br/>"
																+"상품이미지 : "+JSONData.fileName+"<br/>"
																+"상세정보 : "+JSONData.prodDetail+"<br/>"
																+"제조일자 : "+JSONData.manuDate+"<br/>"
																+"가격 : "+JSONData.price+"<br/>"
																+"등록일자 : "+JSONData.regDate+"<br/>"
																+"</h3>";
									//Debug...									
									//alert(displayValue);
									$("h3").remove();
									 $("#"+prodNo+"").html(displayValue); 
								
								}
						});
			 });
			 });
		  */
		  
		  
		   	 
			 $(function(){
			 
				 $( ".ct_list_pop td:nth-child(2)" ).on("click" , function() {
					 
					 		var prodNo=$("p",this).text().trim();
					 		
					 		value="";
					 		
					 		if(${param.menu=="manage"}){
								value="상품수정";
							}else{
								value="상세보기";
							}
					 		
						$.ajax( 
								{
									url : "/product/json/getProduct/"+prodNo+"/${param.menu}",
									method : "GET" ,
									dataType : "json" ,
									headers : {
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									},
									
									success : function(JSONData , status) {
										if(JSONData.fileName==null){
											 JSONData.fileName="no.png";
										 }
		
										var displayValue = "<h3>"
																	+"상품번호 : "+JSONData.prodNo+"<br/>"
																	+"상품명 : "+JSONData.prodName+"<br/>"
																	+"상품이미지 :" + "<br/>"
																	 
																	+"<img src="+"../images/uploadFiles/"+JSONData.fileName+" width="+"200"+" height="+"200"+"/>"+"<br/>"
																	
																	+"상세정보 : "+JSONData.prodDetail+"<br/>"
																	+"제조일자 : "+JSONData.manuDate+"<br/>"
																	+"가격 : "+JSONData.price+"<br/>"
																	+"등록일자 : "+JSONData.regDate+"<br/>"
																	+"<input type='button' value='"+value+"' id='del'/>"+"<br/>"  
																	+"</h3>";
									
									
										$("h3").remove();
										 $("#"+prodNo+"").html(displayValue);
										 
										 if(JSONData.fileName==null){
											 JSONData.fileName="no.png";
										 }
										 
											$(function(){
												$("#del").on("click",function(){
													//console.log("구매붤튼... : " +$(this).html() );
													self.location="/product/getProduct?prodNo="+prodNo+"&menu=${param.menu}";
													
												});
											});
										 
									
									}
							});
				 });
				 });
			  
		 
	 $(function(){
	 	 $(".ct_list_pop:contains('상품배송하기')").on("click",function(){
	 		 self.location="/purchase/updateTranCode"+$('#tran',this).text().trim();
		}); 
	 });
	 
	     
</script>
</head>

<body bgcolor="#ffffff" text="#000000">


<div style="width:98%; margin-left:10px;">

<form name="detailForm">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
				
			<c:if test="${param.menu=='manage'}">
				<td width="93%" class="ct_ttl01">상품 관리</td>
				</c:if>
				
			<c:if test="${param.menu=='search'}">
				<td width="93%" class="ct_ttl01">상품 목록조회</td>
				</c:if>
			
					<td/>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
				
				<td align="right">
				<select name="searchCondition" class="ct_input_g" style="width:80px">
					<option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
					<option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>>상품명</option>
					<option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>>상품가격</option>
				</select>
				
				<input type="text" name="searchKeyword" 
				value ="${ !empty search.searchKeyword ? searchKeyword : ""}"
				class="ct_input_g" style="width:200px; height:19px" />
			</td>

		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						검색
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >전체 ${ resultPage.totalCount } 건수, 현재 ${resultPage.currentPage } 페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_list_b" width="100">상품명</td>
		<td class="ct_list_b"></td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">가격</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">등록일</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">현재상태</td>
		
		<c:if test="${param.menu=='manage' }">
		<td class="ct_list_b">배송상태</td>
		</c:if>
				
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	<c:set var="i" value="0" />
	<c:forEach var="product" items="${list }">
		<c:set var="i" value="${i+1 }"/>
	
	<tr class="ct_list_pop">
		<td align="center">${ i }</td>
		<td>
		<c:if test="${product.proTranCode==null}">	
			<div id = "prodNo" style="display:none">
				<p>${product.prodNo }</p>
			</div>
				<span>
				${product.prodName }
				</span>
		</c:if>
				
		<c:if test="${product.proTranCode!=null}">	
		<%-- 	<div style="display:none">
				${product.prodName}
			</div> --%>
			<input readonly="readonly" value="판매종료"/>
		</c:if>
		</td>
		<td align="left"></td>				
		<td></td>
		<td align="left">${product.price }</td>
		<td></td>
		<td align="left">${product.regDate}</td>
		<td></td>
		<td align="left">
		
		<c:if test="${product.proTranCode==null}">
			<c:if test="${param.menu=='search' }">
		판매중
			</c:if>
		</c:if>
	
		<c:if test="${product.proTranCode!=null}">
			<c:if test="${param.menu=='search' }">
		Sold Out
			</c:if>
		</c:if>
		
		
		<c:if test="${product.proTranCode==null}">
			<c:if test="${param.menu=='manage' }">
		판매중
			</c:if>
		</c:if>
		
		<c:if test="${product.proTranCode=='1  '}">
			<c:if test="${param.menu=='manage' }">
			<div id="tran" style="display:none">
			?prodNo=${product.prodNo}&menu=${param.menu}&tranCode=${product.proTranCode}
			</div>
			상품배송하기
			</c:if>
		</c:if>
		
		<c:if test="${product.proTranCode =='2  '}">
			<c:if test="${param.menu=='manage' }">
		admin 배송완료
			</c:if>
		</c:if>
		
		<c:if test="${product.proTranCode =='3  '}">
			<c:if test="${param.menu=='manage' }">
		user 수령완료
			</c:if>
		</c:if>
		</td>
		
		<td align="left">
		

		
		<c:if test="${product.proTranCode=='1  '}">
			<c:if test="${param.menu=='manage' }">
		배송대기
			</c:if>
		</c:if>
		
		<c:if test="${product.proTranCode=='2  '}">
			<c:if test="${param.menu=='manage' }">
		배송중
			</c:if>
		</c:if>
		
		<c:if test="${product.proTranCode=='3  '}">
			<c:if test="${param.menu=='manage' }">
		배송완료
			</c:if>
		</c:if>
		
		
		
		
		
		</td>
			
	</tr>
	<tr>
			<!-- //////////////////////////// 추가 , 변경된 부분 /////////////////////////////
			<td colspan="11" bgcolor="D6D7D6" height="1"></td>
			////////////////////////////////////////////////////////////////////////////////////////////  -->
			<td id="${product.prodNo}" colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	
	
	</c:forEach>


</table>

<!-- PageNavigation Start... -->
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value="1"/>	
			
			<jsp:include page="../common/pageNavigator.jsp"/>
		
    	</td>
	</tr>
</table>
<!-- PageNavigation End... -->

</form>

</div>

</body>
</html> 