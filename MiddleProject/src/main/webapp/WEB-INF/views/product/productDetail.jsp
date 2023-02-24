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
						<div class="main-border-button">
							<a href="">찜 하기</a> <a id="cart" style="cursor: pointer;">장바구니</a>
						</div>
						<br />
						<div class="main-border-button"></div>
					</div>
					<div></div>
				</div>
			</div>

			<div>
				<table class="productDetailQnA">
					<thead class="productDetailQnA">
						<tr class="productDetailQnA">
							<th class="productDetailQnA">First Name</th>
							<th class="productDetailQnA">Last Name</th>
							<th class="productDetailQnA">Phone</th>
							<th class="productDetailQnA">Email</th>
							<th class="productDetailQnA">Date of Birth</th>

						</tr>
					</thead>
					<tbody class="productDetailQnA">
						<tr class="productDetailQnA">
							<td class="productDetailQnA">James</td>
							<td class="productDetailQnA">Matman</td>
							<td class="productDetailQnA">(713) 123-8965</td>
							<td class="productDetailQnA"><a
								href="mailto:jmatman@stewart.com" class="productDetailQnA">jmatman@stewart.com</a></td>
							<td class="productDetailQnA">01/13/1979</td>
						</tr>
						<tr class="productDetailQnA">
							<td class="productDetailQnA">Johnny</td>
							<td class="productDetailQnA">Smith</td>
							<td class="productDetailQnA">(713) 584-9614</td>
							<td class="productDetailQnA"><a
								href="mailto:jsmith@stewart.com" class="productDetailQnA">jsmith@stewart.com</a></td>
							<td class="productDetailQnA">06/09/1971</td>
						</tr>
						<tr class="productDetailQnA">
							<td class="productDetailQnA">Susan</td>
							<td class="productDetailQnA">Johnson</td>
							<td class="productDetailQnA">(713) 847-1124</td>
							<td class="productDetailQnA"><a
								href="mailto:sjohnson@stewart.com">sjohnson@stewart.com</a></td>
							<td class="productDetailQnA">08/25/1965</td>
						</tr>
						<tr class="productDetailQnA">
							<td class="productDetailQnA">Tracy</td>
							<td class="productDetailQnA">Richardson</td>
							<td class="productDetailQnA">(713) 245-4821</td>
							<td class="productDetailQnA"><a
								href="mailto:trichard@stewart.com">trichard@stewart.com</a></td>
							<td class="productDetailQnA">03/13/1980</td>
						</tr>
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
   
   
</script>
