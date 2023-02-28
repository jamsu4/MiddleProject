<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <style>
      #box {
        width: 35%;
        margin: 0 auto;
      }
    </style>
  </head>
   <body>
      <form id="box"
        class="form-signin"
        th:action="@{/account/myinfo}"
        method="post"
        th:object="4{member}"
      >
        <h1 class="h3 mb-3 fw-normal">내 정보 수정</h1>
        <hr />

        <input
          type="hidden"
          class="form-control"
          th:field="*{id}"
          th:readonly="readonly"
        />
        <input
          type="hidden"
          class="form-control"
          th:field="*{role}"
          th:readonly="readonly"
        />

        <div class="mb-3">
          <label th:for="username">이메일</label>
          <input
            type="email"
            class="form-control"
           
          />
        </div>

        <div class="mb-3">
          <label th:for="nickname">닉네임</label>
          <input
            type="text"
            class="form-control"
           
          />  
        <div class="mb-3">
          <label for="age">전화번호</label>
          <input
            type="text"
            class="form-control"
            id="age"
            th:readonly="readonly"
          />
        </div>

        <div class="mb-3">
          <label th:for="gender">성별</label>
          <input
            type="text"
            class="form-control"
            id="gender"
            name="gender"
            th:value="*{gender.value}"
            hidden
          />
          <input
            type="text"
            class="form-control"
            th:value="*{gender.title}"
            readonly
          />
        </div>

        <div class="mb-3">
          <button
            class="w-100 btn btn-lg btn-primary"
            type="submit"
            onclick="return modifyCheckAll()"
          >
            수정
          </button>
        </div>

        <div class="mb-3">
          <a
            type="button"
            style="color: white"
            class="w-100 btn btn-lg btn-secondary"
            onclick="window.history.back();"
            >취소</a
          >
        </div>
      </form>
    
    </body>
</html>
