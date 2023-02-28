<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
  <style>
    img{
      width: 70px;
      height: 50px;
    }
  </style>
</head>
<body>
    <div class="content">
      <div class="container">
        <h2 class="mb-5">Table #4</h2>

        <div class="table-responsive custom-table-responsive">
          <table class="table custom-table">
            <thead>
              <tr>
                <th scope="col">
                  <label class="control control--checkbox">
                    <input type="checkbox" class="js-check-all" />
                    <div class="control__indicator"></div>
                  </label>
                </th>

                <th scope="col">상품번호</th>
                <th scope="col">상품사진</th>
                <th scope="col">상품명</th>
                <th scope="col">Contact</th>
                <th scope="col">금액</th>
              </tr>
            </thead>
            
            <tbody>
            <c:forEach var="zzim" items="${list }">
              <tr scope="row">
                <th scope="row">
                  <label class="control control--checkbox">
                    <input type="checkbox" />
                    <div class="control__indicator"></div>
                  </label>
                </th>
                <td>${zzim.proId }</td>
                <td><img src= "images/${zzim.proImg }"></td>
                <td>
                  ${zzim.proName }
                  <small class="d-block"
                    ></small
                  >
                </td>
                <td>+63 983 0962 971</td>
                <td>${zzim.proPrice }</td>
              </tr>
              <tr class="spacer">
                <td colspan="100"></td>
              </tr>
              </c:forEach>
            </tbody>
            
          </table>
        </div>
      </div>
    </div>

  </body>
    

    
  