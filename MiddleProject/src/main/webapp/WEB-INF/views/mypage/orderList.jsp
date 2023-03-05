<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js">
	
</script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="js/payment.js"></script>
<link rel="stylesheet" href="css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="css/icomoon.css">
<!-- Ion Icon Fonts-->
<link rel="stylesheet" href="css/ionicons.min.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- Magnific Popup -->
<link rel="stylesheet" href="css/magnific-popup.css">

<!-- Flexslider  -->
<link rel="stylesheet" href="css/flexslider.css">

<!-- Owl Carousel -->
<link rel="stylesheet" href="css/owl.carousel.min.css">

<link rel="stylesheet" href="css/owl.theme.default.min.css">

<!-- Date Picker -->
<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<!-- Flaticons  -->
<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

<!-- Theme style  -->
<link rel="stylesheet" href="css/style.css">
<style>
.selectpicker+.bootstrap-select>.btn-light {
	display: none !important;
}

.bootstrap-select>.dropdown-menu {
	display: none !important;
}

.nice-select {
	display: none !important;
}

#couponList {
	display: block !important;
}

.ordImg {
	width: 120px;
	height: 90px;
	border-radius: 10px;
}

button {
	color: white;
	background-color: rgba(0, 0, 0, 0.644);
	border-radius: 5px;
	border: none;
	width: 80px;
	height: 35px;
}
</style>

<h3>주문내역 입니다.</h3>
<div class="colorlib-product">
	<div class="container">
		<div class="row row-pb-lg">
			<div class="col-md-10 offset-md-1">
				<div class="process-wrap">
					<div id="processComplete" class="process text-center">
						<p>
							<span>01</span>
						</p>
						<h3>Shopping Cart</h3>
					</div>
					<div id="processCheckOut" class="process text-center">
						<p>
							<span>02</span>
						</p>
						<h3>Checkout</h3>
					</div>
					<div id="processCart" class="process text-center active">
						<p>
							<span>03</span>
						</p>
						<h3>Order Complete</h3>
					</div>
				</div>
			</div>
		</div>
		<div class="row row-pb-lg">
			<div class="col-md-12">
				<div class="product-name d-flex">
					<div class="one-eight text-center">
						<input id="allcheck" type="checkbox">
					</div>
					<div class="one-eight text-left px-4">
						<span>상품</span>
					</div>
					<div class="one-eight text-center">
						<span>주문일자</span>
					</div>
					<div class="one-eight text-center">
						<span>주소</span>
					</div>
					<div class="one-eight text-center">
						<span>수령인</span>
					</div>
					<div class="one-eight text-center">
						<span>주문금액(수량)</span>
					</div>
					<div class="one-eight text-right px-4">
						<span>주문상태</span>
					</div>
					<div class="one-eight text-right px-4">
						<span>후기</span>
					</div>
					<div class="one-eight text-right px-4">
						<span>주문취소</span>
					</div>
				</div>
				<div id="orderList">
					<c:forEach var="list" items="${list }">
						<div class="product-cart d-flex" data-ordproid="${list.ordProId }" data-id="${list.ordId }">
							<div class="one-eight text-center">
								<div class="display-tc">
									<input class="selectBox" type="checkbox" data-value="44"
										data-price="44" data-name="44">
								</div>
							</div>
							<div class="one-eight text-center">
								<div class="display-tc">
									<img src="images/${list.proImg }" class="ordImg"> <span
										class="price">${list.proName }</span>
								</div>
							</div>
							<div class="one-eight text-center">
								<div class="display-tc">
									<span class="price">${list.payDate }</span>
								</div>
							</div>
							<div class="one-eight text-center">
								<div class="display-tc">
									<span class="price">${list.ordAddr }</span>
								</div>
							</div>
							<div class="one-eight text-center">
								<div class="display-tc">
									<span class="price">${list.ordReceiver }</span>
								</div>
							</div>
							<div class="one-eight text-center">
								<div class="display-tc">
									<span class="price">${list.proPrice }</span> <span
										class="price">(${list.ordQuant })</span>
								</div>
							</div>
							<div class="one-eight text-center">
								<div class="display-tc">
									<span class="price">${list.ordStatus }</span>
								</div>
							</div>
							<c:choose>
							<c:when test="${list.ordStatus eq '배송완료'}">
								<div class="one-eight text-center">
									<div class="display-tc">
										<button>후기작성</button>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="one-eight text-center">
									<div class="display-tc">
										<button disabled>후기작성</button>
									</div>
								</div>
							</c:otherwise>
							</c:choose>
							<c:choose>
							<c:when test="${list.ordStatus eq '주문취소'}">
							<div class="one-eight text-center">
								<div class="display-tc">
									<button disabled>취소완료</button>
								</div>
							</div>
							</c:when>
							<c:otherwise>
							<div class="one-eight text-center">
								<div class="display-tc">
									<button onclick=orderCancel(event)>주문취소</button>
								</div>
							</div>
							</c:otherwise>
							</c:choose>
						</div>
					</c:forEach>
				</div>
				<div id="paging" style="text-align: center;">
					<c:if test="${paging.prev}">
						<c:set var="beginPage" value="${paging.beginPage - 1}" />
						<c:out value="${beginPage}" />
						<a onclick=movePage(event) data-page="${beginPage}">prev</a>
					</c:if>
					<c:forEach begin="${paging.beginPage}" end="${paging.endPage}"
						step="1" var="index">
						<c:choose>
							<c:when test="${paging.page==index}">
					            ${index}
					        </c:when>
							<c:otherwise>
								<a onclick=movePage(event) data-page="${index}">${index}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:set var="beginPage" value="${paging.endPage + 1}" />
					<c:out value="${endPage}" />
					<c:if test="${paging.next}">
						<a onclick=movePage(event) data-page="${endPage}">next</a>
					</c:if>
				</div>

			</div>


		</div>
	</div>
