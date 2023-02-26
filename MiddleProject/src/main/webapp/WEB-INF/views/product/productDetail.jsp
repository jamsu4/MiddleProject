<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!-- ***** Product Area Starts ***** -->
<section class="section" id="product">

	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="left-images">
					<img src="images/${proDetail.proImg }" alt="" />
				</div>
			</div>
			<div class="col-lg-4">
				<div class="right-content">
					<h4>${proDetail.proName }</h4>
					<span class="price">${proDetail.proPrice } 원</span>
					<ul class="stars">
						<li><i class="fa fa-star"></i></li>
						<li><i class="fa fa-star"></i></li>
						<li><i class="fa fa-star"></i></li>
						<li><i class="fa fa-star"></i></li>
						<li><i class="fa fa-star"></i></li>
					</ul>
					<span>${proDetail.proDesc }</span>
					<div class="quote">
						<i class="fa fa-quote-left"></i>
						<p>${proDetail.proDesc }</p>
					</div>
					<div class="quantity-content">
						<div class="left-content">
							<h6>No. of Orders</h6>
						</div>
						<div class="right-content">
							<div class="quantity buttons_added">
								<input type="button" value="-" class="minus" /><input
									id="productCount" type="number" step="1" min="0" max=""
									name="quantity" value="1" title="Qty"
									class="input-text qty text" size="4" pattern="" inputmode=""
									readonly /><input type="button" value="+" class="plus" />
							</div>
						</div>
					</div>
					<div class="total">
						<h4>Total: ${proDetail.proPrice }</h4>
						<div class="main-border-button">
							<a href="">바로 결제</a>
						</div>
						<br />
						<c:if test="${!empty logId }">
							<div class="main-border-button">
								<c:choose>
									<c:when test="${zzimUser.proId eq proDetail.proID}">
										<a id="zzim" class="selected" style="cursor: pointer;">찜
											취소</a>
									</c:when>
									<c:otherwise>
										<a id="zzim" class="" style="cursor: pointer;">찜 하기</a>
									</c:otherwise>
								</c:choose>
								<a id="cart" style="cursor: pointer;">장바구니</a>
							</div>
						</c:if>
						<br />
						<div class="main-border-button"></div>
					</div>
					<div></div>
				</div>
			</div>

			<div class="productDetailQnA">
				<h1>Q&A</h1>
				<table class="productDetailQnA">
					<thead class="productDetailQnA">
						<tr class="productDetailQnA">
							<th class="productDetailQnA">QA_ID</th>
							<th class="productDetailQnA">작성자</th>
							<th class="productDetailQnA">제품</th>
							<th class="productDetailQnA">제목</th>
							<th class="productDetailQnA">작성일자</th>

						</tr>
					</thead>
					<tbody class="productDetailQnA">
						<c:forEach var="qa" items="${qaList }">
							<tr class="productDetailQnA">
								<td class="productDetailQnA">${qa.qaId }</td>
								<td class="productDetailQnA">${qa.memId }</td>
								<td class="productDetailQnA">${qa.proId }</td>
								<td class="productDetailQnA">${qa.qaTitle }</td>
								<td class="productDetailQnA">${qa.qaDate }</td>
								<!-- 							<td class="productDetailQnA"><a -->
								<!-- 								href="mailto:jmatman@stewart.com" class="productDetailQnA">jmatman@stewart.com</a></td> -->
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</section>
<!-- ***** Product Area Ends ***** -->

<script>
   let plus = document.querySelectorAll(".plus")[0];
   let minus = document.querySelectorAll(".minus")[0];
   let productCount = document.querySelector("#productCount");
   let total = document.querySelectorAll(".total")[0].children[0];
   let proId = ${proDetail.proID };

   plus.addEventListener("click", function () {
     let productCountValue = parseInt(productCount.value) + 1;
     let result = productCountValue * ${proDetail.proPrice };
     total.innerText = "Total: " + result;
   });

   minus.addEventListener("click", function () {
     let productCountValue = parseInt(productCount.value) - 1;
     let result = productCountValue * ${proDetail.proPrice };
     if (result >= 0) {
       total.innerText = "Total: " + result;
     }
   });
   
   $('#cart').click(function() {
	   let productCountValue = parseInt(productCount.value);
	   let result = productCountValue * ${proDetail.proPrice };
	   let proId = ${proDetail.proID };
	   
	   console.log(result);
	   console.log(productCountValue);
	   console.log(${proDetail.proID });
	   console.log("카트임");
	   $.ajax({
		   url: "productCartAdd.do",
		   method: "post",
		   data: {memId: "${logId}", proId: proId, caQuant: productCountValue, caSumprice: result},
		   success: function(result){
			   console.log(result);
			   if (result.retCode == "Success") {
			   	   let popup = confirm("장바구니에 제품이 담겼습니다.");
				   if(popup){
					   document.write("<h1> 장바구니로 이동 </h1>");
				   }
			   } else {
				   alert("오류");
			   }
		   },
		   error: function(reject){
			   console.log(reject);
			   alert("오류");
		   },
	   });
   })
   
   
   $('#zzim').click(function(){
	   if ($(this).hasClass('selected')) {
		   $.ajax({
	 		   url: "productZzimDel.do",
	 		   method: "post",
	 		   data: {memId: "${logId}", proId: proId},
	 		   success: function(result){
	 			   console.log(result);
	 			   if (result.retCode == "Success") {
	 				   $('#zzim').removeClass('selected');
	 				   $("#zzim").text("찜 하기");
	 			   	   let popup = confirm("찜이 취소되었습니다.");
	 				   if(popup){
	 					   document.write("<h1> 찜취소 </h1>");
	 				   }
	 			   } else {
	 				   alert("오류");
	 			   }
	 		   },
	 		   error: function(reject){
	 			   console.log(reject);
	 			   alert("오류");
	 		   },
	 	   });
		   
	   } else {
		   $.ajax({
	 		   url: "productZzimAdd.do",
	 		   method: "post",
	 		   data: {memId: "${logId}", proId: proId},
	 		   success: function(result){
	 			   console.log(result);
	 			   if (result.retCode == "Success") {
	 				   $('#zzim').addClass('selected');
	 				   $("#zzim").text("찜 취소");
	 			   	   let popup = confirm("찜이 되었습니다.");
	 				   if(popup){
	 					   document.write("<h1> 찜이동 </h1>");
	 				   }
	 			   } else {
	 				   alert("오류");
	 			   }
	 		   },
	 		   error: function(reject){
	 			   console.log(reject);
	 			   alert("오류");
	 		   },
	 	   });
	   }
   })
   
</script>
