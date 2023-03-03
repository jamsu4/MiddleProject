<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
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
</style>

<main>
	<div class="container-fluid px-4">
		<div id="pageName">
			<h1>QA 관리페이지</h1>
		</div>
		<div>
			<form action="#" method="POST" id="search-btn-group">
				<label for="search-input"></label> <input type="text" id="search-input" name="search-input"
					class="search-input" placeholder="아이디를 입력하세요">
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
				<!-- <input type="file" id="fileUpload" accept="images/*"
				style="display: none" onchange="setThumbnail(event);" /> -->
				<table id="datatablesSimple" class="table">
					<thead>
						<tr>
							<th>QA 글 번호</th>
							<th>상품 번호</th>
							<th>멤버 아이디</th>
							<th>글 제목</th>
							<th>글 내용</th>
							<th>작성 일자</th>
							<th>댓글</th>
						</tr>
					</thead>
					<tbody id="qaList"></tbody>
				</table>
				<br />
				<!-- 				<button id="addQa" class="btn btn-primary"
				onclick="location.href = '#'">등록</button> -->
				<button id="addQa" class="btn btn-primary">등록</button>
			</div>
		</div>
	</div>
</main>


<script>
	$.ajax({
		url: "qaList.do",
		success: function (result) {
			$(result).each(function (idx, item) {
				$("#qaList").append(makeRow(item));
			});

			$(result).each(function (idx, item) {
				$("#qaList").append(makeRowUpd(item));
			});
		},
		error: function (reject) {
			console.log(reject);
		},
	});

	
	function makeRow(manager = {}) {
		let tr = $("<tr />");

		tr.append(
			$("<td />").text(manager.qaId),
			$("<td />").text(manager.memId),
			$("<td />").text(manager.proId),
			$("<td />").text(manager.qaTitle),
			$("<td />").text(manager.qaContent),
			$("<td />").text(manager.qaDate),
			$("<td />").text(manager.qaReply),
			$("<td />").append(
				$("<button />")
					.addClass("btn btn-success updbtn")
					.text("수정")
					.attr("qaIdUpd", manager.qaId)
			),
			$('<td />').append( //td 추가
				$('<button class="btn btn-danger">삭제</button>')
					.attr('qaIdDel', manager.qaId) // .attr => setAttribute, 만들다
					.on('click', deleteQaFnc) //이벤트
			)
		);

		return tr;
	}

	
	function makeRowUpd(manager = {}) {
		let tr = $("<tr />");

		$(".updbtn").on("click", function (e) {
			console.log(e.target);
			let qid = $(this).closest("tr").children().eq(0).text();
			let mid = $(this).closest("tr").children().eq(1).text();
			let pid = $(this).closest("tr").children().eq(2).text();
			let qtitle = $(this).closest("tr").children().eq(3).text();
			let qcontent = $(this).closest("tr").children().eq(4).text();
			let qdate = $(this).closest("tr").children().eq(5).text();
			let qreply = $(this).closest("tr").children().eq(6).text();

			let nTr = $("<tr />").append(
				$("<td />").append($("<input id='qid' />").val(qid)),
				$("<td />").append($("<input id='mid' />").val(mid)),
				$("<td />").append($("<input id='pid' />").val(pid)),
				$("<td />").append($("<input id='qtitle' />").val(qtitle)),
				$("<td />").append($("<input id='qcontent' />").val(qcontent)),
				$("<td />").append($("<input id='qdate' />").val(qdate)),
				$("<td />").append($("<input id='qreply' />").val(qreply)),
				$("<td />").append(
					$(
						"<button onclick='updateQaFnc(event)' class='btn btn-success updbtn'>수정 완료</button>"
					)
				)
			);
			$(this).closest("tr").replaceWith(nTr);
		});

		return tr;
	}


	function deleteQaFnc(e) {
		if (!window.confirm("삭제하시겠습니까?")) {
			return;
		}

		let qaId = $(e.target).attr("qaIdDel");
		console.log(qaId);

		//
		$.ajax({
			url: "removeQa.do",
			data: { qaId: qaId },
			success: function (result) {
				console.log(result);
				if (result.retCode == "Success") {
					$(e.target).parent().parent().remove();
				} else {
					alert("오류");
				}
			},
			error: function (reject) {
				console.log(reject);
			},
		});
	}

	
	function updateQaFnc(e) {
		let tr = $(e.target).parent().parent();

		let qid = $("#qid").val();
		let mid = $("#mid").val();
		let pid = $("#pid").val();
		let qtitle = $("#qtitle").val();
		let qcontent = $("#qcontent").val();
		let qdate = $("#qdate").val();
		let qreply = $("#qreply").val();

		/* 	    let formData = new FormData();
				formData.append("qid", qid);
				formData.append("mid", mid);
				formData.append("pid", pid);
				formData.append("qtitle", qtitle);
				formData.append("qcontent", qcontent);
				formData.append("qdate", qdate);
				formData.append("qreply", qreply);
		 */
		$.ajax({
			url: "updateQa.do",
			method: "post",
			data: {
				qid: qid,
				mid: mid,
				pid: pid,
				qtitle: qtitle,
				qcontent: qcontent,
				qdate: qdate,
				qreply: qreply
			},
			success: function (result) {
				console.log(result);
				if (result.retCode == 'Success') {
					tr.replaceWith(makeRow(result.manager));
					tr.replaceWith(makeRowUpd(result.manager));
				} else {
					alert("입력 미완");
				}
			},
			error: function (reject) {
				console.log(reject);
			},
		});
	}
</script>