</div>





<script>
	//페이지 이동
	function movePage(event) {
		console.log(event.target)
		page = $(event.target).data('page');
		console.log(page);

		$
				.ajax({
					url : "orderManage.do",
					data : {
						page : page
					},
					success : function(result) {
						console.log(result.orderList);
						$('#orderList').empty();
						$('#paging').empty();
						var paging = result.paging;
						var orderList = result.orderList;
						var tbody = $('#orderList');

						$.each(orderList, function(index, list) {
						var divProductCart = $('<div>').addClass('product-cart d-flex');
						var divOneEight1 = $('<div>').addClass('one-eight text-center').append(
							    $('<div>').addClass('display-tc').append(
							        $('<input>').addClass('selectBox')
							        .attr('type', 'checkbox')
							        .attr('data-value', list.proId)
							        .attr('data-price', list.proPrice)
							        .attr('data-name', list.proName)
							    )
							);

							var divOneEight2 = $('<div>').addClass('one-eight text-center').append(
							    $('<div>').addClass('display-tc').append(
							        $('<img>').addClass('ordImg').attr('src', 'images/' + list.proImg),
							        $('<span>').addClass('price').text(list.proName)
							    )
							);

							var divOneEight3 = $('<div>').addClass('one-eight text-center').append(
							    $('<div>').addClass('display-tc').append(
							        $('<span>').addClass('price').text(list.payDate)
							    )
							);

							var divOneEight4 = $('<div>').addClass('one-eight text-center').append(
							    $('<div>').addClass('display-tc').append(
							        $('<span>').addClass('price').text(list.ordAddr)
							    )
							);

							var divOneEight5 = $('<div>').addClass('one-eight text-center').append(
							    $('<div>').addClass('display-tc').append(
							        $('<span>').addClass('price').text(list.ordReceiver)
							    )
							);

							var divOneEight6 = $('<div>').addClass('one-eight text-center').append(
							    $('<div>').addClass('display-tc').append(
							        $('<span>').addClass('price').text(list.proPrice),
							        $('<span>').addClass('price').text('(' + list.ordQuant + ')')
							    )
							);

							var divOneEight7 = $('<div>').addClass('one-eight text-center').append(
							    $('<div>').addClass('display-tc').append(
							        $('<span>').addClass('price').text(list.ordStatus)
							    )
							);

							if (list.ordStatus == '배송완료') {
								  var divOneEight8 = $('<div>').addClass('one-eight text-center').append(
								    $('<div>').addClass('display-tc').append(
								      $('<button>').text('후기작성')
								    )
								  );
								} else {
								  var divOneEight8 = $('<div>').addClass('one-eight text-center').append(
								    $('<div>').addClass('display-tc').append(
								      $('<button>').attr('disabled', 'disabled').text('후기작성')
								    )
								  );
								}

								if (list.ordStatus == '주문취소') {
								  var divOneEight9 = $('<div>').addClass('one-eight text-center').append(
								    $('<div>').addClass('display-tc').append(
								      $('<button>').attr('disabled', 'disabled').text('취소완료')
								    )
								  );
								} else {
								  var divOneEight9 = $('<div>').addClass('one-eight text-center').append(
								    $('<div>').addClass('display-tc').append(
								      $('<button>').text('주문취소').on('click', orderCancel)
								    )
								  );
								}

							divProductCart.append(divOneEight1)
							.append(divOneEight2)
							.append(divOneEight3)
							.append(divOneEight4)
							.append(divOneEight5)
							.append(divOneEight6)
							.append(divOneEight7)
							.append(divOneEight8)
							.append(divOneEight9);

							// append the product cart to the tbody
							$('#orderList').append(divProductCart);


									var pagingspace = "";
									if (paging.prev) {
										var beginPage = paging.beginPage - 1;
										pagingspace += "<a onclick='movePage(event)' data-page='"
												+ beginPage + "'>prev</a>";
									}
									for (var i = paging.beginPage; i <= paging.endPage; i++) {
										if (paging.page == i) {
											pagingspace += i;
										} else {
											pagingspace += "<a onclick='movePage(event)' data-page='"
													+ i + "'>" + i + "</a>";
										}
									}
									if (paging.next) {
										var endPage = paging.endPage + 1;
										pagingspace += "<a onclick='movePage(event)' data-page='"
												+ endPage + "'>next</a>";
									}
									$('#paging').html(pagingspace);

								})
					},
					error : function(reject) {
						console.log(reject);
					}
				});
	}
	//결제취소
