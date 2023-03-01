<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<style>
		* {
			padding: 0;
			margin: 0;
			border: none;
		}

		body {
			font-size: 14px;
			font-family: 'Roboto', sans-serif;
		}

		.login-wrapper {
			width: 400px;
			height: 350px;
			padding: 40px;
			box-sizing: border-box;
			margin: 0 auto;
		}

		.login-wrapper > h2 {
			font-size: 30px;
			color: #6A24FE;
			margin-bottom: 20px;
		}

		.login-wrapper,
		.info-wrapper {
			text-align: center;
		}

		.login-wrapper>input {
			width: 100%;
			height: 48px;
			padding: 0 10px;
			box-sizing: border-box;
			margin-bottom: 16px;
			border-radius: 6px;
			background-color: #d3d3d3;
		}

		.login-wrapper>input::placeholder {
			color: #797979;
		}

		.login-wrapper>input[type="submit"] {
			color: #fff;
			font-size: 16px;
			background-color: #6A24FE;
			margin-top: 20px;
		}


		/* 회원가입 버튼 */
		.btn-open-popup {
			padding: 5px;
			border-radius: 6px;
			color: #fff;
			font-size: 16px;
			background-color: lightcoral;
			margin-top: 20px;
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


		#modal-title {
			font-size: 1.5rem;
			font-weight: bolder;
			color: #6A24FE;
		}

		.modal_body {
			position: absolute;
			top: 50%;
			left: 50%;
			width: 35%;
			/* height: 500px; */
			padding: 40px;
			text-align: center;
			background-color: rgb(255, 255, 255);
			border-radius: 10px;
			box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
			transform: translateX(-50%) translateY(-50%);
		}

		form>button[type="submit"] {
			width: 100%;
			height: 48px;
			padding: 0 10px;
			box-sizing: border-box;
			margin-bottom: 16px;
			border-radius: 6px;

			color: #fff;
			font-size: 16px;
			background-color: #6A24FE;
			margin-top: 20px;
		}


		/* 모달 창 내의 input 태그 꾸미기 */
		form > input {
			width: 100%;
			height: 48px;
			padding: 0 10px;
			box-sizing: border-box;
			margin-bottom: 16px;
			border-radius: 6px;
			background-color: #d3d3d3;
		}

		form > input::placeholder {
			color: #797979;
		}
	</style>
</head>

<body>
	<div class="login-wrapper">
		<h2>로그인</h2>
		<div id="errorMsg"></div>			<!-- 여기다가 에러 메시지 출력 -->

		<input type="text" id="mid" name="mid" placeholder="ID를 입력하세요">
		<input type="password" id="mpw" name="mpw" placeholder="비밀번호를 입력하세요">

		<input type="submit" id="loginBtn" value="로그인">
	</div>


	<div>
		<div class="info-wrapper">
			<a href="findIdForm.do">ID 찾기</a> |
			<a href="findPwdForm.do">비밀번호 찾기</a><br>



			<span>신규 회원 가입 시 적립금 5만원 지급</span>
			<button class="btn-open-popup">회원가입</button>
		</div>

		<!-- 모달창 -->
		<div class="modal">
			<div class="modal_body">
				<span id="modal-title">개인 정보를 작성해 주세요</span>
				<hr>

				<form action="signup.do" method="POST" onsubmit="return formCheck(this);">
					<!-- <input type="text" placeholder="아이디를 입력해 주세요" name="member_id" required> -->
					<div id="id_check"></div> <!-- 여기다가 메세지 띄울거임. (중복 여부 메시지) -->


					<input type="text" id="member_id" name="member_id" placeholder="아이디를 입력해 주세요" required><br>
					<input type="password" placeholder="비밀번호를 입력해 주세요" name="member_pw" required autofocus><br>
					<input type="password" placeholder="비밀번호를 다시 한 번 입력해 주세요" name="member_confirm_pw" required><br>
					<input type="text" placeholder="이름을 입력해 주세요" name="member_name" required><br>
					<input type="text" placeholder="연락처를 입력해 주세요" name="member_phone" required><br>
					<input type="text" placeholder="이메일을 입력해 주세요" name="member_email" required><br>
					<!-- 유저 회원가입이니까 DB에서 mem_user 컬럼의 값을 자동으로 user 로 숨겨서 전달하기 -->
					<input type="hidden" name="member_user" value="user">


					<!-- 버튼 클릭시 signUpForm.do 로 이동 -->
					<button type="submit">가입하기</button>
				</form>
			</div>
		</div>
	</div>


	<script>
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




		// 회원가입 할 때, 비밀번호와 재확인용 비밀번호가 일치하는지 확인하는 함수.
		// 불일치하면, 가입 안 됨
		function formCheck(frm) {
			if (frm.member_pw.value != frm.member_confirm_pw.value) {
				alert("비번이 다른데여");

				frm.member_pw.value = '';
				frm.member_confirm_pw.value = '';

				return false;
			}

			return true;
		}



		// 아이디 중복확인
		$("#member_id").blur(function () {
			// id = "id_reg" / name = "userId"
			let member_id = $("#member_id").val();

			$.ajax({
				url: "idCheck.do",
				type: "post",
				data: { id: member_id },
				success: function (result) {
					console.log("1 = 중복o / 0 = 중복x : " + result);

					if (result.retCode == "Success") {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다 :(");
						$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					} else if (result.retCode == "Fail") {

						$("#id_check").text("사용 가능한 아이디입니다 =)");
						$("#id_check").css("color", "lightseagreen");

					} else if (member_id == "") {
						$("#id_check").text("아이디를 입력해주세요!");
						$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					}
				},
				error: function () {
					console.log("실패");
				},
			});
		});




// 아이디/비번 불일치
$("#loginBtn").on('click', function () {
			let id = $("#mid").val();
			let pw = $("#mpw").val();

			$.ajax({
				url: "login.do",
				type: "post",
				data: {
					mid: id,
					mpw: pw
				},

				success: function (result) {

					if (result.retCode == "Success") {
						location.href='main.do';
					} else if (result.retCode == "Fail") {
						$("#errorMsg").text("아이디와 비밀번호를 정확히 입력해 주세요");
						$("#errorMsg").css("color", "red");

						$('#mid').val('');
						$('#mpw').val('');
					}
				},

				error: function () {
					console.log("실패");
				},
			});
		});
	</script>
</body>
</html>