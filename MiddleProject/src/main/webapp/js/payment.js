	var IMP = window.IMP; // 생략가능
	IMP.init('imp42753804'); // <-- 본인 가맹점 식별코드 삽입
	
	
	function requestPay() {
		var totalPrice = document.querySelectorAll('.totalPrice')[1].textContent;
		console.log(totalPrice);
		var name ="";
		var productName = document.querySelectorAll('.selectBox:checked')
		if(productName.length >0) {
			name = productName[0].dataset.name + " 외 " + (productName.length-1) + "개";
			
		} else {
			name = productName[0].dataset.name
		}
		console.log(name)
		
		
		
		  IMP.init('iamport'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
		  IMP.request_pay({
		    pg: "inicis",
		    pay_method: "card",
		    merchant_uid : 'merchant_'+new Date().getTime(),
		    name : name,	//수정부분
		    amount : totalPrice,		//수정부분
		    buyer_email : 'iamport@siot.do',	//수정
		    buyer_name : '구매자',			//수정
		    buyer_tel : '010-1234-5678',	//수정
		    buyer_addr : '서울특별시 강남구 삼성동',	//수정
		    buyer_postcode : '123-456'		//수정
		  }, function (rsp) { // callback
		      if (rsp.success) {
		    	  let msg = '결제가 완료되었습니다.';
		          alert(msg);
		          location.href = "main.do"
		      } else {
		    	  let msg = '결제에 실패하였습니다.';
		          msg += '에러내용 : ' + rsp.error_msg;
		          alert(msg);
		      }
		  });
		}	