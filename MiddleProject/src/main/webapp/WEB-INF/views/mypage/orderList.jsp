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

.star-rating {
	display: flex;
	flex-direction: row-reverse;
	font-size: 2.25rem;
	line-height: 2.5rem;
	justify-content: space-around;
	padding: 0 0.2em;
	text-align: center;
	width: 5em;
}

.star-rating input {
	display: none;
}

.star-rating label {
	-webkit-text-fill-color: transparent;
	/* Will override color (regardless of order) */
	-webkit-text-stroke-width: 2.3px;
	-webkit-text-stroke-color: #2b2a29;
	cursor: pointer;
}

.star-rating :checked ~ label {
	-webkit-text-fill-color: gold;
}

.star-rating label:hover, .star-rating label:hover ~ label {
	-webkit-text-fill-color: #fff58c;
}

div#image_container img {
	height: 200px;
	width: 200px;
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
				</div>
				<c:forEach var="list" items="${list }">
					<div class="product-cart d-flex">
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
								<span class="price">${list.proPrice }</span> <span class="price">(${list.ordQuant })</span>
							</div>
						</div>
						<div class="one-eight text-center">
							<div class="display-tc">
								<span class="price">${list.ordStatus }</span>
							</div>
						</div>
						<c:choose>
							<c:when test="${list.ordStatus == '결제완료'}">
								<div class="one-eight text-center">
									<div class="display-tc">
										<button>후기작성</button>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="one-eight text-center">
									<div class="display-tc">
										<button class="reviewBtn" data-bs-toggle="modal"
											data-bs-target="#exampleModal" proid="${list.proId }">후기작성</button>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>


				</c:forEach>

				<div id="cartDiv2" class="row row-pb-lg">
					<div class="col-md-12">
						<div class="total-wrap">
							<div class="row"></div>
						</div>
					</div>
				</div>
			</div>

			<div class="row" id="paymentPage" style="display: none;">
				<div class="col-lg-8">
					<form method="post" class="colorlib-form">
						<h2>주문/배송정보</h2>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group"></div>
							</div>

							<div class="col-md-6">
								<div class="form-group">
									<label for="bname">주문자</label> <input type="text" id="bname"
										class="form-control">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="bphone">번호</label> <input type="text" id=bphone
										class="form-control">
								</div>
							</div>

							<div class="col-md-12" style="border-bottom: 1px dotted black;">
								<div class="form-group">
									<label for="bemail">이메일</label> <input type="text" id="bemail"
										class="form-control">
								</div>
							</div>
							<div class="col-md-6" style="margin-top: 10px;">
								<div class="form-group">
									<label for="rname">수신자</label> <input type="text" id="rname"
										class="form-control" placeholder="이름">
								</div>
							</div>
							<div class="col-md-6" style="margin-top: 10px;">
								<div class="form-group">
									<label for="rphone">번호</label> <input type="text" id="rphone"
										class="form-control" placeholder="번호">
								</div>
							</div>

							<!-- 							<div class="col-md-12"> -->
							<!-- 								<div class="form-group"> -->
							<!-- 									<label for="companyname">이메일</label> <input type="text" -->
							<!-- 										id="remail" class="form-control" placeholder="이메일"> -->
							<!-- 								</div> -->
							<!-- 							</div> -->
							<div>
								<!-- 						   	<input type="text" id="sample4_postcode" placeholder="우편번호"> -->
								<!-- 							<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br> -->
								<!-- 							<input type="text" id="sample4_roadAddress" placeholder="도로명주소"> -->
								<input type="text" id="sample4_jibunAddress" placeholder="지번주소"
									style="display: none;"> <span id="guide"
									style="color: #999; display: none"></span>
								<!-- 									<input type="text" id="sample4_detailAddress" placeholder="상세주소"> -->
								<!-- 									<input type="text" id="sample4_extraAddress" placeholder="참고항목"> -->
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label for="fname">Address</label> <input type="button"
										onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<input type="text" id="sample4_roadAddress" placeholder="도로명주소"
										class="form-control" readonly>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<input type="text" id="sample4_extraAddress" placeholder="참고항목"
										class="form-control" readonly>
								</div>
							</div>

							<div class="col-md-12">
								<div class="form-group">
									<input type="text" id="sample4_detailAddress"
										placeholder="상세주소" class="form-control">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="lname">Zip/Postal Code</label> <input type="text"
										id="sample4_postcode" placeholder="우편번호" class="form-control"
										readonly>
								</div>
							</div>

							<!-- 						<div class="col-md-6"> -->
							<!-- 							<div class="form-group"> -->
							<!-- 								<label for="email">E-mail Address</label> <input type="text" -->
							<!-- 									id="email" class="form-control" placeholder="E-mail"> -->
							<!-- 							</div> -->
							<!-- 						</div> -->
							<!-- 						<div class="col-md-6"> -->
							<!-- 							<div class="form-group"> -->
							<!-- 								<label for="Phone">Phone Number</label> <input type="text" -->
							<!-- 									id="zippostalcode" class="form-control" placeholder=""> -->
							<!-- 							</div> -->
							<!-- 						</div> -->

							<div class="col-md-12">
								<div class="form-group">
									<div class="radio">
										<label> <input type="radio" name="optradio">이전
											배송정보
										</label> <label> <input type="radio" name="optradio">새로운
											배송정보
										</label>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>


				<div class="col-lg-4">
					<div class="row">
						<div class="col-md-12">
							<div class="total cart-detail">
								<div class="sub">
									<p>
										<span>장바구니 총합:</span><span class="sumCartPrice"></span>
									</p>
									<p>
										<span>Delivery:</span> <span
											style="text-decoration: line-through; opacity: 0.5;">3000원</span>
									</p>
									<p>
										<span>Discount:</span> <span class="couponPrice"
											style="opacity: 0.5;">0</span>
									</p>
								</div>
								<div class="grand-total">
									<p>
										<span><strong>Total:</strong></span><span class="totalPrice"></span>
									</p>
								</div>
							</div>
						</div>

						<div class="w-100"></div>

						<div class="col-md-12">
							<div class="cart-detail">
								<h2>Payment Method</h2>
								<div class="form-group">
									<div class="col-md-12">
										<div class="radio">
											<label><input type="radio" name="optradio">
												카드 결제</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-12">
										<div class="radio">
											<label><input type="radio" name="optradio">
												Check Payment</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-12">
										<div class="radio">
											<label><input type="radio" name="optradio">
												Paypal</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-12">
										<div class="checkbox">
											<label><input id="paymentInfoCheck" type="checkbox"
												value=""> 상기 주문 정보를 모두 확인했습니다.</label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 text-center">
							<p>
								<c:if test="44">
									<button onclick=requestPay() class="btn btn-primary">결제하기</button>
								</c:if>

							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="exampleModal"
	aria-labelledby="exampleModalLabel" aria-hidden="true"
	data-bs-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">후기 작성</h1>
			</div>
			<div class="modal-body">
				<div class="mb-3">
					<label for="recipient-name" class="col-form-label">제목</label> <input
						type="text" class="form-control" id="rTitle">
				</div>
				<div class="mb-3">
					<label for="recipient-name" class="col-form-label">내용</label>
					<textarea id="rContent" class="form-control" rows="5" cols="60"></textarea>
				</div>
				<div class="star-rating space-x-4 mx-auto mb-3">
					<input type="radio" id="5-stars" name="rating" value="5"
						v-model="ratings" /> <label for="5-stars" class="star pr-4">★</label>
					<input type="radio" id="4-stars" name="rating" value="4"
						v-model="ratings" /> <label for="4-stars" class="star">★</label>
					<input type="radio" id="3-stars" name="rating" value="3"
						v-model="ratings" /> <label for="3-stars" class="star">★</label>
					<input type="radio" id="2-stars" name="rating" value="2"
						v-model="ratings" /> <label for="2-stars" class="star">★</label>
					<input type="radio" id="1-star" name="rating" value="1"
						v-model="ratings" /> <label for="1-star" class="star">★</label>
				</div>
				<div class="mb-3">
					<label for="recipient-image" class="col-form-label">사진</label> <input
						type="file" class="form-control" id="rimage"
						onchange="setThumbnail(event);">
				</div>
				<div class="mb-3" id="image_container" style="text-align: center;"></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal" id="closeBtn">닫기</button>
				<button type="button" class="btn btn-primary"
					onclick='insertReview(event)'>등록</button>
			</div>
		</div>
	</div>
