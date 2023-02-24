<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
	<style>
		#buttons {
			
			
		}
	</style>
</head>  
  
  	
  
 
<body>
  <div class="content">
    
    <div class="container">
      <h2 class="mb-5"><button id="">주문내역</button></h2>
      <h2 class="mb-5"><button id="jjimBtn">찜한상품</button></h2>
      <h2 class="mb-5"><button id="">주문내역</button></h2>
      <h2 class="mb-5"><button id="">주문내역</button></h2>

      <div class="table-responsive custom-table-responsive">

        <table class="table custom-table">
          <thead>
            <tr>  

              <th scope="col">
                <label class="control control--checkbox">
                  <input type="checkbox"  class="js-check-all"/>
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
          <tr class="spacer"><td colspan="100"></td></tr>
            <tr scope="row">
              <th scope="row">
                <label class="control control--checkbox">
                  <input type="checkbox"/>
                  <div class="control__indicator"></div>
                </label>
              </th>
              <c:forEach var="notice" items="${list }">
              <td>
                ${notice.notId }
              </td>
              <td>관리자</a></td>
              <td>
                ${notice.notTitle }
                <small class="d-block"></small>
              </td>
              <td></td>
              <td>${notice.notDate }</td>
            </tr>
            <tr class="spacer"><td colspan="100"></td></tr>
            <tr>
              <th scope="row">
                <label class="control control--checkbox">
                  <input type="checkbox"/>
                  <div class="control__indicator"></div>
                </label>
              </th>
             </c:forEach> 
              
            
          </tbody>
        </table>
      </div>


    </div>

  </div>
  <script>
  $("#jjimBtn").click(function(){  
      
	    var url="jjimList.json";  
	    var params="memId=";
	   
	    $.ajax({      
	        type:"POST",  
	        url:url,      
	        data:params,      
	        success:function(args){   
	            $("#result").html(args);      
	        },   
	        beforeSend:showRequest,  
	        error:function(e){  
	            alert(e.responseText);  
	        }  
	    });  
	       
	}); 
  </script>
 	
 </body>   
    

    
  