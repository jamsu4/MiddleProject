<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
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
			<h1>리뷰관리페이지</h1>
		</div>

		<div id="line" class="card mb-4"></div>
		<div>
			<div class="card mb-4">
				<table id="datatablesSimple1" class="table table-border">
					<tr>
						<th style="padding-top: 15px;">상품번호</th>
						<td colspan=5>
							<div class="input-group mb-3">
								<input type="text" class="form-control"
									aria-label="Text input with dropdown button" id="proIdBtn">
							</div>
						</td>
					</tr>
					<tr>
						<th style="padding-top: 15px;">유저ID</th>
						<td colspan=5>
							<div class="input-group mb-3">
								<input type="text" class="form-control"
									aria-label="Text input with dropdown button" id="memIdBtn">
							</div>
						</td>

					</tr>
					<tr>
						<th>리뷰일자</th>
						<td colspan=5>
							<div class="btn-group" role="group"
								aria-label="Basic radio toggle button group">
								<input type="radio" class="btn-check" name="btnradio"
									id="btnradio1" autocomplete="off" checked> <label
									class="btn btn-outline-primary" for="btnradio1" id="btnDate1">오늘</label> <input
									type="radio" class="btn-check" name="btnradio" id="btnradio2"
									autocomplete="off"> <label
									class="btn btn-outline-primary" for="btnradio2" id="btnDate2">일주일</label> <input
									type="radio" class="btn-check" name="btnradio" id="btnradio3"
									autocomplete="off"> <label
									class="btn btn-outline-primary" for="btnradio3" id="btnDate3">1개월</label> <input
									type="radio" class="btn-check" name="btnradio" id="btnradio4"
									autocomplete="off"> <label
									class="btn btn-outline-primary" for="btnradio3" id="btnDate4">6개월</label>
							</div>

						</td>

					</tr>
				</table>
				<div style="text-align: center; margin-bottom:20px">
					<button type="button" class="btn btn-primary btn-lg" id="searchBtn">검색</button>
					<button type="button" class="btn btn-secondary btn-lg" id="resetBtn">초기화</button>
				</div>
			</div>
		</div>
		<div>
			<div id="line" class="card mb-4"></div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> DataTable Example
				</div>
				<div class="card-body">
					<input type="file" id="fileUpload" accept="images/*"
						style="display: none" onchange="setThumbnail(event);" />
					<table id="datatablesSimple" class="table">
						<thead>
							<tr>
								<th>리뷰_ID</th>
								<th>제품_ID</th>
								<th>유저_ID</th>
								<th>리뷰 이미지</th>
								<th>리뷰 제목</th>
								<th>리뷰 내용</th>
								<th>별점</th>
								<th>리뷰 날짜</th>
								<th>리뷰 댓글</th>
								<th>수정</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody id="reviewList"></tbody>
					</table>
					<br />
				</div>
			</div>
		</div>
	</div>
</main>
<!-- Modal -->
<div class="modal fade" id="exampleModal" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">리뷰 댓글 작성</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <textarea id="rReply" rows="5" cols="60"></textarea>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="closeBtn">닫기</button>
        <button type="button" class="btn btn-primary" onclick='updateProductFnc(event)'>등록</button>
      </div>
    </div>
  </div>
</div>

