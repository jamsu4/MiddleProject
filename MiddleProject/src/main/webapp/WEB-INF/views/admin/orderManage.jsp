<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js">
	
</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script> -->
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
		<form action="searchOrder.do" method="post">
			<div class="card mb-4">
				<table id="datatablesSimple1" class="table table-border">
					<tr>
						<th style="padding-top: 15px;">주문번호</th>
						<td colspan=5>
							<div class="input-group mb-3">
								<input type="text" class="form-control" name="ordId"
									aria-label="Text input with dropdown button">
							</div>
						</td>
					</tr>
					<tr>
						<th style="padding-top: 15px;">주문자</th>
						<td colspan=5>
							<div class="input-group mb-3">
								<input type="text" class="form-control" name="memId"
									aria-label="Text input with dropdown button">
							</div>
						</td>
					</tr>
					<tr>
						<th>주문상태</th>
						<td colspan=5>
							<div class="btn-group" role="group"
								aria-label="Basic radio toggle button group">
									<input type="radio" class="btn-check" name="ordStatus" value="결제완료"
									id="btnradio1" autocomplete="off" checked> <label
									class="btn btn-outline-primary" for="btnradio1">결제완료</label>
									<div class="space"></div> 
									<input id="btnradio2"
									type="radio" class="btn-check" name="ordStatus" value="배송준비중"
									autocomplete="off"> <label
									class="btn btn-outline-primary" for="btnradio2">배송준비중</label> 
									<div class="space"></div> 
									<input id="btnradio3"
									type="radio" class="btn-check" name="ordStatus" value="배송중"
									autocomplete="off"> <label
									class="btn btn-outline-primary" for="btnradio3">배송중</label> 
									<div class="space"></div> 
									<input id="btnradio4"
									type="radio" class="btn-check" name="ordStatus" value="배송완료"
									autocomplete="off"> <label
									class="btn btn-outline-primary" for="btnradio4">배송완료</label>
									<div class="space"></div> 
									<input id="btnradio5"
									type="radio" class="btn-check" name="ordStatus" value="주문취소"
									autocomplete="off"> <label
									class="btn btn-outline-primary" for="btnradio5">주문취소</label>
							</div>
						</td>
					</tr>
<!-- 					<tr> -->
<!-- 						<th>주문일자</th> -->
<!-- 						<td colspan=5> -->
<!-- 							<div class="btn-group" role="group" -->
<!-- 								aria-label="Basic radio toggle button group"> -->
<!-- 									<input type="radio" class="btn-check" name="findPeriod" -->
<!-- 									id="btnradio1" autocomplete="off"> <label -->
<!-- 									class="btn btn-outline-primary" for="btnradio1">오늘</label> -->
<!-- 									<div class="space"></div>  -->
<!-- 									<input -->
<!-- 									type="radio" class="btn-check" name="findPeriod" id="btnradio2" -->
<!-- 									autocomplete="off"> <label -->
<!-- 									class="btn btn-outline-primary" for="btnradio2">일주일</label>  -->
<!-- 									<div class="space"></div>  -->
<!-- 									<input -->
<!-- 									type="radio" class="btn-check" name="findPeriod" id="btnradio3" -->
<!-- 									autocomplete="off"> <label -->
<!-- 									class="btn btn-outline-primary" for="btnradio3">1개월</label>  -->
<!-- 									<div class="space"></div>  -->
<!-- 									<input -->
<!-- 									type="radio" class="btn-check" name="findPeriod" id="btnradio4" -->
<!-- 									autocomplete="off"> <label -->
<!-- 									class="btn btn-outline-primary" for="btnradio3">6개월</label> -->
<!-- 							</div> -->
<!-- 						</td> -->
<!-- 					</tr> -->
				</table>
				<button type="submit" class="btn btn-primary btn-lg">검색</button>
				<button type="reset" class="btn btn-secondary btn-lg">초기화</button>
			</div>
		</form>
<!-- 		<div> -->
<!-- 			<form action="#" method="POST" id="search-btn-group"> -->
<!-- 				<label for="search-input"></label> <input type="text" -->
<!-- 					id="search-input" name="search-input" class="search-input" -->
<!-- 					placeholder="아이디를 입력하세요"> -->
<!-- 				<button type="submit" class="search-btn"> -->
<!-- 					<i class="fa fa-search"></i> -->
<!-- 				</button> -->
<!-- 			</form> -->
<!-- 		</div> -->
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
								<td title="product ID : ${list.proId }">${list.proName }</td>
								<td title="member ID : ${list.memId }">${list.memName }</td>
								<td>${list.ordTotalprice }</td>
								<td><select>
										<option>
									</select>
										<button class="btn dropdown-toggle"
											type="button" data-bs-toggle="dropdown" aria-expanded="false">
											${list.ordStatus }</button>
										
									</div></td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</main>

<script>



</script>