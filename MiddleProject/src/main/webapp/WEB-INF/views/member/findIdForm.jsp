<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<title>Insert title here</title>
<style>
	#errorMsg {
		font-size: 50px;
		color: red;
	}
</style>
</head>
<body>
	<div id="errorMsg">
		${error}
	</div>
    
	<form action="findId.do" method="post">
		
		
		<h2>아이디 찾기</h2>

		<div>
			<label>이름</label>
			<input type="text" name="name" placeholder="이름을 입력하세요." required="required">
		</div>

		<div>
			<label>이메일</label>
			<input type="text"name="email" placeholder="이메일을 입력하세요." required="required">
		</div>
		
		<div>
			<button type="submit"class="btn btn-primary btn-lg">아이디 찾기</button>
		</div>
	</form>
</body>