<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js">
	
</script>
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
.space {
	margin-right : 7px !important;
}
</style>
<main>
	<div class="container-fluid px-4">
		<div id="pageName">
			<h1>주문관리페이지</h1>
		</div>

		<div id="line" class="card mb-4"></div>
		<form>
			<div class="card mb-4">
				<table id="datatablesSimple1" class="table table-border">
					<tr>
						<th style="padding-top: 15px;">통합검색</th>
						<td colspan=5>
							<div class="input-group mb-3">
								<button class="btn btn-outline-secondary dropdown-toggle"
									type="button" data-bs-toggle="dropdown" aria-expanded="false">검색조건</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="#">주문번호</a></li>
									<li><a class="dropdown-item" href="#">주문상품</a></li>
									<li><a class="dropdown-item" href="#">주문자</a></li>
								</ul>
								<input type="text" class="form-control"
									aria-label="Text input with dropdown button">
							</div>
						</td>
					</tr>
					<tr>
						<th>주문상태</th>
						<td colspan=5>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox"
									id="inlineCheckbox1" value="option1"> <label
									class="form-check-label" for="inlineCheckbox1">결제완료</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox"
									id="inlineCheckbox2" value="option2"> <label
									class="form-check-label" for="inlineCheckbox2">배송준비중</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox"
									id="inlineCheckbox3" value="option2"> <label
									class="form-check-label" for="inlineCheckbox2">배송중</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox"
									id="inlineCheckbox4" value="option2"> <label
									class="form-check-label" for="inlineCheckbox2">배송완료</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox"
									id="inlineCheckbox5" value="option2"> <label
									class="form-check-label" for="inlineCheckbox2">주문취소</label>
							</div>
						</td>

					</tr>
					<tr>
						<th>주문일자</th>
						<td colspan=5>
							<div class="btn-group" role="group"
								aria-label="Basic radio toggle button group">
									<input type="radio" class="btn-check" name="btnradio"
									id="btnradio1" autocomplete="off" checked> <label
									class="btn btn-outline-primary" for="btnradio1">오늘</label>
									<div class="space"></div> 
									<input
									type="radio" class="btn-check" name="btnradio" id="btnradio2"
									autocomplete="off"> <label
									class="btn btn-outline-primary" for="btnradio2">일주일</label> 
									<div class="space"></div> 
									<input
									type="radio" class="btn-check" name="btnradio" id="btnradio3"
									autocomplete="off"> <label
									class="btn btn-outline-primary" for="btnradio3">1개월</label> 
									<div class="space"></div> 
									<input
									type="radio" class="btn-check" name="btnradio" id="btnradio4"
									autocomplete="off"> <label
									class="btn btn-outline-primary" for="btnradio3">6개월</label>
							</div>

						</td>

					</tr>
				</table>
				<button type="button" class="btn btn-primary btn-lg">검색</button>
				<button type="button" class="btn btn-secondary btn-lg">초기화</button>
			</div>
		</form>
		<div>
			<form action="#" method="POST" id="search-btn-group">
				<label for="search-input"></label> <input type="text"
					id="search-input" name="search-input" class="search-input"
					placeholder="아이디를 입력하세요">
				<button type="submit" class="search-btn">
					<i class="fa fa-search"></i>
				</button>
			</form>
		</div>
		<div id="line" class="card mb-4"></div>
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> DataTable Example
			</div>
			<div class="card-body">
				<table id="datatablesSimple" class="table">
					<thead>
						<tr>
							<th>주문날짜</th>
							<th>주문번호</th>
							<th>주문상품</th>
							<th>주문자</th>
							<th>결제금액</th>
							<th>주문상태</th>

						</tr>
					</thead>
					<tbody>
					<tbody>
						<c:forEach var="list" items="${orderList }">
							<tr>
								<td>${list.payDate }</td>
								<td>${list.ordId }</td>
								<td>${list.proName }</td>
								<td>${list.memName }</td>
								<td>${list.ordTotalprice }</td>
								<td><div class="dropdown">
										<button class="btn dropdown-toggle"
											type="button" data-bs-toggle="dropdown" aria-expanded="false">
											${list.ordStatus }</button>
										<ul class="dropdown-menu">
											<li><a class="dropdown-item" href="#">배송준비중</a></li>
											<li><a class="dropdown-item" href="#">배송중</a></li>
											<li><a class="dropdown-item" href="#">배송완료</a></li>
											<li><hr class="dropdown-divider"></li>
											<li><a class="dropdown-item" href="#">주문취소</a></li>
										</ul>
									</div></td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</main>