</div>



<script>
	//후기 작성
	let proid = 0;
	$('.reviewBtn').click(function(e) {
		proid = $(this).attr('proid')
	});

	function insertReview(event) {
		console.log('등록')
		let rtitle = $('#rTitle').val();
		let rContent = $('#rContent').val();
		let rate = $('input[name="rating"]:checked').val()
		let memid = '${logId}';
		let fileValue = $("#rimage").val().split("\\");
		let fileName = fileValue[fileValue.length - 1];
		let rimage = $("#rimage")[0].files[0];
		if (typeof rate == 'undefined') {
			rate = 0;
		}

		let formData = new FormData();
		formData.append("rtitle", rtitle);
		formData.append("rContent", rContent);
		formData.append("rate", rate);
		formData.append("memid", memid);
		formData.append("rimage", rimage);
		formData.append("proid", proid);

		$.ajax({
			url : "insertReview.do",
			method : "post",
			data : formData,
			contentType : false,
			processData : false,
			success : function(result) {
				if (result.retCode == "Success") {
					alert("등록되었습니다")
					$('#exampleModal').modal('hide')
					location.reload();
				} else {
					alert("오류");
				}
			},
			error : function(reject) {
				console.log(reject);
			},
		});

	}

	$('#closeBtn').click(function() {
		  $(this).closest('.modal-content').find('input, textarea, select').val('');
		  $(this).closest('.modal-content').find('input[type=radio], input[type=checkbox]').prop('checked', false);
		  $('#image_container').empty();
	});

	//사진 미리보기
	function setThumbnail(event) {
		var reader = new FileReader();

		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.querySelector("div#image_container").appendChild(img);
		};

		reader.readAsDataURL(event.target.files[0]);
	}

	//상품 삭제
	$('.closed').click(function() {
		var $this = $(this);
		console.log($(this).data('cid'));
		var cartId = $(this).data('cid');
		$.ajax({
			url : 'removeCart.do',
			method : 'post',
			data : {
				cartId : cartId
			},
			success : function(result) {
				if (result.retCode == "Success") {
					alert('목록에서 삭제를 성공했습니다.');
					$this.closest('.product-cart').remove();
				} else {
					alert('목록 등록에 실패했습니다.');

				}
			},
			error : function(err) {
				console.log(err);
			}
		});

	});

	//수량 변경시 금액 변경
	// 모든 quantity 클래스를 가진 input 태그에 대해 이벤트 리스너를 등록합니다.
	$('.quantity').on(
			'change',
			function() {
				var quantity = $(this).val();
				console.log(quantity);
				var price = $(this).closest('.product-cart').find(
						'.one-eight:nth-child(3) .price').text();
				console.log(price);
				var sumPrice = quantity * price;
				console.log(sumPrice);
				var sumPriceElement = $(this).closest('.product-cart').find(
						'.one-eight:nth-child(5) .price');
				console.log(sumPriceElement);

				sumPriceElement.text(sumPrice);
				updatePrices();
				totalPrice();
			});
	//우편번호
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_roadAddress").value = roadAddr;
						document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("sample4_extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}
	//쿠폰 조회
	$.ajax({
		url : "selectCoupon.do",
		type : "POST",
		data : {
			memId : "${logId}"
		},
		success : function(result) {
			if (result.retCode == "Success") {
				$.each(result.cvo, function(idx, item) {
					console.log(item);
					let option = $('<option />')
					option.text(item.coupName)
					option.val(item.coupId)
					option.attr('data-price', item.coupPrice)

					$('#couponList').append(option);
				});
				$('#couponList').attr('data-name', result.cvo[0].memName)
				$('#couponList').attr('data-phone', result.cvo[0].memPhone)
				$('#couponList').attr('data-email', result.cvo[0].memEmail)
				$('#couponList').attr('data-id', result.cvo[0].memId)
			} else {
				console.log("쿠폰없음")
			}
		},
		error : function(error) {
			console.log("실패");
		}
	});

	//쿠폰 선택 이벤트

	$('#couponList').change(function() {
		if ($('.selectBox:checked').length > 0) {
			// 선택된 값이 변경되었을 때 실행할 코드
			let selectedValue = $(this).find(':selected').data('price');
			console.log('선택된 값:', selectedValue);
			$('.couponPrice').text("");
			$('.couponPrice').text(selectedValue).attr('style', "");
			totalPrice();
		} else {
			alert("구매할 상품을 먼저 선택해주세요.");
		}
	});

	//상품 선택 체크박스 - 전체선택
	$('#allcheck').click(function() {
		checkSelect();
		updatePrices();
		totalPrice();
	})
	//선택박스 - 전체선택 - 결제금액 계산
	$('.selectBox').click(function() {
		checkAll();
		updatePrices();
		totalPrice();
	})

	//결제페이지 등장
	$('#movePayment').click(function() {
		if ($('.selectBox:checked').length > 0) {
			$('#cartDiv2').hide();
			$('#paymentPage').show();
			$('#processCheckOut').attr("class", "process text-center active");
			$('#processCart').attr("class", "process text-center");

			$('#bname').attr('value', $('#couponList').data('name'));
			$('#bphone').attr('value', $('#couponList').data('phone'));
			$('#bemail').attr('value', $('#couponList').data('email'));

		} else {
			alert("구매할 상품을 선택해주세요.");
			return;
		}
		updatePrices();
		totalPrice();

	});

	function checkSelect() {
		let checkCount = $('.selectBox:checked').length;
		let totalCount = $('.selectBox').length;
		if (checkCount != totalCount) {
			$('.selectBox').each(function() {
				$(this).prop("checked", true);
			})
		} else {
			$('.selectBox').each(function() {
				$(this).prop("checked", false);
			})
		}
	}

	function checkAll() {
		let checkCount = $('.selectBox:checked').length;
		let totalCount = $('.selectBox').length;
		if (checkCount != totalCount) {
			$('#allcheck').prop("checked", false);
		} else {
			$('#allcheck').prop("checked", true);
		}
	}

	function updatePrices() {
		let sum = 0;
		$('.selectBox:checked').each(
				function() {
					console.log($(this).closest('.product-cart').find(
							'.one-eight:nth-child(5) .price').text());
					let selectedPrice = parseInt($(this).closest(
							'.product-cart').find(
							'.one-eight:nth-child(5) .price').text());
					sum += selectedPrice;
				});
		console.log(sum);
		$('.sumCartPrice').text(sum);

	}
	function totalPrice() {
		let total = 0;
		let couponprice = parseInt($('#couponList option:selected').data(
				'price'));
		let productprice = parseInt($('.sumCartPrice').eq(0).text());
		total = productprice - couponprice
		console.log(total);
		$('.totalPrice').text(total);
	}
</script>