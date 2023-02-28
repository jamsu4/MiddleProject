<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="js/findInfo.js"></script>
<head>
<meta charset="UTF-8" />

<style>

/* 이거 있으면 고양이 사진 옆으로 가는데, 일단 고양이 사진 밑으로 보내달라고 하심 */
/* form {
	width: 500px;
	height: 500px;
	display: flex;
	flex-direction: column;
	align-items: center;
	position: absolute;
	top: 50%;
	left: 70%;
	transform: translate(-50%, -50%);
	border: 1px solid rgb(89, 117, 196);
	border-radius: 10px;
} */

tr {
	text-align: center;
}
input[type='text'], input[type='password'] {
	width: 300px;
	height: 40px;
	border: 1px solid rgb(89, 117, 196);
	border-radius: 5px;
	padding: 0 10px;
	margin-bottom: 10px;
}

input[type='submit'], input[type='reset'] {
	background-color: rgb(89, 117, 196);
	color: white;
	width: 300px;
	height: 50px;
	font-size: 17px;
	border: none;
	border-radius: 5px;
	margin: 20px 0 30px 0;
}


/* 회원가입 버튼 */
a[href*="https://www.naver.com/"] {
	color: red;
}

/* 폼 태그 내의 Login 글씨 */
#title {
	font-size: 50px;
	margin: 40px 0 30px 0;
}

/* 모달 창 위치 조정 */
.modal {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal.show {
	display: block;
}

.modal_body {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 400px;
	height: 700px;
	padding: 40px;
	text-align: center;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateX(-50%) translateY(-50%);
}
</style>
</head>


<body>
	<form action="login.do" method="post">	
		<h3 id="title">Login</h3>
	
		<!-- 이걸 자바스크립트로 바꿔서 해야하나???      회원 가입시 비번 확인용 구현처럼 (아래 코드 있음) -->
		<c:if test="${result != null }">
			<c:out value="${result}"></c:out>
		</c:if>
		
		<table class="table">
			<tr>
				<th>ID</th>
				<td><input type="text" id="mid" name="mid"></td>
			</tr>
			<tr>
				<th>Password</th>
				<td><input type="password" id="mpw" name="mpw"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="로그인">
					<!-- <input type="reset" value="취소"> --></td>
			</tr>
		</table>
	</form>

	<div>
		<div>
			<a href="findIdForm.do">ID 찾기</a> |
			<a href="findPwdForm.do">비밀번호 찾기</a>
		</div>


		<span>신규 회원 가입 시 적립금 5만원 지급</span>

		<div class="modal">
			<div class="modal_body">
				회원가입내용 작성해라 <hr>
				
				<form action="signup.do" method="POST" onsubmit="return formCheck(this);">
					<label for="member_id"><b>아이디</b></label>
					<input type="text" placeholder="아이디를 입력해 주세요" name="member_id" required>
	
	
					<label for="member_pw"><b>비밀번호</b></label>
					<input type="password" placeholder="비밀번호를 입력해 주세요" name="member_pw" required autofocus>
					
					<label for="member_confirm_pw"><b>비밀번호 재확인</b></label>
					<input type="password" placeholder="비밀번호를 다시 한 번 입력해 주세요" name="member_confirm_pw" required>
					
					<label for="member_name"><b>이름</b></label>
					<input type="text" placeholder="이름을 입력해 주세요" name="member_name" required>
	
					<label for="member_phone"><b>연락처</b></label>
					<input type="text" placeholder="연락처를 입력해 주세요" name="member_phone" required>
					
					<label for="member_phone"><b>이메일</b></label>
					<input type="text" placeholder="이메일을 입력해 주세요" name="member_email" required>
	
					<!-- 유저 회원가입이니까 DB에서 mem_user 컬럼의 값을 자동으로 user 로 숨겨서 전달하기 -->
					<input type="hidden" name="member_user" value="user">
					
					
					<!-- 버튼 클릭시 signUpForm.do 로 이동 -->
					<button type="submit">가입 정보 작성 완료</button>
				</form>
			</div>
		</div>

		<button class="btn-open-popup">회원가입</button>
	</div>
	

	<script>
		// 회원가입 할 때, 비밀번호와 재확인용 비밀번호가 일치하는지 확인하는 함수.
		// 불일치하면, 가입 안 됨
		function formCheck(frm) {
		 if(frm.member_pw.value != frm.member_confirm_pw.value) {
		  alert("비번이 다른데여");
		  
		  frm.member_pw.value = '';
		  frm.member_confirm_pw.value = '';
		  
		  return false;
		 }
		 
		 return true;
		}
    
		
	  // 모달창 관련
      const body = document.querySelector('body');
      const modal = document.querySelector('.modal');
      const btnOpenPopup = document.querySelector('.btn-open-popup');


      btnOpenPopup.addEventListener('click', () => {
        modal.classList.toggle('show');

        if (modal.classList.contains('show')) {
          body.style.overflow = 'hidden';
        }
      });

      
      modal.addEventListener('click', (event) => {
        if (event.target === modal) {
          modal.classList.toggle('show');

          if (!modal.classList.contains('show')) {
            body.style.overflow = 'auto';
          }
        }
      });
    </script>
</body>