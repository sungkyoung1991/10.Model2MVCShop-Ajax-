<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

	function fncAddpurchase(){
		$('form').attr("method","post").attr("enctype","multipart/form-data").attr("action","/purchase/addPurchaseView?prodNo=${product.prodNo }").submit();
	}

		$(function(){
			$(".ct_btn01:contains('구매')").on("click",function(){
				/* self.location="/purchase/addPurchaseView?prodNo=${product.prodNo }"; */
				fncAddpurchase();
			});
		});
		
		$(function(){
			$(".ct_btn01:contains('확인')").on("click",function(){
				self.location="/product/listProduct?menu=${param.menu}";
			});
		});
		
	
$(function(){ 

		
		/* $("form[name='replyForm'] input[type='button']").on("click",function(){ */
			 $("input[type='button']").on("click",function(){ 
				console.log("쓰기.."+ $(this).html());
 
	 $.ajax(
			 
			 {
				 url : "/product/json/productReply/"+${product.prodNo},
				 method : "POST",
				headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
							},
				 data : JSON.stringify({
					reply :  $("input[type='text']").val()
				 }),
				 dataType : "json",
				 success : function(JSONData, status){
					 alert(status);
					 alert(JSONData);
				 
					 var display = 
						"<div id = 'append'>"+
						 "${user.userId} : "+ JSONData.reply + "\n"+
						 "</div>";
					 
					 $(display).appendTo("body");
					 
				 }
			});
		});
	}); 
	


</script>
<title>Insert title here</title>
</head>

<body bgcolor="#ffffff" text="#000000">

	<form name="detailForm">

		<table width="100%" height="37" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
					width="15" height="37"></td>
				<td background="/images/ct_ttl_img02.gif" width="100%"
					style="padding-left: 10px;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="93%" class="ct_ttl01">상품상세조회</td>
							<td width="20%" align="right">&nbsp;</td>
						</tr>
					</table>
				</td>
				<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
					width="12" height="37" /></td>
			</tr>
		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 13px;">
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">상품번호 <img
					src="/images/ct_icon_red.gif" width="3" height="3"
					align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="105" id="prodNo">${product.prodNo}</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">상품명 <img
					src="/images/ct_icon_red.gif" width="3" height="3"
					align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${product.prodName}</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">상품이미지 <img
					src="/images/ct_icon_red.gif" width="3" height="3"
					align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><img
					src="../images/uploadFiles/${product.fileName }" /></td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6">${product.fileName}</td>
			</tr>
			<tr>
				<td width="104" class="ct_write">상품상세정보 <img
					src="/images/ct_icon_red.gif" width="3" height="3"
					align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${product.prodDetail}</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">제조일자</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${product.manuDate}</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">가격</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${product.price}</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">등록일자</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${product.regDate}</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 10px;">
			<tr>
				<td width="53%"></td>
				<td align="right">

					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="17" height="23"><img src="/images/ct_btnbg01.gif"
								width="17" height="23" /></td>

							<td background="/images/ct_btnbg02.gif" class="ct_btn01"
								style="padding-top: 3px;">
								<%-- <ahref="/purchase/addPurchaseView?prodNo=${product.prodNo }">구매</a> --%>
								구매
								</td>
								
							<td width="14" height="23"><img src="/images/ct_btnbg03.gif"
								width="14" height="23" />
							<td background="/images/ct_btnbg02.gif" class="ct_btn01"
								style="padding-top: 3px;">
								<%-- <a href="/product/listProduct?menu=${param.menu}">확인</a> --%>
								확인
								</td>
							<td width="14" height="23"><img src="/images/ct_btnbg03.gif"
								width="14" height="23" /></td>
						</tr>
					</table>

				</td>
			</tr>
		</table>
		
		
		<table width="100%" height="37" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="15" height="37"><img src="/images/IMG_3713.PNG"
					width="250" height="170"></td>
				<td  width="100%"
					style="padding-left: 10px;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="93%" class="ct_ttl01">상품평</td>
							<td width="20%" align="right">&nbsp;</td>
						</tr>
					</table>
				</td>
				<td width="30" height="37"><img src="/images/ct_ttl_img03.gif"
					width="12" height="37" /></td>
			</tr>
		</table>
		
		<input type = "text" name="reply" style="width: 800px; height: 30px" placeholder="댓글을입력해주세요.">
		
		<br/>
	
		<!-- <input type="button" value="쓰기" /> -->
		<input type="button" value="쓰기" />
		
	</form>
	
	
	<!-- 
	<form name="replyForm">

		<table width="100%" height="37" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="15" height="37"><img src="/images/IMG_3713.PNG"
					width="15" height="37"></td>
				<td  width="100%"
					style="padding-left: 10px;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="93%" class="ct_ttl01">상품평</td>
							<td width="20%" align="right">&nbsp;</td>
						</tr>
					</table>
				</td>
				<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
					width="12" height="37" /></td>
			</tr>
		</table>
		

	
		
	
	
		<input type = "text" name="reply" style="width: 800px; height: 19px"/></br>
	
		<input type="button" value="쓰기" />
		
	

		
		
		</form> -->
	
	

</body>
</html>