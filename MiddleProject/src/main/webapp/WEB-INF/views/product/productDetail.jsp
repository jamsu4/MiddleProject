<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!-- ***** Product Area Starts ***** -->
<section class="section" id="product">
  <div class="container">
    <div class="row">
      <div class="col-lg-8">
        <div class="left-images">
          <img src="images/${proDetail.proimg }" alt="" />
        </div>
      </div>
      <div class="col-lg-4">
        <div class="right-content">
          <h4>${proDetail.proName }</h4>
          <span class="price">${proDetail.proPrice } 원</span>
          <ul class="stars">
            <li><i class="fa fa-star"></i></li>
            <li><i class="fa fa-star"></i></li>
            <li><i class="fa fa-star"></i></li>
            <li><i class="fa fa-star"></i></li>
            <li><i class="fa fa-star"></i></li>
          </ul>
          <span>${proDetail.proDesc }</span>
          <div class="quote">
            <i class="fa fa-quote-left"></i>
            <p>${proDetail.proDesc }</p>
          </div>
          <div class="quantity-content">
            <div class="left-content">
              <h6>No. of Orders</h6>
            </div>
            <div class="right-content">
              <div class="quantity buttons_added">
                <input type="button" value="-" class="minus" /><input
                  id="productCount"
                  type="number"
                  step="1"
                  min="0"
                  max=""
                  name="quantity"
                  value="1"
                  title="Qty"
                  class="input-text qty text"
                  size="4"
                  pattern=""
                  inputmode=""
                  readonly
                /><input type="button" value="+" class="plus" />
              </div>
            </div>
          </div>
          <div class="total">
            <h4>Total: ${proDetail.proPrice }</h4>
            <div class="main-border-button">
              <a href="#" id="cart">Add To Cart</a>
            </div>
            <br />
            <div class="main-border-button">
              <a href="#" id="pay">바로 결제</a>
              <a href="#">찜 하기</a>
            </div>
            <br />
            <div class="main-border-button"></div>
          </div>
          <div></div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- ***** Product Area Ends ***** -->

<script>
   let plus = document.querySelectorAll(".plus")[0];
   let minus = document.querySelectorAll(".minus")[0];
   let productCount = document.querySelector("#productCount");
   let total = document.querySelectorAll(".total")[0].children[0];
   console.log(total);
   plus.addEventListener("click", function () {
     let productCountValue = parseInt(productCount.value) + 1;
     let result = productCountValue * ${proDetail.proPrice };
     total.innerText = "Total: " + result;
   });

   minus.addEventListener("click", function () {
     let productCountValue = parseInt(productCount.value) - 1;
     let result = productCountValue * ${proDetail.proPrice };
     if (result >= 0) {
       total.innerText = "Total: " + result;
     }
   });

   $('#cart').click(function() {
	   let productCountValue = parseInt(productCount.value);
	   let result = productCountValue * ${proDetail.proPrice };
	   console.log(result);
	   console.log(productCountValue);
	   console.log("카트임");
   })
   
   
</script>