<script>
	
	$.ajax({
		url : "reviewManageList.do",
		success : function(result) {
			$(result).each(function(idx, item) {
				$("#reviewList").append(makeRow(item));
			});

			$(result).each(function(idx, item) {
				$("#reviewList").append(makeRowUpd(item));
			});
		},
		error : function(reject) {
			console.log(reject);
		},
	});
	
	$('#closeBtn').click( function() {
		console.log('클릭')
		location.reload();
	})
	
	$('#searchBtn').click( function(e) {
		let proId = $('#proIdBtn').val();
		let memId = $('#memIdBtn').val();
		
		$.ajax({
			url : "searchReviewManage.do",
			data : {proId : proId, memId : memId},
			success : function(result) {
				$('#proIdBtn').val("");
				$('#memIdBtn').val("");
				$("#reviewList").find("tr").remove();
				$(result).each(function(idx, item) {
					$("#reviewList").append(makeRow(item));
				});
				$(result).each(function(idx, item) {
					$("#reviewList").append(makeRowUpd(item));
				});
			},
			error : function(reject) {
				console.log(reject);
			}
		})		
	})
	
	$('#resetBtn').click( function(e) {
		
		$.ajax({
			url : "searchReviewManage.do",
			data : {proId : "", memId : ""},
			success : function(result) {
				$("#reviewList").find("tr").remove();
				$(result).each(function(idx, item) {
					$("#reviewList").append(makeRow(item));
				});
				$(result).each(function(idx, item) {
					$("#reviewList").append(makeRowUpd(item));
				});
			},
			error : function(reject) {
				console.log(reject);
			}
		})		
	})
	
	$('#btnDate1').click( function() {
		let date = '오늘';
		console.log("오늘")
		$.ajax({
			url : "searchReviewDate.do",
			data : {date : date},
			success : function(result) {
				$("#reviewList").find("tr").remove();
				$(result).each(function(idx, item) {
					$("#reviewList").append(makeRow(item));
				});
				$(result).each(function(idx, item) {
					$("#reviewList").append(makeRowUpd(item));
				});
			},
			error : function(reject) {
				console.log(reject);
			}
		})		
	})
	$('#btnDate2').click( function() {
		console.log("일주일")
		let date = '일주일';
		$.ajax({
			url : "searchReviewDate.do",
			data : {date : date},
			success : function(result) {
				$("#reviewList").find("tr").remove();
				$(result).each(function(idx, item) {
					$("#reviewList").append(makeRow(item));
				});
				$(result).each(function(idx, item) {
					$("#reviewList").append(makeRowUpd(item));
				});
			},
			error : function(reject) {
				console.log(reject);
			}
		})		
	})
	$('#btnDate3').click( function() {
		console.log("1개월")
		let date = '1개월';
		$.ajax({
			url : "searchReviewDate.do",
			data : {date : date},
			success : function(result) {
				$("#reviewList").find("tr").remove();
				$(result).each(function(idx, item) {
					$("#reviewList").append(makeRow(item));
				});
				$(result).each(function(idx, item) {
					$("#reviewList").append(makeRowUpd(item));
				});
			},
			error : function(reject) {
				console.log(reject);
			}
		})		
	})
	$('#btnDate4').click( function() {
		console.log("6개월")
		let date = '6개월';
		$.ajax({
			url : "searchReviewDate.do",
			data : {date : date},
			success : function(result) {
				$("#reviewList").find("tr").remove();
				$(result).each(function(idx, item) {
					$("#reviewList").append(makeRow(item));
				});
				$(result).each(function(idx, item) {
					$("#reviewList").append(makeRowUpd(item));
				});
			},
			error : function(reject) {
				console.log(reject);
			}
		})		
	})
	
	function makeRow(review = {}) {
	    let tr = $("<tr />");

	    tr.append(
	      $("<td />").text(review.revId),
	      $("<td />").text(review.proId),
	      $("<td />").text(review.memId),
	      $("<td />").append(
	        $("<img>", {
	          src: "images/" + review.revImage,
	          width: "100px",
	          height: "100px",
	        })
	      ),
	      $("<td />").text(review.revTitle),
	      $("<td />").text(review.revContent),
	      $("<td />").text(review.revRate),
	      $("<td />").text(review.revDate),
	      $("<td />").text(review.revReply),
	      $("<td />").append(
	        $("<button />")
	          .addClass("btn btn-success updbtn")
	          .text("댓글작성")
	          .attr("revIdUpd", review.revId)
	          .attr("data-bs-toggle", "modal")
	          .attr("data-bs-target", "#exampleModal")
	      ),
	      
	      $("<td />").append(
	        $('<button class="btn btn-danger">삭제</button>')
	          .attr("revIdDel", review.revId)
	          .on("click", deleteProductFnc)
	      )
	    );
	    return tr;
	 }
	
	function deleteProductFnc(e) {
	    if (!window.confirm("삭제하시겠습니까?")) {
	      return;
	    }

	    let revId = $(e.target).attr("revIdDel");

	    $.ajax({
	      url: "removeReviewManage.do",
	      data: { revId: revId },
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
		let tr = $("#rtr")
		
		let rReply = $("#rReply").val();
		let rid = $("#rid").text();
		
		let pid = $("#pid").text();
		let mid = $("#mid").text();
		let rtitle = $("#rtitle").text();
		let rcontent = $("#rcontent").text();
		let rate = $("#rate").text();
		let rdate = $("#rdate").text();
		let rimg = $("#revImg").attr('src').substring(7);
		
		let formData = new FormData();
		formData.append("rReply", rReply);
		formData.append("rid", rid);
		formData.append("pid", pid);
		formData.append("mid", mid);
		formData.append("rtitle", rtitle);
		formData.append("rcontent", rcontent);
		formData.append("rate", rate);
		formData.append("rdate", rdate);
		formData.append("rimg", rimg);
		
// 		$.ajax({
// 			url: "modifyReviewManage.do",
// 			method: "post",
// 			data : {rid : rid, rReply: rReply},
// 			success: function(result){
// 				console.log(result);
// 				if (result.retCode == "Success") {
// 					location.reload();
// 				} else {
// 					alert("오류");
// 				}
// 			},
// 			error: function(reject){
// 				console.log(reject);
// 			},
// 		});
		$.ajax({
		      url: "modifyReviewManage.do",
		      method: "post",
		      data: formData,
		      contentType: false,
		      processData: false,
		      success: function (result) {
		        if (result.retCode == "Success") {
		          alert("수정완료");
		          $('#exampleModal').modal('hide')
		          $('textarea').val('');
		          tr.replaceWith(makeRow(result.review));
		          tr.replaceWith(makeRowUpd(result.review));
		        } else {
		          alert("입력미완");
		        }
		      },
		      error: function (reject) {
		        console.log(reject);
		      },
		    });
	}
	
	function makeRowUpd(review = {}) {
		let tr = $("<tr />")
		
		$(".updbtn").on("click", function (e) {
			let rid = $(this).closest("tr").children().eq(0).text();
			let pid = $(this).closest("tr").children().eq(1).text();
			let mid = $(this).closest("tr").children().eq(2).text();
			let rimg = $(this).closest("tr").children().eq(3).children().attr("src");
			let rtitle = $(this).closest("tr").children().eq(4).text();
			let rcontent = $(this).closest("tr").children().eq(5).text();
			let rate = $(this).closest("tr").children().eq(6).text();
			let rdate = $(this).closest("tr").children().eq(7).text();
			let rReply = $(this).closest("tr").children().eq(8).text();
		
		
			let nTr = $("<tr id='rtr'/>").append(
			        $("<td id='rid'/>").text(rid),
			        $("<td id='pid'/>").text(pid),
			        $("<td id='mid'/>").text(mid),
			        $("<td class='image_container'/>").append(
			          $("<img>", {
			            src: rimg,
			            width: "100px",
			            height: "100px",
			            id: "revImg",
			            class: "image_container"
			          })
			        ),
			        $("<td id='rtitle'/>").text(rtitle),
			        $("<td id='rcontent'/>").text(rcontent),
			        $("<td id='rate'/>").text(rate),
			        $("<td id='rdate'/>").text(rdate),
			        $("<td />").text(rReply),
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
	
</script>