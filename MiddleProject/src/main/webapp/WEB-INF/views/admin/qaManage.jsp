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
				<div id="paging" style="text-align: center;"></div>
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
		
		success: function (result) {

		},
		error: function (reject) {
			console.log(reject);
		},
	});
	
	$(document).ready(function() {
		getqaList(1);
	  });
	  var page = 1;
	  
	  function getqaList(page) {
		  $.ajax({
			url: "qaList.do",
		    data: { page: page },
		    success: function (result) {
		      console.log(result.paging);
				$(result.qaList).each(function (idx, item) {
					$("#qaList").append(makeRow(item));
				});

				$(result.qaList).each(function (idx, item) {
					$("#qaList").append(makeRowUpd(item));
				});
		      var beginPage = parseInt(result.paging.beginPage);
		      var endPage = parseInt(result.paging.endPage);
		      var currentPage = parseInt(result.paging.page);
		      console.log(beginPage);
		      console.log(endPage);
		      console.log(currentPage);
		      if(result.paging.prev) {
		        $('#paging').append($('<a>').click(movePage)
		                          .data('page',(beginPage-1))
		                          .text('prev'));
		      }
		      for (var i = beginPage; i <= endPage; i++) {
		        if (i === currentPage) {
		          $('#paging').append(i);
		        } else {
		          var link = createPageLink(i, i);
		          $('#paging').append(link);
		        }
		      }
		      if(result.paging.next) {
		        $('#paging').append($('<a>').click(movePage)
		                          .data('page',(endPage+1))
		                          .text('next'));
		      }
		    },
		    error: function (reject) {
		      console.log(reject);
		    },
		  });
		}
	  //페이지 이동
	  function movePage() {
		  console.log(this)
		  page = $(this).data('page');
		  $('#qaList').empty();
		  $('#paging').empty();
		  getqaList(page);
	  }
	  //페이지네이션 제작
	  function createPageLink(page, text) {
	  return $('<a>').click(movePage)
	  				 .data('page',page)
	  			  	 .text(text);
	  }
	
	////////////////////////////////////////////////////
	
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
				$("<td />").append($("<input id='qreply' />").val(qreply))
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
</script>