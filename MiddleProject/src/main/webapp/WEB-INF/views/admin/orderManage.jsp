<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<h1>회원관리페이지</h1>
		</div>

		<div id="line" class="card mb-4"></div>
		<div>
			<div class="card mb-4">
				<table id="datatablesSimple1" class="table table-border">
					<tr>
						<th style="padding-top: 15px;">주문번호</th>
						<td colspan=5>
							<div class="input-group mb-3">
								<button class="btn btn-outline-secondary dropdown-toggle"
									type="button" data-bs-toggle="dropdown" aria-expanded="false">Dropdown</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="#">Action</a></li>
									<li><a class="dropdown-item" href="#">Another action</a></li>
									<li><a class="dropdown-item" href="#">Something else
											here</a></li>
									<li><hr class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="#">Separated link</a></li>
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
								<input type="radio" class="btn-check" name="btnradio" id="btnradio1" 
								autocomplete="off" checked>
								<label class="btn btn-outline-primary" for="btnradio1">오늘</label> 
								<input type="radio" class="btn-check" name="btnradio" id="btnradio2"
								autocomplete="off"> 
								<label class="btn btn-outline-primary" for="btnradio2">일주일</label> 
								<input type="radio" class="btn-check" name="btnradio" id="btnradio3"
								autocomplete="off"> 
								<label class="btn btn-outline-primary" for="btnradio3">1개월</label> 
								<input type="radio" class="btn-check" name="btnradio" id="btnradio4"
								autocomplete="off"> 
								<label class="btn btn-outline-primary" for="btnradio3">6개월</label>
							</div>

						</td>

					</tr>
				</table>
				<button type="button" class="btn btn-primary btn-lg">검색</button>
				<button type="button" class="btn btn-secondary btn-lg">초기화</button>
			</div>
		</div>
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
				<table id="datatablesSimple">
					<thead>
						<tr>
							<th>Name</th>
							<th>Position</th>
							<th>Office</th>
							<th>Age</th>
							<th>Start date</th>
							<th>Salary</th>
						</tr>
					</thead>
					<tbody>
					<tbody>
						<tr>
							<td>Tiger Nixon</td>
							<td>System Architect</td>
							<td>Edinburgh</td>
							<td>61</td>
							<td>2011/04/25</td>
							<td>$320,800</td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
	</div>
</main>