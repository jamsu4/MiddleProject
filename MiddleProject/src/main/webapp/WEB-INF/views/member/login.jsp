<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

		<!-- null이 아니라면 -->
		<!-- 메세지 출력하기 -->
		<c:if test="${result != null}">
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
		<h6>ID / PW 찾기</h6>


		<h6>신규 회원 가입 시 적립금 5만원 지급</h6>

		<div class="modal">
			<div class="modal_body">
				회원가입내용 작성해라 <hr>
				
				<label for="member_id"><b>아이디</b></label>
				<input type="text" placeholder="Enter ID" name="member_id" required>


				<label for="member_pw"><b>비밀번호</b></label>
				<input type="password" placeholder="Enter Password" name="member_pw" required>
				
				<label for="member_name"><b>비밀번호 재확인</b></label>
				<input type="text" placeholder="Enter Name" name="member_name" required>
				
				<label for="member_name"><b>이름</b></label>
				<input type="text" placeholder="Enter Name" name="member_name" required>

				<label for="member_phone"><b>연락처</b></label>
				<input type="text" placeholder="Enter Phone" name="member_phone" required>
				
				<label for="member_phone"><b>이메일</b></label>
				<input type="text" placeholder="Enter Phone" name="member_phone" required>


				<!-- 버튼 클릭시 signUpForm.do 로 이동 -->
				<button type="button" onclick="location.href='signup.do' ">가입
					정보 작성 완료</button>
			</div>
		</div>

		<button class="btn-open-popup">회원가입</button>

	</div>

	<script>
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