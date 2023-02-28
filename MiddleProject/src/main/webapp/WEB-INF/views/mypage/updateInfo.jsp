<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
   	
<style>
	#box {
		width : 30%;
		margin : 0 auto;
	} 
</style>
<form class="form-signin" action="updateInfo.do" method="post" id="box">

        <h1 class="h3 mb-3 fw-normal">내 정보 수정</h1>
        <hr>
        <div class="mb-3">
            <label>이름</label>
            <input type="text" class="form-control" name= "memName" value=${list.memName } >
        </div>
        
        <div class="mb-3">
            <label>이메일</label>
            <input type="text" class="form-control" name= "memEmail" value=${list.memEmail }>
        </div>
        
        <div class="mb-3">
            <label>전화번호</label>
            <input type="text" class="form-control" name= "memPhone" value=${list.memPhone } >
        </div>
        
        <div class="mb-3">
            <label>현재 비밀번호</label>
            <input type="password" class="form-control" value=${list.memPw } readonly>
        </div>
        
        <div class="mb-3">
            <label>변경 비밀번호</label>
            <input type="password" class="form-control">
        </div>
        
        <div class="mb-3">
            <label>변경 비밀번호 확인</label>
            <input type="password" class="form-control">
        </div>
		<input name="memId" value=${list.memId } type="hidden">
		<input name="memUser" value=${list.memUser } type="hidden">

        <div class="mb-3">
            <button class="w-100 btn btn-lg btn-primary" type="submit" onclick="">수정</button>
        </div>

        <div class="mb-3">
            <a type="button" style="color:white" class="w-100 btn btn-lg btn-secondary" onclick="">취소</a>
        </div>
        
    </form>
    
    <script>
     
      if(document.querySelectorAll("input")[4].innerText==''||document.querySelectorAll("input")[5].innerText==''){
    	  document.querySelectorAll("input")[3].setAttribute("name","memPw")
      }else if(document.querySelectorAll("input")[4].innerText==document.querySelectorAll("input")[5].innerText){
    	  document.querySelectorAll("input")[4].setAttribute("name","memPw")
      }
    </script>
 
