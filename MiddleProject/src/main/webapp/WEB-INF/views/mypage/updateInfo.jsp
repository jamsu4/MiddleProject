<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
   	
<style>
	#box {
		width : 30%;
		margin : 0 auto;
	} 
</style>
<form class="form-signin" action="updateInfo.do" method="post" id="box" onsubmit="return currentPw()">

        <h1 class="h3 mb-3 fw-normal">내 정보 수정</h1>
        <hr>
        <div class="mb-3">
            <label>이름</label>
            <input type="text" class="form-control" name= "memName" value=${list.memName } readonly>
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
            <label>현재 비밀번호</label><sub style="color:red"> * 필수입력</sub>
            <input type="password" name="memPw" class="form-control" >
        </div>
        
        <div class="mb-3">
            <label>변경 비밀번호</label>
            <input type="password" class="form-control">
        </div>
        
        <div class="mb-3">
            <label>변경 비밀번호 확인</label>
            <input type="password" class="form-control">
        </div>
		<input name="memId" type="hidden" value=${list.memId } >
		<input name="memUser" type="hidden" value=${list.memUser } >

        <div class="mb-3">
            <button class="w-100 btn btn-lg btn-primary" onclick="" type="submit" >수정</button>
        </div>

        <div class="mb-3">
            <a type="button" style="color:white" class="w-100 btn btn-lg btn-secondary" onclick="">취소</a>
        </div>
        
    </form>
    
    <script>
    function currentPw(){
    	if(document.querySelectorAll("input")[3].value == ''){
    		alert('현재 비밀번호를 입력해주세요.');
    		return false;
    	}else if(document.querySelectorAll("input")[4].value != document.querySelectorAll("input")[5].value){
    		alert('변경 비밀번호 확인');
    		return false;
    	}else if(${list.memPw} != document.querySelectorAll("input")[3].value){
    		alert('현재 비밀번호가 다릅니다')
    		return false;
    	}else if(document.querySelectorAll("input")[4].value ==''||document.querySelectorAll("input")[5].value==''||
    			document.querySelectorAll("input")[4].value ==document.querySelectorAll("input")[5].value ){
    		document.querySelectorAll("input")[4].setAttribute("name","memPw")
    		return true;
    	}
    	return true;
    }
     
      if(document.querySelectorAll("input")[4].innerText==''||document.querySelectorAll("input")[5].innerText==''){
    	  document.querySelectorAll("input")[3].setAttribute("name","memPw")
      }else if(document.querySelectorAll("input")[4].innerText==document.querySelectorAll("input")[5].innerText){
    	  document.querySelectorAll("input")[4].setAttribute("name","memPw")
      }
    </script>
 
