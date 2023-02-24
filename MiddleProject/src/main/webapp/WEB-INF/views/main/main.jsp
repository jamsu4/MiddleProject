<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js">
</script>
    
<style>
	.img {
		width : 350px;
		height : 350px;
		border : 1px solid black;
	}
</style>
<h3>Main Page.</h3>
<form action="searchProduct.do">
	<input type="text" name="search">
	<input type="submit" value="검색하기">
</form>
<section class="section" id="men">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="section-heading">
                        <h2>가구</h2>
                        <span>Details to details is what makes Hexashop different from the other themes.</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="men-item-carousel">
                    <div class="owl-nav">
                    </div>
                        <div class="owl-men-item owl-carousel">
                        <c:forEach var="list" items="${list }">
                        	<c:if test="${list.proCategory eq '가구' }">
                            <div class="item">
                                <div class="thumb">
                                    <div class="hover-content">
                                        <ul>
                                            <li><a href="single-product.html"><i class="fa fa-star"></i></a></li>
                                            <li><a href="cart.do"><i class="fa fa-shopping-cart cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <a href="productDetail.do?pid=${list.proID }"><img src="images/${list.proImg }" alt="" class="img"></a>
                                </div>
                                <div class="down-content">
                                    <h4>${list.proName }</h4>
                                    <span>${list.proPrice }</span>
                                    <ul class="stars">
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star"></i></li>
                                    </ul>
                                </div>
                            </div>
                            </c:if>
						</c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="section" id="men">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="section-heading">
                        <h2>식품</h2>
                        <span>Details to details is what makes Hexashop different from the other themes.</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="men-item-carousel">
                    <div class="owl-nav">
                    </div>
                        <div class="owl-men-item owl-carousel">
                        <c:forEach var="list" items="${list }">
                        	<c:if test="${list.proCategory eq '식품' }">
                            <div class="item">
                                <div class="thumb">
                                    <div class="hover-content">
                                        <ul>
                                            <li><a href="single-product.html"><i class="fa fa-star"></i></a></li>
                                            <li><a href="single-product.html"><i class="fa fa-shopping-cart cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <a href="productDetail.do?pid=${list.proID }"><img src="images/${list.proImg }" alt="" class="img"></a>
                                </div>
                                <div class="down-content">
                                    <h4>${list.proName }</h4>
                                    <span>${list.proPrice }</span>
                                    <ul class="stars">
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star"></i></li>
                                    </ul>
                                </div>
                            </div>
                            </c:if>
						</c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="section" id="men">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="section-heading">
                        <h2>위생용품</h2>
                        <span>Details to details is what makes Hexashop different from the other themes.</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="men-item-carousel">
                    <div class="owl-nav">
                    </div>
                        <div class="owl-men-item owl-carousel">
                        <c:forEach var="list" items="${list }">
                        	<c:if test="${list.proCategory eq '위생용품' }">
                            <div class="item">
                                <div class="thumb">
                                    <div class="hover-content">
                                        <ul>
                                            <li><a href="single-product.html"><i class="fa fa-star"></i></a></li>
                                            <li><a href="single-product.html"><i class="fa fa-shopping-cart cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <a href="productDetail.do?pid=${list.proID }"><img src="images/${list.proImg }" alt="" class="img"></a>
                                </div>
                                <div class="down-content">
                                    <h4>${list.proName }</h4>
                                    <span>${list.proPrice }</span>
                                    <ul class="stars">
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star"></i></li>
                                    </ul>
                                </div>
                            </div>
                            </c:if>
						</c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="section" id="men">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="section-heading">
                        <h2>목욕용품</h2>
                        <span>Details to details is what makes Hexashop different from the other themes.</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="men-item-carousel">
                    <div class="owl-nav">
                    </div>
                        <div class="owl-men-item owl-carousel">
                        <c:forEach var="list" items="${list }">
                        	<c:if test="${list.proCategory eq '목욕용품' }">
                            <div class="item">
                                <div class="thumb">
                                    <div class="hover-content">
                                        <ul>
                                            <li><a href="single-product.html"><i class="fa fa-star"></i></a></li>
                                            <li><a href="single-product.html"><i class="fa fa-shopping-cart cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <a href="productDetail.do?pid=${list.proID }"><img src="images/${list.proImg }" alt="" class="img"></a>
                                </div>
                                <div class="down-content">
                                    <h4>${list.proName }</h4>
                                    <span>${list.proPrice }</span>
                                    <ul class="stars">
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star"></i></li>
                                    </ul>
                                </div>
                            </div>
                            </c:if>
						</c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="section" id="men">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="section-heading">
                        <h2>장난감</h2>
                        <span>Details to details is what makes Hexashop different from the other themes.</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="men-item-carousel">
                    <div class="owl-nav">
                    </div>
                        <div class="owl-men-item owl-carousel">
                        <c:forEach var="list" items="${list }">
                        	<c:if test="${list.proCategory eq '장난감' }">
                            <div class="item">
                                <div class="thumb">
                                    <div class="hover-content">
                                        <ul>
                                            <li><a href="single-product.html"><i class="fa fa-star"></i></a></li>
                                            <li><a href="single-product.html"><i class="fa fa-shopping-cart cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <a href="productDetail.do?pid=${list.proID }"><img src="images/${list.proImg }" alt="" class="img"></a>
                                </div>
                                <div class="down-content">
                                    <h4>${list.proName }</h4>
                                    <span>${list.proPrice }</span>
                                    <ul class="stars">
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star"></i></li>
                                    </ul>
                                </div>
                            </div>
                            </c:if>
						</c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="section" id="men">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="section-heading">
                        <h2>기타</h2>
                        <span>Details to details is what makes Hexashop different from the other themes.</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="men-item-carousel">
                    <div class="owl-nav">
                    </div>
                        <div class="owl-men-item owl-carousel">
                        <c:forEach var="list" items="${list }">
                        	<c:if test="${list.proCategory eq '기타' }">
                            <div class="item">
                                <div class="thumb">
                                    <div class="hover-content">
                                        <ul>
                                            <li><a href="single-product.html"><i class="fa fa-star"></i></a></li>
                                            <li>
                                            	<a href="single-product.html">
                                            		<i id="${list.proID}" data-price="${list.proPrice }" class="fa fa-shopping-cart cart"></i>
                                            	</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <a href="productDetail.do?pid=${list.proID }">
                                    	<img src="images/${list.proImg }" alt="" class="img">
                                    </a>
                                </div>
                                <div class="down-content">
                                    <h4>${list.proName }</h4>
                                    <span>${list.proPrice }</span>
                                    <ul class="stars">
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star"></i></li>
                                    </ul>
                                </div>
                            </div>
                            </c:if>
						</c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <script>
    $('.cart').on('click', function() {
		 var proId = $(this).attr('id')
		 var caSumprice = $(this).attr('data-price')
		$.ajax({
			url: 'addMember.do',
			method: 'post',
			data: {memid :'${logId }', proId : proId, caQuant:1, caSumprice: caSumprice}
			success: function(result) {
				if (result.retCode == "Success") {
					alert('장바구니 등록 성공')
				} else {
					alert('등록 실패');
				}
			},
			error: function(err) {
				console.log(err);
			}
		})
    
    </script>