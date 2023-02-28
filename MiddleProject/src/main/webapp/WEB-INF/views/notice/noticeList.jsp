<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<head>
	<link rel="stylesheet" type="text/css" href="css/juanButton.css" />
</head>
<body>
  <div class="content">
    <div class="container">
      <h2 class="mb-5">공지사항</h2>

      <div class="table-responsive custom-table-responsive">
        <table class="table custom-table">
          <thead>
            <tr>
              <th scope="col">
                <label class="control control--checkbox">
                  <input
                    type="checkbox"
                    class="js-check-all"
                    id="cboxAll"
                    name="cboxAll"
                    onclick="checkAll()"
                  />
                  <div class="control__indicator"></div>
                </label>
              </th>

              <th scope="col">글번호</th>
              <th scope="col">작성자</th>
              <th scope="col">제목</th>
              <th scope="col"></th>
              <th scope="col">작성일</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="notice" items="${list }">
              <tr
                scope="row"
                onclick="location.href='noticeDetail.do?notId=${notice.notId}'"
                style="cursor: pointer"
              >
                <th scope="row" onclick="event.cancelBubble=true">
                  <label class="control control--checkbox">
                    <input type="checkbox" name="cbox" />
                    <div class="control__indicator"></div>
                  </label>
                </th>
                <td>${notice.notId }</td>
                <td>관리자</td>
                <td>${notice.notTitle }</td>
                <td></td>
                <td>${notice.notDate }</td>
              </tr>
            </c:forEach>
            <tr class="spacer">
              <td colspan="100"></td>
            </tr>
          </tbody>
        </table>
        <button onclick="location.href='addNoticeForm.do'" class="admin">
          글작성
        </button>
        <button class="admin" id="delBtn" onclick="delNotice()">삭제</button>
      </div>
    </div>
  </div>

  <script type="text/javaScript" src="js/juanTable.js">
    
</body>
