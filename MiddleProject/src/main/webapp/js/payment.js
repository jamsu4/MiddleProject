	var IMP = window.IMP; // 생략가능
	IMP.init('imp42753804'); // <-- 본인 가맹점 식별코드 삽입
	
	
	function requestPay() {
		
		//결제내용 확인 체크
//		if(!docomuent.querySelect('#paymentInfoCheck').checked){
//			alert("주문정보를 확인 해주세요.");
//			return;
//		}
		
		
		//총 결제 금액
		var totalPrice = document.querySelectorAll('.totalPrice')[1].textContent;
		//결제 상품 이름
		var name ="";
		var productName = document.querySelectorAll('.selectBox:checked')
		if(productName.length >0) {
			name = productName[0].dataset.name + " 외 " + (productName.length-1) + "개";
			
		} else {
			name = productName[0].dataset.name
		}
		//결제자 이메일
		var buyerEmail = document.querySelector('#bemail').value;
		//결제자 이름
		var buyerName = document.querySelector('#bname').value;
		//결제자 번호
		var buyerTel = document.querySelector('#bphone').value;
		//결제자 주소

		//결제자 ID
		var memId = document.querySelector('#couponList').dataset.id;
		console.log(memId);
		//수신자 이름
		var ordReciever = document.querySelector('#rname').value;
		console.log(ordReciever);
		//수신자 주소
		var ordAddr = document.querySelector('#sample4_roadAddress').value+"/"
					  + document.querySelector('#sample4_extraAddress').value + "/" 
					  + document.querySelector('#sample4_detailAddress').value
		console.log(ordAddr);
		//수신자 연락처
		var ordPhone = document.querySelector('#rphone').value;
		console.log(ordPhone);
		//결제자 우편번호
		var ordPostcode = document.querySelector('#sample4_postcode').value;
		console.log(ordPostcode);
		
		  IMP.init('iamport'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
		  IMP.request_pay({
		    pg: "inicis",
		    pay_method: "card",
		    merchant_uid : 'merchant_'+new Date().getTime(),
		    name : name,	//수정부분
		    amount : 100,		//수정부분
		    buyer_email : buyerEmail,	//수정
		    buyer_name : buyerName,			//수정
		    buyer_tel : buyerTel	//수정
//		    buyer_addr : '서울특별시 강남구 삼성동',	//수정
//		    buyer_postcode : '123-456'		//수정
		  }, function (rsp) { // callback
		      if (rsp.success) {
		    	  let msg = '결제가 완료되었습니다.';
				  //주문, 결제 정보 저장
				  $.ajax({
					url : "addOrder.do",
					type : "POST",
					data : {
						ordStatus : '결제완료',
						memId : memId,
						ordReceiver : ordReciever,
						ordAddr : ordAddr,
						ordPhone : ordPhone,
						ordPostcode	: ordPostcode,
						ordTotalPrice : totalPrice
					},
				  })

		          alert(msg);
		          location.href = "main.do"
		      } else {
		    	  let msg = '결제에 실패하였습니다.';
		          msg += '에러내용 : ' + rsp.error_msg;
		          alert(msg);
		      }
		  });
		}	