function orderCancel(event) {
	var result = confirm('주문을 취소 하시겠습니까?')	
	if(result) {
	var ordProId = $(event.target).closest('.product-cart').data('ordproid');
	var ordId = $(event.target).closest('.product-cart').data('id');
	let merchant_uid = "";
	let cancel_request_amount = "";
	const imp_key = "1264228020715837";
	const imp_secret = "NjH51deXXTC2OxTMUgJdzpSmEa94G9nmkaKnsO2nvyJ8edetXf4cLEXROkg0ojWzfQ0JkNdROCQm9kVd";
	let imp_uid = "";
//		const amount = 100;
	
	IMP.init('iamport');
	
	$.ajax({
	  url: "refundInfo.do",
	  type: "POST",
	  data: {
	    ordProId: ordProId,
	    ordId: ordId
	  },
	  success: function(result) {
	    console.log(result.refundInfo);
	    merchant_uid = result.refundInfo.payCode;
	    cancel_request_amount = result.refundInfo.ordProSumprice;
	    imp_uid = result.refundInfo.payUid;
	    console.log(merchant_uid);
	    console.log(imp_uid);

	    IMP.init('iamport');
	    const param = {
	      imp_uid: imp_uid,
	      merchant_uid: merchant_uid,
	      amount: 100
	    };
		console.log(param);
	    IMP.certification(param, function(rsp) {
	    	console.log(rsp);
	      if (rsp.success) {
	        // 결제 취소가 성공한 경우
	        alert('결제 취소를 성공했습니다.');
	        $.ajax({
				url : "updateOrderStatus.do",
				type : "POST",
				data : {
					ordProId : ordProId,
					ordStatus : "결제취소"
				},
				success : function(result) {
					if(result.retCode == "Success"){					
						console.log("수정 성공");
					} else {
						console.log("수정 실패");
					}
				},
				error : function(error) {
					console.log("수정 통신 실패");
				}
			});
	        location.reload();
	      } else {
	        // 결제 취소가 실패한 경우
	        alert('결제 취소를 실패했습니다');
	      }
	    });
	  },
	  error: function(error) {
		console.log(error);
	    console.log("조회 통신 실패");
	  }
	});
	}
	}	
	
	
	
	
	
</script>