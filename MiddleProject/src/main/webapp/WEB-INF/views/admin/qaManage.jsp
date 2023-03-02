<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<style>
table:nth-of-type(2) input {
	width: 100px;
	display: inline-block;
}

/* 버튼 스타일링 */
.search-btn {
	background-color: #4caf50;
	border: none;
	color: white;
	padding: 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin-left: 10px;
	cursor: pointer;
}

/* 입력창 스타일링 */
.search-input {
	padding: 10px;
	font-size: 16px;
	border: 2px solid #ccc;
	border-radius: 5px;
	vertical-align: middle;
}

#search-btn-group {
	margin-top: 10px;
	margin-right: 20px;
	margin-bottom: 20px;
	float: right;
}

#pageName {
	margin-top: 10px;
	float: left;
}

#line {
	clear: both;
}

#datatablesSimple1 tr th {
	width: 100px;
}

.input-group {
	margin: 0px !important;
}
</style>
<main>
	<div class="container-fluid px-4">
		<div id="pageName">
			<h1>Q&A 관리페이지</h1>
		</div>
		<div>
			<form action="#" method="POST" id="search-btn-group">
				<label for="search-input"></label> <input type="text"
					id="search-input" name="search-input" class="search-input"
					placeholder="상품 번호를 입력하세요">
				<button type="submit" class="search-btn">
					<i class="fa fa-search"></i>
				</button>
			</form>
            <br>
		</div>
		<div id="line" class="card mb-4"></div>
		

		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> Q&A 목록
			</div>
			<div class="card-body">
                <table class="datatablesSimple">
                    <thead>
                        <tr>
                            <th>Q&A 글 번호</th>
                            <th>상품 번호</th>
                            <th>멤버 아이디</th>
                            <th>글 제목</th>
                            <th>글 내용</th>
                            <th>작성 일자</th>
                            <th>댓글</th>
                        </tr>
                    </thead>

                    <tbody>
                        <!-- var : list배열의 항목 하나 / items : 배열 -->
                        <c:forEach var="qna" items="${qaDetail}">
                        <tr>
                            <td>${qna.qaId}</td>
                            <td>${qna.proId}</td>
                            <td>${qna.memId}</td>
                            <td>${qna.qaTitle}</td>
                            <td>${qna.qaContent}</td>
                            <td>${qna.qaDate}</td>
                            <td>${qna.qaReply}</td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
			</div>
		</div>
	</div>
</main>