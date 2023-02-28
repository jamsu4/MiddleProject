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
						<c:if test="${!empty logId }">
							<div class="main-border-button">
								<c:choose>
									<c:when test="${zzimUser.proId eq proDetail.proId}">
										<!-- 										<a id="zzim" class="selected" style="cursor: pointer;">찜 -->
										<!-- 											취소</a> -->
										<a id="zzim" class="selected" style="cursor: pointer;"> <i
											class="fa fa-heart text-danger"></i>
										</a>
									</c:when>
									<c:otherwise>
										<!-- 										<a id="zzim" class="" style="cursor: pointer;">찜 하기</a> -->
										<a id="zzim" class="" style="cursor: pointer;"><i
											class="fa fa-heart"></i></a>
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
		</div>
		<!--====== Reviews Part Start ======-->
		<c:forEach var="review" items="${reviewList }">
			<section class="reviews-wrapper pt-100 pb-100 ">
				<div class="container">
					<div class="reviews-style">
						<div class="tab-pane fade show active" id="profile"
							role="tabpanel" aria-labelledby="profile-tab">
							<div class="review-wrapper">
								<div class="reviews-title">
									<h4 class="title">Product Reviews</h4>
								</div>
								<div class="reviews-rating-wrapper flex-wrap">
									<div class="reviews-rating-star">
										<img src="images/${review.revImage }" alt="" />
									</div>
									<div class="reviews-rating-form">
										<div class="rating-star">
											<h2>제목</h2>
											<h3>${review.revTitle }</h3>
											<br>
											<h2>작성자</h2>
											<h3>${review.memId }</h3>
											<br>
											<h2>작성일자</h2>
											<h3>${review.revDate }</h3>
											<br>
											<h2>내용</h2>
											<h3>${review.revContent }</h3>
										</div>
										<div class="rating-form">
											<form action="#">
												<div class="single-form form-default">
													<label>내용</label>
													<div class="form-input">
														<textarea placeholder="Your review here"></textarea>
														<i class="mdi mdi-message-text-outline"></i>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
								<div class="reviews-btn flex-wrap">
									<div class="reviews-btn-left">
										<div class="dropdown-style">
											<button class="main-btn primary-btn" type="button"
												id="dropdownMenu-1" data-toggle="dropdown"
												aria-haspopup="true" aria-expanded="true">
												댓글 <i class="mdi mdi-chevron-down"></i>
											</button>
										</div>
									</div>
								</div>
								<div class="reviews-comment">
									<ul class="comment-items">
										<li>
											<div class="single-review-comment">
												<div class="comment-user-info">
													<div class="comment-author">
														<img src="assets/images/review/author-1.jpg" alt="">
													</div>
													<div class="comment-content">
														<h6 class="name">User Name</h6>
														<p>
															<i class="mdi mdi-star"></i> <span class="rating"><strong>4</strong>
																of 5</span> <span class="date">20 Nov 2019 22:01</span>
														</p>
													</div>
												</div>
												<div class="comment-user-text">
													<p>Good headphones. The sound is clear. AND the bottoms
														repyat and top ring. Currently are really not taken. For
														me quiet. With my Beats of course can not be compared. But
														for the money and definitely recommend. The one who took
														happy as an elephant. Product as advertised, looks good
														Quality, sound is not the best but because of cost-benefit
														ratio it seems very good to me, recommended the seller .</p>
													<ul class="comment-meta">
														<li><i class="mdi mdi-thumb-up"></i> <span>31</span></li>
														<li><a href="#">Like</a></li>
														<li><a href="#">Replay</a></li>
													</ul>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</c:forEach>
		<!--====== Reviews Part Ends ======-->
		<div class="productDetailQnA">
			<h1>Q&A</h1>
			<table class="productDetailQnA">
				<thead class="productDetailQnA">
					<tr class="productDetailQnA">
						<th class="productDetailQnA">QA_ID</th>
						<th class="productDetailQnA">작성자</th>
						<th class="productDetailQnA">제품</th>
						<th class="productDetailQnA">제목</th>
						<th class="productDetailQnA">내용</th>
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
							<c:choose>
								<c:when test="${qa.memId eq logId}">
									<td class="productDetailQnA">${qa.qaContent }</td>
								</c:when>
								<c:otherwise>
									<td class="productDetailQnA">비밀글입니다.</td>
								</c:otherwise>
							</c:choose>
							<td class="productDetailQnA">${qa.qaDate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br>
			<button class="btn btn-primary"
				onclick="window.open('productQaPage.do?pid=${proDetail.proId }','window_name','width=700,height=600,location=no,status=no,scrollbars=yes');">등록</button>
		</div>
	</div>

</section>
<!-- ***** Product Area Ends ***** -->

<script>
   let plus = document.querySelectorAll(".plus")[0];
   let minus = document.querySelectorAll(".minus")[0];
   let productCount = document.querySelector("#productCount");
   let total = document.querySelectorAll(".total")[0].children[0];
   let proId = ${proDetail.proId };

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
	   let proId = ${proDetail.proId };
	   
	   console.log(result);
	   console.log(productCountValue);
	   console.log(${proDetail.proId });
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
					   location.href='cart.do';
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
	 				   $('#zzim').children(0).remove();
// 	 				   let i = $("<i>").attr("class", "fa.fa-star text-danger")
	 				   $("#zzim").append("<i class='fa fa-heart'></i>");
	 			   	   alert("찜이 취소되었습니다.");
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
	 				   $('#zzim').children(0).remove();
	 				   $("#zzim").append("<i class='fa fa-heart text-danger'></i>");
	 			   	   let popup = confirm("찜이 되었습니다.");
	 				   if(popup){
	 					  location.href='zzimList.do';
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
