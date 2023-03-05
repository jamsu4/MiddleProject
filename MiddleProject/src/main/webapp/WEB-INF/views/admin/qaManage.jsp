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
<!-- 							<th>글 제목</th> -->
<!-- 							<th>글 내용</th> -->
							<th>작성 일자</th>
<!-- 							<th>댓글</th> -->
							<th>댓글</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody id="qaList"></tbody>
				</table>
			</div>
		</div>
	</div>
</main>
<!-- Modal -->
<div class="modal fade" id="exampleModal"
	aria-labelledby="exampleModalLabel" aria-hidden="true"
	data-bs-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">Q&A 댓글 작성</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="mb-3">
					<label for="recipient-name" class="col-form-label">제목</label>
					<input type="text" class="form-control" id="qTitle" readonly>
				</div>
				<div class="mb-3">
					<label for="recipient-name" class="col-form-label">Q&A 내용</label>
					<textarea id="qContent" class="form-control" rows="5" cols="60" readonly></textarea>
				</div>
				<div class="mb-3">
					<label for="recipient-name" class="col-form-label">댓글</label>
					<textarea id="qReply" rows="5" cols="60"></textarea>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal" id="closeBtn">닫기</button>
				<button type="button" class="btn btn-primary"
					onclick='updateProductFnc(event)'>등록</button>
			</div>
		</div>
	</div>
</div>

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
			$("<td />").text(manager.proId),
			$("<td />").text(manager.memId),
// 			$("<td />").text(manager.qaTitle),
// 			$("<td />").text(manager.qaContent),
			$("<td />").text(manager.qaDate),
// 			$("<td />").text(manager.qaReply),
			$("<td />").append(
			        $("<button />")
			          .addClass("btn btn-success updbtn")
			          .text("댓글")
			          .attr("qaIdUpd", manager.qaId)
			          .attr("data-bs-toggle", "modal")
			          .attr("data-bs-target", "#exampleModal")
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
			let qid = $(this).closest("tr").children().eq(0).text();
			let pid = $(this).closest("tr").children().eq(1).text();
			let mid = $(this).closest("tr").children().eq(2).text();
// 			let qtitle = $(this).closest("tr").children().eq(3).text();
// 			let qcontent = $(this).closest("tr").children().eq(4).text();
			let qdate = $(this).closest("tr").children().eq(3).text();
// 			let qreply = $(this).closest("tr").children().eq(6).text();
			
			if($(this).closest("tr").children().eq(0).text() == manager.qaId){
				$('#qContent').val(manager.qaContent)
				$('#qTitle').val(manager.qaTitle)
				$('#qReply').val(manager.qaReply)
			}
			
			
			let nTr = $("<tr id='qtr'/>").append(
				$("<td id='qid'/>").text(qid),
				$("<td id='pid'/>").text(pid),
				$("<td id='mid'/>").text(mid),
// 				$("<td id='qtitle'/>").text(qtitle),
// 				$("<td id='qcontent'/>").text(qcontent),
				$("<td id='qdate'/>").text(qdate),
// 				$("<td id='qreply'/>").text(qreply),
				$("<td />").append(
			          $(
			            "<button onclick='updateProductFnc(event)' class='btn btn-success updbtn'>작성 중</button>"
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
	
	function updateProductFnc(e) {
		let tr = $("#qtr")
		
		let qReply = $("#qReply").val();
		let qtitle = $("#qTitle").val();
		let qcontent = $("#qContent").val();
		
		let qid = $("#qid").text();
		let mid = $("#mid").text();
		let pid = $("#pid").text();
		let qdate = $("#qdate").text();
		
		$.ajax({
		      url: "updateQa.do",
		      method: "post",
		      data: {qReply:qReply, qid:qid, mid:mid, pid:pid, qtitle:qtitle, qcontent:qcontent, qdate:qdate},
		      success: function (result) {
		        if (result.retCode == "Success") {
		          alert("작성완료");
		          $('#exampleModal').modal('hide')
		          $('textarea').val('');
		          tr.replaceWith(makeRow(result.manager));
		          tr.replaceWith(makeRowUpd(result.manager));
		        } else {
		          alert("입력미완");
		        }
		      },
		      error: function (reject) {
		        console.log(reject);
		      },
		    });
	}
	
	$('#closeBtn').click( function() {
		console.log('클릭')
		location.reload();
	})
</script>