<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
body {
	color: #666;
	font: 14px/24px "Open Sans", "HelveticaNeue-Light",
		"Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial,
		"Lucida Grande", Sans-Serif;
}

table {
	border-collapse: separate;
	border-spacing: 0;
	width: 100%;
}

th, td {
	padding: 6px 15px;
}

th {
	background: #42444e;
	color: #fff;
	text-align: left;
}

tr:first-child th:first-child {
	border-top-left-radius: 6px;
}

tr:first-child th:last-child {
	border-top-right-radius: 6px;
}

td {
	border-right: 1px solid #c6c9cc;
	border-bottom: 1px solid #c6c9cc;
}

td:first-child {
	border-left: 1px solid #c6c9cc;
}

tr:nth-child(even) td {
	background: #eaeaed;
}

tr:last-child td:first-child {
	border-bottom-left-radius: 6px;
}

tr:last-child td:last-child {
	border-bottom-right-radius: 6px;
}

#addProduct {
	float: right;
	margin-right: 30px;
}
</style>
<input type="file" id="fileUpload" accept="images/*" style="display:none" onchange="updateProductFnc()" >
<table>
	<thead>
		<tr>
			<th>제품_ID</th>
			<th>제품 이미지</th>
			<th>제품명</th>
			<th>제품 가격</th>
			<th>제품 설명</th>
			<th>제품 카테고리</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
	</thead>
	<tbody id="productList">
	</tbody>
</table>
<br>
<button id="addProduct" class="btn btn-primary">등록</button>
<script>

	$.ajax({
		url : "productManagerList.do",
		success : function(result) {
			$(result).each(function(idx, item) {
				$("#productList").append(makeRow(item));
			});
		},
		error : function(reject) {
			console.log(reject);
		}
	});
	
	function makeRow(manager = {}){
		let tr = $("<tr />");
		
		$('#proUpd').on("click", function (e) {
			let pid = $(this).closest('tr').children().eq(0).text();
		    let pimg = $(this).closest('tr').children().eq(1).children().attr("src")
		    let pname = $(this).closest('tr').children().eq(2).text();
		    let pprice = $(this).closest('tr').children().eq(3).text();
		    let pdesc = $(this).closest('tr').children().eq(4).text();
		    let pcategory = $(this).closest('tr').children().eq(5).text();
			
			let nTr = $("<tr />").append(
				$("<td />").append($("<input id='pid' />").val(pid)),
				$("<td />").append(
						$('<img>', {
							'src' : pimg,
							'width' : '100px',
							'height' : '100px',
							'id' : 'proImg'
						})		
					),
				$("<td />").append($("<input id='pname' />").val(pname)),
				$("<td />").append($("<input id='pprice' />").val(pprice)),
				$("<td />").append($("<input id='pdesc' />").val(pdesc)),
				$("<td />").append($("<input id='pcategory' />").val(pcategory)),
				$("<td />").append(
				        $(
				          "<button onclick='updateProductFnc(event)' class='btn btn-success' id='updbtn'>수정</button>"
				        )
				      )
			)
			$(this).closest('tr').replaceWith(nTr);
		})
		
		tr.append(
			$("<td />").text(manager.proID),
			$("<td />").append(
				$('<img>', {
					'src' : 'images/'+ manager.proImg,
					'width' : '100px',
					'height' : '100px',
				})		
			),
			$("<td />").text(manager.proName),
			$("<td />").text(manager.proPrice),
			$("<td />").text(manager.proDesc),
			$("<td />").text(manager.proCategory),
			$("<td />").append(
				$('<button id="proUpd" class="btn btn-success">수정</button>')
					.attr("proIdUpd", manager.proID)		
			),
			$("<td />").append(
				$('<button class="btn btn-danger">삭제</button>')
					.attr("proIdDel", manager.proID)
					.on("click", deleteProductFnc)
			),
		
		)
		return tr;
	}
	
	function deleteProductFnc(e){
		if (!window.confirm("삭제하시겠습니까?")) {
		    return;
		}
		
		let proId = $(e.target).attr("proIdDel");
		console.log(proId);
		
		$.ajax({
		    url: "removeProductManager.do",
		    data: { proId: proId }, 
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
	
	function updateProductFnc(e){
		console.log("수정버튼");
		let pid = $('#pid').val();
		let pimg = $("#fileUpload")[0].files[0];
		let pname = $('#pname').val();
		let pprice = $('#pprice').val();
		let pdesc = $('#pdesc').val();
		let pcategory = $('#pcategory').val();
		
		let formData = new FormData();
		formData.append("pid", pid);
		formData.append("pimg", pimg);
		formData.append("pname", pname);
		formData.append("pprice", pprice);
		formData.append("pdesc", pdesc);
		formData.append("pcategory", pcategory);
		
		$.ajax({
		      url: "modifyProductManager.do",
		      method: "post",
		      data: formData,
		      contentType: false,
		      processData: false,
		      success: function (result) {
		        console.log(result);
		        if (result.retCode == "Success") {
		        	let reader = new FileReader();
					reader.onload = function (ev) {
						console.log(ev.target)
						$('#proImg').attr('src', ev.target.result);
					}
					if(typeof pimg != "undefined"){
						reader.readAsDataURL(pimg);
					}
		        	alert("수정완료");
		        	location.reload();
// 	           		tr.replaceWith(makeRow(result.manager));
// 		        	$('#productList').load(location.href+' #productList');
		        } else {
		          alert("입력미완");
		        }
		      },
		      error: function (reject) {
		        console.log(reject);
		      },
		    });
	}
	
	$(this).on('click', function(e){
		if(e.target.id == 'proImg'){
			$('#fileUpload').click();
		}
	})
	
</script>