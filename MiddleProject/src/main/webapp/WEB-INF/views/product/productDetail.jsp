<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!------리뷰 부트스트랩--------->
    <!--====== Favicon Icon ======-->
    <link rel="shortcut icon" href="bootstrap1/assets/images/favicon.png" type="image/png">

    <!--====== Slick CSS ======-->
    <link rel="stylesheet" href="bootstrap1/assets/css/slick.css">

    <!--====== Line Icons CSS ======-->
    <link rel="stylesheet" href="bootstrap1/assets/css/LineIcons.css">

    <!--====== Material Design Icons CSS ======-->
    <link rel="stylesheet" href="bootstrap1/assets/css/materialdesignicons.min.css">

    <!--====== Jquery Ui CSS ======-->
    <link rel="stylesheet" href="bootstrap1/assets/css/jquery-ui.min.css">

    <!--====== nice select CSS ======-->
    <link rel="stylesheet" href="bootstrap1/assets/css/nice-select.css">

    <!--====== Bootstrap CSS ======-->
    <link rel="stylesheet" href="bootstrap1/assets/css/bootstrap.min.css">

    <!--====== Default CSS ======-->
    <link rel="stylesheet" href="bootstrap1/assets/css/default.css">

    <!--====== Style CSS ======-->
    <link rel="stylesheet" href="bootstrap1/assets/css/style.css">

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
									<c:when test="${zzimUser.proId eq proDetail.proId}">
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
		</div>
		<!--====== Reviews Part Start ======-->
		<section class="reviews-wrapper pt-100 pb-100 ">
			<div class="container">
				<div class="reviews-style">
					<div class="reviews-menu">

						<ul class="breadcrumb-list-grid nav nav-tabs border-0" id="myTab"
							role="tablist">
							<li class="nav-item" role="presentation"><a id="home-tab"
								data-toggle="tab" href="#home" role="tab" aria-controls="home"
								aria-selected="true"> Details </a></li>
							<li class="nav-item" role="presentation"><a class="active"
								id="profile-tab" data-toggle="tab" href="#profile" role="tab"
								aria-controls="profile" aria-selected="false"> Reviews </a></li>
							<li class="nav-item" role="presentation"><a
								id="specifications-tab" data-toggle="tab" href="#specifications"
								role="tab" aria-controls="specifications" aria-selected="false">
									specifications </a></li>
						</ul>
					</div>

					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade" id="home" role="tabpanel"
							aria-labelledby="home-tab">
							<div class="details-wrapper">
								<div class="row">
									<div class="col-lg-8">
										<div class="reviews-title">
											<h4 class="title">Oculus VR</h4>
										</div>
										<p class="mb-15 pt-30">Lorem ipsum dolor sit amet
											consectetur adipisicing elit. Maxime quod sequi vitae atque
											perspiciatis voluptas recusandae explicabo ea dolores numquam
											ratione, obcaecati ullam, ipsam minima vero nostrum nesciunt
											facere laudantium? Facere animi rem veniam quibusdam nam sed
											ex maxime laboriosam a vero nesciunt tenetur, eius autem
											fugiat quod expedita dignissimos.</p>
										<p class="mb-30">Repellendus, doloribus illum expedita,
											dolorem voluptas doloremque voluptatibus, magni tempora
											laboriosam deserunt suscipit labore dolorum aperiam cum
											veniam accusamus? Consequatur dolore facere perferendis
											repellat, modi in consectetur ipsum atque quos natus.</p>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade show active" id="profile"
							role="tabpanel" aria-labelledby="profile-tab">
							<div class="review-wrapper">
								<div class="reviews-title">
									<h4 class="title">Customer Reviews (38)</h4>
								</div>

								<div class="reviews-rating-wrapper flex-wrap">
									<div class="reviews-rating-star">
										<p class="rating-review">
											<i class="mdi mdi-star"></i> <span>4.5</span> of 5
										</p>

										<div class="reviews-rating-bar">
											<div class="single-reviews-rating-bar">
												<p class="value">5 Starts</p>
												<div class="rating-bar-inner">
													<div class="bar-inner" style="width: 60%;"></div>
												</div>
												<p class="percent">60%</p>
											</div>
										</div>
										<div class="reviews-rating-bar">
											<div class="single-reviews-rating-bar">
												<p class="value">4 Starts</p>
												<div class="rating-bar-inner">
													<div class="bar-inner" style="width: 20%;"></div>
												</div>
												<p class="percent">20%</p>
											</div>
										</div>
										<div class="reviews-rating-bar">
											<div class="single-reviews-rating-bar">
												<p class="value">3 Starts</p>
												<div class="rating-bar-inner">
													<div class="bar-inner" style="width: 10%;"></div>
												</div>
												<p class="percent">10%</p>
											</div>
										</div>
										<div class="reviews-rating-bar">
											<div class="single-reviews-rating-bar">
												<p class="value">2 Starts</p>
												<div class="rating-bar-inner">
													<div class="bar-inner" style="width: 5%;"></div>
												</div>
												<p class="percent">05%</p>
											</div>
										</div>
										<div class="reviews-rating-bar">
											<div class="single-reviews-rating-bar">
												<p class="value">1 Starts</p>
												<div class="rating-bar-inner">
													<div class="bar-inner" style="width: 0;"></div>
												</div>
												<p class="percent">0%</p>
											</div>
										</div>
									</div>

									<div class="reviews-rating-form">
										<div class="rating-star">
											<p>Click on star to review</p>
											<ul id="stars" class="stars">
												<li class="star" data-value='1'><i class="mdi mdi-star"></i></li>
												<li class="star" data-value='2'><i class="mdi mdi-star"></i></li>
												<li class="star" data-value='3'><i class="mdi mdi-star"></i></li>
												<li class="star" data-value='4'><i class="mdi mdi-star"></i></li>
												<li class="star" data-value='5'><i class="mdi mdi-star"></i></li>
											</ul>
										</div>
										<div class="rating-form">
											<form action="#">
												<div class="single-form form-default">
													<label>Write your Review</label>
													<div class="form-input">
														<textarea placeholder="Your review here"></textarea>
														<i class="mdi mdi-message-text-outline"></i>
													</div>
												</div>
												<div class="single-rating-form flex-wrap">
													<div class="rating-form-file">
														<div class="file">
															<input type="file" id="file-1"> <label
																for="file-1"><i class="mdi mdi-camera"></i></label>
														</div>
														<div class="file">
															<input type="file" id="file-1"> <label
																for="file-1"><i class="mdi mdi-attachment"></i></label>
														</div>
													</div>
													<div class="rating-form-btn">
														<button class="main-btn primary-btn">write a
															Review</button>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>

								<div class="reviews-btn flex-wrap">
									<div class="reviews-btn-left">
										<div class="dropdown-style">
											<div class="dropdown dropdown-white">
												<button class="main-btn primary-btn" type="button"
													id="dropdownMenu-1" data-toggle="dropdown"
													aria-haspopup="true" aria-expanded="true">
													All Stars (213) <i class="mdi mdi-chevron-down"></i>
												</button>

												<ul class="dropdown-menu sub-menu-bar"
													aria-labelledby="dropdownMenu-1">
													<li><a href="#">Dropped Menu 1</a></li>
													<li><a href="#">Dropped Menu 2</a></li>
													<li><a href="#">Dropped Menu 3</a></li>
													<li><a href="#">Dropped Menu 4</a></li>
												</ul>
											</div>
										</div>
										<div class="dropdown-style">
											<div class="dropdown dropdown-white">
												<button class="main-btn primary-btn-border" type="button"
													id="dropdownMenu-1" data-toggle="dropdown"
													aria-haspopup="true" aria-expanded="true">
													Sort by Latest <i class="mdi mdi-chevron-down"></i>
												</button>

												<ul class="dropdown-menu sub-menu-bar"
													aria-labelledby="dropdownMenu-1">
													<li><a href="#">Dropped Menu 1</a></li>
													<li><a href="#">Dropped Menu 2</a></li>
													<li><a href="#">Dropped Menu 3</a></li>
													<li><a href="#">Dropped Menu 4</a></li>
												</ul>
											</div>
										</div>
									</div>

									<div class="reviews-btn-right">
										<a href="#" class="main-btn">with photo (18)</a> <a href="#"
											class="main-btn">additional feedback (23)</a>
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

											<ul class="comment-replay">
												<li>
													<div class="single-review-comment">
														<div class="comment-user-info">
															<div class="comment-author">
																<img src="assets/images/review/author-2.jpg" alt="">
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
															<p>Good headphones. The sound is clear. AND the
																bottoms repyat and top ring. Currently are really not
																taken.</p>
															<div class="comment-image flex-wrap">
																<div class="image">
																	<img src="assets/images/review/attachment-1.jpg" alt="">
																</div>
																<div class="image">
																	<img src="assets/images/review/attachment-2.jpg" alt="">
																</div>
															</div>
															<ul class="comment-meta">
																<li><i class="mdi mdi-thumb-up"></i> <span>31</span></li>
																<li><a href="#">Like</a></li>
																<li><a href="#">Replay</a></li>
															</ul>
														</div>
													</div>
												</li>
												<li>
													<div class="single-review-comment">
														<div class="comment-user-info">
															<div class="comment-author">
																<img src="assets/images/review/author-3.jpg" alt="">
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
															<p>Good headphones. The sound is clear. AND the
																bottoms repyat and top ring. Currently are really not
																taken.</p>
															<ul class="comment-meta">
																<li><i class="mdi mdi-thumb-up"></i> <span>31</span></li>
																<li><a href="#">Like</a></li>
																<li><a href="#">Replay</a></li>
															</ul>
														</div>
													</div>
												</li>
											</ul>
										</li>
										<li>
											<div class="single-review-comment">
												<div class="comment-user-info">
													<div class="comment-author">
														<img src="assets/images/review/author-4.jpg" alt="">
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
						<div class="tab-pane fade" id="specifications" role="tabpanel"
							aria-labelledby="specifications-tab">
							<div class="specifications-wrapper">
								<div class="row">
									<div class="col-lg-8">
										<div class="reviews-title">
											<h4 class="title">Oculus VR</h4>
										</div>
										<p class="mb-15 pt-30">Lorem ipsum dolor sit amet
											consectetur adipisicing elit. Maxime quod sequi vitae atque
											perspiciatis voluptas recusandae explicabo ea dolores numquam
											ratione, obcaecati ullam, ipsam minima vero nostrum nesciunt
											facere laudantium? Facere animi rem veniam quibusdam nam sed
											ex maxime laboriosam a vero nesciunt tenetur, eius autem
											fugiat quod expedita dignissimos.</p>
										<p class="mb-30">Repellendus, doloribus illum expedita,
											dolorem voluptas doloremque voluptatibus, magni tempora
											laboriosam deserunt suscipit labore dolorum aperiam cum
											veniam accusamus? Consequatur dolore facere perferendis
											repellat, modi in consectetur ipsum atque quos natus.</p>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</section>
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
	 				   $("#zzim").text("찜 하기");
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
	 				   $("#zzim").text("찜 취소");
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
